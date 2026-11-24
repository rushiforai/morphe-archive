package app.jofslash.patches.kaloricketabulky.messages

import app.jofslash.patches.kaloricketabulky.shared.Constants.COMPATIBILITY_KALORICKE_TABULKY
import app.jofslash.patches.kaloricketabulky.shared.editManifest
import app.jofslash.patches.kaloricketabulky.shared.removeNamed
import app.morphe.patcher.patch.resourcePatch

private const val REGISTRAR = "com.google.firebase.components:com.google.firebase.inappmessaging"

/** Firebase In-App Messaging and its display, each also with a Kotlin (ktx) registrar. */
private val IN_APP_MESSAGING_REGISTRARS = setOf(
    "$REGISTRAR.FirebaseInAppMessagingRegistrar",
    "$REGISTRAR.FirebaseInAppMessagingKtxRegistrar",
    "$REGISTRAR.display.FirebaseInAppMessagingDisplayRegistrar",
    "$REGISTRAR.display.FirebaseInAppMessagingDisplayKtxRegistrar",
)

@Suppress("unused")
val disableInAppMessagesPatch = resourcePatch(
    name = "Disable in-app messages",
    description = "Stops the pop-ups and banners that Kalorické Tabulky sends to the app as marketing campaigns " +
            "(Firebase In-App Messaging). Push notifications and the app's own messages stay.",
    default = true
) {
    category("App")
    compatibleWith(COMPATIBILITY_KALORICKE_TABULKY)

    execute {
        // Firebase starts a component only when the manifest lists its registrar. The app's own
        // code never calls In-App Messaging, so without the registrars it is simply not there: no
        // campaigns are fetched and none are shown.
        editManifest { it.removeNamed("meta-data", IN_APP_MESSAGING_REGISTRARS) }
    }
}
