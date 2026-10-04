package app.template.patches.sofascore.misc.facebook

import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.COMPATIBILITY_SOFASCORE
import app.morphe.util.returnEarly
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
 */
private val disableFacebookTelemetryResourcePatch = resourcePatch(
    name = "Disable Facebook telemetry",
    description = "Disables Facebook auto-logged events and advertiser ID collection.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_SOFASCORE)

    execute {
        document("AndroidManifest.xml").use { doc ->
            val applications = doc.getElementsByTagName("application")
            if (applications.length == 0) return@execute
            val application = applications.item(0) as Element

            val existing = buildSet {
                val metas = application.getElementsByTagName("meta-data")
                for (i in 0 until metas.length) {
                    val name = (metas.item(i) as? Element)?.getAttribute("android:name")
                    if (!name.isNullOrEmpty()) add(name)
                }
            }

            for ((name, value) in mapOf(
                "com.facebook.sdk.AutoLogAppEventsEnabled" to "false",
                "com.facebook.sdk.AdvertiserIDCollectionEnabled" to "false",
            )) {
                if (name in existing) continue
                val meta = doc.createElement("meta-data")
                meta.setAttribute("android:name", name)
                meta.setAttribute("android:value", value)
                application.appendChild(meta)
            }
        }
    }
}

@Suppress("unused")
val disableFacebookSdkPatch = bytecodePatch(
    name = "Disable Facebook SDK",
    description = "Blocks Facebook Audience Network ads and disables Facebook " +
        "event tracking while keeping Facebook Login working."
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
