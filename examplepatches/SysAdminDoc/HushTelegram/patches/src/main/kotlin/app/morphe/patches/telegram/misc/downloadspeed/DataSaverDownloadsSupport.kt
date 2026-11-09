/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.downloadspeed

import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.names.tgMutableClassDefByOrNull

internal const val DATA_SAVER = "$EXTENSION_PACKAGE/misc/DataSaverDownloads;"
internal const val DOWNLOAD_CONTROLLER = "Lorg/telegram/messenger/DownloadController;"
internal const val CURRENT_MASK = "$DOWNLOAD_CONTROLLER->getCurrentDownloadMask()I"
internal const val CHECK_SETTINGS = "$DOWNLOAD_CONTROLLER->checkAutodownloadSettings()V"
internal const val QUEUE_KEYS = "$DOWNLOAD_CONTROLLER->downloadQueueKeys:Ljava/util/HashMap;"
internal const val QUEUE_PAIRS = "$DOWNLOAD_CONTROLLER->downloadQueuePairs:Ljava/util/HashMap;"
private const val MEDIA_CONTROLLER = "Lorg/telegram/messenger/MediaController;"
private const val NETWORK_TYPE = "Lorg/telegram/messenger/ApplicationLoader;->getAutodownloadNetworkType()I"
private const val MESSAGE_OBJECT = "Lorg/telegram/messenger/MessageObject;"
private const val MESSAGE = "Lorg/telegram/tgnet/TLRPC\$Message;"
private const val INTERNAL = "canDownloadMediaInternal"
private const val FILE_LOADER = "Lorg/telegram/messenger/FileLoader;"
private const val HOLD = "invoke-static {}, $DATA_SAVER->hold()Z"
private val SELF_CALLS = setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE, Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)
private val SWITCHES = setOf(Opcode.PACKED_SWITCH, Opcode.SPARSE_SWITCH)

/** What an answer must still do to be the one about automatic downloads. */
internal enum class AutoDownloadCheck(val what: String) {
    /** Reads which network the phone is on to pick that network's automatic download settings. */
    NETWORK("reads the network's download settings"),
    /** Goes through canDownloadMediaInternal, which does. */
    MESSAGE("asks the message check that reads the network's download settings"),
    /** Reads the network's settings and loads the song after the one playing. */
    NEXT_SONG("reads the network's download settings and loads the next song"),
    /** Starts the loads the download queue holds. */
    LOADS("starts the queue's downloads"),
}

/**
 * The answers about automatic downloads, each by its [signature] in its [owner], and the [check]
 * that shows it's still that answer. A yes from the runtime, asked by [ask], answers no at the
 * start of each: no media types for the network, nothing to download for a chat's media, a new
 * message's media or a size, no next song or story to load ahead, and nothing started from the
 * download queue.
 *
 * 13.2's R8 folded three of DownloadController's answers into the code that asked them. Chat cells
 * now run canDownloadMediaType's body themselves, which ends in canDownloadMediaInternal, so that
 * check is held. canDownloadNextTrack went into MediaController.checkIsNextMusicFileDownloaded, the
 * one place that asked it, so that method is held. processDownloadObjects became one case of a
 * storage runnable that R8 shares between lambdas, so its [owner] is empty and the hold goes at the
 * start of that case (see [queueSite]).
 */
internal enum class AutoDownloadAnswer(val owner: String?, val signature: String, val check: AutoDownloadCheck, val ask: String = HOLD) {
    // The range form reaches p0 however many registers the method has; {p0} stops at v15.
    MASK(DOWNLOAD_CONTROLLER, "getCurrentDownloadMask()I", AutoDownloadCheck.NETWORK,
        "invoke-static/range {p0 .. p0}, $DATA_SAVER->holdMask(Ljava/lang/Object;)Z"),
    MESSAGE_MEDIA(DOWNLOAD_CONTROLLER, "canDownloadMedia($MESSAGE_OBJECT)Z", AutoDownloadCheck.MESSAGE),
    MESSAGE_CHECK(DOWNLOAD_CONTROLLER, "$INTERNAL($MESSAGE_OBJECT)I", AutoDownloadCheck.NETWORK),
    NEW_MESSAGE(DOWNLOAD_CONTROLLER, "canDownloadMedia($MESSAGE)I", AutoDownloadCheck.NETWORK),
    SIZED(DOWNLOAD_CONTROLLER, "canDownloadMedia(IJ)Z", AutoDownloadCheck.NETWORK),
    STORIES(DOWNLOAD_CONTROLLER, "canPreloadStories()Z", AutoDownloadCheck.NETWORK),
    NEXT_SONG(MEDIA_CONTROLLER, "checkIsNextMusicFileDownloaded(I)V", AutoDownloadCheck.NEXT_SONG),
    QUEUE(null, "processDownloadObjects(ILjava/util/ArrayList;)V", AutoDownloadCheck.LOADS);

