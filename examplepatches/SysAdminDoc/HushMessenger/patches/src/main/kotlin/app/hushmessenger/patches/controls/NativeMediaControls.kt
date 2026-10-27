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
/** "Generate AI stickers" in Messenger 584's string pack (0x7f140560 in 583). */
internal const val GENERATE_AI_LABEL = 0x7f140559
/**
 * "Generate" in 584's string pack: the same cell when an account gets more than one sticker maker. Its tap opens a menu of
 * custom, AI and music stickers, so it fronts the AI maker too.
 */
internal const val GENERATE_MENU_LABEL = 0x7f141bd3
/** "Generate" in 584.1's string pack, shifted one resource past 584.0's. */
internal const val GENERATE_MENU_LABEL_5841 = 0x7f141bd5
/** The viewer's onCreateDialog override: A1K in 584, A1O in 584.1 armv7, A1I or A1J in 584.1 arm64 (A1F in 583). */
internal const val EPHEMERAL_DIALOG = "A1K"
internal val EPHEMERAL_DIALOGS = setOf(EPHEMERAL_DIALOG, "A1O", "A1I", "A1J")
private const val WINDOW = "Landroid/view/Window;"
private const val SET_FLAGS = "$WINDOW->setFlags(II)V"
private const val ADD_FLAGS = "$WINDOW->addFlags(I)V"
private const val SECURE = 0x2000

internal fun screenshotViewerHooks() = setOf(
    "$EPHEMERAL_VIEWER->$EPHEMERAL_DIALOG(Landroid/os/Bundle;)Landroid/app/Dialog;",
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
    var jumpSources = emptySet<Int>()
    val valid = when {
        definingClass == EPHEMERAL_VIEWER && name in EPHEMERAL_DIALOGS &&
            parameterTypes.map { it.toString() } == listOf("Landroid/os/Bundle;") && returnType == "Landroid/app/Dialog;" -> {
            sites = listOf(9); allowedJumps = emptySet()
            implementation!!.registerCount == 5 && code.size == 15 && result(4, "Landroid/app/Dialog;", 2) && window(5, "Landroid/app/Dialog;", 2, 1, 10) &&
                literal(8, 0) && call(9, SET_FLAGS, listOf(1, 0, 0))
        }
        definingClass == EPHEMERAL_VIEWER && name == "onResume" && parameterTypes.isEmpty() && returnType == "V" -> {
            sites = listOf(14, 21); allowedJumps = setOf(15); jumpSources = setOf(10, 13)
            implementation!!.registerCount == 5 && code.size == 46 && result(8, "Landroid/app/Activity;", 0) && literal(9, 1) &&
                nullCheck(10, 0, 15) && window(11, "Landroid/app/Activity;", 0, 0, 15) && call(14, SET_FLAGS, listOf(0, 1, 1)) &&
                op(15, Opcode.INVOKE_VIRTUAL) && code[15].mediaArgs() == listOf(4) &&
                ((code[15] as? ReferenceInstruction)?.reference as? MethodReference)?.returnType == "Landroid/app/Dialog;" &&
                op(16, Opcode.MOVE_RESULT_OBJECT) && reg(16) == 0 && nullCheck(17, 0, 22) &&
                window(18, "Landroid/app/Dialog;", 0, 0, 22) && call(21, SET_FLAGS, listOf(0, 1, 1)) &&
                (10..21).none { code[it].writes(1) }
        }
        definingClass == QUICKSNAP_VIEWER && name == "onCreateView" &&
            parameterTypes.map { it.toString() } == listOf("Landroid/view/LayoutInflater;", "Landroid/view/ViewGroup;", "Landroid/os/Bundle;") &&
            returnType == "Landroid/view/View;" -> {
            // Builds move the flag between 29 and 32 with their setup code, so the one window flag call is the site.
            val site = code.indices.singleOrNull { code[it].mediaRef() == ADD_FLAGS } ?: mediaFailure(this)
            sites = listOf(site); allowedJumps = emptySet()
            site >= 6 && implementation!!.registerCount == 23 &&
                result(site - 6, "Landroid/app/Dialog;", 0) && nullCheck(site - 5, 0, site + 1) &&
                window(site - 4, "Landroid/app/Dialog;", 0, 1, site + 1) && literal(site - 1, 0) && call(site, ADD_FLAGS, listOf(1, 0))
        }
        else -> mediaFailure(this)
    }
    val setters = code.indices.filter { code[it].mediaRef() in setOf(SET_FLAGS, ADD_FLAGS, "$WINDOW->clearFlags(I)V") }
    // A branch/switch may not enter the guarded prefix halfway through a value definition.
    if (!valid || setters != sites || jumpTargets().any { it in 1..sites.last() && it !in allowedJumps } ||
        (allowedJumps.isNotEmpty() && code.any { "SWITCH" in it.opcode.toString() || "PAYLOAD" in it.opcode.toString() }) ||
        (allowedJumps.isNotEmpty() && code.indices.any { it !in jumpSources && code[it] is OffsetInstruction && code.branchTarget(it) in allowedJumps })) mediaFailure(this)
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
        // Whole references, so each sits in the patcher DEX as one string the catalog check can find.
        val setter = if (old.mediaRef() == SET_FLAGS) "$SETTINGS->setScreenshotFlags(${WINDOW}II)V" else "$SETTINGS->addScreenshotFlags(${WINDOW}I)V"
        replaceInstruction(at, "invoke-static {${old.mediaArgs().joinToString(", ") { "v$it" }}}, $setter")
    }
}

