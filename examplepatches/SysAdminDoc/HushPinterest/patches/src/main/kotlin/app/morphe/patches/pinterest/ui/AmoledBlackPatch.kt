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
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.patches.pinterest.misc.extension.requireThisIntact
import app.morphe.patches.pinterest.misc.settings.EXTENSION_ROOT
import app.morphe.patches.pinterest.misc.settings.settingsPatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

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
internal const val PIN_DETAILS_HOOK = "$AMOLED_BLACK->pinDetails(Landroid/view/View;)V"
internal const val TOAST_HOOK = "$AMOLED_BLACK->toast(Landroid/view/View;)V"
internal const val BLACK_BUTTONS_HOOK = "$AMOLED_BLACK->gestaltButton(Landroid/view/View;)V"
internal const val SEARCH_GUIDE_HOOK = "$AMOLED_BLACK->searchGuide(Landroid/view/View;)V"
internal const val SEARCH_BUBBLE_HOOK = "$AMOLED_BLACK->searchBubble(Landroid/view/View;)V"
internal const val SETTINGS_CARD_HOOK = "$AMOLED_BLACK->settingsCard(Landroid/view/View;)V"

/** The chips over search results, such as Filter and the suggested searches. */
internal const val SEARCH_GUIDE = "Lcom/pinterest/gestalt/searchGuide/GestaltSearchGuide;"

/** The shape each row of a "Refine your search" list is drawn on, a resource only that row loads (14.45.0). */
internal const val SEARCH_BUBBLE_FILL = "rounded_rect_medium_radius_opaque_background"

/** The view at the top of Pinterest's own settings that holds the account card (14.45.0). */
internal const val SETTINGS_PROFILE_PREVIEW = "Lcom/pinterest/feature/settings/menu/view/SettingsProfilePreview;"
internal const val CARD_VIEW = "Landroidx/cardview/widget/CardView;"

/** The sheet of the drawer a pin's chevron slides up, looked up only where the drawer is built (14.45.0). */
internal const val PIN_DETAILS_SHEET = "metadata_drawer_bottom_sheet"

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
 * lego menus is built, under a switch of their own, and the drawer a pin's chevron slides up joins
 * them as soon as its layout is inflated. The bar over a board, a profile's filter
 * buttons and a board's header image are each handed over from their constructors right after the
 * constructor of the class they're built on, under one more switch. Each of these is found apart too.
 * Black buttons takes each Gestalt button right after Pinterest styles it, and each chip over search
 * results each time Pinterest puts a look on it, found apart from the buttons. It also takes the
 * account card at the top of Pinterest's settings the moment Pinterest keeps it, and each row of a
 * "Refine your search" list right after the row gets its shape, each found apart too.
 */
