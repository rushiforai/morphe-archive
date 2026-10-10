package app.template.patches.telegram.ads

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.TelegramPrivacyAppCenterLogFingerprint
import app.template.patches.telegram.TelegramPrivacyAppCenterStartFingerprint
import app.template.patches.telegram.TelegramPrivacyCrashlyticsLogFingerprint
import app.template.patches.telegram.TelegramPrivacyCrashlyticsSetCollectionFingerprint
import app.template.patches.telegram.TelegramPrivacyCrashlyticsSetCustomKeyFingerprint
import app.template.patches.telegram.TelegramPrivacyFirebaseLogEventFingerprint
import app.template.patches.telegram.TelegramPrivacyFirebaseSetCollectionFingerprint
import app.template.patches.telegram.TelegramPrivacyFirebaseSetCurrentScreenFingerprint
import app.template.patches.telegram.TelegramPrivacyFirebaseSetUserPropertyFingerprint
import org.w3c.dom.Element

/**
 * Unified privacy patch for Telegram 12.10.6, Telegram Web 12.10.6 and Plus Messenger
 * 12.10.6.0. It disables Firebase Analytics collection/event forwarding and Crashlytics
 * collection/log APIs where those SDKs exist. Telegram/Web's App Center logging/start
 * methods are already no-op stubs in the audited APKs; they are kept as defensive hooks.
 *
 * It deliberately does not alter Telegram's local StatsController (traffic counters),
 * push registration, Firebase Installations, Google sign-in, or Telegram protocol traffic.
 * Those are not equivalent to analytics and changing them could break normal operation.
 *
 * Default is false until the user completes on-device regression tests.
 */
private val telegramPrivacyManifestPatch = resourcePatch(
    name = "Privacy telemetry manifest settings",
    description = "Disables Firebase Analytics and Crashlytics collection through application metadata.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val applications = document.getElementsByTagName("application")
            require(applications.length > 0) {
                "AndroidManifest.xml has no application element; cannot apply privacy metadata"
            }
            val application = applications.item(0) as Element

            fun setMetadata(name: String, value: String) {
                val children = application.childNodes
                var existing: Element? = null
                for (index in 0 until children.length) {
                    val element = children.item(index) as? Element ?: continue
                    if (element.tagName == "meta-data" && element.getAttribute("android:name") == name) {
                        existing = element
                        break
                    }
                }

                val element = existing ?: document.createElement("meta-data").also {
                    application.appendChild(it)
                }
                element.setAttribute("android:name", name)
                element.setAttribute("android:value", value)
            }

            // Analytics: disabled and deactivated so application code cannot re-enable it.
            setMetadata("firebase_analytics_collection_enabled", "false")
            setMetadata("firebase_analytics_collection_deactivated", "true")
            setMetadata("google_analytics_adid_collection_enabled", "false")

            // Crashlytics: disables collection by default. The bytecode hook below also
            // forces explicit set-enabled calls to false. Do not remove the registrar:
            // Firebase component initialization is shared with other Firebase services.
            setMetadata("firebase_crashlytics_collection_enabled", "false")
        }
    }
}

@Suppress("unused")
val telegramDisableAnalyticsPatch = bytecodePatch(
    name = "Disable telemetry and analytics",
    description = "Disables Firebase Analytics and Crashlytics collection where bundled and blocks app telemetry logging entry points.",
    default = false,
) {
    compatibleWith(
        TELEGRAM_COMPATIBILITY,
        TELEGRAM_WEB_COMPATIBILITY,
        TELEGRAM_PLUS_COMPATIBILITY,
    )
    dependsOn(telegramPrivacyManifestPatch)

    execute {
        var patchedTargets = 0

        // Telegram and Telegram Web: these methods were inspected and are already no-op
        // stubs (return-void). Keep the hooks conditional for fork/version tolerance.
        TelegramPrivacyAppCenterLogFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }
        TelegramPrivacyAppCenterStartFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }

        // Plus: suppress direct Analytics event, user-property and screen-name forwarding.
        TelegramPrivacyFirebaseLogEventFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }
        TelegramPrivacyFirebaseSetCollectionFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "const/4 p1, 0x0")
            patchedTargets++
        }
        TelegramPrivacyFirebaseSetUserPropertyFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }
        TelegramPrivacyFirebaseSetCurrentScreenFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }

        // Plus: Crashlytics wrapper method names are obfuscated, but the exact descriptors
        // and method bodies were inspected in the supplied Plus 12.10.6.0 DEX.
        TelegramPrivacyCrashlyticsSetCollectionFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "const/4 p1, 0x0")
            patchedTargets++
        }
        TelegramPrivacyCrashlyticsSetCustomKeyFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }
        TelegramPrivacyCrashlyticsLogFingerprint.methodOrNull?.let { method ->
            method.addInstructions(0, "return-void")
            patchedTargets++
        }

        if (patchedTargets == 0) {
            error("No audited privacy target found; refusing to apply a silent no-op privacy patch")
        }
    }
}
