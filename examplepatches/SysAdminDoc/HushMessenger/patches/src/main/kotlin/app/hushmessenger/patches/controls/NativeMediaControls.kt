package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.*
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val EPHEMERAL_VIEWER = "Lcom/facebook/messaging/media/ephemeralmedia/viewer/EphemeralMediaViewerFragment;"
internal const val QUICKSNAP_VIEWER = "Lcom/facebook/messaging/quicksnap/consumption/viewer/MsgrQuicksnapViewerFragment;"
internal const val GENERATE_AI_LABEL = 0x7f1404fe
private const val WINDOW = "Landroid/view/Window;"
private const val SET_FLAGS = "$WINDOW->setFlags(II)V"
private const val ADD_FLAGS = "$WINDOW->addFlags(I)V"
private const val SECURE = 0x2000

internal fun screenshotViewerHooks(dialogMethod: String) = setOf(
    "$EPHEMERAL_VIEWER->$dialogMethod(Landroid/os/Bundle;)Landroid/app/Dialog;",
    "$EPHEMERAL_VIEWER->onResume()V",
    "$QUICKSNAP_VIEWER->onCreateView(Landroid/view/LayoutInflater;Landroid/view/ViewGroup;Landroid/os/Bundle;)Landroid/view/View;",
)

private fun Instruction.mediaArgs(): List<Int> = when (this) {
    is FiveRegisterInstruction -> listOf(registerC, registerD, registerE, registerF, registerG).take(registerCount)
    is RegisterRangeInstruction -> (startRegister until startRegister + registerCount).toList()
    else -> emptyList()
}
private fun Instruction.mediaRef() = (this as? ReferenceInstruction)?.reference.toString()
private fun Instruction.mediaRegister() = (this as? OneRegisterInstruction)?.registerA
private fun Instruction.writes(register: Int) = opcode.setsRegister() &&
    (mediaRegister() == register || ("WIDE" in opcode.toString() && mediaRegister()?.plus(1) == register))
private fun Method.mediaCode() = implementation?.instructions?.toList().orEmpty()
private fun mediaFailure(method: Method): Nothing = throw PatchException("Messenger controls: native media contract changed in ${method.hookId()}")

