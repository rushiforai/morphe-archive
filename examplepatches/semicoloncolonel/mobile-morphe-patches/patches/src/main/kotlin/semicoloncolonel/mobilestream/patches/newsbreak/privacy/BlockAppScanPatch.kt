package semicoloncolonel.mobilestream.patches.newsbreak.privacy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import semicoloncolonel.mobilestream.patches.newsbreak.shared.Constants

// NewsBreak 26.44.1 checks the phone for about 500 other apps, including
// sportsbooks, prediction markets, period trackers, and payment apps, and
// reports which ones are installed to its servers as an "app_install_list"
// event. The scan, the delayed start that schedules it, and the report are
// all stopped. The one-off check the app makes for Chrome, to open links,
// still works.

private const val APP_SCAN = "Lcom/particlemedia/feature/home/util/AppScanUtil;"

internal object ScanWithDelayFingerprint : Fingerprint(
    definingClass = APP_SCAN,
    name = "scanAppInstallListWithDelay",
    returnType = "V",
)

internal object ScanInstalledAppsFingerprint : Fingerprint(
    definingClass = APP_SCAN,
    name = "scanInstalledApps",
    returnType = "V",
)

internal object ReportInstalledAppsFingerprint : Fingerprint(
    definingClass = APP_SCAN,
    name = "tryReportInstalledApps",
    returnType = "V",
)

internal object ShouldScanFingerprint : Fingerprint(
    definingClass = APP_SCAN,
    name = "shouldScanInstalledAppList",
    returnType = "Z",
)

@Suppress("unused")
val blockAppScanPatch = bytecodePatch(
    name = "Block installed-app scan",
    description = "Stops the app from checking which other apps are on your phone and reporting them.",
) {
    category("Privacy")
    compatibleWith(Constants.COMPATIBILITY)

    execute {
        ScanWithDelayFingerprint.method.addInstructions(0, "return-void")
        ScanInstalledAppsFingerprint.method.addInstructions(0, "return-void")
        ReportInstalledAppsFingerprint.method.addInstructions(0, "return-void")
        ShouldScanFingerprint.method.addInstructions(0, "const/4 v0, 0x0\nreturn v0")
    }
}
