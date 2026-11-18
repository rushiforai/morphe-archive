package app.jofslash.patches.quora.app

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.methodCall
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/NativeTweaksPatch;"

// Builds the notification for a push message from Quora.
internal object UpdateNotificationsFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/FCMIntentService;",
    name = "updateNotifications",
    returnType = "V",
    parameters = listOf("Ljava/util/Map;"),
)

@Suppress("unused")
val blockPromotionalNotificationsPatch = bytecodePatch(
    name = "Block promotional notifications",
    description = "Drops digest and promotional push notifications. Replies, comments and other " +
            "notifications about you still arrive.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        registerSetting("blockPromotionalNotifications", "Block promotional notifications")
        // p1 is the message's data.
        UpdateNotificationsFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p1 }, $EXTENSION_CLASS->isPromotionalNotification(Ljava/util/Map;)Z
                move-result v0
                if-eqz v0, :show
                return-void
                :show
                nop
            """
        )
    }
}

// Pull to refresh: every call that enables the layout goes through here.
internal object SwipeRefreshSetEnabledFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/view/QSwipeRefreshLayout;",
    name = "setEnabled",
    returnType = "V",
    parameters = listOf("Z"),
)

// Swiping sideways between the feeds of a tab.
internal object SwitcherShouldPageFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/fragments/switcherfragment/SwitcherViewPager;",
    name = "shouldPage",
    returnType = "Z",
    parameters = listOf("Landroid/view/MotionEvent;"),
)

@Suppress("unused")
val disableSwipeGesturesPatch = bytecodePatch(
    name = "Disable swipe gestures",
    description = "Turns off pulling down to refresh and swiping sideways between feeds, " +
            "so a page doesn't reload or change while you read.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    val pullToRefresh = booleanOption(
        key = "disablePullToRefresh",
        default = true,
        title = "Disable pull to refresh",
    )
    val swipeBetweenFeeds = booleanOption(
        key = "disableSwipeBetweenFeeds",
        default = true,
        title = "Disable swiping between feeds",
    )

    execute {
        if (pullToRefresh.value != true && swipeBetweenFeeds.value != true) {
            throw PatchException("Pick at least one gesture to turn off")
        }
        if (pullToRefresh.value == true) {
            registerSetting("disablePullToRefresh", "Disable pull to refresh")
            SwipeRefreshSetEnabledFingerprint.method.addInstructions(
                0,
                """
                    invoke-static { p1 }, $EXTENSION_CLASS->pullToRefreshEnabled(Z)Z
                    move-result p1
                """
            )
        }
        if (swipeBetweenFeeds.value == true) {
            registerSetting("disableSwipeBetweenFeeds", "Disable swiping between feeds")
            SwitcherShouldPageFingerprint.method.addInstructionsWithLabels(
                0,
                """
                    invoke-static { }, $EXTENSION_CLASS->swipeBetweenFeedsDisabled()Z
                    move-result v0
                    if-eqz v0, :page
                    const/4 v0, 0x0
                    return v0
                    :page
                    nop
                """
            )
        }
    }
}

// Starts Branch, the install attribution and link SDK, when the app starts.
internal object BranchStartFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/Quora;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lio/branch/referral/Branch;", name = "getAutoInstance"),
    )
)

// The release app turns on Branch's debug mode.
internal object BranchDebugModeFingerprint : Fingerprint(
    definingClass = "Lio/branch/referral/Branch;",
    name = "enableDebugMode",
    returnType = "V",
    parameters = listOf(),
)

@Suppress("unused")
val blockBranchTrackingPatch = bytecodePatch(
    name = "Block Branch tracking",
    description = "Turns on Branch's \"disable tracking\" mode and turns off its debug mode. " +
            "Branch tracks where installs come from. Quora's quora.app.link links may open with less detail.",
    default = false
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        BranchStartFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.first().index
                val next = implementation!!.instructions.elementAt(index + 1).opcode
                val insertIndex = if (next == Opcode.MOVE_RESULT_OBJECT) index + 2 else index + 1
                addInstruction(insertIndex, "invoke-static { }, $EXTENSION_CLASS->disableBranchTracking()V")
            }
        }
        BranchDebugModeFingerprint.method.addInstructions(0, "return-void")
    }
}
