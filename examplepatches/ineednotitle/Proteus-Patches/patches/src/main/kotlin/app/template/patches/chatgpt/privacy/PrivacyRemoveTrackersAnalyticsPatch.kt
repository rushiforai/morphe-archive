package app.template.patches.chatgpt.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.CHATGPT_COMPATIBILITY
import org.w3c.dom.Element

/**
 * Tracker/analytics audit of stock ChatGPT 1.2026.293 (2629319).
 *
 * Suppresses the app's direct product-event bridges, Statsig event/exposure
 * reporting, Segment-style event dispatch, and Bitdrift's crash/session-replay
 * bootstrap. The manifest side disables Datadog RUM auto-start, removes the
 * Bitdrift startup hook and Sentry NDK preload, and removes advertising ID /
 * install-referrer access. Firebase Cloud Messaging and Firebase Installations
 * are deliberately kept so push notifications continue to work.
 *
 * This cannot stop OpenAI's server-side logging, or telemetry that is part of
 * a required service request (for example, feature/config fetches). INTERNET
 * and core app APIs stay enabled; removing those would break ChatGPT itself.
 */
private val removeTrackerManifestPatch = resourcePatch {
    compatibleWith(CHATGPT_COMPATIBILITY)

    execute {
        document("AndroidManifest.xml").use { document ->
            val manifest = document.documentElement
            val permissionsToRemove = setOf(
                "com.google.android.gms.permission.AD_ID",
                "com.google.android.finsky.permission.BIND_GET_INSTALL_REFERRER_SERVICE",
                "android.permission.ACCESS_ADSERVICES_AD_ID",
                "android.permission.ACCESS_ADSERVICES_ATTRIBUTION",
                "android.permission.ACCESS_ADSERVICES_TOPICS",
                "android.permission.AD_SERVICES_CONFIG",
            )

            listOf("uses-permission", "uses-permission-sdk-23").forEach { tag ->
                val nodes = document.getElementsByTagName(tag)
                for (index in nodes.length - 1 downTo 0) {
                    val node = nodes.item(index) as Element
                    val name = node.getAttribute("android:name")
                    if (name in permissionsToRemove || name.startsWith("android.permission.ACCESS_ADSERVICES_")) {
                        manifest.removeChild(node)
                    }
                }
            }

            val providersToRemove = setOf(
                "com.datadog.android.rum.DdRumContentProvider",
                "io.sentry.ndk.SentryNdkPreloadProvider",
            )
            val providers = document.getElementsByTagName("provider")
            for (index in providers.length - 1 downTo 0) {
                val node = providers.item(index) as Element
                if (node.getAttribute("android:name") in providersToRemove) {
                    node.parentNode.removeChild(node)
                }
            }

            // Bitdrift is registered through AndroidX Startup. Remove only its
            // initializer metadata; keep EmojiCompat, lifecycle, OkHttp and the
            // ProfileInstaller initializers intact.
            val metadata = document.getElementsByTagName("meta-data")
            for (index in metadata.length - 1 downTo 0) {
                val node = metadata.item(index) as Element
                val name = node.getAttribute("android:name")
                if (name == "io.bitdrift.capture.ContextHolder" ||
                    name == "io.sentry.gradle-plugin-integrations"
                ) {
                    node.parentNode.removeChild(node)
                }
            }
        }
    }
}

private fun voidMethod(className: String, name: String, vararg parameters: String) = Fingerprint(
    definingClass = className,
    name = name,
    returnType = "V",
    parameters = parameters.toList(),
)

private fun objectMethod(className: String, name: String, vararg parameters: String) = Fingerprint(
    definingClass = className,
    name = name,
    returnType = "Ljava/lang/Object;",
    parameters = parameters.toList(),
)

