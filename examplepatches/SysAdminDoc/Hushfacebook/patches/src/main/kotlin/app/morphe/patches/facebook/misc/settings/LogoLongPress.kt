/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.settings

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.feed.holdsString
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

/**
 * The home feed's top bar, the view that builds the Facebook logo. The class keeps this name in
 * every build checked (573, 577 and 580) while Redex renames its methods: the one that builds the
 * logo is `A0C` in 573, `A0D` in 577 and `A0I` in 580. Whichever layout the bar shows, the logo is
 * the view that method builds, since the newer bar (`com.facebook.navigation.navbar.NavigationBar`)
 * takes that view from it too.
 */
internal const val WORDMARK_NAVIGATION_BAR = "Lcom/facebook/navigation/navbar/legacy/search/WordmarkNavigationBar;"

/** The trace section the bar opens while it builds the logo. Only the method that does holds it. */
internal const val CREATE_WORDMARK_VIEW = "WordmarkNavigationBar#createWordmarkView"

private const val ON_CLICK_LISTENER = "Landroid/view/View\$OnClickListener;"
private const val ON_TOUCH_LISTENER = "Landroid/view/View\$OnTouchListener;"

/** How Facebook gives the logo its tap. The call right after it gives the logo its touch listener. */
internal const val LOGO_CLICK_CALL = "Landroid/view/View;->setOnClickListener($ON_CLICK_LISTENER)V"

/**
 * SettingsEntry's stand-in for Facebook's call that gives the logo its touch listener: the logo,
 * then Facebook's listener, which is null unless Facebook reads the logo's gestures itself.
 */
internal const val LOGO_TOUCH_STAND_IN = "$ENTRY->setLogoTouchListener(Landroid/view/View;$ON_TOUCH_LISTENER)V"

/** Whether this is a framework View call named [name] that takes one [listener] and answers nothing. */
private fun Instruction.setsListener(name: String, listener: String): Boolean {
    if (opcode != Opcode.INVOKE_VIRTUAL && opcode != Opcode.INVOKE_VIRTUAL_RANGE) return false
    val call = (this as? ReferenceInstruction)?.reference as? MethodReference ?: return false
    return call.name == name && call.returnType == "V" && call.definingClass.startsWith("Landroid/") &&
        call.parameterTypes.map { it.toString() } == listOf(listener)
}

/** The register a call is made on: its first. */
private fun Instruction.receiver(): Int = when (this) {
    is RegisterRangeInstruction -> startRegister
    is FiveRegisterInstruction -> registerC
    else -> -1
}

/**
 * Where [builder], the bar's method that builds the logo, gives the logo its touch listener: the
 * instruction right after the method's one click listener, on the same view. 573, 577 and 580 set
 * the logo's click listener, then its touch listener, then its content description, in that order.
 * The click listener is Facebook's tap, and it stays as it is.
 */
internal fun logoTouchListenerIndex(builder: Method): Int {
    val where = "${builder.definingClass}->${builder.name}"
    val instructions = builder.implementation?.instructions?.toList()
        ?: throw PatchException("$where, the method building the Facebook logo, has no body")
    val clicks = instructions.indices.filter { instructions[it].setsListener("setOnClickListener", ON_CLICK_LISTENER) }
    val click = clicks.singleOrNull() ?: throw PatchException(
        "Expected $where to give one view a click listener, the Facebook logo; it gives ${clicks.size}",
    )
    val touch = instructions.getOrNull(click + 1)
    if (touch == null || !touch.setsListener("setOnTouchListener", ON_TOUCH_LISTENER)) {
        throw PatchException(
            "In $where the Facebook logo's click listener is no longer followed by its touch listener, " +
                "the call the long press goes in through",
        )
    }
    if (touch.receiver() != instructions[click].receiver()) {
        throw PatchException(
            "In $where the touch listener after the Facebook logo's click listener goes to another view " +
                "(v${touch.receiver()}, not v${instructions[click].receiver()})",
        )
    }
    return click + 1
}

/**
 * Sends Facebook's call that gives the Facebook logo its touch listener to SettingsEntry, which
 * makes the call with a listener that opens the Hushfacebook screen on a long press, or with
 * Facebook's own when Facebook passes one. Every name used is kept: the bar's class, the trace
 * section its logo builder opens and the framework's listener calls. Stops the patch, naming what
 * it missed, when the evidence isn't there.
 */
internal fun BytecodePatchContext.hookLogoLongPress() {
    val bar = mutableClassDefByOrNull(WORDMARK_NAVIGATION_BAR)
        ?: throw PatchException("This Facebook has no $WORDMARK_NAVIGATION_BAR, the home feed's top bar")
    val builders = bar.methods.filter { holdsString(it, CREATE_WORDMARK_VIEW) }
    val builder = builders.singleOrNull() ?: throw PatchException(
        "Expected one method of $WORDMARK_NAVIGATION_BAR holding \"$CREATE_WORDMARK_VIEW\", found ${builders.size}",
    )
    builder.sendToStandIn(logoTouchListenerIndex(builder), LOGO_TOUCH_STAND_IN)
}
