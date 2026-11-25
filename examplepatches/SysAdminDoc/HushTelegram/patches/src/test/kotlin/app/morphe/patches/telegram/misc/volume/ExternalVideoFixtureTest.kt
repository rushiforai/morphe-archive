/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import app.morphe.util.names.addInstructions
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origName
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderInstruction
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import org.w3c.dom.Document
import org.w3c.dom.Element
import org.xml.sax.InputSource
import java.io.File
import java.io.StringReader
import java.util.concurrent.ConcurrentHashMap
import javax.xml.parsers.DocumentBuilderFactory

/** Where a tap on a video reaches the extension, and what the stubs read from Telegram. */
class ExternalVideoFixtureTest {
    private fun contextFor(build: File) = PatchContexts.of((ExtensionDex.classes() + externalVideoHosts(build)).distinctBy { it.type })

    @Test fun `the viewer and the cell's button ask the extension first and keep the rest of their code`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            context.requireExternalVideoRuntime()
            val plan = context.resolveExternalVideo()
            assertNull("$name: ${plan.missing}", plan.missing)
            val refs = plan.refs!!
            assertEquals(name, 2, plan.edits.size)
            val (viewer, press) = plan.edits
            val viewerStock = viewer.method.code().map(::shape)
            val pressStock = press.method.code().map(::shape)
            // Telegram's own jumps onto the button's read: a press that skips the sticker check comes this way.
            val jumps = press.method.instructions().filterIsInstance<BuilderOffsetInstruction>().filter { it.target.location.index == press.index }
            assertTrue("$name: the read is a jump target", jumps.isNotEmpty())
            plan.apply()

            assertEquals(name, context.tgMutableClassDefBy(PHOTO_VIEWER).type, viewer.method.definingClass)
            val message = context.tgMutableClassDefBy(EXTERNAL_MESSAGE).type
            assertEquals(name, message, viewer.method.parameterTypes[0].toString())
            assertEquals(name, "Z", viewer.method.returnType)
            val asked = viewer.method.code()
            assertEquals(name, Opcode.MOVE_OBJECT_FROM16, asked[0].opcode)
            assertEquals(name, listOf(0, viewer.method.firstParameter()), asked[0].namedRegisters())
            assertEquals(name, Opcode.INVOKE_STATIC, asked[1].opcode)
            assertEquals(name, EXTERNAL_OPEN, asked[1].controlRef())
            assertEquals(name, listOf(0), asked[1].namedRegisters())
            assertResult(name, asked[2], 0)
            assertEquals(name, Opcode.IF_EQZ, asked[3].opcode)
            assertEquals(name, listOf(0), asked[3].namedRegisters())
            assertEquals("$name: no means Telegram's own first instruction", viewer.method.indexOf(asked[6]), asked[3].jumpTarget())
            assertEquals("$name: yes answers false", 0, (asked[4] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(name, listOf(0), asked[4].namedRegisters())
            assertEquals(name, Opcode.RETURN, asked[5].opcode)
            assertEquals(name, listOf(0), asked[5].namedRegisters())
            assertEquals("$name: the viewer's own code", viewerStock, asked.drop(6).map(::shape))

            val body = press.method.code()
            val at = body.indexOfFirst { it.controlRef() == EXTERNAL_PRESSED }
            assertEquals("$name: asked once", 1, body.count { it.controlRef() == EXTERNAL_PRESSED })
            val (self, result) = body[at].namedRegisters()
            assertEquals(name, Opcode.INVOKE_STATIC, body[at].opcode)
            assertEquals(name, Opcode.MOVE_FROM16, body[at - 1].opcode)
            assertEquals("$name: what the press was told", listOf(result, press.method.firstParameter()), body[at - 1].namedRegisters())
            assertEquals(name, Opcode.IPUT_BOOLEAN, body[at - 2].opcode)
            assertEquals(name, EXTERNAL_MARK, body[at - 2].controlRef())
            assertEquals(name, Opcode.IGET_OBJECT, body[at - 3].opcode)
            assertEquals(name, refs.cellMessage, body[at - 3].raw())
            assertEquals(name, self, body[at - 3].namedRegisters()[1])
            assertResult(name, body[at + 1], result)
            assertEquals(name, Opcode.IF_EQZ, body[at + 2].opcode)
            assertEquals(name, listOf(result), body[at + 2].namedRegisters())
            assertEquals(name, Opcode.RETURN_VOID, body[at + 3].opcode)
            assertEquals(name, Opcode.IGET, body[at + 4].opcode)
            assertEquals(name, refs.cellButton, body[at + 4].raw())
            assertEquals(name, listOf(result, self), body[at + 4].namedRegisters())
            assertEquals("$name: no goes on to Telegram's read", press.method.indexOf(body[at + 4]), body[at + 2].jumpTarget())
            val hook = at - 1
            for (jump in jumps) {
                assertEquals("$name: Telegram's jumps reach the question", press.method.indexOf(body[hook]), jump.target.location.index)
            }
            assertEquals("$name: the press's own code", pressStock, body.filterIndexed { i, _ -> i !in hook..at + 3 }.map(::shape))
        }
    }

