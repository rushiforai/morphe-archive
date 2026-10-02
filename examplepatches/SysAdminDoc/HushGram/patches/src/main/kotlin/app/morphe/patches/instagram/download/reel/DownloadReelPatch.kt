/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.download.reel

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.instagram.download.MEDIA
import app.morphe.patches.instagram.download.mediaBridges
import app.morphe.patches.instagram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.instagram.misc.extension.enableStatus
import app.morphe.patches.instagram.misc.extension.instagramExtensionPatch
import app.morphe.patches.instagram.misc.extension.markers
import app.morphe.patches.instagram.misc.extension.requireLocals
import app.morphe.patches.instagram.misc.extension.requireStatusMethod
import app.morphe.patches.instagram.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "Download any reel"

/** The options of a post's or a reel's more menu, which keep their names, Download among them. */
internal const val OPTION = "Lcom/instagram/feed/media/mediaoption/MediaOption\$Option;"
internal const val DOWNLOAD = "$OPTION->DOWNLOAD:$OPTION"
private const val FRAGMENT_ACTIVITY = "Landroidx/fragment/app/FragmentActivity;"

private const val REEL_DOWNLOAD = "$EXTENSION_PACKAGE/download/ReelDownload;"
internal const val OFFER = "$REEL_DOWNLOAD->offer(I)Z"
internal const val WITHHOLD = "$REEL_DOWNLOAD->withhold(I)Z"
internal const val SAVE = "$REEL_DOWNLOAD->save(Ljava/lang/Object;Landroid/app/Activity;)Z"
internal const val ADD_TO = "$REEL_DOWNLOAD->addTo(Ljava/util/List;Ljava/lang/Object;)V"

/** The reel menu's handler of a tapped option, in the class that runs the menu. */
internal const val HANDLER_MARKER = "ClipsOrganicMoreOptionsHelper_handleOptionSelected"

/** Instagram's check of whether a reel's owner lets other people download it. */
internal const val ELIGIBLE_MARKER = "ClipsDownloadUtil_isMediaEligibleForThirdPartyDownloads"

/** The options of the reduced reel menu, a short list that never had a Download row. */
internal const val REDUCED_MARKER = "ClipsOrganicMediaItemViewMoreOptionsController_getReducedMenuOptions"

/**
 * Download in every reel's more menu, saving through HushGram's own pipeline.
 *
 * Instagram 449 already has a Download row in that menu. It shows the row only when the reel's
 * owner lets other people download it, and the redesigned menus also hold it back while a server
 * flag says so. A tap asks Instagram's server, then saves a copy with a watermark. This patch
 * shows the row on every reel and has a tap save the reel from the addresses its Media already
 * holds, at the Download quality, the way Hushfacebook's reel download does.
 *
 * Some accounts get a reduced menu instead: a short list of options (Playback, Interested, Report
 * and a few more) that never includes Download. Its list gets Download added before it's shown,
 * and its rows go through the same handler.
 *
 * Everything is found before anything changes, so a build that differs stops the patch naming
 * what it couldn't find, and nothing is half done.
 */
@Suppress("unused")
val downloadReelPatch = bytecodePatch(
    name = "Download any reel",
    description = "Adds Download to every reel's more menu. Reels save at the Download quality you set, " +
        "best by default, without Instagram's watermark.",
    default = true,
) {
    category("Downloads")
    dependsOn(settingsPatch)
    compatibleWith(*AppCompatibilities.instagram())
    dependsOn(instagramExtensionPatch)

    execute {
        requireStatusMethod("reelDownload")
        offerDownloadOnEveryReel()
        enableStatus("reelDownload")
    }
}

/**
 * Where a builder of the reel menu decides on the Download row: after the move-result at [at] - 1,
 * which leaves Instagram's answer in [register], [hook] filters it.
 */
internal class Gate(val at: Int, val register: Int, val hook: String)

