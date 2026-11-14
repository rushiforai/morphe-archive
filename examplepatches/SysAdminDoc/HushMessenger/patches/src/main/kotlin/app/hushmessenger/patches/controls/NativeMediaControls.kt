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
/** "Generate AI stickers" in Messenger 587's string pack (0x7f14055d in 586). Each release renumbers it. */
internal const val GENERATE_AI_LABEL = 0x7f140566
/**
 * "Generate" in 587's string pack (0x7f141c4e in 586): the same cell when an account gets more than one sticker maker.
 * Its tap opens a menu of custom, AI and music stickers, so it fronts the AI maker too.
 */
internal const val GENERATE_MENU_LABEL = 0x7f141c62
/** "Generate" in 587's armv7 string pack, two resources past arm64's, as in 586. */
internal const val GENERATE_MENU_LABEL_ARMV7 = 0x7f141c64
/** The viewer's onCreateDialog override, A1L in 587 (A1K in 586), its armv7 build included. */
internal const val EPHEMERAL_DIALOG = "A1L"
/**
 * The same override in 587's other arm64 builds (347415285 and its family), with the same body. Older releases used other
 * names for this body, so the name is what keeps their viewers out.
 */
internal const val EPHEMERAL_DIALOG_FAMILY_B = "A1M"
internal val EPHEMERAL_DIALOGS = setOf(EPHEMERAL_DIALOG, EPHEMERAL_DIALOG_FAMILY_B)
/** The Quicksnap viewer's onCreateView frame in 586 and 587. */
internal const val QUICKSNAP_REGISTERS = 39
/** One register more in 587's armv7 build (586's had 38). */
internal const val QUICKSNAP_REGISTERS_ARMV7 = 40
internal val QUICKSNAP_FRAMES = setOf(QUICKSNAP_REGISTERS, QUICKSNAP_REGISTERS_ARMV7)
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

/**
 * Exact native window operations, with their actual constants and null-checked receivers. No try block may cover a
 * guarded prefix: the Ephemeral viewer's bodies have none, and the Quicksnap viewer's all start past its site.
 */
