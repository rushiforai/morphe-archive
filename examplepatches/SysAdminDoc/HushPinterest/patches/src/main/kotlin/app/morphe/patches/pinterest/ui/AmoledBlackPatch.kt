/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.pinterest.misc.extension.enableCapability
import app.morphe.patches.pinterest.misc.extension.enableStatus
import app.morphe.patches.pinterest.misc.extension.handleTargets
import app.morphe.patches.pinterest.misc.extension.localRegisterCount
import app.morphe.patches.pinterest.misc.extension.pinterestExtensionPatch
import app.morphe.patches.pinterest.misc.extension.requireFreeAt
import app.morphe.patches.pinterest.misc.extension.requireStatusMethod
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

private const val PATCH = "AMOLED black"

/** Pinterest's frosted glass. The bar's tabs and its search pill are made of it where the bar shows them as glass. */
internal const val BLUR_VIEW = "Lcom/pinterest/gestalt/design/blur/GestaltBlurView;"

/** The id of the bar that holds the reply box. Every comments screen is built by the one method that looks it up. */
internal const val COMMENTS_SCREEN_ID = "comment_bottom_bar"

/** Pinterest's rounded card. A pin's menu shows See more and See less on it, and nothing else in 14.43.0 uses it. */
internal const val PIN_MENU_CARD = "bento_card_background"

internal const val COMMENTS_HOOK = "$AMOLED_BLACK->comments(Landroid/view/View;)V"
internal const val PIN_MENU_HOOK = "$AMOLED_BLACK->pinMenu(Landroid/view/View;)V"
internal const val PIN_MENU_CARD_HOOK = "$AMOLED_BLACK->pinMenuCard(Landroid/view/View;)V"
internal const val SAVE_SHEET_HOOK = "$AMOLED_BLACK->saveSheet(Landroid/view/View;)V"
internal const val SHEET_HOOK = "$AMOLED_BLACK->gestaltSheet(Landroid/view/View;)V"
internal const val MENU_HOOK = "$AMOLED_BLACK->legoModal(Landroid/view/View;)V"
internal const val BOARD_TOOL_BAR_HOOK = "$AMOLED_BLACK->boardToolBar(Landroid/view/View;)V"
internal const val PROFILE_FILTERS_HOOK = "$AMOLED_BLACK->profileFilters(Landroid/view/View;)V"
internal const val BOARD_HEADER_HOOK = "$AMOLED_BLACK->boardHeader(Landroid/view/View;)V"

/** The ids only the method that sets up each of Pinterest's Gestalt sheets reads together (14.44.0). */
internal const val GESTALT_SHEET_HEADER = "gestalt_sheet_header"
internal const val GESTALT_SHEET_COORDINATOR = "draggable_sheet_coordinator"

/** The ids only the constructor of Pinterest's lego menus reads together (14.44.0). */
internal const val LEGO_MODAL_CONTAINER = "lego_modal_container"
internal const val LEGO_CLOSE_STICKY = "lego_close_container_sticky"

/** The bar that floats over a board, a card. */
internal const val BOARD_TOOL_BAR = "Lcom/pinterest/feature/board/detail/floatingtoolbar/FloatingToolbarView;"

/** A profile's filter buttons, each drawn by Compose: the sort and other pills, and the row of filters. */
internal const val PROFILE_PILL = "Lcom/pinterest/feature/profile/pills/view/PillView;"
internal const val PROFILE_FILTER_BAR = "Lcom/pinterest/feature/profile/filters/FilterBarView;"

/** A board's header image, an empty card on Edit board until an image is picked. */
internal const val BOARD_HEADER_IMAGE = "Lcom/pinterest/feature/board/headerimage/BoardHeaderImageView;"

/** Where a glass view washes its canvas: its draw method, the wash's index, and the registers holding the view and the color. */
internal data class GlassWash(val draw: Method, val index: Int, val view: Int, val color: Int)

/**
 * The bar's gray is Pinterest's elevation color, which menus, popovers and floating buttons share,
 * so the theme is left alone and only the bar's own drawables are recolored as it draws. The
 * comments sheet and a pin's menu carry the same color, and each is handed to the extension by the
 * method that builds it, as is each See more and See less card in that menu. The Save to sheet
 * is handed over as its fragment starts laying it out. The bar, the comments sheet, the menu and
 * the Save to sheet are found apart, so a build that lacks one keeps the others. The menu's sheet
 * and its cards go together, under one switch.
 *
 * The other sheets are handed over where Pinterest sets each Gestalt sheet up and where each of its
 * lego menus is built, under a switch of their own. The bar over a board, a profile's filter
 * buttons and a board's header image are each handed over from their constructors right after the
 * constructor of the class they're built on, under one more switch. Each of these is found apart too.
 */
