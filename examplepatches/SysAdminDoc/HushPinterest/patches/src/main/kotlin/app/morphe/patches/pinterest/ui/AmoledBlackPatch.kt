/*
 * Original HushPinterest implementation, 2026.
 * Copyright 2026 HushPinterest contributors
 * https://github.com/SysAdminDoc/HushPinterest
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.pinterest.ui

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
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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

/** Where a glass view washes its canvas: its draw method, the wash's index, and the registers holding the view and the color. */
internal data class GlassWash(val draw: Method, val index: Int, val view: Int, val color: Int)

/**
 * The bar's gray is Pinterest's elevation color, which menus, popovers and floating buttons share,
 * so the theme is left alone and only the bar's own drawables are recolored as it draws. The
 * comments sheet and a pin's menu carry the same color, and each is handed to the extension by the
 * method that builds it, as is each See more and See less card in that menu. The bar, the
 * comments sheet and the menu are found apart, so a build that lacks one keeps the others. The
 * menu's sheet and its cards go together, under one switch.
 */
@Suppress("unused")
val amoledBlackPatch = bytecodePatch(
    name = PATCH,
    description = "Paints the bottom bar pure black in dark mode, so it matches Pinterest's black pages on OLED " +
        "screens. The comments sheet and a pin's menu can go black too, each with its own switch. Light mode " +
        "stays as it is. Starts off. Turn them on in HushPinterest settings > Interface.",
) {
    category("Interface")
    dependsOn(settingsPatch, pinterestExtensionPatch)
    compatibleWith(*AppCompatibilities.pinterest())
    execute {
        requireStatusMethod("amoledBlack")
        requireStatusMethod("blackBottomBar")
        requireStatusMethod("blackComments")
        requireStatusMethod("blackPinMenu")
        handleTargets(PATCH, "surfaces", listOf("bottom bar", "comments screen", "pin menu")) { surface ->
            try {
                when (surface) {
                    "bottom bar" -> {
                        paintBottomBar()
                        enableCapability("blackBottomBar")
                    }
                    "comments screen" -> {
                        handOver(commentsScreen(), surface, COMMENTS_HOOK)
                        enableCapability("blackComments")
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
        enableStatus("amoledBlack")
    }
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