@Suppress("unused")
val amoledBlackPatch = bytecodePatch(
    name = PATCH,
    description = "Paints the bottom bar pure black in dark mode, so it matches Pinterest's black pages on OLED " +
        "screens. The comments sheet, a pin's menu, the Save to sheet that lists your boards, the other menus " +
        "and sheets, the buttons over boards and profiles, Pinterest's pop-up messages and its gray buttons can go black too, " +
        "each with its own switch. " +
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
        requireStatusMethod("blackToasts")
        requireStatusMethod("blackButtons")
        requireStatusMethod("blackSearchGuides")
        requireStatusMethod("blackSettingsCard")
        requireStatusMethod("blackSearchBubbles")
        var sheets = false
        var boards = false
        val surfaces = listOf("bottom bar", "comments screen", "pin menu", "Save to sheet", "sheets", "menus",
            "pin details", "board tool bar", "profile filters", "board header", "toasts", "button styling", "search guides",
            "settings card", "search bubbles")
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
                    "pin details" -> {
                        // The inherited onCreateView has inflated the whole drawer, which then answers from two places.
                        val drawer = pinDetailsDrawer()
                        val inflated = drawer.inflatedViewAt()
                        val view = (drawer.instructions()[inflated] as OneRegisterInstruction).registerA
                        mutable(drawer).addInstructions(inflated + 1, "invoke-static/range { v$view .. v$view }, $PIN_DETAILS_HOOK")
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
                    "toasts" -> {
                        paintToasts()
                        enableCapability("blackToasts")
                    }
                    "button styling" -> {
                        // Every GestaltButton right after Pinterest styles it, the spot Hide closeup
                        // buttons hands the Save button over at. Whichever patch goes in second takes
                        // the label there, ahead of the other's call, so both run on every path.
                        val style = styleSite()
                        mutable(style.method).addInstructionsAtControlFlowLabel(style.index,
                            "invoke-static/range { v${style.register} .. v${style.register} }, $BLACK_BUTTONS_HOOK")
                        enableCapability("blackButtons")
                    }
                    "search guides" -> {
                        // Every look Pinterest puts on a search guide, its first included, goes through
                        // the method taking the old look and the new, and the guide is its this.
                        val look = searchGuideLook()
                        val body = look.instructions()
                        val ends = body.indices.filter { body[it].opcode == Opcode.RETURN_VOID }
                        if (ends.isEmpty()) throw PatchException("$PATCH: the search guide's look never returns")
                        look.requireThisIntact(PATCH, ends)
                        val method = mutable(look)
                        for (end in ends.sortedDescending()) {
                            method.addInstructionsAtControlFlowLabel(end, "invoke-static/range { p0 .. p0 }, $SEARCH_GUIDE_HOOK")
                        }
                        enableCapability("blackSearchGuides")
                    }
                    "settings card" -> {
                        // Right after the account card is kept in its field, the card in hand.
                        val store = settingsCardStore()
                        mutable(store.method).addInstructions(store.index + 1,
                            "invoke-static/range { v${store.register} .. v${store.register} }, $SETTINGS_CARD_HOOK")
                        enableCapability("blackSettingsCard")
                    }
                    "search bubbles" -> {
                        // Right after each row gets its rounded background, the row in hand.
                        val fill = searchBubbleFill()
                        mutable(fill.method).addInstructions(fill.index + 1,
                            "invoke-static/range { v${fill.register} .. v${fill.register} }, $SEARCH_BUBBLE_HOOK")
                        enableCapability("blackSearchBubbles")
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
 * The method that puts a look on one of Pinterest's search guides: the guide's one instance method
 * that takes two of the same look and returns nothing. Its constructors run it with the first look
 * and every change runs it again. Nothing is changed here.
 */
internal fun BytecodePatchContext.searchGuideLook(): Method {
    val guide = classDefByOrNull(SEARCH_GUIDE) ?: throw PatchException("$PATCH: $SEARCH_GUIDE wasn't found")
    val looks = guide.methods.filter { method ->
        val params = method.parameterTypes.map { it.toString() }
        !AccessFlags.STATIC.isSet(method.accessFlags) && method.implementation != null && method.returnType == "V" &&
            params.size == 2 && params[0] == params[1] && params[0].startsWith("L")
    }
    return looks.singleOrNull()
        ?: throw PatchException("$PATCH: the search guide has ${looks.size} methods taking an old look and a new, not one")
}

/** A view in [register] at [index] of [method], for a hook right after that instruction. */
internal data class ViewSite(val method: Method, val index: Int, val register: Int)

/**
 * Where Pinterest keeps the account card at the top of its own settings: the one store of a
 * CardView into the settings profile preview's field, right after the card is cast from its
 * lookup, the card in the stored register. Only the store leads on to the instruction after it.
 * Nothing is changed here.
 */
internal fun BytecodePatchContext.settingsCardStore(): ViewSite {
    val sites = mutableListOf<ViewSite>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        for (method in owner.methods) {
            if (method.implementation == null ||
                method.fields().none { it.definingClass == SETTINGS_PROFILE_PREVIEW && it.type == CARD_VIEW }) continue
            val body = method.instructions()
            for (index in 1 until body.size) {
                val store = body[index]
                val field = (store as? ReferenceInstruction)?.reference as? FieldReference ?: continue
                if (store.opcode != Opcode.IPUT_OBJECT || field.definingClass != SETTINGS_PROFILE_PREVIEW || field.type != CARD_VIEW) continue
                val card = (store as TwoRegisterInstruction).registerA
                val cast = body[index - 1]
                if (cast.opcode != Opcode.CHECK_CAST || (cast as OneRegisterInstruction).registerA != card ||
                    ((cast as ReferenceInstruction).reference as? TypeReference)?.type != CARD_VIEW) continue
                sites += ViewSite(method, index, card)
            }
        }
    }
    val site = sites.one("$PATCH: account card store")
    site.method.requireOnlyAfter(site.index, "the account card store")
    return site
}

/**
 * Where each row of a "Refine your search" list gets its rounded background: the one method that
 * loads the row's shape, at the view call that puts that shape on the row, the row in the call's
 * first register. Only the call leads on to the instruction after it. Nothing is changed here.
 */
internal fun BytecodePatchContext.searchBubbleFill(): ViewSite {
    val builders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(builders) { method ->
            method.implementation != null && method.fields().any { it.name == SEARCH_BUBBLE_FILL && it.type == "I" }
        }
    }
    val builder = builders.one("$PATCH: Refine your search row builder")
    val body = builder.instructions()
    val loaded = body.indexOfFirst { ((it as? ReferenceInstruction)?.reference as? FieldReference)?.name == SEARCH_BUBBLE_FILL }
    val index = (loaded until body.size).firstOrNull { at ->
        val call = (body[at] as? ReferenceInstruction)?.reference as? MethodReference
        body[at].opcode == Opcode.INVOKE_VIRTUAL && call?.name == "setBackground" && call.returnType == "V" &&
            call.parameters() == listOf("Landroid/graphics/drawable/Drawable;")
    } ?: throw PatchException("$PATCH: the Refine your search row never gets the shape it loads")
    val row = (body[index] as FiveRegisterInstruction).registerC
    builder.requireOnlyAfter(index, "the Refine your search row's background")
    return ViewSite(builder, index, row)
}

/**
 * Refuses a hook right after [index] unless [index] alone leads on to the instruction after it:
 * no branch, switch or handler lands there, so the hook runs on every way there and never on one
 * where its register holds something else.
 */
private fun Method.requireOnlyAfter(index: Int, what: String) {
    val flow = ControlFlow.of(this)
    val next = index + 1
    val others = flow.normal.indices.filter { it != index && next in flow.normal[it] } +
        flow.exceptional.indices.filter { next in flow.exceptional[it] }
    if (next >= flow.instructions.size || next !in flow.normal[index] || others.isNotEmpty()) {
        throw PatchException("$PATCH: $what isn't the only way on to the instruction after it in $definingClass->$name")
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
/** Hands each toast to the extension as soon as the container has had its model build it. */
internal fun BytecodePatchContext.paintToasts() {
    val show = mutable(toastShowMethod())
    val body = show.instructions()
    val built = body.indices.filter { index ->
        val call = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        call != null && call.returnType == TOAST_VIEW && call.parameters() == listOf(TOAST_CONTAINER)
    }.one("$PATCH: toast builder call")
    val result = body.getOrNull(built + 1)
    if (result?.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("$PATCH: the toast container doesn't keep the toast it builds")
    val toast = (result as OneRegisterInstruction).registerA
    show.addInstructions(built + 2, "invoke-static/range { v$toast .. v$toast }, $TOAST_HOOK")
}

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

/** The onCreateView that builds the drawer a pin's chevron slides up. Nothing is changed here. */
internal fun BytecodePatchContext.pinDetailsDrawer(): Method {
    val builders = mutableListOf<Method>()
    classDefForEach { owner ->
        if (owner.type.startsWith(EXTENSION_ROOT)) return@classDefForEach
        owner.methods.filterTo(builders) { method ->
            method.name == "onCreateView" && method.implementation != null &&
                method.fields().any { it.name == PIN_DETAILS_SHEET && it.type == "I" }
        }
    }
    return builders.one("$PATCH: pin details drawer builder")
}

/** Where this onCreateView receives the view it inherits, the layout already inflated. Nothing is changed here. */
internal fun Method.inflatedViewAt(): Int {
    val body = instructions()
    val inherited = body.indices.filter { index ->
        val opcode = body[index].opcode
        val target = (body[index] as? ReferenceInstruction)?.reference as? MethodReference
        (opcode == Opcode.INVOKE_SUPER || opcode == Opcode.INVOKE_SUPER_RANGE) &&
            target?.name == "onCreateView" && target.returnType == "Landroid/view/View;"
    }.one("$PATCH: inherited onCreateView")
    if (body.getOrNull(inherited + 1)?.opcode != Opcode.MOVE_RESULT_OBJECT) {
        throw PatchException("$PATCH: the pin details drawer doesn't keep the view it inherits")
    }
    return inherited + 1
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