@Suppress("unused")
val amoledBlackPatch = bytecodePatch(
    name = PATCH,
    description = "Paints the bottom bar pure black in dark mode, so it matches Pinterest's black pages on OLED " +
        "screens. The comments sheet, a pin's menu, the Save to sheet that lists your boards, the other menus " +
        "and sheets, and the buttons over boards and profiles can go black too, each with its own switch. " +
        "Light mode stays as it is. Starts off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Theme")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("amoledBlack")
        requireStatusMethod("blackBottomBar")
        requireStatusMethod("blackComments")
        requireStatusMethod("blackPinMenu")
        requireStatusMethod("blackSaveSheet")
        requireStatusMethod("blackSheets")
        requireStatusMethod("blackBoards")
        var sheets = false
        var boards = false
        val surfaces = listOf("bottom bar", "comments screen", "pin menu", "Save to sheet", "sheets", "menus",
            "board tool bar", "profile filters", "board header")
        handleTargets(PATCH, "surfaces", surfaces) { surface ->
            try {
                when (surface) {
                    "sheets" -> {
                        // The method's view is the whole sheet, its second register past the method's
                        // own, which nothing has written yet at its start.
                        mutable(gestaltSheetSetup()).addInstructions(0, "invoke-static/range { p1 .. p1 }, $SHEET_HOOK")
                        sheets = true
                    }
                    "menus" -> {
                        handOverBuilt(legoMenu(), MENU_HOOK)
                        sheets = true
                    }
                    "board tool bar" -> {
                        handOverBuilt(listOf(BOARD_TOOL_BAR), BOARD_TOOL_BAR_HOOK)
                        boards = true
                    }
                    "profile filters" -> {
                        handOverBuilt(listOf(PROFILE_PILL, PROFILE_FILTER_BAR), PROFILE_FILTERS_HOOK)
                        boards = true
                    }
                    "board header" -> {
                        handOverBuilt(listOf(BOARD_HEADER_IMAGE), BOARD_HEADER_HOOK)
                        boards = true
                    }
                    "bottom bar" -> {
                        paintBottomBar()
                        enableCapability("blackBottomBar")
                    }
                    "comments screen" -> {
                        handOver(commentsScreen(), surface, COMMENTS_HOOK)
                        enableCapability("blackComments")
                    }
                    "Save to sheet" -> {
                        // The view onViewCreated gets is the whole sheet, already built. It's
                        // the method's second parameter, which nothing has written yet at its start.
                        mutable(boardPickerViewCreated(PATCH)).addInstructions(0, "invoke-static/range { p1 .. p1 }, $SAVE_SHEET_HOOK")
                        enableCapability("blackSaveSheet")
                    }
                    else -> {
                        // The sheet and its cards are one surface: both are found before either changes.
                        val sheet = pinMenuSheet()
                        val card = pinMenuCard()
                        handOver(sheet, surface, PIN_MENU_HOOK)
                        handOver(card, "pin menu card", PIN_MENU_CARD_HOOK)
                        enableCapability("blackPinMenu")
                    }
                }
                null
            } catch (missing: PatchException) {
                "the $surface isn't built the way 14.39.0 builds it (${missing.message})"
            }
        }
        if (sheets) enableCapability("blackSheets")
        if (boards) enableCapability("blackBoards")
        enableStatus("amoledBlack")
    }
}

/**
 * The one method that sets up each of Pinterest's Gestalt sheets on its view, the one that reads
 * both the sheet's header id and its coordinator's. Nothing is changed here.
 */
internal fun BytecodePatchContext.gestaltSheetSetup(): Method {
    val setups = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(setups) { method ->
            method.implementation != null && method.fields().filter { it.type == "I" }.map { it.name }
                .containsAll(listOf(GESTALT_SHEET_HEADER, GESTALT_SHEET_COORDINATOR))
        }
    }
    val setup = setups.one("$PATCH: sheet setup")
    if (AccessFlags.STATIC.isSet(setup.accessFlags) || setup.parameterTypes.size != 1 || !isView(setup.parameterTypes[0].toString())) {
        throw PatchException("$PATCH: the sheet setup ${setup.definingClass}->${setup.name} doesn't take just the sheet's view")
    }
    return setup
}

/** The class of Pinterest's lego menus, whose constructor alone reads both the menu's list id and its Close row's. */
internal fun BytecodePatchContext.legoMenu(): List<String> {
    val builders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(builders) { method ->
            method.implementation != null && method.fields().filter { it.type == "I" }.map { it.name }
                .containsAll(listOf(LEGO_MODAL_CONTAINER, LEGO_CLOSE_STICKY))
        }
    }
    val builder = builders.one("$PATCH: lego menu builder")
    if (builder.name != "<init>") throw PatchException("$PATCH: the lego menu is built in ${builder.name}, not as it's made")
    return listOf(builder.definingClass)
}

