/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.w3c.dom.Document
import org.w3c.dom.Element

internal const val EXTERNAL_VIDEO = "$EXTENSION_PACKAGE/misc/ExternalVideo;"
private const val EV_OBJECT = "Ljava/lang/Object;"
private const val EV_STRING = "Ljava/lang/String;"
private const val EV_FILE = "Ljava/io/File;"
private const val EV_URI = "Landroid/net/Uri;"
private const val EV_CONTEXT = "Landroid/content/Context;"
internal const val EXTERNAL_OPEN = "$EXTERNAL_VIDEO->open($EV_OBJECT)I"
internal const val EXTERNAL_PRESSED = "$EXTERNAL_VIDEO->pressed(${EV_OBJECT}I)I"
internal const val EXTERNAL_SERVICE = "app.hushtelegram.extension.telegram.misc.ExternalVideoService"
internal const val EXTERNAL_FILE_PROVIDER = "Landroidx/core/content/FileProvider;"
internal const val EXTERNAL_STREAM = "Lorg/telegram/messenger/FileStreamLoadOperation;"
internal const val EXTERNAL_MESSAGE = "Lorg/telegram/messenger/MessageObject;"
internal const val EXTERNAL_TL_MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
internal const val EXTERNAL_DOCUMENT = "Lorg/telegram/tgnet/TLRPC\$Document;"
internal const val EXTERNAL_TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
internal const val EXTERNAL_LOADER = "Lorg/telegram/messenger/FileLoader;"
internal const val EXTERNAL_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val EXTERNAL_DIALOG = "Lorg/telegram/messenger/DialogObject;"
internal const val EXTERNAL_MARK = "$EXTERNAL_MESSAGE->putInDownloadsStore:Z"
private const val EV_ARRAY_LIST = "Ljava/util/ArrayList;"
private const val EV_SPEC_INIT = "-><init>(${EV_URI}I[BLjava/util/Map;JJ${EV_STRING}I)V"
private const val EV_LABEL = "hush_stock"
private const val MEDIA_PLAYBACK = "mediaPlayback"
private val EXTERNAL_PERMISSIONS = listOf(
    "android.permission.FOREGROUND_SERVICE",
    "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK",
)

/** [code] in front of the instruction at [index] of [method], with [size] instructions of its own. */
internal class ExternalVideoEdit(val method: MutableMethod, val index: Int, val code: String, val size: Int)

/** What the stubs call, by the names this build gave it. */
internal class ExternalVideoRefs(
    val stream: String,
    val dataSpec: String,
    val streamOpen: String,
    val prepareUri: String,
    val fileUri: String,
    val cell: String,
    val cellMessage: String,
    val cellButton: String,
)

/** The two hooks, found and checked before anything is edited, or [missing], why they can't go in. */
internal class ExternalVideoPlan(val edits: List<ExternalVideoEdit>, val refs: ExternalVideoRefs?, val missing: String?) {
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for (edit in edits) {
            val target = into(edit.method)
            val before = target.realInstructions()
            target.addInstructionsAtControlFlowLabel(edit.index, edit.code, ExternalLabel(EV_LABEL, target.getInstruction(edit.index)))
            // smali drops an instruction it can't build and only logs it.
            externalFit(target.realInstructions() - before == edit.size, "the video hooks didn't compile whole")
        }
    }

    /** The same edits on copies, so a register or smali problem shows before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    /** A hook of an odd length can add or drop the nop that aligns a payload, so those don't count. */
    private fun MutableMethod.realInstructions() = implementation!!.instructions.count { it.opcode != Opcode.NOP }
}

/** One stub of the extension: its signature, and the Telegram code the patch gives it. */
private class ExternalStub(
    val name: String,
    val parameters: List<String>,
    val result: String,
    val registers: Int,
    val smali: (ExternalVideoRefs) -> String,
)

private fun messageQuestion(name: String, member: String) = ExternalStub(name, listOf(EV_OBJECT), "Z", 1) {
    """
    check-cast p0, $EXTERNAL_MESSAGE
    invoke-virtual {p0}, $EXTERNAL_MESSAGE->$member()Z
    move-result p0
    return p0
    """
}