/** Exact native window operations, with their actual constants and null-checked receivers. */
internal fun Method.screenshotViewerSites(): List<Int> {
    val code = mediaCode()
    if (AccessFlags.STATIC.isSet(accessFlags) || implementation == null || implementation!!.tryBlocks.isNotEmpty()) mediaFailure(this)
    fun op(at: Int, opcode: Opcode) = code.getOrNull(at)?.opcode == opcode
    fun reg(at: Int) = code.getOrNull(at)?.mediaRegister()
    fun call(at: Int, reference: String, args: List<Int>) = op(at, Opcode.INVOKE_VIRTUAL) &&
        code[at].mediaRef() == reference && code[at].mediaArgs() == args
    fun literal(at: Int, register: Int) = op(at, Opcode.CONST_16) && reg(at) == register &&
        (code[at] as? NarrowLiteralInstruction)?.narrowLiteral == SECURE
    fun result(at: Int, type: String, register: Int) = op(at, Opcode.MOVE_RESULT_OBJECT) && reg(at) == register &&
        code.getOrNull(at - 1)?.opcode?.toString()?.startsWith("INVOKE") == true &&
        ((code[at - 1] as? ReferenceInstruction)?.reference as? MethodReference)?.returnType == type
    fun nullCheck(at: Int, register: Int, target: Int) = op(at, Opcode.IF_EQZ) && reg(at) == register && code.branchTarget(at) == target
    fun window(at: Int, owner: String, source: Int, result: Int, target: Int) =
        call(at, "$owner->getWindow()$WINDOW", listOf(source)) && op(at + 1, Opcode.MOVE_RESULT_OBJECT) &&
            reg(at + 1) == result && nullCheck(at + 2, result, target)
    val sites: List<Int>
    val allowedJumps: Set<Int>
    val valid = when {
        definingClass == EPHEMERAL_VIEWER && name in setOf("A1A", "A1C") &&
            parameterTypes.map { it.toString() } == listOf("Landroid/os/Bundle;") && returnType == "Landroid/app/Dialog;" -> {
            sites = listOf(9); allowedJumps = emptySet()
            implementation!!.registerCount == 5 && code.size == 15 && result(4, "Landroid/app/Dialog;", 2) && window(5, "Landroid/app/Dialog;", 2, 1, 10) &&
                literal(8, 0) && call(9, SET_FLAGS, listOf(1, 0, 0))
        }
        definingClass == EPHEMERAL_VIEWER && name == "onResume" && parameterTypes.isEmpty() && returnType == "V" -> {
            sites = listOf(14, 21); allowedJumps = setOf(15)
            implementation!!.registerCount == 5 && code.size == 48 && result(8, "Landroid/app/Activity;", 0) && literal(9, 1) && nullCheck(10, 0, 15) &&
                window(11, "Landroid/app/Activity;", 0, 0, 15) && call(14, SET_FLAGS, listOf(0, 1, 1)) &&
                op(15, Opcode.INVOKE_VIRTUAL) && code[15].mediaArgs() == listOf(4) &&
                ((code[15] as? ReferenceInstruction)?.reference as? MethodReference)?.returnType == "Landroid/app/Dialog;" &&
                op(16, Opcode.MOVE_RESULT_OBJECT) && reg(16) == 0 && nullCheck(17, 0, 22) &&
                window(18, "Landroid/app/Dialog;", 0, 0, 22) && call(21, SET_FLAGS, listOf(0, 1, 1)) &&
                (10..21).none { code[it].writes(1) }
        }
        definingClass == QUICKSNAP_VIEWER && name == "onCreateView" &&
            parameterTypes.map { it.toString() } == listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;") &&
            returnType == "Landroid/view/View;" -> {
            sites = listOf(32); allowedJumps = emptySet()
            implementation!!.registerCount == 23 && code.size in setOf(438, 439, 441, 442, 448) &&
                result(26, "Landroid/app/Dialog;", 0) && nullCheck(27, 0, 33) && window(28, "Landroid/app/Dialog;", 0, 1, 33) &&
                literal(31, 0) && call(32, ADD_FLAGS, listOf(1, 0))
        }
        else -> mediaFailure(this)
    }
    val setters = code.indices.filter { code[it].mediaRef() in setOf(SET_FLAGS, ADD_FLAGS, "$WINDOW->clearFlags(I)V") }
    // A branch/switch may not enter the guarded prefix halfway through a value definition.
    if (!valid || setters != sites || jumpTargets().any { it in 1..sites.last() && it !in allowedJumps } ||
        (15 in allowedJumps && code.any { "SWITCH" in it.opcode.toString() || "PAYLOAD" in it.opcode.toString() }) ||
        (15 in allowedJumps && code.indices.any { it !in setOf(10, 13) && code[it] is OffsetInstruction && code.branchTarget(it) == 15 })) mediaFailure(this)
    return sites
}

internal fun MutableMethod.validateScreenshotViewer() {
    if (hookId() !in activeProfile.hooks.getValue("screenshot_viewers")) mediaFailure(this)
    screenshotViewerSites()
}

internal fun MutableMethod.injectScreenshotViewer() {
    validateScreenshotViewer()
    for (at in screenshotViewerSites()) {
        val old = getInstruction(at)
        val setter = if (old.mediaRef() == SET_FLAGS) "setScreenshotFlags(${WINDOW}II)V" else "addScreenshotFlags(${WINDOW}I)V"
        replaceInstruction(at, "invoke-static {${old.mediaArgs().joinToString(", ") { "v$it" }}}, $SETTINGS->$setter")
    }
}

