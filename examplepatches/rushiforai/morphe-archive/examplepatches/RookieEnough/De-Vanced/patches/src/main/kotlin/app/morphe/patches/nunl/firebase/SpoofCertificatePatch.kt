/*
 * Forked from:
 * https://gitlab.com/ReVanced/revanced-patches/-/blob/main/patches/src/main/kotlin/app/revanced/patches/nunl/firebase/SpoofCertificatePatch.kt
 */
package app.morphe.patches.nunl.firebase

import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patcher.Fingerprint
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.util.returnEarly
import com.android.tools.smali.dexlib2.AccessFlags

private const val SPOOFED_CERT_HASH = "eae41fc018df2731a9b6ae1ac327da44a288667b"

@Suppress("unused")
val spoofCertificatePatch = bytecodePatch(
    name = "Spoof certificate",
    description = "Spoofs the X-Android-Cert header to allow push messages.",
) {
    compatibleWith(AppCompatibilities.NU_NL)

    execute {
        val targets = listOf(
            "Lcom/google/firebase/installations/remote/FirebaseInstallationServiceClient;",
            "Lcom/google/firebase/remoteconfig/internal/ConfigFetchHttpClient;",
            "Lcom/google/firebase/remoteconfig/internal/ConfigRealtimeHttpClient;",
        )

        targets.forEach { definingClass ->
            Fingerprint(
                definingClass = definingClass,
                name = "getFingerprintHashForPackage",
                accessFlags = listOf(AccessFlags.PRIVATE),
                returnType = "Ljava/lang/String;",
                parameters = listOf(),
            ).methodOrNull?.returnEarly(SPOOFED_CERT_HASH)
        }
    }
}