internal fun BytecodePatchContext.offerDownloadOnEveryReel() {
    val handlers = mutableListOf<Method>()
    val eligibles = mutableListOf<Method>()
    val loaders = mutableListOf<Method>()
    val reducedLists = mutableListOf<Method>()
    classDefForEach { classDef ->
        classDef.methods.forEach { method ->
            val markers = method.markers()
            if (HANDLER_MARKER in markers) handlers += method
            if (ELIGIBLE_MARKER in markers) eligibles += method
            if (REDUCED_MARKER in markers) reducedLists += method
            if (method.code().any { it.opcode == Opcode.SGET_OBJECT && it.referenceText() == DOWNLOAD }) loaders += method
        }
    }
    val handler = one(handlers, HANDLER_MARKER)
    val eligible = one(eligibles, ELIGIBLE_MARKER)
    if (AccessFlags.STATIC.isSet(handler.accessFlags) || handler.parameterTypes.map(Any::toString) != listOf(OPTION) ||
        handler.returnType != "V"
    ) {
        throw PatchException("$PATCH: ${handler.definingClass}->${handler.name}, the menu's handler, doesn't take one option")
    }
    if (eligible.returnType != "Z") {
        throw PatchException("$PATCH: ${eligible.definingClass}->${eligible.name}, the download check, doesn't answer a boolean")
    }
    val helper = handler.definingClass
    val builders = loaders.filter { it.calls(eligible) && (it.definingClass == helper || it.uses(helper)) }
    if (builders.isEmpty()) throw PatchException("$PATCH: no builder of the reel menu adds Download after the download check")
    val gates = builders.associateWith { it.downloadGates(eligible) }
    val reduced = one(reducedLists, REDUCED_MARKER)
    val reducedReturns = reduced.optionListReturns()
    val media = instanceField(helper, MEDIA)
    val activity = instanceField(helper, FRAGMENT_ACTIVITY)
    val writeBridges = mediaBridges(PATCH)
    val menu = mutable(handler)
    menu.requireLocals(PATCH, 3)

    gates.forEach { (builder, found) ->
        val method = mutable(builder)
        found.sortedByDescending { it.at }.forEach { gate ->
            val register = "v${gate.register}"
            val call = if (gate.register > 15) "invoke-static/range { $register .. $register }" else "invoke-static { $register }"
            method.addInstructions(
                gate.at,
                """
                    $call, ${gate.hook}
                    move-result $register
                """,
            )
        }
    }

    // Each return of the reduced list hands the list through the extension first. The return is
    // replaced rather than preceded, because a jump to the return lands on what replaces it and
    // would skip anything put in front of it.
    val list = mutable(reduced)
    reducedReturns.sortedDescending().forEach { index ->
        val register = (list.getInstruction(index) as OneRegisterInstruction).registerA
        val scratch = if (register == 0) 1 else 0
        list.replaceInstruction(index, "sget-object v$scratch, $DOWNLOAD")
        list.addInstructions(
            index + 1,
            """
                invoke-static { v$register, v$scratch }, $ADD_TO
                return-object v$register
            """,
        )
    }

    menu.addInstructionsWithLabels(
        0,
        """
            move-object/from16 v0, p1
            sget-object v1, $DOWNLOAD
            if-ne v0, v1, :handle
            move-object/from16 v0, p0
            iget-object v1, v0, $media
            iget-object v2, v0, $activity
            invoke-static { v1, v2 }, $SAVE
            move-result v0
            if-eqz v0, :handle
            return-void
        """,
        ExternalLabel("handle", menu.getInstruction(0)),
    )
    writeBridges()
}

private fun one(methods: List<Method>, marker: String): Method = methods.singleOrNull() ?: throw PatchException(
    "$PATCH: expected one method holding the $marker marker, found " +
        if (methods.isEmpty()) "none" else methods.joinToString { "${it.definingClass}->${it.name}" },
)

/** The one instance field of [type] in [owner], the reel menu's class, as a field reference. */
private fun BytecodePatchContext.instanceField(owner: String, type: String): String {
    val fields = classDefBy(owner).fields.filter { !AccessFlags.STATIC.isSet(it.accessFlags) && it.type == type }
    val field = fields.singleOrNull()
        ?: throw PatchException("$PATCH: expected one $type field in $owner, the reel menu's class, found ${fields.size}")
    return "$owner->${field.name}:$type"
}

private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    mutableClassDefBy(method.definingClass).methods.single {
        it.name == method.name && it.returnType == method.returnType &&
            it.parameterTypes.map(Any::toString) == method.parameterTypes.map(Any::toString)
    }

/**
 * Every branch of [this] builder that keeps the Download row out, each with the filter that lets it
 * in: after the download check, the one that skips the row when the check says no, and after that,
 * each that skips it when a flag says yes. The builder must load the row once, call the check once
 * before it, and have only those two kinds of branch between them jumping past the row.
 */