@Suppress("unused")
val privacyRemoveTrackersAnalyticsPatch = bytecodePatch(
    name = "Privacy: block trackers & analytics",
    description = "Suppresses ChatGPT product analytics, Statsig events/exposures, Segment event " +
        "dispatch and Bitdrift crash/session-replay startup; disables Datadog RUM and removes ad-ID/" +
        "install-referrer access. Chat, login, files and push notifications are preserved. " +
        "Core service requests and server-side logging cannot be disabled by an APK patch.",
    default = true,
) {
    compatibleWith(CHATGPT_COMPATIBILITY)
    dependsOn(removeTrackerManifestPatch)

    execute {
        // OpenAI's direct product analytics service and the Valdi bridge feeding it.
        listOf(
            voidMethod("Lzf00;", "track", "Lcom/openai/valdi/oai/platform/OAIAnalyticsEvent;"),
            voidMethod("Lsuf0;", "track", "Lcom/openai/valdi/oai/platform/OAIAnalyticsEvent;"),
            voidMethod("Luuf0;", "track", "Lcom/openai/valdi/oai/platform/OAIAnalyticsEvent;"),
        ).forEach { it.method.addInstructions(0, "return-void") }

        // Statsig event service and Segment-compatible product-event dispatcher.
        listOf(
            voidMethod("Lspw0;", "b", "Lxcc0;"),
            voidMethod("Lspw0;", "k", "Lgs1;", "Ljava/util/Map;"),
            voidMethod("Lspw0;", "m", "Lxcc0;", "Lks1;"),
            voidMethod("Lvgs0;", "b", "Lxcc0;"),
            voidMethod("Lvgs0;", "k", "Lgs1;", "Ljava/util/Map;"),
            voidMethod("Lvgs0;", "q", "Lgs1;", "Ljava/util/Map;", "Lks1;"),
            voidMethod("Lvgs0;", "r", "Lxcc0;", "Lks1;"),
            voidMethod("Lvgs0;", "s", "Lxcc0;", "Lys1;", "Lerw0;", "Lks1;"),
        ).forEach { it.method.addInstructions(0, "return-void") }

        // Statsig's two concrete logging backends. Keep gate/config evaluation,
        // but no-op event ingestion, gate exposures, and log transport callbacks.
        val statsigEventParameters = listOf(
            "Lnea0;", "Ltwp;",
        )
        objectMethod("Libs;", "a", *statsigEventParameters.toTypedArray()).method.addInstructions(
            0,
            "sget-object p0, La011;->a:La011;\nreturn-object p0",
        )
        objectMethod("Lsqw0;", "a", *statsigEventParameters.toTypedArray()).method.addInstructions(
            0,
            "sget-object p0, La011;->a:La011;\nreturn-object p0",
        )

        listOf("Libs;", "Lsqw0;").forEach { className ->
            listOf(
                voidMethod(className, "b", "Ljava/lang/String;"),
                voidMethod(className, "d", "Ljava/lang/String;", "Liox;", "Lusw0;"),
                voidMethod(className, "g", "Ljwp;"),
                voidMethod(className, "h", "Ljava/lang/String;", "Lpuz;", "Lusw0;", "Z"),
                voidMethod(
                    className,
                    "i",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "[Ljava/util/Map;",
                    "Lusw0;",
                    "Ljava/lang/String;",
                    "Ljava/lang/String;",
                    "Z",
                    "Lxyy;",
                    "Z",
                    "Ljava/lang/Integer;",
                ),
            ).forEach { it.method.addInstructions(0, "return-void") }
        }

        // Bitdrift's app bootstrap is the sole createLogger() entrypoint in this
        // target. Its global logger is initialized to the SDK's no-op instance;
        // skip native logger/session/replay initialization entirely.
        voidMethod(
            "Llde;",
            "a",
            "Ljava/lang/String;",
            "Lio/bitdrift/capture/providers/session/SessionStrategy${'$'}Configuration;",
            "Lnlo;",
            "Lkx30;",
            "Ltnm0;",
        ).method.addInstructions(0, "return-void")
    }
}
