package app.jofslash.patches.quora.messages

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.jofslash.patches.quora.shared.registerSetting
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/NativeTweaksPatch;"

// Every message Quora's pages send to the app goes through here.
internal object HandleMessageFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/QMessageBroadcaster;",
    name = "handle",
    returnType = "V",
    parameters = listOf(
        "Lcom/quora/android/messages/MessageDict;",
        "Lorg/json/JSONObject;",
        "Lcom/quora/android/fragments/qwvf/QWebViewController;",
    ),
)

/**
 * A patch that drops the named page messages (MessageDict names) before the app handles them.
 */
private fun blockWebMessagesPatch(
    name: String,
    description: String,
    default: Boolean,
    messages: List<String>,
    // Lists the patch in Patch settings under this key. Privacy patches have none and stay on.
    settingKey: String? = null,
) =
    bytecodePatch(
        name = name,
        description = description,
        default = default
    ) {
        compatibleWith(COMPATIBILITY_QUORA)

        extendWith("extensions/extension.mpe")

        execute {
            if (settingKey != null) registerSetting(settingKey, name)
            val check = if (settingKey == null) {
                "invoke-static { p1, v0 }, $EXTENSION_CLASS->isMessage(Ljava/lang/Object;Ljava/lang/String;)Z"
            } else {
                "const-string v1, \"$settingKey\"\n" +
                        "invoke-static { p1, v0, v1 }, $EXTENSION_CLASS->isBlockedMessage(Ljava/lang/Object;Ljava/lang/String;Ljava/lang/String;)Z"
            }
            // p1 is the message.
            messages.forEachIndexed { i, message ->
                HandleMessageFingerprint.method.addInstructionsWithLabels(
                    0,
                    """
                        const-string v0, "$message"
                        $check
                        move-result v0
                        if-eqz v0, :handle_$i
                        return-void
                        :handle_$i
                        nop
                    """
                )
            }
        }
    }

@Suppress("unused")
val blockTrackingLogsPatch = blockWebMessagesPatch(
    name = "Block tracking logs",
    description = "Stops Quora's pages from passing performance and sign-up tracking events to the app.",
    default = true,
    messages = listOf("LOG_PERF_EVENT", "LOG_SIGNUP_FOR_TRACKING"),
)

@Suppress("unused")
val disableVibrationPatch = blockWebMessagesPatch(
    name = "Disable vibration",
    description = "Stops the app from vibrating when you tap buttons such as upvote.",
    default = false,
    messages = listOf("HAPTIC_VIBRATION"),
    settingKey = "disableVibration",
)

@Suppress("unused")
val hideBadgesPatch = blockWebMessagesPatch(
    name = "Hide badges",
    description = "Hides the red dots and counts on the bottom bar tabs.",
    default = false,
    messages = listOf("UPDATE_BADGE_PROPERTIES", "UPDATE_HOME_TAB_BADGE"),
    settingKey = "hideBadges",
)

@Suppress("unused")
val disableSignInPromptsPatch = blockWebMessagesPatch(
    name = "Disable sign-in prompts",
    description = "Stops Google's \"Save password?\" and automatic Google sign-in prompts. " +
            "You can still sign in with the buttons on the login page.",
    default = false,
    messages = listOf("SAVE_CREDENTIALS", "AUTO_LOGIN_WITH_GOOGLE_ACCOUNT"),
    settingKey = "disableSignInPrompts",
)

@Suppress("unused")
val disableTabPrefetchingPatch = blockWebMessagesPatch(
    name = "Disable tab prefetching",
    description = "Saves data by loading the other tabs only when you open them.",
    default = false,
    messages = listOf("PREFETCH_TABS"),
    settingKey = "disableTabPrefetching",
)