/**
 * The cell under 584's naming, the label it shows, how many renders offer that label, the same for its Generate menu label,
 * and how many instructions its own render has (24 registers). Four renders offer the AI label and one the menu label.
 */
internal data class AiCell(
    val type: String, val superclass: String, val scope: String, val component: String,
    val label: Int = GENERATE_AI_LABEL, val sources: Int = AI_CELL_SOURCES, val size: Int = AI_CELL_SIZE,
    val menu: Int = GENERATE_MENU_LABEL, val menuSources: Int = AI_MENU_SOURCES,
) {
    val render = "$type->render($scope)$component"
}
internal val aiCells = listOf(
    // 584.1 arm64 keeps 584.0's resource IDs, under three namings that vary by build.
    AiCell("LX/CSp;", "LX/1Nj;", "LX/2DF;", "LX/1J7;"),
    AiCell("LX/CVr;", "LX/1Nj;", "LX/2DF;", "LX/1J7;"),
    AiCell("LX/CPH;", "LX/1O9;", "LX/2Df;", "LX/1JX;", menu = GENERATE_MENU_LABEL_5841, size = 109),
    AiCell("LX/CUN;", "LX/1NU;", "LX/2Ce;", "LX/1Iz;", size = 109),
)
internal const val AI_CELL_SIZE = 107
internal const val AI_CELL_REGISTERS = 24
internal const val AI_CELL_SOURCES = 4
internal const val AI_MENU_SOURCES = 1

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
        var menus = 0
        for (sourceClass in classes) for (source in sourceClass.methods) {
            if (source.name != "render") continue
            val code = source.mediaCode()
            for (at in code.indices) {
                if (code[at].opcode !in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) || code[at].mediaRef() != ctor.hookId()) continue
                val arg = code[at].mediaArgs().lastOrNull() ?: continue
                val literal = (at - 1 downTo maxOf(0, at - 24)).firstOrNull { code[it].writes(arg) } ?: continue
                val value = (code[literal] as? NarrowLiteralInstruction)?.narrowLiteral ?: continue
                if ((literal + 1 until at).any { code[it] is OffsetInstruction }) continue
                if (value == shape.label && source.jumpTargets().none { it in literal + 1..at }) sources++
                // The music sticker branch jumps into the menu cell's constructor call, so only the straight run from the literal counts.
                if (value == shape.menu) menus++
            }
        }
        if (sources != shape.sources || menus != shape.menuSources) continue
        val render = cls.methods.singleOrNull { it.hookId() == shape.render } ?: continue
        if (!AccessFlags.STATIC.isSet(render.accessFlags) && render.implementation?.registerCount == AI_CELL_REGISTERS &&
            render.mediaCode().size == shape.size && render.implementation!!.tryBlocks.size == 4) found.add(render)
    }
    return found
}

