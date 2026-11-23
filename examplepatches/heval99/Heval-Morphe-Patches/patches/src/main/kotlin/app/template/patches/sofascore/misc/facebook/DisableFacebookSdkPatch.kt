package app.template.patches.sofascore.misc.facebook

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.patcher.util.returnEarly
import org.w3c.dom.Element

/**
 * Disables Facebook telemetry while keeping the SDK initialized so Facebook
 * Login keeps working.
 *
 * Do NOT kill FacebookInitProvider.onCreate(): Sofascore builds its sign-in UI
 * by constructing Facebook Login handlers, which throw "The SDK has not been
 * initialized" when the provider is neutered - that crashed the login screen
 * (issue #24). The provider only runs `FacebookSdk.sdkInitialize()`, so it is
 * left intact; tracking is switched off through manifest flags instead.
 *
 * Unnamed helper (like the other helper resource patches in this repo), so it is
 * not a selectable patch of its own.
 */
private val disableFacebookTelemetryResourcePatch = resourcePatch {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) {
                throw PatchException("Disable Facebook SDK: AndroidManifest.xml has no <application>")
            }
            val application = applications.item(0) as Element

            for ((name, value) in mapOf(
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            )) {
                // An existing entry is overwritten, so a stock "true" cannot survive.
                var meta: Element? = null
                val children = application.childNodes
                for (i in 0 until children.length) {
                    val child = children.item(i) as? Element ?: continue
                    if (child.tagName == "meta-data" && child.getAttribute("android:name") == name) {
                        meta = child
                        break
                    }
                }
                if (meta == null) {
                    meta = doc.createElement("meta-data")
                    meta.setAttribute("android:name", name)
                    application.appendChild(meta)
                }
                meta.setAttribute("android:value", value)
            }
        }
    }
}

@Suppress("unused")
val disableFacebookSdkPatch = bytecodePatch(
    name = "Disable Facebook SDK",
    description = "Disables Facebook tracking."
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    dependsOn(disableFacebookTelemetryResourcePatch)

    execute {
        // Only the Audience Network (ads) init provider is neutered. The core
        // FacebookInitProvider must run: without sdkInitialize() the login
        // screen crashes (issue #24).
        AudienceNetworkContentProviderFingerprint.method.returnEarly(false)
    }
}
