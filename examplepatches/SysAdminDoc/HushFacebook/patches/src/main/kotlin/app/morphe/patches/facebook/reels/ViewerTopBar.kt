/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.facebook.misc.extension.EXTENSION_PACKAGE
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction

/*
 * Search and the button beside it at the top of a video or reel opened full screen (#311). Read
 * from 585, 2026-10-31, arm64.
 *
 * - The full-screen player screen, ImmersiveActivity, draws its top bar in one LithoView: Back,
 *   Search, and the Reels profile button over a reel or More over a feed video. Its kept
 *   setPipChromeVisibility(I)V loads the bar's id, finds the bar with findViewById on the screen and
 *   sets its visibility, and nothing else. The id is read from there, never written down (585:
 *   0x7f0a22e7). A feed video opened on the main screen gets the same bar in a layer laid over the
 *   tabs, and the Reels tab's header has the id as well, inside the tab pages.
 * - The buttons are Litho hosts with no ids, so the extension takes them from the bar by place
 *   (ViewerTopBar.java). The patch only fills the extension's id stub.
 */

internal const val IMMERSIVE_ACTIVITY = "Lcom/facebook/katana/immersiveactivity/ImmersiveActivity;"
internal const val PIP_CHROME_VISIBILITY = "setPipChromeVisibility"
internal const val VIEWER_TOP_BAR = "$EXTENSION_PACKAGE/reels/ViewerTopBar;"
private const val FIND_VIEW_BY_ID = "Landroid/app/Activity;->findViewById(I)Landroid/view/View;"

private const val PATCH = "Clean up Reels"
private val CONSTS = setOf(Opcode.CONST, Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST_HIGH16)

/** Whether [method] is the player screen's setPipChromeVisibility: an instance method taking one int, returning nothing. */
internal fun isPipChromeVisibility(method: Method) =
    method.name == PIP_CHROME_VISIBILITY && !AccessFlags.STATIC.isSet(method.accessFlags) &&
        method.returnType == "V" && method.parameterTypes.map(CharSequence::toString) == listOf("I")

/**
 * The top bar's id in [method]: the literal loaded right before its first findViewById, which is
 * called on the screen itself. An id resource is a 0x7fXX literal.
 */
internal fun topBarId(method: Method): Int {
    val code = method.implementation?.instructions?.toList()
        ?: throw PatchException("$PATCH: ${method.name} has no code")
    val at = code.indexOfFirst {
        it.opcode == Opcode.INVOKE_VIRTUAL && (it as ReferenceInstruction).reference.toString() == FIND_VIEW_BY_ID
    }
    if (at < 1) throw PatchException("$PATCH: ${method.name} makes no findViewById call after loading an id")
    val call = code[at] as FiveRegisterInstruction
    val screen = method.implementation!!.registerCount - 2
    if (call.registerC != screen) throw PatchException("$PATCH: ${method.name}'s findViewById isn't on the screen itself")
    val load = code[at - 1]
    if (load.opcode !in CONSTS || (load as OneRegisterInstruction).registerA != call.registerD) {
        throw PatchException("$PATCH: ${method.name} doesn't load its findViewById's id right before it")
    }
    val id = (load as NarrowLiteralInstruction).narrowLiteral
    if (id ushr 24 != 0x7f) throw PatchException("$PATCH: ${method.name} loads ${"0x%x".format(id)}, not an id resource")
    return id
}

/** The player screen's setPipChromeVisibility in [screen], or a refusal naming what's missing. */
internal fun pipChromeVisibility(screen: ClassDef?): Method {
    if (screen == null) throw PatchException("$PATCH: no $IMMERSIVE_ACTIVITY")
    return screen.methods.singleOrNull(::isPipChromeVisibility)
        ?: throw PatchException("$PATCH: $IMMERSIVE_ACTIVITY has no $PIP_CHROME_VISIBILITY(I)V")
}

/** The extension's id stub answers the player's top bar id, so it can find the bar after each layout. */
internal fun BytecodePatchContext.hideViewerTopButtons() {
    val id = topBarId(pipChromeVisibility(classDefByOrNull(IMMERSIVE_ACTIVITY)))
    mutableClassDefBy(VIEWER_TOP_BAR).methods.single {
        it.name == "barId" && it.parameterTypes.isEmpty() && it.returnType == "I"
    }.returnEarly(id)
}