private val EXTERNAL_STUBS = listOf(
    messageQuestion("messageIsVideo", "isVideo"),
    messageQuestion("messageIsRound", "isRoundVideo"),
    messageQuestion("messageIsGif", "isGif"),
    messageQuestion("messageIsSecret", "isSecretMedia"),
    messageQuestion("messageIsBlurred", "needDrawBluredPreview"),
    ExternalStub("messageDialog", listOf(EV_OBJECT), "J", 3) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        invoke-virtual {p0}, $EXTERNAL_MESSAGE->getDialogId()J
        move-result-wide v0
        return-wide v0
        """
    },
    ExternalStub("dialogIsEncrypted", listOf("J"), "Z", 2) {
        """
        invoke-static {p0, p1}, $EXTERNAL_DIALOG->isEncryptedDialog(J)Z
        move-result p0
        return p0
        """
    },
    ExternalStub("messageNoForwards", listOf(EV_OBJECT), "Z", 1) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        iget-object p0, p0, $EXTERNAL_MESSAGE->messageOwner:$EXTERNAL_TL_MESSAGE
        iget-boolean p0, p0, $EXTERNAL_TL_MESSAGE->noforwards:Z
        return p0
        """
    },
    ExternalStub("chatNoForwards", listOf("I", "J"), "Z", 3) {
        """
        invoke-static {p0}, $EXTERNAL_CONTROLLER->getInstance(I)$EXTERNAL_CONTROLLER
        move-result-object p0
        invoke-virtual {p0, p1, p2}, $EXTERNAL_CONTROLLER->isPeerNoForwards(J)Z
        move-result p0
        return p0
        """
    },
    ExternalStub("messageDocument", listOf(EV_OBJECT), EV_OBJECT, 1) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        invoke-virtual {p0}, $EXTERNAL_MESSAGE->getDocument()$EXTERNAL_DOCUMENT
        move-result-object p0
        return-object p0
        """
    },
    ExternalStub("messageAccount", listOf(EV_OBJECT), "I", 1) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        iget p0, p0, $EXTERNAL_MESSAGE->currentAccount:I
        return p0
        """
    },
    ExternalStub("messagePath", listOf(EV_OBJECT), EV_STRING, 1) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        iget-object p0, p0, $EXTERNAL_MESSAGE->messageOwner:$EXTERNAL_TL_MESSAGE
        iget-object p0, p0, $EXTERNAL_TL_MESSAGE->attachPath:$EV_STRING
        return-object p0
        """
    },
    ExternalStub("messageFile", listOf(EV_OBJECT), EV_FILE, 1) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        iget-object p0, p0, $EXTERNAL_MESSAGE->messageOwner:$EXTERNAL_TL_MESSAGE
        invoke-static {p0}, $EXTERNAL_LOADER->getPathToMessage($EXTERNAL_TL_MESSAGE)$EV_FILE
        move-result-object p0
        return-object p0
        """
    },
    ExternalStub("messageName", listOf(EV_OBJECT), EV_STRING, 1) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        invoke-virtual {p0}, $EXTERNAL_MESSAGE->getDocumentName()$EV_STRING
        move-result-object p0
        return-object p0
        """
    },
    ExternalStub("messageMarkDownload", listOf(EV_OBJECT, "Z"), "V", 2) {
        """
        check-cast p0, $EXTERNAL_MESSAGE
        iput-boolean p1, p0, $EXTERNAL_MARK
        return-void
        """
    },
    ExternalStub("documentMime", listOf(EV_OBJECT), EV_STRING, 1) {
        """
        check-cast p0, $EXTERNAL_DOCUMENT
        iget-object p0, p0, $EXTERNAL_DOCUMENT->mime_type:$EV_STRING
        return-object p0
        """
    },
    ExternalStub("documentSize", listOf(EV_OBJECT), "J", 3) {
        """
        check-cast p0, $EXTERNAL_DOCUMENT
        iget-wide v0, p0, $EXTERNAL_DOCUMENT->size:J
        return-wide v0
        """
    },
    ExternalStub("documentKey", listOf(EV_OBJECT), EV_STRING, 1) {
        """
        check-cast p0, $EXTERNAL_TL_OBJECT
        invoke-static {p0}, $EXTERNAL_LOADER->getAttachFileName($EXTERNAL_TL_OBJECT)$EV_STRING
        move-result-object p0
        return-object p0
        """
    },
    ExternalStub("loadRunning", listOf("I", EV_STRING), "Z", 2) {
        """
        invoke-static {p0}, $EXTERNAL_LOADER->getInstance(I)$EXTERNAL_LOADER
        move-result-object p0
        invoke-virtual {p0, p1}, $EXTERNAL_LOADER->isLoadingFile($EV_STRING)Z
        move-result p0
        return p0
        """
    },
    ExternalStub("stopLoad", listOf("I", EV_OBJECT), "V", 2) {
        """
        invoke-static {p0}, $EXTERNAL_LOADER->getInstance(I)$EXTERNAL_LOADER
        move-result-object p0
        check-cast p1, $EXTERNAL_DOCUMENT
        invoke-virtual {p0, p1}, $EXTERNAL_LOADER->cancelLoadFile($EXTERNAL_DOCUMENT)V
        return-void
        """
    },
    ExternalStub("streamUri", listOf("I", EV_OBJECT, EV_OBJECT), EV_URI, 3) { refs ->
        """
        check-cast p2, $EXTERNAL_DOCUMENT
        invoke-static {p0, p1, p2}, ${refs.prepareUri}
        move-result-object p0
        return-object p0
        """
    },
    ExternalStub("createStream", emptyList(), EV_OBJECT, 1) { refs ->
        """
        new-instance v0, ${refs.stream}
        invoke-direct {v0}, ${refs.stream}-><init>()V
        return-object v0
        """
    },
    // new DataSpec(address, GET, null, no headers, position, length, null, 0), then open it.
    ExternalStub("streamOpen", listOf(EV_OBJECT, EV_URI, "J", "J"), "J", 17) { refs ->
        """
        new-instance v0, ${refs.dataSpec}
        move-object/from16 v1, p1
        const/4 v2, 0x1
        const/4 v3, 0x0
        invoke-static {}, Ljava/util/Collections;->emptyMap()Ljava/util/Map;
        move-result-object v4
        move-wide/from16 v5, p2
        move-wide/from16 v7, p4
        const/4 v9, 0x0
        const/4 v10, 0x0
        invoke-direct/range {v0 .. v10}, ${refs.dataSpec}$EV_SPEC_INIT
        check-cast p0, ${refs.stream}
        invoke-virtual {p0, v0}, ${refs.streamOpen}
        move-result-wide v0
        return-wide v0
        """
    },
    ExternalStub("streamRead", listOf(EV_OBJECT, "[B", "I", "I"), "I", 4) { refs ->
        """
        check-cast p0, ${refs.stream}
        invoke-virtual {p0, p1, p2, p3}, ${refs.stream}->read([BII)I
        move-result p0
        return p0
        """
    },
    ExternalStub("streamClose", listOf(EV_OBJECT), "V", 1) { refs ->
        """
        check-cast p0, ${refs.stream}
        invoke-virtual {p0}, ${refs.stream}->close()V
        return-void
        """
    },
    ExternalStub("fileUri", listOf(EV_CONTEXT, EV_STRING, EV_FILE), EV_URI, 3) { refs ->
        """
        invoke-static {p0, p1, p2}, ${refs.fileUri}
        move-result-object p0
        return-object p0
        """
    },
    ExternalStub("cellMessageObject", listOf(EV_OBJECT), EV_OBJECT, 1) { refs ->
        """
        check-cast p0, ${refs.cell}
        iget-object p0, p0, ${refs.cellMessage}
        return-object p0
        """
    },
    ExternalStub("cellButtonState", listOf(EV_OBJECT), "I", 1) { refs ->
        """
        check-cast p0, ${refs.cell}
        iget p0, p0, ${refs.cellButton}
        return p0
        """
    },
)

/** The runtime the hooks and stubs belong to, the extension's own, so a change there refuses the patch. */
internal fun BytecodePatchContext.requireExternalVideoRuntime() {
    requireStatusMethod("externalPlayer")
    controlHook(EXTERNAL_VIDEO, "open", listOf(EV_OBJECT), "I")
    controlHook(EXTERNAL_VIDEO, "pressed", listOf(EV_OBJECT, "I"), "I")
    for (stub in EXTERNAL_STUBS) controlHook(EXTERNAL_VIDEO, stub.name, stub.parameters, stub.result)
}

/** Gives the stubs their code. With [install] false it only builds and checks them. */
internal fun BytecodePatchContext.writeExternalVideoStubs(refs: ExternalVideoRefs, install: Boolean = true) {
    for (stub in EXTERNAL_STUBS) writeStub(EXTERNAL_VIDEO, stub.name, stub.registers, stub.smali(refs), install)
}

/** Why this build's videos can't open in another app. */
private class NoExternalVideo(why: String) : Exception(why)

private fun externalFit(ok: Boolean, why: String) {
    if (!ok) throw NoExternalVideo(why)
}

private fun Method.isStaticMethod() = AccessFlags.STATIC.isSet(accessFlags)
private fun Method.isFinalMethod() = AccessFlags.FINAL.isSet(accessFlags)
private fun Method.isPublicMethod() = AccessFlags.PUBLIC.isSet(accessFlags)
private fun Method.parameters() = parameterTypes.map(CharSequence::toString)
private fun Instruction.rawReference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.writesRegister(register: Int): Boolean {
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    if (!opcode.setsRegister()) return false
    return written == register || (opcode.setsWideRegister() && written + 1 == register)
}

/**
 * Finds the two ways a tap on a video gets going, and everything the stubs need:
 *  - the method every one of the viewer's openers ends up in, which takes the message first. It's
 *    final, and answering false from it is what the viewer does when it can't open something.
 *  - the chat cell's button press, for a video that isn't downloaded: its arrow starts the download
 *    there rather than opening the viewer. The press marks the message for the Downloads list and
 *    then reads the button's state, and the hook goes on that read.
 */
internal fun BytecodePatchContext.resolveExternalVideo(): ExternalVideoPlan = try {
    externalVideo().also {
        it.rehearse()
        writeExternalVideoStubs(it.refs!!, install = false)
    }
} catch (missing: NoExternalVideo) {
    ExternalVideoPlan(emptyList(), null, missing.message)
} catch (refused: PatchException) {
    ExternalVideoPlan(emptyList(), null, refused.message)
} catch (failed: RuntimeException) {
    // Code this build reads in a way nothing here expected.
    ExternalVideoPlan(emptyList(), null, "the way videos open can't be read (${failed.javaClass.simpleName}: ${failed.message})")
}

private fun BytecodePatchContext.externalVideo(): ExternalVideoPlan {
    requireExternalMembers()
    val message = tgClassDefByOrNull(EXTERNAL_MESSAGE)!!.type
    val document = tgClassDefByOrNull(EXTERNAL_DOCUMENT)!!.type
    val viewerEdit = viewerHook(message)
    val press = cellPress(message)

    val stream = tgClassDefByOrNull(EXTERNAL_STREAM) ?: throw NoExternalVideo("Telegram's streaming loader is missing")
    val open = stream.methods.filter {
        it.name == "open" && !it.isStaticMethod() && it.isPublicMethod() && it.returnType == "J" && it.parameterTypes.size == 1
    }.controlSingle("streaming loader's open")
    val dataSpec = open.parameters().single()
    externalFit(tgClassDefByOrNull(dataSpec) != null, "the streaming loader's request class is missing")
    // Its parameters come in another order than in Telegram's source, and the message is an Object.
    val prepare = stream.methods.filter {
        it.isStaticMethod() && it.isPublicMethod() && it.returnType == EV_URI && it.parameters() == listOf("I", EV_OBJECT, document)
    }.controlSingle("streaming loader's address builder")
    val provider = tgClassDefByOrNull(EXTERNAL_FILE_PROVIDER) ?: throw NoExternalVideo("Telegram's file provider is missing")
    val fileUri = provider.methods.filter {
        it.isStaticMethod() && it.isPublicMethod() && it.returnType == EV_URI && it.parameters() == listOf(EV_CONTEXT, EV_STRING, EV_FILE)
    }.controlSingle("file provider's address builder")

    val refs = ExternalVideoRefs(
        stream = stream.type,
        dataSpec = dataSpec,
        streamOpen = open.toString(),
        prepareUri = prepare.toString(),
        fileUri = fileUri.toString(),
        cell = press.method.definingClass,
        cellMessage = press.message,
        cellButton = press.button,
    )
    for ((reference, static) in listOf(
        refs.streamOpen to false,
        refs.prepareUri to true,
        refs.fileUri to true,
        "${refs.dataSpec}$EV_SPEC_INIT" to false,
        refs.cellMessage to false,
        refs.cellButton to false,
    )) {
        try {
            requireReachable(reference, static)
        } catch (failed: PatchException) {
            throw NoExternalVideo("$reference isn't reachable from the extension")
        }
    }
    return ExternalVideoPlan(listOf(viewerEdit, press.edit), refs, null)
}

/** Telegram's members the stubs name, by the names in its source. */
private fun BytecodePatchContext.requireExternalMembers() {
    controlMembers(
        EXTERNAL_MESSAGE, "isVideo()Z", "isRoundVideo()Z", "isGif()Z", "isSecretMedia()Z", "needDrawBluredPreview()Z", "getDialogId()J",
        "getDocument()$EXTERNAL_DOCUMENT", "getDocumentName()$EV_STRING", "currentAccount:I", "messageOwner:$EXTERNAL_TL_MESSAGE",
        "putInDownloadsStore:Z",
    )
    controlMembers(EXTERNAL_TL_MESSAGE, "noforwards:Z", "attachPath:$EV_STRING")
    controlMembers(EXTERNAL_DOCUMENT, "size:J", "mime_type:$EV_STRING")
    controlMembers(
        EXTERNAL_LOADER, "static getInstance(I)$EXTERNAL_LOADER", "static getPathToMessage($EXTERNAL_TL_MESSAGE)$EV_FILE",
        "static getAttachFileName($EXTERNAL_TL_OBJECT)$EV_STRING", "isLoadingFile($EV_STRING)Z", "cancelLoadFile($EXTERNAL_DOCUMENT)V",
    )
    controlMembers(EXTERNAL_CONTROLLER, "static getInstance(I)$EXTERNAL_CONTROLLER", "isPeerNoForwards(J)Z")
    controlMembers(EXTERNAL_DIALOG, "static isEncryptedDialog(J)Z")
    controlMembers(EXTERNAL_STREAM, "<init>()V", "read([BII)I", "close()V")
}

/** The viewer's open, asked first thing. v0 holds nothing yet there. */
private fun BytecodePatchContext.viewerHook(message: String): ExternalVideoEdit {
    val viewer = tgMutableClassDefByOrNull(PHOTO_VIEWER) ?: throw NoExternalVideo("the video viewer is missing")
    val open = viewer.methods.filter { method ->
        val types = method.parameters()
        !method.isStaticMethod() && method.returnType == "Z" && types.size > 4 && types[0] == message && types[4] == EV_ARRAY_LIST
    }.controlSingle("video viewer's open")
    externalFit(open.isFinalMethod(), "the video viewer's open can be overridden")
    val flow = ControlFlow.of(open)
    externalFit(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of the video viewer's open")
    val first = open.parameterRegisterNumber(0)
    // The register under the first parameter holds `this`, so v0 has to sit below that.
    externalFit(first > 1, "the video viewer's open has no register to spare")
    return ExternalVideoEdit(open, 0, """
        move-object/from16 v0, v$first
        invoke-static {v0}, $EXTERNAL_OPEN
        move-result v0
        if-eqz v0, :$EV_LABEL
        const/4 v0, 0x0
        return v0
    """, 6)
}

private class CellPress(val method: MutableMethod, val edit: ExternalVideoEdit, val message: String, val button: String)

/** The button press: `message.putInDownloadsStore = true`, then the read of the button's state. */
private fun BytecodePatchContext.cellPress(message: String): CellPress {
    val found = mutableListOf<CellPress>()
    forEachClassMentioning(Mention.reference(EXTERNAL_MARK)) { cls ->
        if (!cls.origType.startsWith("Lapp/hushtelegram/")) {
            tgMutableClassDefBy(cls.type).methods.filter {
                !it.isStaticMethod() && it.returnType == "V" && it.parameters() == listOf("Z") && it.implementation != null
            }.forEach { method -> cellPressIn(method, message)?.let(found::add) }
        }
    }
    val press = found.controlSingle("chat cell's button press")
    externalFit(press.method.isFinalMethod(), "the chat cell's button press can be overridden")
    return press
}

private fun cellPressIn(method: MutableMethod, message: String): CellPress? {
    val body = method.controlBody()
    val mark = body.indices.singleOrNull { body[it].opcode == Opcode.IPUT_BOOLEAN && body[it].controlRef() == EXTERNAL_MARK } ?: return null
    if (mark == 0 || mark + 1 > body.lastIndex) return null
    val read = body[mark - 1] as? TwoRegisterInstruction ?: return null
    val state = body[mark + 1] as? TwoRegisterInstruction ?: return null
    val store = body[mark] as TwoRegisterInstruction
    val messageField = body[mark - 1].controlField() ?: return null
    val stateField = body[mark + 1].controlField() ?: return null
    if (body[mark - 1].opcode != Opcode.IGET_OBJECT || body[mark + 1].opcode != Opcode.IGET) return null
    if (messageField.type != message || messageField.definingClass != method.definingClass) return null
    if (stateField.type != "I" || stateField.definingClass != method.definingClass) return null
    if (read.registerA != store.registerB || read.registerB != state.registerB) return null

    val self = state.registerB
    val result = state.registerA
    externalFit(self < 16 && result < 16 && self != result, "the chat cell's button press keeps itself out of reach")
    val video = method.parameterRegisterNumber(0)
    externalFit(body.none { it.writesRegister(video) }, "the chat cell's button press changes what it was told")
    val edit = ExternalVideoEdit(method, mark + 1, """
        move/from16 v$result, v$video
        invoke-static {v$self, v$result}, $EXTERNAL_PRESSED
        move-result v$result
        if-eqz v$result, :$EV_LABEL
        return-void
    """, 5)
    return CellPress(method, edit, body[mark - 1].rawReference()!!, body[mark + 1].rawReference()!!)
}

/**
 * Declares the service that keeps Telegram running while a player streams from it, and the
 * permissions it needs. Android freezes an app that has only a player on top of it.
 */
internal val externalVideoManifestPatch = resourcePatch {
    execute {
        document("AndroidManifest.xml").use { document ->
            externalVideoManifest(document)?.let { patchLog.warning("Keep videos muted on volume keys: $it.") }
        }
    }
}

/** Adds what's missing, or says why nothing changed. */
internal fun externalVideoManifest(document: Document): String? {
    val applications = document.getElementsByTagName("application")
    if (applications.length != 1) return "the manifest has no single application element, so streamed videos stop behind the player"
    val application = applications.item(0) as Element
    val declared = document.getElementsByTagName("uses-permission")
    val names = (0 until declared.length).map { (declared.item(it) as Element).getAttribute("android:name") }
    for (permission in EXTERNAL_PERMISSIONS - names.toSet()) {
        val element = document.createElement("uses-permission").apply { setAttribute("android:name", permission) }
        document.documentElement.insertBefore(element, application)
    }
    val services = document.getElementsByTagName("service")
    if ((0 until services.length).none { (services.item(it) as Element).getAttribute("android:name") == EXTERNAL_SERVICE }) {
        application.appendChild(document.createElement("service").apply {
            setAttribute("android:name", EXTERNAL_SERVICE)
            setAttribute("android:exported", "false")
            setAttribute("android:foregroundServiceType", MEDIA_PLAYBACK)
        })
    }
    return null
}
