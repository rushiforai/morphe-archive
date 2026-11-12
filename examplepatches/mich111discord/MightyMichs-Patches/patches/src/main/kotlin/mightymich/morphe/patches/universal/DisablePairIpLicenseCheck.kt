package mightymich.morphe.patches.universal

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags

/**
 * Universal PairIP / Play-install license gate bypass.
 * Neutralizes com.pairip.licensecheck.LicenseClient local installer check and
 * related paywall entry points that show "Get this app from Play" on sideloaded builds.
 */
@Suppress("unused")
val disablePairIpLicenseCheckPatch = bytecodePatch(
    name = "Disable PairIP license check",
    description = "Bypasses PairIP LicenseClient installer/license checks that block " +
        "sideloaded or re-signed apps with a Play Store paywall dialog.",
    default = false,
) {
    execute {
        var hits = 0
        val client = "Lcom/pairip/licensecheck/LicenseClient;"

        for (name in listOf(
            "performLocalInstallerCheck",
            "initializeLicenseCheck",
            "checkLicenseInternal",
            "verifyLicense",
            "startPaywallActivity",
            "handleError",
        )) {
            try {
                val m = Fingerprint(definingClass = client, name = name).method
                when (m.returnType) {
                    "Z" -> m.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
                    else -> m.addInstructions(0, "return-void")
                }
                hits++
            } catch (_: Exception) {
            }
        }

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
                m.addInstructions(0, "const/4 v0, 0x1\nreturn v0")
            } else {
                m.addInstructions(0, "return-void")
            }
            hits++
        } catch (_: Exception) {
        }

        try {
            for (def in classDefByStrings("LicenseActivity")) {
                if (def.type != "Lcom/pairip/licensecheck/LicenseActivity;") continue
                val clazz = mutableClassDefBy(def)
                for (method in clazz.methods) {
                    if (method.name != "onCreate") continue
                    if (AccessFlags.ABSTRACT.isSet(method.accessFlags)) continue
                    method.addInstructions(
                        0,
                        """
                            invoke-virtual {p0}, Landroid/app/Activity;->finish()V
                            return-void
                        """,
                    )
                    hits++
                }
            }
        } catch (_: Exception) {
        }

        // Soft-success when PairIP is absent
    }
}
