package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference

internal const val DISAPPEARING_SWIPE = "disappearing_swipe"

/**
 * The chat's overscroll behavior. Messenger attaches it under the message list only for the swipe up that turns on
 * disappearing messages (the timer is set in its onStopNestedScroll), and one chat-view helper is its only creator. It
 * keeps this name in all six supported build families.
 */
internal const val OVERSCROLL_BEHAVIOR = "Lcom/facebook/messaging/threadview/overscroll/ui/OverScrollActionBehavior;"

/** CoordinatorLayout asks the behavior here whether it wants a nested scroll; false keeps it out of the whole gesture. */
internal const val OVERSCROLL_START = "$OVERSCROLL_BEHAVIOR->onStartNestedScroll(" +
    "Landroidx/coordinatorlayout/widget/CoordinatorLayout;Landroid/view/View;Landroid/view/View;Landroid/view/View;II)Z"

/** The impression Messenger logs each time the gesture can start. It names what the behavior is for. */
internal const val DISAPPEARING_SWIPE_MARK = "dm_swipe_up_impression"

private fun Method.stringLiterals() =
    implementation?.instructions?.mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }?.toSet()

/** The behavior's own start method, non-static, and still the one that logs the disappearing-message swipe. */
internal fun Method.isDisappearingSwipeStart() =
    definingClass == OVERSCROLL_BEHAVIOR && hookId() == OVERSCROLL_START && !AccessFlags.STATIC.isSet(accessFlags) &&
        DISAPPEARING_SWIPE_MARK in stringLiterals().orEmpty()

internal fun findDisappearingSwipe(classes: Iterable<ClassDef>): List<Method> =
    classes.filter { it.type == OVERSCROLL_BEHAVIOR }.flatMap { it.methods }.filter { it.isDisappearingSwipeStart() }

internal fun MutableMethod.validateDisappearingSwipe() {
    if (!isDisappearingSwipeStart()) {
        throw PatchException("Messenger controls: ${hookId()} isn't the disappearing-message swipe")
    }
    validateSwitch()
}

/**
 * While the switch is on the behavior declines every nested scroll, so the swipe never moves the indicator and never
 * reaches the timer. The message list scrolls by itself as before. Off, Pause and safe mode run Messenger's own code.
 */
internal fun MutableMethod.injectDisappearingSwipe() {
    validateDisappearingSwipe()
    injectSwitch("blockDisappearingSwipe", "0x0")
}
