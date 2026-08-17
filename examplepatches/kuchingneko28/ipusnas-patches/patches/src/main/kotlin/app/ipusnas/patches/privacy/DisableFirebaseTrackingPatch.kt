package app.ipusnas.patches.privacy

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.patch.ResourcePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.ipusnas.patches.shared.Constants.COMPATIBILITY_IPUSNAS

/**
 * Disables Google Firebase Analytics collection and removes the Firebase
 * Cloud Messaging (push notification) components from the app.
 *
 * The manifest changes mirror what the original smali pipeline did:
 *  - add `firebase_analytics_collection_deactivated=true`
 *  - add `google_analytics_adid_collection_enabled=false`
 *  - remove FCM receivers/services and Google Analytics measurement components
 */
private val disableFirebaseManifestPatch = resourcePatch {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        val manifest = get("AndroidManifest.xml")
        val content = manifest.readText()

        // Self-closing measurement components.
        var patched = content.replace(
            Regex(
                """<receiver[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementReceiver"[^>]*/>"""
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """<service[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementService"[^>]*/>"""
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """<service[^>]*android:name="com\.google\.android\.gms\.measurement\.AppMeasurementJobService"[^>]*/>"""
            ),
            ""
        )

        // Multi-line FCM components (service / receiver with intent-filter children).
        patched = patched.replace(
            Regex(
                """\s*<service[^>]*android:name="mam\.reader\.ilibrary\.fcm\.MyFirebaseMessagingService"[^>]*>.*?</service>""",
                RegexOption.DOT_MATCHES_ALL
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """\s*<service[^>]*android:name="com\.google\.firebase\.messaging\.FirebaseMessagingService"[^>]*>.*?</service>""",
                RegexOption.DOT_MATCHES_ALL
            ),
            ""
        )
        patched = patched.replace(
            Regex(
                """\s*<receiver[^>]*android:name="com\.google\.firebase\.iid\.FirebaseInstanceIdReceiver"[^>]*>.*?</receiver>""",
                RegexOption.DOT_MATCHES_ALL
            ),
            ""
        )

        // FCM default notification channel meta-data can stay; it is inert.
        manifest.writeText(patched)

        // Add analytics deactivation meta-data to the <application> element.
        document("AndroidManifest.xml").use { document ->
            val application = document.getElementsByTagName("application").item(0)
            fun addMetaData(name: String, value: String) {
                val meta = document.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
            addMetaData("firebase_analytics_collection_deactivated", "true")
            addMetaData("google_analytics_adid_collection_enabled", "false")
        }
    }
}

/**
 * The app registers the FCM token in LandingPageAct.B() right after creating
 * notification channels. With the FCM service removed from the manifest the
 * token registration is pointless and can throw, so short-circuit the method
 * after the notification channels are created.
 *
 * We keep the channel creation (users still want local notifications) and only
 * skip the `FirebaseMessaging` token block by returning before it is reached.
 */
private val neuterLandingPageFcmPatch = bytecodePatch {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    execute {
        LandingPageFcmTokenFingerprint.method.addInstruction(0, "return-void")
    }
}

@Suppress("unused")
val disableFirebaseTrackingPatch = bytecodePatch(
    name = "Disable Firebase Analytics and FCM",
    description = "Disables Google Firebase Analytics tracking and removes Firebase Cloud Messaging push notifications.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_IPUSNAS)

    dependsOn(
        disableFirebaseManifestPatch,
        neuterLandingPageFcmPatch,
    )

    execute { }
}