/**
 * Where [constructor] calls the constructor of a class it's built on, its parent's or one further
 * up when R8 dropped the one between, on its this register before anything writes it. Null when it
 * hands over to another of its own class's, which does that instead.
 */
internal fun BytecodePatchContext.builtOnCall(constructor: Method): Int? {
    val own = constructor.definingClass
    if (constructor.callsItsOwn()) return null
    val seen = mutableSetOf(own)
    var parent = classDefBy(own).superclass
    while (parent != null && seen.add(parent)) {
        val at = constructor.parentCall(parent)
        if (at != null) {
            val target = (constructor.instructions()[at] as ReferenceInstruction).reference as MethodReference
            return if (target.definingClass == own) null else at
        }
        parent = classDefByOrNull(parent)?.superclass
    }
    throw PatchException("$PATCH: $own's constructor doesn't call one it's built on, on its this register first")
}

/**
 * True when the constructor's first constructor call is another of its own class's, made on `this`
 * or on a copy of it. A constructor passing its arguments on as a register range moves `this` to the
 * range's first register before the call (14.44.0's PillView(Context) calls the synthetic
 * constructor from v0, a copy of v6).
 */
private fun Method.callsItsOwn(): Boolean {
    val copies = mutableSetOf(implementation!!.registerCount - 1 - parameterTypes.map { if (it.toString() in setOf("J", "D")) 2 else 1 }.sum())
    for (instruction in instructions()) {
        val target = (instruction as? ReferenceInstruction)?.reference as? MethodReference
        if ((instruction.opcode == Opcode.INVOKE_DIRECT || instruction.opcode == Opcode.INVOKE_DIRECT_RANGE) && target?.name == "<init>") {
            val receiver = when (instruction) {
                is FiveRegisterInstruction -> instruction.registerC
                is RegisterRangeInstruction -> instruction.startRegister
                else -> -1
            }
            if (receiver in copies) return target.definingClass == definingClass
        }
        val copied = (instruction as? TwoRegisterInstruction)?.takeIf {
            instruction.opcode == Opcode.MOVE_OBJECT || instruction.opcode == Opcode.MOVE_OBJECT_FROM16 || instruction.opcode == Opcode.MOVE_OBJECT_16
        }
        val fromThis = copied != null && copied.registerB in copies
        copies.removeAll { instruction.putsIn(it) }
        if (fromThis) copies += copied!!.registerA
        if (copies.isEmpty()) return false
    }
    return false
}

/** True when the instruction puts a new value in [register]. */
private fun Instruction.putsIn(register: Int): Boolean {
    if (!opcode.setsRegister()) return false
    val written = (this as? OneRegisterInstruction)?.registerA ?: return false
    return written == register || opcode.setsWideRegister() && written + 1 == register
}

/**
 * Hands each view of [types] to [hook] from its constructors, right after the constructor of the
 * class it's built on, on its this register. Every class is found and checked before any changes.
 */
private fun BytecodePatchContext.handOverBuilt(types: List<String>, hook: String) {
    val sites = types.flatMap { type ->
        val owner = classDefByOrNull(type) ?: throw PatchException("$PATCH: $type wasn't found")
        if (!isView(type)) throw PatchException("$PATCH: $type isn't a view")
        val constructors = owner.methods.filter { it.name == "<init>" && it.implementation != null }
        val built = constructors.mapNotNull { constructor -> builtOnCall(constructor)?.let { constructor to it } }
        if (built.isEmpty()) throw PatchException("$PATCH: no constructor of $type calls one it's built on")
        built
    }
    for ((constructor, call) in sites) mutable(constructor).addInstructions(call + 1, "invoke-static/range { p0 .. p0 }, $hook")
}

/** Everything is found and checked before the bar or the glass changes. */
private fun BytecodePatchContext.paintBottomBar() {
    val wash = glassWash()
    if (classDefByOrNull(BOTTOM_BAR) == null) throw PatchException("$PATCH: Pinterest's bottom bar wasn't found")
    val bar = mutableClassDefBy(BOTTOM_BAR)
    // The extension paints the plain LinearLayout children, which is where the bar keeps its tabs.
    if (bar.fields.none { it.type == "Landroid/widget/LinearLayout;" }) {
        throw PatchException("Bottom bar no longer keeps its tabs in a plain row")
    }
    refreshOnDispatchDraw(bar, "$AMOLED_BLACK->bottomBar(Landroid/view/View;)V")
    // Glass has no fill to recolor. The extension answers the color each frame's wash uses instead.
    mutable(wash.draw).addInstructionsAtControlFlowLabel(wash.index, """
        invoke-static { v${wash.view}, v${wash.color} }, $AMOLED_BLACK->blurFill(Landroid/view/View;I)I
        move-result v${wash.color}
    """)
}

