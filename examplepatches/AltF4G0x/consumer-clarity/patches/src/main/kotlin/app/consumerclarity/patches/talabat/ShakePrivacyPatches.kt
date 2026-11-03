package app.consumerclarity.patches.talabat

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

private const val SHAKE = "Lcom/shakebugs/shake/Shake;"

private fun shakeBuildVoidControl(name: String, description: String, vararg methods: String) =
    consumerBuildBytecodePatch(name, description, "Diagnostics") {
        execute {
            mutableClassDefBy(SHAKE).methods.forEach { method ->
                if (method.name in methods) method.addInstructions(0, "return-void")
            }
        }
    }

private fun shakeVoidControl(name: String, description: String, vararg methods: String) =
    consumerBytecodePatch(name, description, "Diagnostics") {
        execute {
            mutableClassDefBy(SHAKE).methods.forEach { method ->
                if (method.name in methods) method.skipWhenKey(name)
            }
        }
    }

private fun shakeFalseControl(name: String, description: String, vararg methods: String) =
    consumerBytecodePatch(name, description, "Diagnostics") {
        execute {
            mutableClassDefBy(SHAKE).methods.forEach { method ->
                if (method.name in methods) method.returnFalseWhenKey(name)
            }
        }
    }

@Suppress("unused")
val disableShakeCrashReportsPatch = shakeVoidControl(
    "Disable Shake Bugs crash reports",
    "Suppresses Shake Bugs error handling, silent reports, and crash-report enablement.",
    "handleError",
    "silentReport",
)

@Suppress("unused")
val disableShakeNetworkInspectionPatch = shakeVoidControl(
    "Disable Shake Bugs network inspection",
    "Prevents Shake Bugs from recording network requests and responses.",
    "handleNetworkRequest",
    "insertNetworkRequest",
)

@Suppress("unused")
val disableShakeActivityHistoryPatch = shakeBuildVoidControl(
    "Disable Shake Bugs activity history",
    "Prevents Shake Bugs from recording lifecycle and touch activity.",
    "emitLifecycleEvents",
    "handleTouchEvent",
)

@Suppress("unused")
val hideShakeReportUiPatch = shakeVoidControl(
    "Hide Shake Bugs report UI",
    "Prevents Shake Bugs from opening its feedback and bug-report interface.",
    "show",
)

@Suppress("unused")
val hideShakeChatNotificationsPatch = shakeVoidControl(
    "Hide Shake Bugs chat notifications",
    "Prevents Shake Bugs from displaying support-chat notifications.",
    "showChatNotification",
)

@Suppress("unused")
val disableShakeIdentityPatch = shakeBuildVoidControl(
    "Disable Shake Bugs identity tracking",
    "Prevents Shake Bugs from receiving user IDs, metadata, and push tokens.",
    "registerUser",
    "updateUserId",
    "setMetadata",
    "updateUserMetadata",
    "setPushNotificationsToken",
)

@Suppress("unused")
val disableShakeConsoleLogsPatch = shakeVoidControl(
    "Disable Shake Bugs console logs",
    "Prevents application log messages from being added to Shake Bugs reports.",
    "log",
)

@Suppress("unused")
val disableShakeInitializationPatch = shakeBuildVoidControl(
    "Disable Shake Bugs initialization",
    "Prevents Shake Bugs from starting. Other Shake Bugs switches are unnecessary when this is selected.",
    "start",
    "startFromWrapper",
)

@Suppress("unused")
val hideShakeIntroPatch = shakeFalseControl(
    "Hide Shake Bugs introduction",
    "Suppresses Shake Bugs' introductory message.",
    "getShowIntroMessage",
)

@Suppress("unused")
val disableShakeNotificationEventsPatch = shakeVoidControl(
    "Disable Shake Bugs notification history",
    "Prevents Shake Bugs from recording notification events.",
    "insertNotificationEvent",
)

@Suppress("unused")
val disableShakeFeedbackPatch = shakeFalseControl(
    "Disable Shake Bugs user feedback",
    "Disables Shake Bugs' user-feedback collection.",
    "isUserFeedbackEnabled",
)