    @Test fun `each stub reads what its name says from Telegram's own members`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            val refs = context.resolveExternalVideo().refs!!
            context.writeExternalVideoStubs(refs)
            val stubs = context.tgMutableClassDefBy(EXTERNAL_VIDEO).methods.associateBy { it.origName }
            fun body(stub: String) = stubs.getValue(stub).code()
            val document = context.tgMutableClassDefBy(EXTERNAL_DOCUMENT).type

            val members = mapOf(
                "messageIsVideo" to "$EXTERNAL_MESSAGE->isVideo()Z",
                "messageIsRound" to "$EXTERNAL_MESSAGE->isRoundVideo()Z",
                "messageIsGif" to "$EXTERNAL_MESSAGE->isGif()Z",
                "messageIsSecret" to "$EXTERNAL_MESSAGE->isSecretMedia()Z",
                "messageIsBlurred" to "$EXTERNAL_MESSAGE->needDrawBluredPreview()Z",
                "messageDialog" to "$EXTERNAL_MESSAGE->getDialogId()J",
                "dialogIsEncrypted" to "$EXTERNAL_DIALOG->isEncryptedDialog(J)Z",
                "messageNoForwards" to "$EXTERNAL_TL_MESSAGE->noforwards:Z",
                "chatNoForwards" to "$EXTERNAL_CONTROLLER->isPeerNoForwards(J)Z",
                "messageDocument" to "$EXTERNAL_MESSAGE->getDocument()$EXTERNAL_DOCUMENT",
                "messageAccount" to "$EXTERNAL_MESSAGE->currentAccount:I",
                "messagePath" to "$EXTERNAL_TL_MESSAGE->attachPath:Ljava/lang/String;",
                "messageFile" to "$EXTERNAL_LOADER->getPathToMessage($EXTERNAL_TL_MESSAGE)Ljava/io/File;",
                "messageName" to "$EXTERNAL_MESSAGE->getDocumentName()Ljava/lang/String;",
                "messageMarkDownload" to EXTERNAL_MARK,
                "documentMime" to "$EXTERNAL_DOCUMENT->mime_type:Ljava/lang/String;",
                "documentSize" to "$EXTERNAL_DOCUMENT->size:J",
                "documentKey" to "$EXTERNAL_LOADER->getAttachFileName($EXTERNAL_TL_OBJECT)Ljava/lang/String;",
                "loadRunning" to "$EXTERNAL_LOADER->isLoadingFile(Ljava/lang/String;)Z",
                "stopLoad" to "$EXTERNAL_LOADER->cancelLoadFile($EXTERNAL_DOCUMENT)V",
            )
            for ((stub, member) in members) {
                assertTrue("$name: $stub uses $member", body(stub).any { it.controlRef() == member })
            }