internal fun MutableMethod.validateAiStickerCell(): AiCell {
    val cell = aiCells.singleOrNull { it.render == hookId() }
    if (cell == null || hookId() !in activeProfile.hooks.getValue("ai_sticker_cell") ||
        AccessFlags.STATIC.isSet(accessFlags) || implementation?.registerCount != AI_CELL_REGISTERS || mediaCode().size != cell.size ||
        implementation!!.tryBlocks.size != 4) mediaFailure(this)
    return cell
}

internal fun MutableMethod.injectAiStickerCell() {
    val cell = validateAiStickerCell()
    addInstructionsWithLabels(0, """
        move-object/from16 v0, p0
        iget v0, v0, $definingClass->A00:I
        const v1, 0x${cell.label.toString(16)}
        if-eq v0, v1, :ai_cell
        const v1, 0x${cell.menu.toString(16)}
        if-ne v0, v1, :stock_behavior
        :ai_cell
        const-string v0, "ai_stickers"
        invoke-static {v0}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result v0
        if-eqz v0, :stock_behavior
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), ExternalLabel("stock_behavior", getInstruction(0)))
}

private val GOTOS = setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32)
private val EXITS = setOf(Opcode.RETURN_VOID, Opcode.RETURN, Opcode.RETURN_WIDE, Opcode.RETURN_OBJECT, Opcode.THROW)
private const val HAS_NEXT = "Ljava/util/Iterator;->hasNext()Z"
private const val NEXT = "Ljava/util/Iterator;->next()Ljava/lang/Object;"

/**
 * The Suggested sticker grid around [AiCell]. Its render loops over the grid items and sends each through an instance-of
 * chain; the Generate menu item's branch and the Generate AI item's branch both build the cell. [sites] are where those
 * two branch bodies start, [skip] is the loop's continue step (`move index, next` before the one goto back to the loop
 * head) and [flag] is the register the chain's instance-of results land in.
 */
internal data class AiGrid(val sites: List<Int>, val skip: Int, val flag: Int)

/** Whether the label constant at [at] reaches [cell]'s constructor as its label, following plain gotos only. */
private fun List<Instruction>.feedsAiCell(at: Int, cell: AiCell): Boolean {
    val register = this[at].mediaRegister() ?: return false
    var i = at + 1
    repeat(48) {
        val instruction = getOrNull(i) ?: return false
        if (instruction.opcode in GOTOS) { i = branchTarget(i).takeIf { it >= 0 } ?: return false; return@repeat }
        val ref = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if (instruction.opcode in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) && ref?.definingClass == cell.type && ref.name == "<init>")
            return ref.parameterTypes.size == 11 && ref.parameterTypes.last().toString() == "I" && instruction.mediaArgs().lastOrNull() == register
        if (instruction is OffsetInstruction || instruction.writes(register) || instruction.opcode in EXITS) return false
        i++
    }
    return false
}

internal fun Method.aiStickerGrid(cell: AiCell): AiGrid? {
    if (name != "render" || AccessFlags.STATIC.isSet(accessFlags)) return null
    val code = mediaCode()
    fun labelled(at: Int) = code[at].opcode == Opcode.CONST && (code[at] as NarrowLiteralInstruction).narrowLiteral in setOf(cell.menu, cell.label)
    val labels = code.indices.filter(::labelled)
    if (labels.isEmpty() || code.none { it.mediaRef() == HAS_NEXT }) return null
    fun op(at: Int, vararg opcodes: Opcode) = code.getOrNull(at)?.opcode in opcodes
    fun reg(at: Int) = code.getOrNull(at)?.mediaRegister()
    val found = mutableListOf<AiGrid>()
    for (head in code.indices) {
        if (!op(head, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || code[head].mediaRef() != HAS_NEXT) continue
        val iterator = code[head].mediaArgs().singleOrNull() ?: continue
        val more = reg(head + 1)
        val item = reg(head + 4)
        val step = code.getOrNull(head + 5) as? TwoRegisterInstruction
        if (!op(head + 1, Opcode.MOVE_RESULT) || !op(head + 2, Opcode.IF_EQZ) || reg(head + 2) != more ||
            !op(head + 3, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || code[head + 3].mediaRef() != NEXT ||
            code[head + 3].mediaArgs() != listOf(iterator) || !op(head + 4, Opcode.MOVE_RESULT_OBJECT) ||
            !op(head + 5, Opcode.ADD_INT_LIT8) || step == null || (step as NarrowLiteralInstruction).narrowLiteral != 1 ||
            !op(head + 6, Opcode.IF_LTZ) || reg(head + 6) != step.registerB || !op(head + 7, Opcode.CHECK_CAST) || reg(head + 7) != item) continue
        val index = step.registerB
        val next = step.registerA
        // Every item goes back to the head through one goto, right after the index takes its next value.
        val back = code.indices.filter { code[it] is OffsetInstruction && code.branchTarget(it) == head }.singleOrNull() ?: continue
        val move = code.getOrNull(back - 1) as? TwoRegisterInstruction
        if (code[back].opcode !in GOTOS || !op(back - 1, Opcode.MOVE, Opcode.MOVE_FROM16, Opcode.MOVE_16) ||
            move?.registerA != index || move.registerB != next) continue
        var link = head + 8
        var flag: Int? = null
        val menus = mutableListOf<Int>()
        val ais = mutableListOf<Int>()
        val bodies = mutableListOf<IntRange>()
        while (op(link, Opcode.INSTANCE_OF)) {
            val test = code[link] as TwoRegisterInstruction
            if (test.registerB != item || (flag != null && test.registerA != flag)) break
            flag = test.registerA
            val end = code.branchTarget(link + 1)
            if (!op(link + 1, Opcode.IF_EQZ) || reg(link + 1) != flag || end <= link + 2) break
            val body = link + 2 until end
            for (at in body.filter(::labelled)) {
                if (!code.feedsAiCell(at, cell)) continue
                if ((code[at] as NarrowLiteralInstruction).narrowLiteral == cell.menu) menus += link + 2 else ais += link + 2
                bodies += body
            }
            link = end
        }
        val sites = (menus + ais).sorted()
        // One branch per label, each entered only from its own instance-of test, and no label outside them.
        if (flag == null || flag > 15 || menus.size != 1 || ais.size != 1 || menus == ais ||
            flag in setOf(item, index, next, iterator) || sites.any { it in jumpTargets() } ||
            labels.any { at -> bodies.none { at in it } }) continue
        found += AiGrid(sites, back - 1, flag)
    }
    return found.singleOrNull()
}

/** The Suggested grid renders that skip the Generate items, found by the loop around the cell rather than by name. */
internal fun findAiStickerGrids(classes: Iterable<ClassDef>): List<Method> =
    classes.flatMap { it.methods }.filter { method -> aiCells.any { method.aiStickerGrid(it) != null } }

internal fun MutableMethod.validateAiStickerGrid(): AiGrid {
    if (hookId() !in activeProfile.hooks.getValue("ai_sticker_grid")) mediaFailure(this)
    return aiCells.mapNotNull { aiStickerGrid(it) }.singleOrNull() ?: mediaFailure(this)
}

/**
 * Skips a Generate item before the grid gets it, so the stickers after it move up instead of leaving its slot blank.
 * The flag register is the branch's own instance-of result: zero on the way out (a zero merges with whatever the other
 * items leave there), and back to the one it held on the way in.
 */
internal fun MutableMethod.injectAiStickerGrid() {
    val grid = validateAiStickerGrid()
    val skip = getInstruction(grid.skip)
    val flag = "v${grid.flag}"
    for (at in grid.sites.sortedDescending()) addInstructionsWithLabels(at, """
        const-string $flag, "ai_stickers"
        invoke-static {$flag}, $SETTINGS->enabled(Ljava/lang/String;)Z
        move-result $flag
        if-eqz $flag, :stock_behavior
        const/4 $flag, 0x0
        goto/16 :skip_item
        :stock_behavior
        const/4 $flag, 0x1
    """.trimIndent(), ExternalLabel("skip_item", skip))
}
