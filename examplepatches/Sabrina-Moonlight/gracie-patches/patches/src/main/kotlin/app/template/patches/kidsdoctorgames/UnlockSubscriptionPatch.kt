package app.template.patches.kidsdoctorgames

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.returnEarly
import app.template.patches.shared.cert.extractApkCertificatePatch
import app.template.patches.shared.firebase.spoofFirebaseCertHashPatch
import app.template.patches.shared.installer.spoofInstallSourcePatch
import app.template.patches.shared.signature.spoofSignatureVerificationPatch
import java.io.RandomAccessFile
import java.util.logging.Logger

internal val KIDS_DOCTOR_GAMES = Compatibility(
    name = "Kids doctor games",
    packageName = "com.bimiboo.kids.doctor.games",
    apkFileType = ApkFileType.APKS,
    appIconColor = 0x2196F3,
    targets = listOf(
        AppTarget(version = "1.12", versionCode = 466, minSdk = 32),
    ),
)

private const val HELPER =
    "Lapp/template/extension/shared/BbPassUnlockHelper;"

private const val LIB = "lib/arm64-v8a/libil2cpp.so"

private val RETURN_TRUE = hexBytes("20 00 80 52 c0 03 5f d6")
private val RETURN_ACCESS_FULL = hexBytes("60 00 80 52 c0 03 5f d6")

private data class KidsIl2CppGate(
    val label: String,
    val pattern: ByteArray,
    val replacement: ByteArray = RETURN_TRUE,
)

private val IL2CPP_GATES = listOf(
    KidsIl2CppGate("HasThisAppPurchase", hexBytes("fe 0f 1e f8 f4 4f 01 a9 d4 92 01 d0 53 79 01 b0")),
    KidsIl2CppGate("IsOwnedSharedActive", hexBytes("fe 0f 1e f8 f4 4f 01 a9 94 92 01 b0 f3 03 00 aa")),
    KidsIl2CppGate("IsActive", hexBytes("ff c3 00 d1 fe 57 01 a9 f4 4f 02 a9 94 92 01 d0")),
    KidsIl2CppGate("get_HasNonServerAccessGrant", hexBytes("08 a0 40 39 68 00 00 34 20 00 80 52 c0 03 5f d6")),
    KidsIl2CppGate("get_HasNonServerPassGrant", hexBytes("08 a0 40 39 68 00 00 35 08 e0 40 39 68 00 00 34")),
    KidsIl2CppGate("get_IsFullAccess", hexBytes("00 20 40 f9 01 00 00 14 fe 57 be a9 f4 4f 01 a9")),
    KidsIl2CppGate(
        "ResolveAccessState",
        hexBytes("fe 0f 1f f8 78 fb ff 97 c0 00 00 36 0b 00 00 94"),
        RETURN_ACCESS_FULL,
    ),
)

private object PairipInitializeLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "initializeLicenseCheck",
    returnType = "V",
    parameters = emptyList(),
)

private object PairipCheckLicenseFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "checkLicense",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

private object PairipScheduleShutdownFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/licensecheck/LicenseClient;",
    name = "scheduleAppShutdown",
    returnType = "V",
    parameters = emptyList(),
)

private object PairipVerifyIntegrityFingerprint : Fingerprint(
    definingClass = "Lcom/pairip/SignatureCheck;",
    name = "verifyIntegrity",
    returnType = "V",
    parameters = listOf("Landroid/content/Context;"),
)

private val unlockIl2CppNativeInternalPatch = rawResourcePatch {
    execute {
        val logger = Logger.getLogger("kidsdoctorgames.il2cpp")
        val target = get(LIB, true)
        if (!target.exists()) {
            throw PatchException(
                "Native library not found: $LIB. Open the full APKS (arm64), not only base.apk.",
            )
        }
        RandomAccessFile(target, "rw").use { raf ->
            for (gate in IL2CPP_GATES) {
                val offset = indexOfPattern(raf, gate.pattern)
                if (offset < 0L) {
                    throw PatchException(
                        "IL2CPP pattern not found for ${gate.label}: " +
                            gate.pattern.joinToString(" ") { "%02x".format(it) },
                    )
                }
                val pad = (gate.pattern.size - gate.replacement.size).coerceAtLeast(0)
                raf.seek(offset)
                raf.write(gate.replacement + ByteArray(pad))
                logger.info("IL2CPP ${gate.label} @ 0x${offset.toString(16)}")
            }
        }
    }
}