    /** How a refusal names it. */
    val label: String get() = owner?.let { "${it.substringAfterLast('/').dropLast(1)}.$signature" } ?: "the download queue's start"

    /** Whether a no is returning with nothing done, rather than false or 0. */
    val void: Boolean get() = signature.endsWith(")V")
}

/** Where a hold goes: in front of instruction [at] of [method], with local [register] taking the runtime's answer. */
internal class HoldSite(val method: MutableMethod, val at: Int, val register: Int)

/** Every answer's hold site, found and checked before anything is edited, or [missing], why this build can't hold. */
internal class DataSaverPlan(val holds: Map<AutoDownloadAnswer, HoldSite>, val missing: String?) {
    /** Every edit, on the methods themselves or on what [into] makes of each. */
    fun apply(into: (MutableMethod) -> MutableMethod = { it }) {
        for ((answer, site) in holds) insertHold(into(site.method), site, answer)
    }

    /** The same edits on copies, so a smali or register problem refuses before the app is touched. */
    fun rehearse() = apply { MutableMethod(ImmutableMethod.of(it)) }

    companion object {
        fun missing(why: String) = DataSaverPlan(emptyMap(), why)
    }
}

/** On a yes the answer is no: false or 0, or for the queue and the next song, nothing started. */
private fun insertHold(target: MutableMethod, site: HoldSite, answer: AutoDownloadAnswer) {
    val r = "v${site.register}"
    val no = if (answer.void) "return-void" else "const/4 $r, 0x0\nreturn $r"
    val code = """
        ${answer.ask}
        move-result $r
        if-eqz $r, :hush_stock
        $no
    """
    val stock = ExternalLabel("hush_stock", target.getInstruction(site.at))
    // A case start is where its switch jumps, so the hold takes over that label.
    if (site.at == 0) target.addInstructionsWithLabels(0, code, stock) else target.addInstructionsAtControlFlowLabel(site.at, code, stock)
}

/** The runtime the hold calls. It's the extension's own, so a change there refuses whatever this build holds. */
internal fun BytecodePatchContext.requireDataSaverRuntime() {
    requireStatusMethod("dataSaverDownloads")
    controlHook(DATA_SAVER, "hold", listOf(), "Z")
    controlHook(DATA_SAVER, "holdMask", listOf("Ljava/lang/Object;"), "Z")
    controlHook(DATA_SAVER, "checkAgain", listOf("Ljava/lang/Object;"), "V")
}

/** Gives the runtime's checkAgain stub Telegram's own download check, run on the controller it's handed. */
internal fun BytecodePatchContext.writeCheckAgain() = writeStub(DATA_SAVER, "checkAgain", 1, """
    check-cast p0, $DOWNLOAD_CONTROLLER
    invoke-virtual {p0}, $CHECK_SETTINGS
    return-void
""")

/** Why this build's answers can't be held. */
private class Unheld(val why: String) : Exception(why)

private fun need(ok: Boolean, why: String) {
    if (!ok) throw Unheld(why)
}

/**
 * DownloadController's answers are found by their signatures and must still read the network's
 * download settings, directly or through canDownloadMediaInternal. The next song's preload must
 * still read them and load the song, and the queue must still start its loads. Every other
 * canDownload or canPreload answer would go around the hold, so one this list doesn't know leaves
 * the hold out; an answer R8 lets out of its caller again in a later build shows up there. The
 * download mask is held at its source, so the classes that read it decide with no media types, and
 * checkAutodownloadSettings, the check Telegram runs when the network changes, cancels the queue's
 * automatic loads when the hold starts and picks them up again when it lifts. The runtime runs that
 * check through checkAgain.
 */
internal fun BytecodePatchContext.resolveDataSaverDownloads(): DataSaverPlan = try {
    DataSaverPlan(holds(), null)
} catch (unheld: Unheld) {
    DataSaverPlan.missing(unheld.why)
}