            assertTrue("$name: ${refs.prepareUri}", refs.prepareUri.endsWith("(ILjava/lang/Object;$document)Landroid/net/Uri;"))
            assertEquals(name, refs.prepareUri, body("streamUri").single { it.opcode == Opcode.INVOKE_STATIC }.raw())
            assertEquals(name, refs.stream, body("createStream").single { it.opcode == Opcode.NEW_INSTANCE }.raw())
            assertEquals(name, "${refs.stream}-><init>()V", body("createStream").single { it.opcode == Opcode.INVOKE_DIRECT }.raw())

            val open = body("streamOpen")
            assertEquals(name, refs.dataSpec, open.single { it.opcode == Opcode.NEW_INSTANCE }.raw())
            val request = open.single { it.opcode == Opcode.INVOKE_DIRECT_RANGE }
            assertEquals(name, "${refs.dataSpec}-><init>(Landroid/net/Uri;I[BLjava/util/Map;JJLjava/lang/String;I)V", request.raw())
            assertEquals("$name: the request and each of its arguments", (0..10).toList(), request.namedRegisters())
            assertEquals(name, refs.streamOpen, open.single { it.opcode == Opcode.INVOKE_VIRTUAL }.raw())
            assertEquals(name, "${refs.stream}->read([BII)I", body("streamRead").single { it.opcode == Opcode.INVOKE_VIRTUAL }.raw())
            assertEquals(name, "${refs.stream}->close()V", body("streamClose").single { it.opcode == Opcode.INVOKE_VIRTUAL }.raw())
            assertEquals(name, refs.fileUri, body("fileUri").single { it.opcode == Opcode.INVOKE_STATIC }.raw())
            assertEquals(name, refs.cellMessage, body("cellMessageObject").single { it.opcode == Opcode.IGET_OBJECT }.raw())
            assertEquals(name, refs.cellButton, body("cellButtonState").single { it.opcode == Opcode.IGET }.raw())
        }
    }

    @Test fun `resolving changes nothing, not even the stubs`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = contextFor(build)
            val before = state(build, context)
            assertNull(build.name, context.resolveExternalVideo().missing)
            assertEquals(build.name, before, state(build, context))
        }
    }

    @Test fun `anything unexpected refuses before a method changes`() {
        val cases: List<Pair<String, (BytecodePatchContext, MutableMethod, MutableMethod) -> Unit>> = listOf(
            "the video viewer's open can be overridden" to { _, viewer, _ -> viewer.accessFlags = viewer.accessFlags and AccessFlags.FINAL.value.inv() },
            "video viewer's open is missing or ambiguous" to { c, viewer, _ -> c.tgMutableClassDefBy(PHOTO_VIEWER).methods.removeAll { it.toString() == viewer.toString() } },
            "something jumps back to the start of the video viewer's open" to { _, viewer, _ ->
                viewer.addInstructionsWithLabels(1, "if-eqz v0, :hush_start", ExternalLabel("hush_start", viewer.getInstruction(0)))
            },
            "the chat cell's button press can be overridden" to { _, _, press -> press.accessFlags = press.accessFlags and AccessFlags.FINAL.value.inv() },
            "chat cell's button press is missing or ambiguous" to { c, _, press ->
                c.tgMutableClassDefBy(press.definingClass).methods.removeAll { it.toString() == press.toString() }
            },
            "the chat cell's button press changes what it was told" to { _, _, press ->
                press.addInstructions(0, "const/16 v${press.firstParameter()}, 0x0")
            },
            "streaming loader's open is missing or ambiguous" to { c, _, _ ->
                c.tgMutableClassDefBy(EXTERNAL_STREAM).methods.removeAll { it.name == "open" && it.returnType == "J" }
            },
            "streaming loader's address builder is missing or ambiguous" to { c, _, _ ->
                c.tgMutableClassDefBy(EXTERNAL_STREAM).methods.removeAll { it.returnType == "Landroid/net/Uri;" && AccessFlags.STATIC.isSet(it.accessFlags) }
            },
            "file provider's address builder is missing or ambiguous" to { c, _, _ ->
                c.tgMutableClassDefBy(EXTERNAL_FILE_PROVIDER).methods.removeAll { it.returnType == "Landroid/net/Uri;" && AccessFlags.STATIC.isSet(it.accessFlags) }
            },
            "isn't reachable from the extension" to { c, _, _ ->
                val open = c.tgMutableClassDefBy(EXTERNAL_STREAM).methods.single { it.name == "open" && it.returnType == "J" }
                c.tgMutableClassDefBy(open.parameterTypes.single().toString()).methods
                    .single { it.name == "<init>" && it.parameterTypes.joinToString("") == "Landroid/net/Uri;I[BLjava/util/Map;JJLjava/lang/String;I" }
                    .let { it.accessFlags = it.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value }
            },
            "isVideo" to { c, _, _ -> c.tgMutableClassDefBy(EXTERNAL_MESSAGE).methods.removeAll { it.origName == "isVideo" && it.parameterTypes.isEmpty() } },
        )
        for (build in Fixtures.declaredBuilds()) {
            for ((why, change) in cases) {
                val context = contextFor(build)
                val found = context.resolveExternalVideo()
                change(context, found.edits[0].method, found.edits[1].method)
                val before = state(build, context)
                val plan = context.resolveExternalVideo()
                val missing = plan.missing
                assertNotNull("${build.name}: $why", missing)
                assertTrue("${build.name}: $why, got: $missing", why in missing!!)
                assertTrue("${build.name}: $why", plan.edits.isEmpty())
                assertNull("${build.name}: $why", plan.refs)
                assertEquals("${build.name}: $why leaves everything as it was", before, state(build, context))
            }
        }
    }

    @Test fun `the manifest gains the service and only the permissions it lacks`() {
        val bare = parse(manifest(""))
        assertNull(externalVideoManifest(bare))
        assertEquals(listOf(FOREGROUND, MEDIA), permissions(bare))
        val tags = bare.documentElement.childNodes.let { nodes -> (0 until nodes.length).map { (nodes.item(it) as Element).tagName } }
        assertEquals("the permissions sit before the application", listOf("uses-permission", "uses-permission", "application"), tags)
        val service = services(bare).single()
        assertEquals(EXTERNAL_SERVICE, service.getAttribute("android:name"))
        assertEquals("nothing outside the app can start it", "false", service.getAttribute("android:exported"))
        assertEquals("mediaPlayback", service.getAttribute("android:foregroundServiceType"))

        val telegram = parse(manifest("<uses-permission android:name=\"$FOREGROUND\" /><uses-permission android:name=\"$MEDIA\" />"))
        assertNull(externalVideoManifest(telegram))
        assertEquals("no second copies", listOf(FOREGROUND, MEDIA), permissions(telegram))

        val partial = parse(manifest("<uses-permission android:name=\"$FOREGROUND\" />"))
        assertNull(externalVideoManifest(partial))
        assertEquals(listOf(FOREGROUND, MEDIA), permissions(partial))

        assertNull("a second run adds nothing", externalVideoManifest(bare))
        assertEquals(1, services(bare).size)
        assertEquals(listOf(FOREGROUND, MEDIA), permissions(bare))
    }

    @Test fun `a manifest without one application is left alone and says so`() {
        val empty = parse("<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\"><uses-sdk /></manifest>")
        assertEquals("the manifest has no single application element, so streamed videos stop behind the player", externalVideoManifest(empty))
        assertTrue(permissions(empty).isEmpty())
        assertTrue(services(empty).isEmpty())
    }

    @Test fun `the manifest names the extension's service`() {
        val type = "L" + EXTERNAL_SERVICE.replace('.', '/') + ";"
        val service = ExtensionDex.classes().single { it.type == type }
        assertEquals("android's service", "Landroid/app/Service;", service.superclass)
        assertTrue(AccessFlags.PUBLIC.isSet(service.accessFlags))
    }

    private fun assertResult(name: String, instruction: Instruction, register: Int) {
        assertEquals(name, Opcode.MOVE_RESULT, instruction.opcode)
        assertEquals(name, listOf(register), instruction.namedRegisters())
    }

    /** Every method of the slice and of the extension's class, by what it does. */
    private fun state(build: File, context: BytecodePatchContext) = (externalVideoHosts(build).map { it.type } + EXTERNAL_VIDEO).associateWith { type ->
        context.tgMutableClassDefBy(type).methods.map { method -> listOf(method.toString(), method.accessFlags, method.code().map(::shape)) }
    }

    /** An instruction by what it does: an insert can push a branch past a short goto's reach. */
    private fun shape(instruction: Instruction): List<Any?> {
        val opcode = if (instruction.opcode == Opcode.GOTO_16 || instruction.opcode == Opcode.GOTO_32) Opcode.GOTO else instruction.opcode
        return listOf(opcode, instruction.namedRegisters(), instruction.controlRef())
    }

    /** The register of the first declared parameter, worked out from the method's shape. */
    private fun MutableMethod.firstParameter(): Int =
        implementation!!.registerCount - parameterTypes.sumOf { type -> if (type.toString() == "J" || type.toString() == "D") 2.toInt() else 1.toInt() }

    private fun MutableMethod.instructions(): List<BuilderInstruction> = implementation!!.instructions.toList()
    private fun MutableMethod.indexOf(instruction: Instruction) = instructions().indexOfFirst { it === instruction }
    private fun Instruction.jumpTarget() = (this as BuilderOffsetInstruction).target.location.index
    private fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty().filter { it.opcode != Opcode.NOP }
    private fun Instruction.raw() = (this as? ReferenceInstruction)?.reference?.toString()

    private fun manifest(permissions: String) =
        "<manifest xmlns:android=\"http://schemas.android.com/apk/res/android\">$permissions<application><activity android:name=\"a\" /></application></manifest>"

    private fun parse(xml: String): Document =
        DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(InputSource(StringReader(xml)))

    private fun elements(document: Document, tag: String) =
        document.getElementsByTagName(tag).let { nodes -> (0 until nodes.length).map { nodes.item(it) as Element } }

    private fun permissions(document: Document) = elements(document, "uses-permission").map { it.getAttribute("android:name") }
    private fun services(document: Document) = elements(document, "service")

    private companion object {
        const val FOREGROUND = "android.permission.FOREGROUND_SERVICE"
        const val MEDIA = "android.permission.FOREGROUND_SERVICE_MEDIA_PLAYBACK"
    }
}

