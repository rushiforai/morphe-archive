package app.ru_apps.sberbank

import app.morphe.patcher.patch.resourcePatch
import app.shared.*
import org.w3c.dom.Element

/**
 * Sberbank bundles Kaspersky Lab's KAV SDK (`com.kavsdk.*`, confirmed present as
 * `smali_classes9/kavsdk/` — 1043 classes — in the 17.13.0 decompile) wired up via its
 * own `ru.sberbank.mobile.feature.kavsdk.*` integration layer. Manifest-declared
 * components (verified in AndroidManifest.xml):
 *   - com.kavsdk.SdkService / com.kavsdk.JobSchedulerService — background scan service.
 *   - com.kavsdk.StartReceiver / com.kavsdk.AlarmReceiver / com.kavsdk.AppInstallationReceiver
 *     — boot/alarm/package-install triggers that (re)start scanning.
 *   - ru.sberbank.mobile.feature.kavsdk.receiver.OnBootReceiver — app-side boot trigger.
 *   - ru.sberbank.mobile.feature.kavsdk.presentation.* / AntivirusActivity /
 *     AntivirusMainActivity — the in-app "Антивирус" menu UI itself.
 * Disabling all of these removes the background-scan triggers; the UI entries are
 * disabled alongside them so the app doesn't offer a menu item that no longer does
 * anything, matching this repo's existing DisableMyTrackerPatch convention (manifest
 * component disabling, not bytecode stubbing).
 */
@Suppress("unused")
val disableKasperskySdkPatch = resourcePatch(
    name = "Disable Kaspersky SDK",
    description = "Disables Sberbank's bundled Kaspersky KAV SDK (background antivirus scanning) manifest entry points.",
    default = false,
) {
    execute {
        document("AndroidManifest.xml").use { document ->
            val application = document.documentElement.childrenNamed("application").single() as Element

            val disabledComponents = application.disableComponentsWhere { name ->
                name.startsWith("com.kavsdk.") ||
                    name.startsWith("ru.sberbank.mobile.feature.kavsdk.")
            }

            println("Disable Kaspersky SDK: disabled $disabledComponents manifest components.")
        }
    }
}
