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
    patchCategory: String,
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
        category(patchCategory)
        compatibleWith(COMPATIBILITY_QUORA)

        extendWith("extensions/quora.mpe")

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
    patchCategory = "Privacy",
    description = "Stops Quora's pages from passing performance and sign-up tracking events to the app.",
    default = true,
    messages = listOf("LOG_PERF_EVENT", "LOG_SIGNUP_FOR_TRACKING"),
)

@Suppress("unused")
val disableVibrationPatch = blockWebMessagesPatch(
    name = "Disable vibration",
    patchCategory = "App",
    description = "Stops the app from vibrating when you tap buttons such as upvote.",
    default = false,
    messages = listOf("HAPTIC_VIBRATION"),
    settingKey = "disableVibration",
)

@Suppress("unused")
val hideBadgesPatch = blockWebMessagesPatch(
    name = "Hide badges",
    patchCategory = "App",
    description = "Hides the red dots and counts on the bottom bar tabs.",
    default = false,
    messages = listOf("UPDATE_BADGE_PROPERTIES", "UPDATE_HOME_TAB_BADGE"),
    settingKey = "hideBadges",
)

@Suppress("unused")
val disableSignInPromptsPatch = blockWebMessagesPatch(
    name = "Disable sign-in prompts",
    patchCategory = "App",
    description = "Stops Google's \"Save password?\" and automatic Google sign-in prompts. " +
            "You can still sign in with the buttons on the login page.",
    default = true,
    messages = listOf("SAVE_CREDENTIALS", "AUTO_LOGIN_WITH_GOOGLE_ACCOUNT"),
    settingKey = "disableSignInPrompts",
)

@Suppress("unused")
val disableTabPrefetchingPatch = blockWebMessagesPatch(
    name = "Disable tab prefetching",
    patchCategory = "App",
    description = "Saves data by loading the other tabs only when you open them.",
    default = false,
    messages = listOf("PREFETCH_TABS"),
    settingKey = "disableTabPrefetching",
)

private const val WEB_VIEW_CONTROLLER = "Lcom/quora/android/fragments/qwvf/QWebViewController;"
private const val SETTINGS_CLASS = "Lapp/jofslash/extension/quora/PatchSettings;"

// The page shows the button with the updateNewStoriesButton message. The controller handles that
// message itself, so it never reaches QMessageBroadcaster.handle.
internal object UpdateNewStoriesButtonFingerprint : Fingerprint(
    definingClass = WEB_VIEW_CONTROLLER,
    name = "updateNewStoriesButton",
    returnType = "V",
    parameters = listOf("Lcom/quora/android/util/QJSONObject;"),
)

// The app shows the button itself when you come back after a while.
internal object NewStoriesButtonVisibilityFingerprint : Fingerprint(
    definingClass = WEB_VIEW_CONTROLLER,
    name = "updateNewStoriesButtonVisibility",
    returnType = "V",
    parameters = listOf("Z"),
)

@Suppress("unused")
val hideMoreStoriesPatch = bytecodePatch(
    name = "Hide More Stories button",
    description = "Hides the red \"More Stories\" button that appears over the feed. " +
            "Pull down to load new stories.",
    default = true
) {
    category("Feed")
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/quora.mpe")

    execute {
        registerSetting("hideMoreStories", "Hide More Stories button")
        // v0 is free at the start of both methods. p1 is the message; only "visible": true is dropped,
        // so the page can still hide a button that showed before the setting was switched on.
        UpdateNewStoriesButtonFingerprint.method.addInstructionsWithLabels(
            0,
            """
                const-string v0, "hideMoreStories"
                invoke-static { v0 }, $SETTINGS_CLASS->on(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :show
                const-string v0, "visible"
                invoke-virtual { p1, v0 }, Lorg/json/JSONObject;->optBoolean(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :show
                return-void
                :show
                nop
            """
        )
        // p1 is whether to show it; hiding it still goes through.
        NewStoriesButtonVisibilityFingerprint.method.addInstructionsWithLabels(
            0,
            """
                const-string v0, "hideMoreStories"
                invoke-static { v0 }, $SETTINGS_CLASS->on(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :keep
                const/4 p1, 0x0
                :keep
                nop
            """
        )
    }
}
