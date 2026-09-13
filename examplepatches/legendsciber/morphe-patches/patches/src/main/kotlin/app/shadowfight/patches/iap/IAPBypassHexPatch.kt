package app.shadowfight.patches.iap

import app.morphe.patcher.patch.rawResourcePatch
import java.util.logging.Logger

@Suppress("unused")
val sfIAPBypassHexPatch = rawResourcePatch(
    name = "In-App Purchase Bypass",
    description = "Bypasses server-side purchase verification.",
    default = false,
) {
    execute {
        val logger = Logger.getLogger("SF2HexPatch")

        val libPath = try {
            val f = get("lib/arm64-v8a/libil2cpp.so")
            if (f != null && f.exists()) "lib/arm64-v8a/libil2cpp.so" else null
        } catch (e: Exception) { null }

        if (libPath == null) {
            logger.info("IAP hex patch: no libil2cpp.so found, skipping")
            return@execute
        }
        logger.info("IAP hex patch: found $libPath")

        try {
            val libFile = get(libPath)
            val libBytes = libFile.readBytes()

            // ARM64 instructions
            val ret = byteArrayOf(
                0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte()
            )
            val retNop = byteArrayOf(
                0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte(),
                0x1F.toByte(), 0x20.toByte(), 0x03.toByte(), 0xD5.toByte()
            )
            val movW0x0Ret = byteArrayOf(  // MOV W0, #0; RET
                0x00.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
                0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte()
            )
            val movW0x1Ret = byteArrayOf(  // MOV W0, #1; RET
                0x20.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
                0xC0.toByte(), 0x03.toByte(), 0x5F.toByte(), 0xD6.toByte()
            )

            // Offset-based patches for SF2 v2.46.0 libil2cpp.so
            // Offsets from Il2CppDumper script.json (methodPointer values)
            // These are verified correct function entry points via capstone disassembly
            data class HexPatch(
                val offset: Int,
                val originalBytes: ByteArray,
                val replacementBytes: ByteArray,
                val description: String
            )

            val hexPatches = listOf(
                // Patch 1: ProcessPurchase -> return Complete (0)
                // DGGBFKNKEAH.ProcessPurchase at 0x02F66C48
                // Original: MOV W8, #1; STRB W8, [X22, #0x611]
                // This skips ALL server verification. Item delivery also skipped.
                HexPatch(
                    offset = 0x02F66C48,
                    originalBytes = byteArrayOf(
                        0x28.toByte(), 0x00.toByte(), 0x80.toByte(), 0x52.toByte(),
                        0xC8.toByte(), 0x46.toByte(), 0x18.toByte(), 0x39.toByte()
                    ),
                    replacementBytes = movW0x0Ret,
                    description = "ProcessPurchase -> return Complete (skip server verification)"
                ),

                // Patch 2: DCGFJIGIDKH -> return true
                // FEFHGAHGKBK.DCGFJIGIDKH at 0x02F62A74
                // Returns bool. Making it return true = all products appear purchased.
                HexPatch(
                    offset = 0x02F62A74,
                    originalBytes = byteArrayOf(
                        0xE0.toByte(), 0x03.toByte(), 0x14.toByte(), 0xAA.toByte(),
                        0xE1.toByte(), 0x03.toByte(), 0x1F.toByte(), 0xAA.toByte()
                    ),
                    replacementBytes = movW0x1Ret,
                    description = "DCGFJIGIDKH (IsProductUnlocked) -> return true"
                ),

                // Patch 3: MMDPFIHOBJP -> ret
                // FEFHGAHGKBK.LGOBIOGNECC.MMDPFIHOBJP at 0x02F62E00
                // Server response callback. Skip processing = no error popup.
                HexPatch(
                    offset = 0x02F62E00,
                    originalBytes = byteArrayOf(
                        0x20.toByte(), 0x8E.toByte(), 0x00.toByte(), 0xB0.toByte(),
                        0x00.toByte(), 0x9C.toByte(), 0x44.toByte(), 0xF9.toByte()
                    ),
                    replacementBytes = retNop,
                    description = "MMDPFIHOBJP (server callback) -> ret"
                ),

                // Patch 4: CAGEJJOAJLJ -> ret
                // FEFHGAHGKBK.CAGEJJOAJLJ at 0x02F62438
                // Process result handler. Skip = ignore server response.
                HexPatch(
                    offset = 0x02F62438,
                    originalBytes = byteArrayOf(
                        0xF4.toByte(), 0xA7.toByte(), 0x00.toByte(), 0xF0.toByte(),
                        0x88.toByte(), 0xEA.toByte(), 0x56.toByte(), 0x39.toByte()
                    ),
                    replacementBytes = retNop,
                    description = "CAGEJJOAJLJ (result processor) -> ret"
                )
            )

            var patchedCount = 0
            for (patch in hexPatches) {
                val offset = patch.offset
                if (offset + patch.originalBytes.size > libBytes.size) {
                    logger.info("  SKIPPED: ${patch.description} (offset 0x${Integer.toHexString(offset)} exceeds file size)")
                    continue
                }

                // Verify original bytes match (safety check)
                var bytesMatch = true
                for (i in patch.originalBytes.indices) {
                    if (libBytes[offset + i] != patch.originalBytes[i]) {
                        bytesMatch = false
                        break
                    }
                }

                if (!bytesMatch) {
                    logger.info("  SKIPPED: ${patch.description} (original bytes mismatch at 0x${Integer.toHexString(offset)} - game version may have changed)")
                    continue
                }

                // Apply patch
                for (i in patch.replacementBytes.indices) {
                    libBytes[offset + i] = patch.replacementBytes[i]
                }
                patchedCount++
                logger.info("  PATCHED: ${patch.description} at 0x${Integer.toHexString(offset)}")
            }

            if (patchedCount > 0) {
                libFile.writeBytes(libBytes)
                logger.info("IAP hex patch COMPLETE: $patchedCount/${hexPatches.size} patches applied")
            } else {
                logger.info("IAP hex patch: no patches applied - bytes mismatch")
            }
        } catch (e: Exception) {
            logger.info("IAP hex patch FAILED: ${e.message}")
            e.printStackTrace()
        }
    }
}
