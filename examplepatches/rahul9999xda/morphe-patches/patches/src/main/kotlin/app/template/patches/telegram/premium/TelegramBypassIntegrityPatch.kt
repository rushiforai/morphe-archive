package app.template.patches.telegram.premium

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.methodCall
import app.template.patches.shared.Constants.TELEGRAM_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_PLUS_COMPATIBILITY
import app.template.patches.shared.Constants.TELEGRAM_WEB_COMPATIBILITY
import app.template.patches.telegram.AndroidUtilitiesGetCertFingerprintFingerprint
import app.template.patches.telegram.SafetyNetCheckFingerprint
import app.template.patches.telegram.signature.telegramSpoofDependency
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference

// SHA-256 of the original signing certificate (X.509 DER) for each package variant.
// Computed as: SHA-256(CertificateFactory("X509").generateCertificate(pkcs7Stream).encoded)
// i.e. the hash of the DER-encoded X.509 cert extracted from the APK's META-INF/[name].RSA PKCS7 blob.
// This is exactly what getCertificateSHA256Fingerprint() computes at runtime.
//
// Do NOT use the raw PKCS7 SHA-256 — that's a different (larger) byte sequence.
//
// These are the upstream/original application certificate fingerprints that the
// Telegram protocol expects, matching the DER certs seeded by TelegramCertSeedPatch.kt.
// The supplied APKs are bundletool/repackaged builds whose wrapper signing certificates
// differ; do NOT substitute the current APK wrapper-certificate hashes here.
// Telegram/Web original VK cert SHA-256: 49C1522548EBACD46CE322B6FD47F6092BB745D0F88082145CAF35E14DCC38E1
// Plus original cert SHA-256:             6EBB622268AAD319DBE8A1F414837D2843A9B35856AEFB7DEE2971A3D493F276
private val CERT_HASHES = mapOf(
    "org.telegram.messenger"     to "49C1522548EBACD46CE322B6FD47F6092BB745D0F88082145CAF35E14DCC38E1",
    "org.telegram.messenger.web" to "49C1522548EBACD46CE322B6FD47F6092BB745D0F88082145CAF35E14DCC38E1",
    "org.telegram.plus"          to "6EBB622268AAD319DBE8A1F414837D2843A9B35856AEFB7DEE2971A3D493F276",
)

// Plus calls this method from ConnectionsManager but the method body itself is not
// declared in the supplied Plus APK. Patch the verified call-site there instead.
private val plusCertificateFingerprintCallSite = Fingerprint(
    filters = listOf(
        methodCall(
            definingClass = "Lorg/telegram/messenger/AndroidUtilities;",
            name = "getCertificateSHA256Fingerprint",
            returnType = "Ljava/lang/String;",
        ),
    ),
)

private var detectedPackageName = ""

private val readPackageNamePatch = app.morphe.patcher.patch.resourcePatch(default = false) {
    execute {
        document("AndroidManifest.xml").use { doc ->
            detectedPackageName = (doc.getElementsByTagName("manifest").item(0)
                as org.w3c.dom.Element).getAttribute("package")
        }
    }
}

@Suppress("unused")
val telegramBypassIntegrityPatch = bytecodePatch(
    name = "Bypass integrity check",
    description = "Spoofs certificate fingerprint and SafetyNet results so login works on patched APK.",
) {
    compatibleWith(TELEGRAM_COMPATIBILITY, TELEGRAM_WEB_COMPATIBILITY, TELEGRAM_PLUS_COMPATIBILITY)
    dependsOn(telegramSpoofDependency(), readPackageNamePatch)

    execute {
        val certHash = CERT_HASHES[detectedPackageName]
            ?: error("No cert hash for package '$detectedPackageName'")

        // Return the exact original certificate SHA-256. On Plus, the helper body is
        // not declared in this APK, so replace its one verified call-site in place.
        val certMethod = AndroidUtilitiesGetCertFingerprintFingerprint.methodOrNull
        if (certMethod != null) {
            certMethod.addInstructions(0, """
                const-string v0, "$certHash"
                return-object v0
            """)
        } else {
            val callMatches = plusCertificateFingerprintCallSite.matchAllOrNull().orEmpty()
            if (callMatches.isEmpty()) {
                error("Certificate fingerprint method/call-site not found for '$detectedPackageName'")
            }
            callMatches.forEach { match ->
                match.instructionMatches.map { it.index }.distinct().sortedDescending().forEach { index ->
                    val resultInstruction = match.method.getInstruction<OneRegisterInstruction>(index + 1)
                    require(match.method.getInstruction(index + 1).opcode == Opcode.MOVE_RESULT_OBJECT) {
                        "Certificate fingerprint call is not followed by move-result-object"
                    }
                    val resultRegister = resultInstruction.registerA
                    match.method.replaceInstruction(index, "const-string v$resultRegister, \"$certHash\"")
                    match.method.replaceInstruction(index + 1, "nop")
                }
            }
        }

        // Force only the boolean results of JSONObject.optBoolean("basicIntegrity")
        // and optBoolean("ctsProfileMatch") to true. Do not match diagnostic strings:
        // replacing an arbitrary instruction two slots after those strings can corrupt
        // a later String argument and fail verification.
        SafetyNetCheckFingerprint.method.apply {
            val instructions = implementation!!.instructions
            val resultIndices = instructions.mapIndexedNotNull { index, instruction ->
                if (instruction.opcode != Opcode.CONST_STRING) return@mapIndexedNotNull null
                val string = (instruction as? ReferenceInstruction)?.reference as? StringReference
                if (string?.string != "basicIntegrity" && string?.string != "ctsProfileMatch") {
                    return@mapIndexedNotNull null
                }
                val invoke = instructions.getOrNull(index + 1)
                val methodRef = (invoke as? ReferenceInstruction)?.reference as? MethodReference
                val result = instructions.getOrNull(index + 2)
                if (invoke?.opcode == Opcode.INVOKE_VIRTUAL &&
                    methodRef != null &&
                    methodRef.definingClass == "Lorg/json/JSONObject;" &&
                    methodRef.name == "optBoolean" &&
                    result?.opcode == Opcode.MOVE_RESULT
                ) index + 2 else null
            }.distinct().sortedDescending()

            if (resultIndices.size != 2) {
                error("Expected two JSONObject.optBoolean integrity results, found ${resultIndices.size}")
            }
            resultIndices.forEach { patchIndex ->
                val register = getInstruction<OneRegisterInstruction>(patchIndex).registerA
                replaceInstruction(patchIndex, "const/4 v$register, 0x1")
            }
        }
    }
}
