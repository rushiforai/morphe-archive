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
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction

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
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

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
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

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
    default = true
) {
    category("Privacy")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

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

// Runs when the app comes back from the background. After a while away, Quora closes open
// answers and reloads the feed from here.
internal object AppRefreshOnResumeFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/components/activities/AppRefreshHelper\$Companion;",
    name = "onResume",
    returnType = "V",
)

@Suppress("unused")
val keepPlaceOnReturnPatch = bytecodePatch(
    name = "Keep place on return",
    description = "Keeps open answers and your place in the feed when you come back to the app, " +
            "instead of closing them and reloading the feed.",
    default = false
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        registerSetting("keepPlaceOnReturn", "Keep place on return")
        AppRefreshOnResumeFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { }, $EXTENSION_CLASS->keepPlaceOnReturn()Z
                move-result v0
                if-eqz v0, :refresh
                return-void
                :refresh
                nop
            """
        )
    }
}

// Whether Quora follows the device theme. A new install has no stored value, so this
// returns false while the bars still follow the device: dark bars around light pages.
internal object UseDeviceThemeFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/util/QThemeUtil;",
    name = "getUseDeviceTheme",
    returnType = "Z",
    parameters = listOf(),
    filters = listOf(
        methodCall(definingClass = "Lcom/quora/android/model/QKeyValueStore;", name = "getBoolean"),
    )
)

@Suppress("unused")
val fixDeviceThemePatch = bytecodePatch(
    name = "Fix device theme",
    description = "On a new install, follows the device's dark or light theme everywhere. " +
            "Without it, Quora shows dark bars around light pages until you pick a theme again.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        UseDeviceThemeFingerprint.let {
            it.method.apply {
                val index = it.instructionMatches.first().index + 1
                val moveResult = getInstruction(index)
                if (moveResult.opcode != Opcode.MOVE_RESULT_OBJECT) throw PatchException("No stored theme result")
                val register = (moveResult as OneRegisterInstruction).registerA
                addInstructions(
                    index + 1,
                    """
                        invoke-static { v$register }, $EXTENSION_CLASS->useDeviceThemeOrDefault(Ljava/lang/Boolean;)Ljava/lang/Boolean;
                        move-result-object v$register
                    """
                )
            }
        }
    }
}
