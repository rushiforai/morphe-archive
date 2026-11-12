package mightymich.morphe.patches.com.spaceship.screen.textcopy

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Bypass Google Play install / PairIP license gate on Screen Translate.
 *
 * Issue #49: after re-signing, the app shows Play overlay
 * "Get this app from Play / To continue using Instant Translate On Screen…".
 * Driven by com.pairip.licensecheck.LicenseClient (local installer check + license).
 * Soft-success if PairIP methods are missing.
 */
@Suppress("unused")
val bypassPlayInstallGatePatch = bytecodePatch(
    name = "Bypass Play install gate",
    description = "Skips PairIP / Play installer checks that block sideloaded Screen Translate " +
        "builds with the \"Get this app from Play\" dialog.",
    default = true,
) {
    compatibleWith(ScreenTranslateCompatibility.SCREEN_TRANSLATE)

    execute {
        var hits = 0
        val client = "Lcom/pairip/licensecheck/LicenseClient;"

        for (name in listOf(
            "performLocalInstallerCheck",
            "initializeLicenseCheck",
            "checkLicenseInternal",
            "verifyLicense",
            "connectToLicensingService",
            "startPaywallActivity",
            "handleError",
            "showErrorDialog",
        )) {
            try {
                val m = Fingerprint(definingClass = client, name = name).method
                when (m.returnType) {
                    "Z" -> m.addInstructions(
                        0,
                        """
                            const/4 v0, 0x1
                            return v0
                        """,
                    )
                    else -> m.addInstructions(0, "return-void")
                }
                hits++
            } catch (_: Exception) {
            }
        }

        // Force licensed response code before processResponse body runs
        try {
            Fingerprint(definingClass = client, name = "processResponse")
                .method.addInstructions(0, "const/4 p1, 0x0")
            hits++
        } catch (_: Exception) {
        }

        try {
            val m = Fingerprint(
                definingClass = "Lcom/pairip/licensecheck/ResponseValidator;",
                name = "validateResponse",
            ).method
            if (m.returnType == "Z") {
                m.addInstructions(
                    0,
                    """
                        const/4 v0, 0x1
                        return v0
                    """,
                )
            } else {
                m.addInstructions(0, "return-void")
            }
            hits++
        } catch (_: Exception) {
        }

        // Close LicenseActivity immediately if shown
        try {
            for (def in classDefByStrings("LicenseActivity")) {
                if (def.type != "Lcom/pairip/licensecheck/LicenseActivity;") continue
                val clazz = mutableClassDefBy(def)
                for (method in clazz.methods) {
                    if (method.name != "onCreate") continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    try {
                        method.addInstructions(
                            0,
                            """
                                invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                                return-void
                            """,
                        )
                        hits++
                    } catch (_: Exception) {
                    }
                }
            }
        } catch (_: Exception) {
        }

        // Soft-success when PairIP is absent on older builds
    }
}