internal fun Method.downloadGates(eligible: Method): List<Gate> {
    val code = code()
    val where = "$definingClass->$name"
    val row = code.indices.filter { code[it].opcode == Opcode.SGET_OBJECT && code[it].referenceText() == DOWNLOAD }.singleOrNull()
        ?: throw PatchException("$PATCH: $where doesn't load Download once")
    val check = code.indices.filter { code[it].calls(eligible) }.singleOrNull()
        ?: throw PatchException("$PATCH: $where doesn't call the download check once")
    if (check > row) throw PatchException("$PATCH: $where calls the download check after adding Download")

    val address = IntArray(code.size + 1)
    code.forEachIndexed { index, instruction -> address[index + 1] = address[index] + instruction.codeUnits }
    val skips = (check + 1 until row).filter { index ->
        val jump = code[index]
        (jump.opcode in BRANCHES || jump.opcode in GOTOS) &&
            address.indexOf(address[index] + (jump as OffsetInstruction).codeOffset) > row
    }
    if (skips.none { code[it].opcode == Opcode.IF_EQZ }) {
        throw PatchException("$PATCH: in $where no branch after the download check skips Download")
    }
    return skips.map { index ->
        val branch = code[index]
        if (branch.opcode in GOTOS) throw PatchException("$PATCH: in $where a jump at $index goes around Download")
        val register = (branch as OneRegisterInstruction).registerA
        val set = (index - 1 downTo check + 1).firstOrNull { code[it].writes(register) }
            ?: throw PatchException("$PATCH: in $where the branch at $index tests a register set before the download check")
        val call = code.getOrNull(set - 1)
        val answers = (call as? ReferenceInstruction)?.reference as? MethodReference
        if (code[set].opcode != Opcode.MOVE_RESULT || answers?.returnType != "Z") {
            throw PatchException("$PATCH: in $where the branch at $index doesn't test the answer of a call")
        }
        val fromCheck = call.calls(eligible)
        when {
            fromCheck && branch.opcode == Opcode.IF_EQZ -> Gate(set + 1, register, OFFER)
            !fromCheck && branch.opcode == Opcode.IF_NEZ -> Gate(set + 1, register, WITHHOLD)
            else -> throw PatchException("$PATCH: in $where the branch at $index keeps Download out in a way this patch doesn't know")
        }
    }
}

/**
 * The returns of [this], the reduced reel menu's list of options. It must answer a list, and each
 * return's register must fit a plain call, next to one more register the hook loads Download into.
 */
internal fun Method.optionListReturns(): List<Int> {
    val where = "$definingClass->$name"
    if (returnType != "Ljava/util/ArrayList;" && returnType != "Ljava/util/List;") {
        throw PatchException("$PATCH: $where, the reduced menu's options, doesn't answer a list")
    }
    val code = code()
    val returns = code.indices.filter { code[it].opcode == Opcode.RETURN_OBJECT }
    if (returns.isEmpty()) throw PatchException("$PATCH: $where, the reduced menu's options, never returns")
    if ((implementation?.registerCount ?: 0) < 2) throw PatchException("$PATCH: $where has no register to spare")
    returns.forEach { index ->
        if ((code[index] as OneRegisterInstruction).registerA > 15) {
            throw PatchException("$PATCH: $where returns its options from a register above v15")
        }
    }
    return returns
}

internal fun Method.code(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

private fun Instruction.referenceText(): String? = (this as? ReferenceInstruction)?.reference?.toString()

/** The conditional branches, and the plain jumps. Opcode.name is the smali name, so they're listed. */
private val BRANCHES = setOf(
    Opcode.IF_EQ, Opcode.IF_NE, Opcode.IF_LT, Opcode.IF_GE, Opcode.IF_GT, Opcode.IF_LE,
    Opcode.IF_EQZ, Opcode.IF_NEZ, Opcode.IF_LTZ, Opcode.IF_GEZ, Opcode.IF_GTZ, Opcode.IF_LEZ,
)
private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)

private fun Instruction.calls(method: Method): Boolean {
    val reference = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return reference.definingClass == method.definingClass && reference.name == method.name &&
        reference.returnType == method.returnType &&
        reference.parameterTypes.map(Any::toString) == method.parameterTypes.map(Any::toString)
}

private fun Method.calls(method: Method): Boolean = code().any { it.calls(method) }

/** Whether [this] reads or calls anything of [type]. */
private fun Method.uses(type: String): Boolean = code().any { instruction ->
    when (val reference = (instruction as? ReferenceInstruction)?.reference) {
        is FieldReference -> reference.definingClass == type
        is MethodReference -> reference.definingClass == type
        else -> false
    }
}

private fun Instruction.writes(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val first = (this as? OneRegisterInstruction)?.registerA ?: return false
    return first == register || (opcode.setsWideRegister() && first + 1 == register)
}