@Suppress("unused")
val unlockSubscriptionPatch = bytecodePatch(
    name = "Unlock subscription",
    description = "Unlocks the full subscription.",
    default = true,
) {
    compatibleWith(KIDS_DOCTOR_GAMES)
    dependsOn(
        unlockIl2CppNativeInternalPatch,
        extractApkCertificatePatch,
        spoofFirebaseCertHashPatch,
        spoofInstallSourcePatch,
        spoofSignatureVerificationPatch,
    )
    extendWith("extensions/extension.mpe")

    execute {
        runCatching { PairipInitializeLicenseFingerprint.method.returnEarly() }
        runCatching { PairipCheckLicenseFingerprint.method.returnEarly() }
        runCatching { PairipScheduleShutdownFingerprint.method.returnEarly() }
        runCatching { PairipVerifyIntegrityFingerprint.method.returnEarly() }

        HasTrustedActiveSharedSubscriptionFingerprint.method.returnEarly(true)
        QueryPackageFingerprint.method.returnEarly(true)
        SharedSubStoreIsActiveFingerprint.method.returnEarly(true)
        SharedSubTrustPolicyIsTrustedFingerprint.method.returnEarly(true)
        runCatching { BbIdCrossAppTrustIsTrustedFingerprint.method.returnEarly(true) }

        forceFarExpiry(TrustedActiveSharedSubscriptionExpiryFingerprint.method)
        forceFarExpiry(QueryPackageExpiryFingerprint.method)
        forceFarExpiry(SharedSubStoreExpiresAtFingerprint.method)

        PurchaseGetPurchaseStateFingerprint.method.addInstructions(
            0,
            """
                const/4 v0, 0x1
                return v0
            """.trimIndent(),
        )
        PurchaseIsAcknowledgedFingerprint.method.returnEarly(true)

        UnityPlayerActivityOnCreateFingerprint.method.addInstructions(
            0,
            """
                invoke-static {p0}, $HELPER->activate(Landroid/content/Context;)V
            """.trimIndent(),
        )
        runCatching {
            UnityPlayerActivityOnResumeFingerprint.method.addInstructions(
                0,
                """
                    invoke-static {p0}, $HELPER->activate(Landroid/content/Context;)V
                """.trimIndent(),
            )
        }
    }
}

private fun forceFarExpiry(method: app.morphe.patcher.util.proxy.mutableTypes.MutableMethod) {
    method.addInstructions(
        0,
        """
            const-wide v0, 0x7ffffffffffffL
            return-wide v0
        """.trimIndent(),
    )
}

private fun hexBytes(pattern: String): ByteArray {
    val stripped = pattern.replace(" ", "")
    require(stripped.length % 2 == 0) { "hex length must be even" }
    return ByteArray(stripped.length / 2) { i ->
        stripped.substring(i * 2, i * 2 + 2).toInt(16).toByte()
    }
}

private fun indexOfPattern(file: RandomAccessFile, needle: ByteArray): Long {
    val right = IntArray(256) { -1 }
    for ((i, element) in needle.withIndex()) {
        right[element.toInt() and 0xFF] = i
    }
    val bufferSize = 65536
    val buffer = ByteArray(bufferSize + needle.size)
    var fileOffset = 0L
    val fileLength = file.length()
    while (fileOffset < fileLength) {
        file.seek(fileOffset)
        val bytesRead = file.read(buffer)
        if (bytesRead < needle.size) break
        var i = 0
        while (i <= bytesRead - needle.size) {
            var j = needle.size - 1
            while (j >= 0 && buffer[i + j] == needle[j]) j--
            if (j < 0) return fileOffset + i
            val shift = j - right[buffer[i + j].toInt() and 0xFF]
            i += maxOf(1, shift)
        }
        fileOffset += (bytesRead - needle.size + 1).toLong()
    }
    return -1L
}
