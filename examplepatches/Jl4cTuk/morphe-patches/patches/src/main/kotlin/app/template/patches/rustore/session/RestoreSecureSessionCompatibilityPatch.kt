package app.template.patches.rustore.session

import app.morphe.patcher.patch.InstallerType
import app.morphe.patcher.patch.PatchAvailability
import app.morphe.patcher.patch.rawResourcePatch
import app.template.patches.rustore.shared.Constants.COMPATIBILITY_RUSTORE
import app.template.patches.rustore.shared.Constants.OFFICIAL_RUSTORE_SIGNER_SHA256

private fun String.decodeHex(): ByteArray {
    require(length % 2 == 0) { "Hex string must contain complete bytes" }
    return chunked(2).map { it.toInt(16).toByte() }.toByteArray()
}

private val officialRuStoreCertificateDigest =
    OFFICIAL_RUSTORE_SIGNER_SHA256.decodeHex()

private data class NativeSignaturePatchSpec(
    val abi: String,
    val digestOffset: Int,
    val codeOffset: Int,
    val expectedCode: ByteArray,
    val replacementCode: ByteArray,
)

private val nativeSignaturePatchSpecs = listOf(
    NativeSignaturePatchSpec(
        abi = "arm64-v8a",
        digestOffset = 0x87e0,
        codeOffset = 0x1594c,
        expectedCode =
            "220340f9e10216cbe00316aad3fcff97760000b4e00316aaf9030094".decodeHex(),
        replacementCode =
            "280340f98974f910200540ad000500ad760000b4e00316aaf9030094".decodeHex(),
    ),
    NativeSignaturePatchSpec(
        abi = "armeabi-v7a",
        digestOffset = 0x3e96,
        codeOffset = 0x9c40,
        expectedCode =
            "d9f80020a8eb07013846fff729fb002f1cbf384600f088fc".decodeHex(),
        replacementCode =
            "d9f8000045f6b6517a46a2eb010121f90f0200f90f02ffe7".decodeHex(),
    ),
    NativeSignaturePatchSpec(
        abi = "x86",
        digestOffset = 0x320e,
        codeOffset = 0x140f4,
        expectedCode =
            "29f78b450089442408897c2404893424e807f3ffff85f67408893424e84b0e0000"
                .decodeHex(),
        replacementCode =
            "568b7d008db35ae7fcffb908000000f3a55e85f6740b893424e84e0e0000909090"
                .decodeHex(),
    ),
    NativeSignaturePatchSpec(
        abi = "x86_64",
        digestOffset = 0x8600,
        codeOffset = 0x15556,
        expectedCode =
            "4c29ed488b134c89ef4889eee8d9f3ffff4d85ed74084c89efe84c0f0000".decodeHex(),
        replacementCode =
            "488b3b488d35a030ffff6a0459f348a54d85ed74094c89efe84d0f000090".decodeHex(),
    ),
)

private val expectedDigestStorage =
    "(base != 0) && \"DW_EH_PE_datarel".encodeToByteArray()

@Suppress("unused")
val restoreSecureSessionCompatibilityPatch = rawResourcePatch(
    name = "Restore secure-session compatibility",
    description =
        "Preserves RuStore secure-session requests when the APK is re-signed.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_RUSTORE)

    availability { installer, _ ->
        when (installer) {
            InstallerType.MOUNT -> PatchAvailability.UNAVAILABLE
            InstallerType.STANDARD, InstallerType.SHIZUKU -> PatchAvailability.REQUIRED
        }
    }

    execute {
        nativeSignaturePatchSpecs.forEach { spec ->
            val library = get("lib/${spec.abi}/libbridge_helper.so", false)
            val bytes = library.readBytes()

            require(
                bytes.copyOfRange(
                    spec.digestOffset,
                    spec.digestOffset + expectedDigestStorage.size,
                ).contentEquals(expectedDigestStorage),
            ) {
                "RuStore native signature digest storage anchor changed for ${spec.abi}"
            }
            require(
                bytes.copyOfRange(
                    spec.codeOffset,
                    spec.codeOffset + spec.expectedCode.size,
                ).contentEquals(spec.expectedCode),
            ) {
                "RuStore native signature code anchor changed for ${spec.abi}"
            }
            require(spec.expectedCode.size == spec.replacementCode.size) {
                "RuStore native signature patch size changed for ${spec.abi}"
            }

            officialRuStoreCertificateDigest.copyInto(bytes, spec.digestOffset)
            spec.replacementCode.copyInto(bytes, spec.codeOffset)

            check(
                bytes.copyOfRange(
                    spec.digestOffset,
                    spec.digestOffset + officialRuStoreCertificateDigest.size,
                ).contentEquals(officialRuStoreCertificateDigest),
            ) {
                "RuStore certificate digest was not written for ${spec.abi}"
            }
            check(
                bytes.copyOfRange(
                    spec.codeOffset,
                    spec.codeOffset + spec.replacementCode.size,
                ).contentEquals(spec.replacementCode),
            ) {
                "RuStore native signature code was not written for ${spec.abi}"
            }

            library.writeBytes(bytes)
        }
    }
}