private fun BytecodePatchContext.holds(): Map<AutoDownloadAnswer, HoldSite> {
    val controller = tgMutableClassDefByOrNull(DOWNLOAD_CONTROLLER)
    need(controller != null, "DownloadController is missing")
    val known = AutoDownloadAnswer.entries.filter { it.owner == DOWNLOAD_CONTROLLER }.map { it.signature }.toSet()
    val unknown = controller!!.methods.filter { it.origName.startsWith("canDownload") || it.origName.startsWith("canPreload") }
        .map { it.signature() }.filter { it !in known }.sorted()
    need(unknown.isEmpty(), "DownloadController has answers the hold doesn't know (${unknown.joinToString()})")
    val check = controller.methods.filter { it.signature() == "checkAutodownloadSettings()V" }
    need(check.size == 1 && AccessFlags.PUBLIC.isSet(check[0].accessFlags) && !AccessFlags.STATIC.isSet(check[0].accessFlags),
        "DownloadController.checkAutodownloadSettings()V is missing or no longer public")
    need(reads(check.single(), CURRENT_MASK), "DownloadController.checkAutodownloadSettings()V no longer reads the download mask")

    return AutoDownloadAnswer.entries.associateWith { answer ->
        if (answer.owner == null) return@associateWith queueSite(answer)
        val owner = tgMutableClassDefByOrNull(answer.owner)
        need(owner != null, "${answer.label} is missing")
        val found = owner!!.methods.filter { it.signature() == answer.signature && !AccessFlags.STATIC.isSet(it.accessFlags) }
        need(found.size == 1, "${answer.label} is missing or ambiguous")
        val method = found.single()
        need(passes(method, answer.check), "${answer.label} no longer ${answer.check.what}")
        need(method.localRegisterCount() >= 1, "${answer.label} has no local to answer in")
        val flow = ControlFlow.of(method)
        need(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of ${answer.label}")
        // Nothing has run at a method's start, so any local is free.
        HoldSite(method, 0, 0)
    }
}

private fun passes(method: Method, check: AutoDownloadCheck): Boolean {
    val body = method.controlBody()
    val loads = { body.any { it.controlRef()?.startsWith("$FILE_LOADER->loadFile(") == true } }
    return when (check) {
        AutoDownloadCheck.NETWORK -> reads(method, NETWORK_TYPE)
        // 13.2's R8 made the private check package-wide, so the Play build calls it virtually.
        AutoDownloadCheck.MESSAGE -> body.any { it.opcode in SELF_CALLS && it.controlRef()?.let { ref ->
            ref.startsWith("$DOWNLOAD_CONTROLLER->$INTERNAL(") } == true }
        AutoDownloadCheck.NEXT_SONG -> reads(method, NETWORK_TYPE) && loads()
        AutoDownloadCheck.LOADS -> loads()
    }
}

/**
 * Where the download queue starts its loads: the one method anywhere that reads the queue's keys
 * and pairs and calls FileLoader.loadFile. In 13.2 that's a case of a storage runnable whose run()
 * switches on which lambda it stands for. The hold goes where the stretch of code holding the first
 * read of the keys starts, which has to be the method's start or a case its switch falls or jumps
 * into, with nothing else reaching it, so it holds the queue's loads and nothing else.
 */
private fun BytecodePatchContext.queueSite(answer: AutoDownloadAnswer): HoldSite {
    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.allReferences(listOf(QUEUE_KEYS, QUEUE_PAIRS))) { cls ->
        for (m in cls.methods) {
            if (m.implementation == null) continue
            val refs = m.controlBody().mapNotNull { it.controlRef() }.toSet()
            if (QUEUE_KEYS in refs && QUEUE_PAIRS in refs && passes(m, answer.check)) found += cls.origType to m.toString()
        }
    }
    need(found.size == 1, "${answer.label} is missing or ambiguous (${found.size} found)")
    val (type, signature) = found.single()
    val method = tgMutableClassDefBy(type).methods.single { it.toString() == signature }
    val body = method.controlBody()
    val flow = ControlFlow.of(method)
    val into = Array(body.size) { mutableListOf<Int>() }
    flow.normal.forEachIndexed { from, next -> next.forEach { into[it] += from } }
    var at = body.indexOfFirst { it.controlRef() == QUEUE_KEYS }
    while (at > 0 && into[at] == listOf(at - 1) && flow.normal[at - 1] == listOf(at)) at--
    val entered = if (at == 0) into[0].isEmpty() else into[at].isNotEmpty() && into[at].all { body[it].opcode in SWITCHES }
    need(entered && flow.exceptional.none { at in it }, "${answer.label} is no longer the start of its own case")
    val register = try {
        method.freeLocalsAt(answer.label, at, 1, highest = 255).single()
    } catch (taken: PatchException) {
        throw Unheld("${answer.label} has no free local to answer in")
    }
    return HoldSite(method, at, register)
}

/** Whether [method] calls [ref] itself. */
private fun reads(method: Method, ref: String) = method.controlBody().any { it.controlRef() == ref }

// Source names: 13.2's R8 renames DownloadController and its answers, and the types they take.
private fun Method.signature() = "$origName(${origParameterTypes.joinToString("")})$origReturnType"