private data class AiCell(val type: String, val superclass: String, val scope: String, val component: String, val size: Int = 104) {
    val render = "$type->render($scope)$component"
}
private val aiCells = listOf(
    AiCell("LX/FXP;", "LX/1Hx;", "LX/2MZ;", "LX/1GG;"),
    AiCell("LX/FWm;", "LX/1Hx;", "LX/2MZ;", "LX/1GG;"),
    AiCell("LX/FTy;", "LX/1Hw;", "LX/2MY;", "LX/1GF;"),
    AiCell("LX/FfQ;", "LX/1Hw;", "LX/2MY;", "LX/1GF;", 106),
    AiCell("LX/FSU;", "LX/1IL;", "LX/2Nf;", "LX/1Gf;"),
)

/** This is a single icon/click prefix cell, not the result grid. A00 is its label resource. */
internal fun findAiStickerCells(classes: Iterable<ClassDef>): List<Method> {
    val found = mutableListOf<Method>()
    for (shape in aiCells) {
        val cls = classes.singleOrNull { it.type == shape.type } ?: continue
        if (cls.superclass != shape.superclass || cls.fields.count { it.name == "A00" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } != 1) continue
        val ctor = cls.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.size == 11 &&
            it.parameterTypes.first().toString() == "Lcom/facebook/auth/usersession/FbUserSession;" && it.parameterTypes.last().toString() == "I" &&
            it.parameterTypes.slice(7..8).map { p -> p.toString() } == List(2) { "Lkotlin/jvm/functions/Function0;" } } ?: continue
        val body = ctor.mediaCode()
        val store = body.getOrNull(5) as? TwoRegisterInstruction
        if (AccessFlags.STATIC.isSet(ctor.accessFlags) || ctor.implementation?.registerCount != 12 || body.size != 15 ||
            body[5].opcode != Opcode.IPUT || store?.registerA != 11 || store.registerB != 0 || body[5].mediaRef() != "${shape.type}->A00:I" ||
            body.count { it.mediaRef() == "${shape.type}->A00:I" } != 1 || body.take(5).any { it.writes(0) || it.writes(11) } ||
            body.any { it is OffsetInstruction } || ctor.implementation!!.tryBlocks.isNotEmpty()) continue
        var sources = 0
        for (sourceClass in classes) for (source in sourceClass.methods) {
            if (source.name != "render") continue
            val code = source.mediaCode()
            for (at in code.indices) {
                if (code[at].opcode !in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) || code[at].mediaRef() != ctor.hookId()) continue
                val arg = code[at].mediaArgs().lastOrNull() ?: continue
                val literal = (at - 1 downTo maxOf(0, at - 24)).firstOrNull { code[it].writes(arg) } ?: continue
                if ((code[literal] as? NarrowLiteralInstruction)?.narrowLiteral == GENERATE_AI_LABEL &&
                    (literal + 1 until at).none { code[it] is OffsetInstruction } && source.jumpTargets().none { it in literal + 1..at }) sources++
            }
        }
        if (sources != 4) continue
        val render = cls.methods.singleOrNull { it.hookId() == shape.render } ?: continue
        if (!AccessFlags.STATIC.isSet(render.accessFlags) && render.implementation?.registerCount == 23 &&
            render.mediaCode().size == shape.size && render.implementation!!.tryBlocks.size == 4) found.add(render)
    }
    return found
}

internal fun MutableMethod.validateAiStickerCell() {
    val shape = aiCells.singleOrNull { it.render == hookId() } ?: mediaFailure(this)
    if (hookId() !in activeProfile.hooks.getValue("ai_sticker_cell") || AccessFlags.STATIC.isSet(accessFlags) ||
        implementation?.registerCount != 23 || mediaCode().size != shape.size || implementation!!.tryBlocks.size != 4) mediaFailure(this)
}

internal fun MutableMethod.injectAiStickerCell() {
    validateAiStickerCell()
    addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        iget v0, v0, $definingClass->A00:I
        const v1, 0x7f1404fe
        if-ne v0, v1, :stock_behavior
        const-string v0, "ai_stickers"
        invoke-static {v0}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :stock_behavior
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}