/**
 * The one place Pinterest's frosted glass washes its blurred backdrop with a color, checked so a
 * hook in front of it can read the view and put its answer where the color was. Nothing is changed here.
 */
internal fun BytecodePatchContext.glassWash(): GlassWash {
    val glass = classDefByOrNull(BLUR_VIEW) ?: throw PatchException("$PATCH: Pinterest's frosted glass view wasn't found")
    val draw = glass.methods.filter {
        it.name == "draw" && it.returnType == "V" && it.parameters() == listOf("Landroid/graphics/Canvas;")
    }.one("$PATCH: frosted glass draw method")
    val (index, wash) = draw.instructions().withIndex().filter { (_, instruction) ->
        ((instruction as? ReferenceInstruction)?.reference as? MethodReference)?.let {
            it.definingClass == "Landroid/graphics/Canvas;" && it.name == "drawColor" && it.parameters() == listOf("I")
        } == true
    }.one("$PATCH: frosted glass wash")
    // A two-register call names the canvas and then the color, both in v15 or below.
    val color = (wash as? FiveRegisterInstruction)?.takeIf { it.registerCount == 2 }?.registerD
        ?: throw PatchException("$PATCH: the frosted glass wash isn't a plain call with a canvas and a color")
    val view = draw.localRegisterCount()
    if (view > 15) throw PatchException("$PATCH: the frosted glass view's own register is past v15")
    draw.requireThisIntact(PATCH, listOf(index))
    // The hook's answer replaces the color in its register, so nothing after the wash may read the old one.
    draw.requireFreeAt(PATCH, index + 1, listOf(color))
    return GlassWash(draw, index, view, color)
}

/**
 * The method that builds every comments screen: the one onCreateView that looks up the reply bar
 * and answers the screen's root view. Nothing is changed here.
 */
internal fun BytecodePatchContext.commentsScreen(): Method {
    val builders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(builders) { method ->
            method.name == "onCreateView" && method.implementation != null &&
                method.fields().any { it.name == COMMENTS_SCREEN_ID && it.type == "I" }
        }
    }
    return builders.one("$PATCH: comments screen builder")
}

/** The method that builds a pin's menu and answers the sheet that holds it. Nothing is changed here. */
internal fun BytecodePatchContext.pinMenuSheet(): Method {
    val menu = classDefByOrNull(PIN_MENU) ?: throw PatchException("$PATCH: Pinterest's pin menu wasn't found")
    return menu.methods.filter { it.name == "createModalView" && it.implementation != null }
        .one("$PATCH: pin menu builder")
}

/**
 * The method that builds each card a pin's menu shows See more and See less on: the one that gives
 * a view Pinterest's rounded card and answers it. The menu adds the cards to its list itself, so
 * the sheet's own hook never sees them. Nothing is changed here.
 */
internal fun BytecodePatchContext.pinMenuCard(): Method {
    val builders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(builders) { method ->
            method.implementation != null && method.fields().any { it.name == PIN_MENU_CARD && it.type == "I" }
        }
    }
    return builders.one("$PATCH: pin menu card builder")
}

/**
 * Hands the view [builder] answers to [hook], right in front of its only return and on every way
 * into it. The hook reads the answered register and writes nothing, so it borrows no register.
 */
private fun BytecodePatchContext.handOver(builder: Method, what: String, hook: String) {
    if (!isView(builder.returnType)) {
        throw PatchException("$PATCH: the $what builder answers ${builder.returnType}, which isn't a view")
    }
    val method = mutable(builder)
    val (index, answer) = method.instructions().withIndex().filter { (_, instruction) ->
        instruction.opcode == Opcode.RETURN_OBJECT
    }.one("$PATCH: $what builder return")
    val view = (answer as OneRegisterInstruction).registerA
    method.addInstructionsAtControlFlowLabel(index, "invoke-static/range { v$view .. v$view }, $hook")
}

/** Whether [type] is one of Android's views or a class of Pinterest's built on one. */
private fun BytecodePatchContext.isView(type: String): Boolean {
    val seen = mutableSetOf<String>()
    var at: String? = type
    while (at != null && seen.add(at)) at = (classDefByOrNull(at) ?: break).superclass
    return at != null && (at.startsWith("Landroid/view/") || at.startsWith("Landroid/widget/"))
}
