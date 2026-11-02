package patches.rainviewer

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import java.security.MessageDigest
import java.util.Base64

@Suppress("unused")
val googleCompatibility = bytecodePatch(
    name = "Fix Google services",
    description = "Reports RainViewer's original certificate digest to Firebase/Google API package restrictions after re-signing. Does not forge Google Play Integrity tokens or suppress publisher server rejection.",
) {
    compatibleWith(rainviewer)
    dependsOn(originalInput, startupCompatibility)
    execute {
        val certificates = packageMetadata.signingCertificates.values.flatten()
            .distinctBy { Base64.getEncoder().encodeToString(it.encoded) }
        check(certificates.size == 1) { "Expected the complete original RainViewer APK set with one signer" }
        val certificate = certificates.single()
        val sha256 = MessageDigest.getInstance("SHA-256").digest(certificate.encoded)
            .joinToString("") { "%02x".format(it.toInt() and 0xff) }
        check(sha256 in rainviewer.signatures.orEmpty()) { "Unknown original RainViewer certificate" }
        val digest = Base64.getEncoder().encodeToString(MessageDigest.getInstance("SHA-1").digest(certificate.encoded))
        // All six inspected Firebase callers use this SHA-1 certificate helper.
        // Keep lookups for other packages on the real PackageManager path.
        exact("Lc63;", "A", "[B", "Landroid/content/Context;", "Ljava/lang/String;").apply {
            check(implementation!!.registerCount >= 4) { "Unexpected certificate helper register layout" }
            addInstructionsWithLabels(0, """
                const-string v0, "com.lucky_apps.RainViewer"
                invoke-virtual {v0, p1}, Ljava/lang/String;->equals(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :originalLookup
                const-string v0, "$digest"
                const/4 v1, 0x2
                invoke-static {v0, v1}, Landroid/util/Base64;->decode(Ljava/lang/String;I)[B
                move-result-object v0
                return-object v0
            """.trimIndent(), ExternalLabel("originalLookup", getInstruction(0)))
        }
    }
}
