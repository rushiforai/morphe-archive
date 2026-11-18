package app.jofslash.patches.quora.notifications

import app.jofslash.patches.quora.shared.Constants.COMPATIBILITY_QUORA
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.string

private const val EXTENSION_CLASS = "Lapp/jofslash/extension/quora/NativeTweaksPatch;"
private const val WEB_VIEW_CONTROLLER = "Lcom/quora/android/fragments/qwvf/QWebViewController;"

// The handler Quora's pages call to ask for the notification permission.
internal object RequestNotificationPermissionFingerprint : Fingerprint(
    definingClass = "Lcom/quora/android/messages/QWebViewMessageHandler;",
    returnType = "V",
    parameters = listOf("Lorg/json/JSONObject;", WEB_VIEW_CONTROLLER),
    filters = listOf(
        string("android.permission.POST_NOTIFICATIONS"),
    )
)

@Suppress("unused")
val disableNotificationPromptPatch = bytecodePatch(
    name = "Disable notification prompt",
    description = "Stops the app from asking for permission to show notifications. " +
            "You can still turn notifications on in Android's settings.",
    default = true
) {
    compatibleWith(COMPATIBILITY_QUORA)

    extendWith("extensions/extension.mpe")

    execute {
        // p0 is the message data, p1 the WebView controller. When skipping the prompt,
        // answer the page's callback with { success: false }, as if the user declined.
        RequestNotificationPermissionFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-virtual { p1 }, $WEB_VIEW_CONTROLLER->getActivity()Landroidx/fragment/app/FragmentActivity;
                move-result-object v0
                invoke-static { v0 }, $EXTENSION_CLASS->skipNotificationPrompt(Landroid/content/Context;)Z
                move-result v0
                if-eqz v0, :prompt
                const-string v0, "callbackId"
                invoke-virtual { p0, v0 }, Lorg/json/JSONObject;->optString(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                invoke-static { }, $EXTENSION_CLASS->notificationPromptResult()Lorg/json/JSONObject;
                move-result-object v1
                invoke-virtual { p1, v0, v1 }, $WEB_VIEW_CONTROLLER->invokeJavaScriptCallback(Ljava/lang/String;Lorg/json/JSONObject;)V
                return-void
                :prompt
                nop
            """
        )
    }
}
