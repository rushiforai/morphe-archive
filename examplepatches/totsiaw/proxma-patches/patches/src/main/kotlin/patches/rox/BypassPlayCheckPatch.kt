package patches.rox

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch

/*
 * ROX 3.0.13 is wrapped in Google's PairIP licence check (com.pairip.licensecheck, Java-only variant,
 * no VMRunner). The manifest application is com.pairip.application.Application, whose
 * attachBaseContext() calls the static LicenseClient.checkLicense(Context). On a re-signed sideload the
 * local installer check fails, PairIP starts LicenseActivity with the Play paywall ("Get this app from
 * Play") and closes the app. Until now the reporter had to add a separate installer-source patch.
 *
 * PairIP names are not obfuscated (it is injected after R8), so these fingerprints are stable:
 *   - LicenseClient.checkLicense(Context)V          -> return-void (main entry, from Application)
 *   - LicenseClient.initializeLicenseCheck()V       -> return-void (any other caller)
 *   - LicenseContentProvider.onCreate()Z            -> return true (present in dex, kept for safety)
 *   - LicenseClient.startPaywallActivity(PendingIntent)V -> return-void (last line if a path slips past)
 */

private const val LICENSE_CLIENT = "Lcom/pairip/licensecheck/LicenseClient;"
private const val LICENSE_PROVIDER = "Lcom/pairip/licensecheck/LicenseContentProvider;"
private const val PLAY_CHECK = "Lapp/proxma/rox/PlayCheck;"

internal val roxCheckLicenseFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
    custom = { m, c -> c.type == LICENSE_CLIENT && m.name == "checkLicense" },
)

internal val roxInitLicenseCheckFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf(),
    custom = { m, c -> c.type == LICENSE_CLIENT && m.name == "initializeLicenseCheck" },
)

internal val roxLicenseProviderOnCreateFingerprint = Fingerprint(
    returnType = "Z",
    parameters = listOf(),
    custom = { m, c -> c.type == LICENSE_PROVIDER && m.name == "onCreate" },
)

internal val roxStartPaywallFingerprint = Fingerprint(
    returnType = "V",
    parameters = listOf("Landroid/app/PendingIntent;"),
    custom = { m, c -> c.type == LICENSE_CLIENT && m.name == "startPaywallActivity" },
)

@Suppress("unused")
val bypassPlayCheckPatch = bytecodePatch(
    name = "Bypass Play Store check",
    description = "Stops ROX from sending a patched copy to the \"Get this app from Play\" screen and " +
        "closing, so no separate installer-source patch is needed.",
) {
    compatibleWith(COMPATIBILITY_ROX)
    extendWith("extensions/extension.mpe")

    execute {
        roxCheckLicenseFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $PLAY_CHECK->skippedAppStart()V
                return-void
            """,
        )
        roxInitLicenseCheckFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $PLAY_CHECK->skippedClient()V
                return-void
            """,
        )
        roxStartPaywallFingerprint.method.addInstructions(
            0,
            """
                invoke-static {}, $PLAY_CHECK->skippedPaywall()V
                return-void
            """,
        )
        // The provider is not declared in 3.0.13's manifest, but the class ships; patch it if found.
        roxLicenseProviderOnCreateFingerprint.methodOrNull?.addInstructions(
            0,
            """
                invoke-static {}, $PLAY_CHECK->skippedProvider()V
                const/4 v0, 0x1
                return v0
            """,
        )
    }
}
