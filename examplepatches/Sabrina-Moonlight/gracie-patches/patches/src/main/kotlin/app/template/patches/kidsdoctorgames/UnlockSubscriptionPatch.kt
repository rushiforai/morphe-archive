package app.template.patches.kidsdoctorgames

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.ApkFileType
import app.morphe.patcher.patch.AppTarget
import app.morphe.patcher.patch.Compatibility
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.util.returnEarly
import java.io.RandomAccessFile
import java.util.logging.Logger

/**
 * Kids doctor games 1.12 (versionCode 466) — full BB Pass unlock.
 *
 * One visible patch. Internally:
 * 1) Hex-patches Unity IL2CPP gates in lib/arm64-v8a/libil2cpp.so
 * 2) Forces SharedSub / Billing Java methods
 * 3) Activates local SharedSub on Activity onCreate + onResume
 *
 * Open the full APKS (not only base.apk) so the arm64 lib is present.
 */
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

/** ARM64: mov w0, #1 ; ret */
private val RETURN_TRUE = hexBytes("20 00 80 52 c0 03 5f d6")

/** ARM64: mov w0, #3 ; ret (ResolveAccessState full/pass path) */
private val RETURN_ACCESS_FULL = hexBytes("60 00 80 52 c0 03 5f d6")

private data class NativeGate(
    val name: String,
    val pattern: ByteArray,
    val replacement: ByteArray = RETURN_TRUE,
)

/**
 * Unique prologues verified against this APK's libil2cpp.so (metadata v39).
 */
private val IL2CPP_GATES = listOf(
    NativeGate(
        "HasThisAppPurchase",
        hexBytes("fe 0f 1e f8 f4 4f 01 a9 d4 92 01 d0 53 79 01 b0"),
    ),
    NativeGate(
        "IsOwnedSharedActive",
        hexBytes("fe 0f 1e f8 f4 4f 01 a9 94 92 01 b0 f3 03 00 aa"),
    ),
    NativeGate(
        "IsActive",
        hexBytes("ff c3 00 d1 fe 57 01 a9 f4 4f 02 a9 94 92 01 d0"),
    ),
    NativeGate(
        "get_HasNonServerAccessGrant",
        hexBytes("08 a0 40 39 68 00 00 34 20 00 80 52 c0 03 5f d6"),
    ),
    NativeGate(
        "get_HasNonServerPassGrant",
        hexBytes("08 a0 40 39 68 00 00 35 08 e0 40 39 68 00 00 34"),
    ),
    NativeGate(
        "get_IsFullAccess",
        hexBytes("00 20 40 f9 01 00 00 14 fe 57 be a9 f4 4f 01 a9"),
    ),
    NativeGate(
        "ResolveAccessState",
        hexBytes("fe 0f 1f f8 78 fb ff 97 c0 00 00 36 0b 00 00 94"),
        RETURN_ACCESS_FULL,
    ),
)

/**
 * Private resource patch (not listed alone in Morphe).
 * Runs because [unlockSubscriptionPatch] depends on it.
 */
private val unlockIl2CppNativeInternalPatch = rawResourcePatch {
    execute {
        val logger = Logger.getLogger("kidsdoctorgames.il2cpp")
        val target = get(LIB, true)
        if (!target.exists()) {
            throw PatchException(
                "Native library not found: $LIB. Open the full APKS (with arm64 split), not only base.apk.",
            )
        }

        RandomAccessFile(target, "rw").use { raf ->
            for (gate in IL2CPP_GATES) {
                val offset = indexOfPattern(raf, gate.pattern)
                if (offset < 0L) {
                    throw PatchException(
                        "IL2CPP pattern not found for ${gate.name}: " +
                            gate.pattern.joinToString(" ") { "%02x".format(it) },
                    )
                }
                val pad = (gate.pattern.size - gate.replacement.size).coerceAtLeast(0)
                val padded = gate.replacement + ByteArray(pad)
                raf.seek(offset)
                raf.write(padded)
                logger.info("IL2CPP ${gate.name} patched @ 0x${offset.toString(16)}")
            }
        }
        logger.info("IL2CPP: ${IL2CPP_GATES.size} native gates applied")
    }
}

@Suppress("unused")
val unlockSubscriptionPatch = bytecodePatch(
    name = "Unlock subscription",
    description = "Unlocks BB Pass: forces Unity IL2CPP access gates in libil2cpp.so, " +
        "SharedSub/Billing Java methods, and activates local pass state on start. " +
        "Requires the full APKS (arm64).",
    default = true,
) {
    compatibleWith(KIDS_DOCTOR_GAMES)
    dependsOn(unlockIl2CppNativeInternalPatch)
    extendWith("extensions/extension.mpe")

    execute {
        val logger = Logger.getLogger(this::class.java.name)

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

        logger.info("Kids doctor games: Java SharedSub + Billing + activate applied")
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
    require(stripped.length % 2 == 0) { "hex length must be even: $pattern" }
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
