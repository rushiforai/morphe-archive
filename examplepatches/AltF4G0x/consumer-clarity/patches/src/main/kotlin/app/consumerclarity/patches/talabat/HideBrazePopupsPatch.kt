package app.consumerclarity.patches.talabat

@Suppress("unused")
val hideBrazePopupsPatch = consumerBytecodePatch(
    name = "Hide Braze in-app popups",
    description = "Prevents Braze promotional in-app messages from being queued or displayed. Functional app " +
        "dialogs and push notifications are unchanged.",
    category = "Promotions",
    key = "hide_braze_popups",
    default = true,
) {

    execute {
        mutableClassDefBy("Lcom/braze/ui/inappmessage/BrazeInAppMessageManager;").methods.apply {
            single { it.name == "registerInAppMessageManager" }.skipWhen("hideBrazePopups")
            single { it.name == "addInAppMessage" }.skipWhen("hideBrazePopups")
        }
    }
}