internal fun Method.screenshotViewerSites(): List<Int> {
    val code = mediaCode()
    if (AccessFlags.STATIC.isSet(accessFlags) || implementation == null) mediaFailure(this)
    val tries = implementation!!.tryBlocks
    fun coveredThrough(last: Int) = code.take(last + 1).sumOf { it.codeUnits }.let { end -> tries.any { it.startCodeAddress < end } }
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
            tries.isEmpty() && implementation!!.registerCount == 5 && code.size == 15 && result(4, "Landroid/app/Dialog;", 2) && window(5, "Landroid/app/Dialog;", 2, 1, 10) &&
                literal(8, 0) && call(9, SET_FLAGS, listOf(1, 0, 0))
        }
        definingClass == EPHEMERAL_VIEWER && name == "onResume" && parameterTypes.isEmpty() && returnType == "V" -> {
            sites = listOf(14, 21); allowedJumps = setOf(15); jumpSources = setOf(10, 13)
            tries.isEmpty() && implementation!!.registerCount == 5 && code.size == 46 && result(8, "Landroid/app/Activity;", 0) && literal(9, 1) &&
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
            sites = listOf(site)
            // 587 checks the session between loading the window and checking it, and sends a missing dialog to a tail that
            // nulls the window and jumps back to that session check. Nothing between may write the window or leave.
            val tail = code.branchTarget(site - 8)
            val hoisted = site >= 9 && tail > site && result(site - 9, "Landroid/app/Dialog;", 0) && nullCheck(site - 8, 0, tail) &&
                call(site - 7, "Landroid/app/Dialog;->getWindow()$WINDOW", listOf(0)) && result(site - 6, WINDOW, 1) &&
                (site - 5..site - 3).none { code[it].writes(1) || code[it] is OffsetInstruction || code[it].opcode == Opcode.THROW || code[it].opcode.toString().startsWith("RETURN") } &&
                nullCheck(site - 2, 1, site + 1) && op(tail, Opcode.CONST_4) && reg(tail) == 1 &&
                (code[tail] as? NarrowLiteralInstruction)?.narrowLiteral == 0 &&
                code.getOrNull(tail + 1)?.opcode in setOf(Opcode.GOTO, Opcode.GOTO_16, Opcode.GOTO_32) && code.branchTarget(tail + 1) == site - 5
            allowedJumps = if (hoisted) setOf(site - 5) else emptySet()
            if (hoisted) jumpSources = setOf(tail + 1)
            site >= 6 && !coveredThrough(site) && implementation!!.registerCount in QUICKSNAP_FRAMES &&
                (hoisted || result(site - 6, "Landroid/app/Dialog;", 0) && nullCheck(site - 5, 0, site + 1) &&
                    window(site - 4, "Landroid/app/Dialog;", 0, 1, site + 1)) && literal(site - 1, 0) && call(site, ADD_FLAGS, listOf(1, 0))
        }
        else -> mediaFailure(this)
    }
    val setters = code.indices.filter { code[it].mediaRef() in setOf(SET_FLAGS, ADD_FLAGS, "$WINDOW->clearFlags(I)V") }
    // A branch/switch may not enter the guarded prefix halfway through a value definition.
    if (!valid || setters != sites || jumpTargets().any { it in 1..sites.last() && it !in allowedJumps } ||
        (allowedJumps.isNotEmpty() && code.any { "SWITCH" in it.opcode.toString() || "PAYLOAD" in it.opcode.toString() }) ||
        (allowedJumps.isNotEmpty() && jumpTargets(branches = false).any { it in allowedJumps }) ||
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
 * The AI sticker cell as discovery found it: its class, the Litho base it extends, its render's scope and component
 * types, and the [AiCellShape] numbers it matched.
 */
internal data class AiCell(
    val type: String, val superclass: String, val scope: String, val component: String,
    val label: Int = GENERATE_AI_LABEL, val sources: Int = AI_CELL_SOURCES, val size: Int = AI_CELL_SIZE,
    val menu: Int = GENERATE_MENU_LABEL, val menuSources: Int = AI_MENU_SOURCES, val registers: Int = AI_CELL_REGISTERS,
) {
    val render = "$type->render($scope)$component"
}

/**
 * What tells the cell apart in each of 587's build families: the AI label it shows, how many renders offer that label,
 * how many instructions and registers its own render has, its Generate menu label and how many renders offer that.
 * Four renders offer the AI label and one the menu label. Every build names the cell and its types differently, so
 * discovery reads those off the class whose numbers match.
 */
internal data class AiCellShape(
    val label: Int, val sources: Int, val size: Int, val menu: Int, val menuSources: Int, val registers: Int = AI_CELL_REGISTERS,
)
internal val aiCellShapes = listOf(
    AiCellShape(GENERATE_AI_LABEL, AI_CELL_SOURCES, AI_CELL_SIZE, GENERATE_MENU_LABEL, AI_MENU_SOURCES),
    // 587's armv7 builds: the same render, and their own Generate label.
    AiCellShape(GENERATE_AI_LABEL, AI_CELL_SOURCES, AI_CELL_SIZE, GENERATE_MENU_LABEL_ARMV7, AI_MENU_SOURCES),
    // 587's other arm64 builds (347415280, 281 and 285): arm64's Generate label, a render an instruction shorter and a
    // register wider.
    AiCellShape(GENERATE_AI_LABEL, AI_CELL_SOURCES, AI_CELL_SIZE_SHORT, GENERATE_MENU_LABEL, AI_MENU_SOURCES, AI_CELL_REGISTERS_WIDE),
)
internal const val AI_CELL_SIZE = 105
internal const val AI_CELL_SIZE_SHORT = 104
internal const val AI_CELL_REGISTERS = 24
internal const val AI_CELL_REGISTERS_WIDE = 25
internal const val AI_CELL_SOURCES = 4
internal const val AI_MENU_SOURCES = 1

/** The cells the last discovery found, which the cell and grid switches check their method against. */
internal var aiStickerCells: List<AiCell> = emptyList()

/**
 * This is a single icon/click prefix cell, not the result grid. A00 is its label resource. The cell is the one class of
 * its name whose constructor stores its last argument as that label, whose render overrides the abstract render of the
 * Litho base it extends, and whose labels and render size match one of [aiCellShapes].
 */
internal fun discoverAiCells(classes: Iterable<ClassDef>): List<Pair<AiCell, Method>> {
    val all = classes.toList()
    val byType = all.groupBy { it.type }
    val renders = all.flatMap { it.methods }.filter { it.name == "render" }
    val found = mutableListOf<Pair<AiCell, Method>>()
    for (cls in all) {
        if (cls.fields.count { it.name == "A00" && it.type == "I" && !AccessFlags.STATIC.isSet(it.accessFlags) } != 1) continue
        val ctor = cls.methods.singleOrNull { it.name == "<init>" && it.parameterTypes.size == 11 &&
            it.parameterTypes.first().toString() == FB_USER_SESSION && it.parameterTypes.last().toString() == "I" &&
            it.parameterTypes.slice(7..8).map { p -> p.toString() } == List(2) { "Lkotlin/jvm/functions/Function0;" } } ?: continue
        val body = ctor.mediaCode()
        val store = body.getOrNull(5) as? TwoRegisterInstruction
        if (AccessFlags.STATIC.isSet(ctor.accessFlags) || ctor.implementation?.registerCount != 12 || body.size != 15 ||
            body[5].opcode != Opcode.IPUT || store?.registerA != 11 || store.registerB != 0 || body[5].mediaRef() != "${cls.type}->A00:I" ||
            body.count { it.mediaRef() == "${cls.type}->A00:I" } != 1 || body.take(5).any { it.writes(0) || it.writes(11) } ||
            body.any { it is OffsetInstruction } || ctor.implementation!!.tryBlocks.isNotEmpty()) continue
        if (byType.getValue(cls.type).size != 1) continue
        val render = cls.methods.singleOrNull { it.name == "render" } ?: continue
        val scope = render.parameterTypes.singleOrNull()?.toString() ?: continue
        val base = cls.superclass?.let { byType[it] }?.singleOrNull() ?: continue
        if (!AccessFlags.ABSTRACT.isSet(base.accessFlags) || base.superclass != render.returnType || base.methods.none {
                it.name == "render" && AccessFlags.ABSTRACT.isSet(it.accessFlags) && it.returnType == render.returnType &&
                    it.parameterTypes.map { p -> p.toString() } == listOf(scope) }) continue
        if (AccessFlags.STATIC.isSet(render.accessFlags) || render.implementation == null ||
            render.implementation!!.tryBlocks.size != 4) continue
        // Each label constant that reaches the constructor's label argument, in a straight run.
        val labels = mutableListOf<Int>()
        val straight = mutableListOf<Int>()
        for (source in renders) {
            val code = source.mediaCode()
            for (at in code.indices) {
                if (code[at].opcode !in setOf(Opcode.INVOKE_DIRECT, Opcode.INVOKE_DIRECT_RANGE) || code[at].mediaRef() != ctor.hookId()) continue
                val arg = code[at].mediaArgs().lastOrNull() ?: continue
                val literal = (at - 1 downTo maxOf(0, at - 24)).firstOrNull { code[it].writes(arg) } ?: continue
                val value = (code[literal] as? NarrowLiteralInstruction)?.narrowLiteral ?: continue
                if ((literal + 1 until at).any { code[it] is OffsetInstruction }) continue
                labels += value
                if (source.jumpTargets().none { it in literal + 1..at }) straight += value
            }
        }
        val size = render.mediaCode().size
        val registers = render.implementation!!.registerCount
        // The music sticker branch jumps into the menu cell's constructor call, so the menu label counts either way.
        val shape = aiCellShapes.firstOrNull { shape ->
            shape.size == size && shape.registers == registers && straight.count { it == shape.label } == shape.sources &&
                labels.count { it == shape.menu } == shape.menuSources
        } ?: continue
        found += AiCell(cls.type, base.type, scope, render.returnType, shape.label, shape.sources, shape.size, shape.menu,
            shape.menuSources, shape.registers) to render
    }
    return found
}

internal fun findAiStickerCells(classes: Iterable<ClassDef>): List<Method> {
    val found = discoverAiCells(classes)
    aiStickerCells = found.map { it.first }
    return found.map { it.second }
}

internal fun MutableMethod.validateAiStickerCell(): AiCell {
    val cell = aiStickerCells.singleOrNull { it.render == hookId() }
    if (cell == null || hookId() !in activeProfile.hooks.getValue("ai_sticker_cell") ||
        AccessFlags.STATIC.isSet(accessFlags) || implementation?.registerCount != cell.registers || mediaCode().size != cell.size ||
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
 * chain; the Generate menu item's branch builds the cell, and so does the Generate AI item's where a build still lists it
 * (584 did; 586 doesn't). [sites] are where those branch bodies start, [skip] is the loop head every item goes
 * back to and [flag] is the register the chain's instance-of results land in.
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
        if (!op(head + 1, Opcode.MOVE_RESULT) || !op(head + 2, Opcode.IF_EQZ) || reg(head + 2) != more ||
            !op(head + 3, Opcode.INVOKE_INTERFACE, Opcode.INVOKE_INTERFACE_RANGE) || code[head + 3].mediaRef() != NEXT ||
            code[head + 3].mediaArgs() != listOf(iterator) || !op(head + 4, Opcode.MOVE_RESULT_OBJECT) ||
            !op(head + 5, Opcode.CHECK_CAST) || reg(head + 5) != item) continue
        // Every item goes back to the head through a plain goto.
        val backs = code.indices.filter { code[it] is OffsetInstruction && code.branchTarget(it) == head }
        if (backs.isEmpty() || backs.any { code[it].opcode !in GOTOS }) continue
        var link = head + 6
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
        // One menu branch and at most one AI branch, each entered only from its own instance-of test, and no label outside them.
        if (flag == null || flag > 15 || menus.size != 1 || ais.size > 1 || menus == ais ||
            flag in setOf(item, iterator) || sites.any { it in jumpTargets() } ||
            labels.any { at -> bodies.none { at in it } }) continue
        found += AiGrid(sites, head, flag)
    }
    return found.singleOrNull()
}

/**
 * The Suggested grid renders that skip the Generate items, found by the loop around the cell rather than by name. The
 * grid runs its own cell discovery, so it doesn't depend on the cell finder having run first.
 */
internal fun findAiStickerGrids(classes: Iterable<ClassDef>): List<Method> {
    val cells = discoverAiCells(classes).map { it.first }
    aiStickerCells = cells
    return classes.flatMap { it.methods }.filter { method -> cells.any { method.aiStickerGrid(it) != null } }
}

internal fun MutableMethod.validateAiStickerGrid(): AiGrid {
    if (hookId() !in activeProfile.hooks.getValue("ai_sticker_grid")) mediaFailure(this)
    return aiStickerCells.mapNotNull { aiStickerGrid(it) }.singleOrNull() ?: mediaFailure(this)
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