private val EXTERNAL_VIDEO_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The viewer, the chat cell, the streaming loader with its request class, and what the stubs read. */
internal fun externalVideoHosts(build: File): List<ClassDef> = EXTERNAL_VIDEO_HOSTS.hostsOf(build.path) {
    val named = FixtureDex.classes(build, setOf(
        PHOTO_VIEWER, EXTERNAL_MESSAGE, EXTERNAL_TL_MESSAGE, EXTERNAL_DOCUMENT, EXTERNAL_TL_OBJECT, EXTERNAL_LOADER,
        EXTERNAL_CONTROLLER, EXTERNAL_DIALOG, EXTERNAL_STREAM, EXTERNAL_FILE_PROVIDER,
    ))
    val message = named.getValue(EXTERNAL_MESSAGE).type
    val request = named.getValue(EXTERNAL_STREAM).methods
        .single { it.name == "open" && it.returnType == "J" && it.parameterTypes.size == 1 }.parameterTypes.single().toString()
    // By shape, since the cell's own name changes: a (Z)V that sets a flag on a message field it holds.
    val cells = FixtureDex.classesWhere(build, { true }) { method ->
        method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf("Z") &&
            method.implementation?.instructions?.toList().orEmpty().let { body ->
                fun field(instruction: Instruction) = (instruction as? ReferenceInstruction)?.reference as? FieldReference
                body.any { it.opcode == Opcode.IPUT_BOOLEAN && field(it)?.definingClass == message } &&
                    body.any { it.opcode == Opcode.IGET_OBJECT && field(it)?.type == message }
            }
    }
    (named.values + FixtureDex.classes(build, setOf(request)).values + cells).distinctBy { it.type }
}
