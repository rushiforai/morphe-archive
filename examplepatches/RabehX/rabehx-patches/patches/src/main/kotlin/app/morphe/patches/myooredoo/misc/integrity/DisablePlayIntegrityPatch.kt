/*
 * Copyright 2026 RabehX.
 * https://github.com/RabehX/rabehx-patches
 */

package app.morphe.patches.myooredoo.misc.integrity

import app.morphe.patcher.patch.mutableClassDefByOrNull
import app.morphe.patcher.patch.patch
import app.morphe.patcher.patch.retainOriginalV1Signature
import app.morphe.patcher.patch.retainOriginalV2Signature
import app.morphe.patcher.util.returnEarly
import app.morphe.patches.myooredoo.shared.Constants
import app.morphe.patches.shared.replyFlutterString

@Suppress("unused")
val disablePlayIntegrityPatch = patch(
    name = "Disable Play Integrity",
    description = "Short-circuits Google Play Integrity with \"DISABLED\", retains original " +
            "APK v1/v2 signatures, and spoofs app integrity checksum/signature checks.",
    default = true,
) {
    category("Security")
    compatibleWith(Constants.COMPATIBILITY_MYOOREDOO)

    execute {
        retainOriginalV1Signature()
        retainOriginalV2Signature()

        mutableClassDefByOrNull("Lcom/android/sec/utils/Play;")
            ?.methods?.firstOrNull { it.name == "apic" }
            ?.replyFlutterString("DISABLED", resultParam = "p1")

        mutableClassDefByOrNull("Lcom/emrys/aic/app_integrity_checker/AppIntegrityCheckerPlugin;")?.methods?.forEach {
            when (it.name) {
                "getChecksum" -> it.returnEarly("696691799")
                "getSignature" -> it.returnEarly("iZolMPZ+iE5k+Ps3hGJtLCTCZpchWE/f8yydfZSyfZY=\\n")
            }
        }
    }
}
