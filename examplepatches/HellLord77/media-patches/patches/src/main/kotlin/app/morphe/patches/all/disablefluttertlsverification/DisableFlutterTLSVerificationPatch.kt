package app.morphe.patches.all.disablefluttertlsverification

import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import java.util.logging.Logger
import kotlin.experimental.and

private const val NATIVE_LIBRARY_DIRECTORY = "lib"

// https://github.com/NVISOsecurity/disable-flutter-tls-verification
private val ANDROID_PATTERNS = mapOf(
    CpuArchitecture.ARM64_V8A to listOf(
        Pattern("F? 0F 1C F8 F? 5? 01 A9 F? 5? 02 A9 F? ?? 03 A9 ?? ?? ?? ?? 68 1A 40 F9", false),
        Pattern(
            "F? 43 01 D1 FE 67 01 A9 F8 5F 02 A9 F6 57 03 A9 F4 4F 04 A9 13 00 40 F9 F4 03 00 AA 68 1A 40 F9",
            false
        ),
        Pattern(
            "FF 43 01 D1 FE 67 01 A9 ?? ?? 06 94 ?? 7? 06 94 68 1A 40 F9 15 15 41 F9 B5 00 00 B4 B6 4A 40 F9",
            false
        ),
        Pattern(
            "FF ?3 01 D1 F? ?? 01 A9 ?? ?? ?? 94 ?? ?? ?? 52 48 00 00 39 1A 50 40 F9 DA 02 00 B4 48 03 40 F9",
            true
        )
    ), CpuArchitecture.ARMEABI_V7A to listOf(
        Pattern("2D E9 F? 4? D0 F8 00 80 81 46 D8 F8 18 00 D0 F8", false)
    ), CpuArchitecture.X86_64 to listOf(
        Pattern(
            "55 41 57 41 56 41 55 41 54 53 50 49 89 F? 4? 8B ?? 4? 8B 4? 30 4C 8B ?? ?? 0? 00 00 4D 85 ?? 74 1? 4D 8B",
            false
        ),
        Pattern(
            "55 41 57 41 56 41 55 41 54 53 48 83 EC 18 49 89 FF 48 8B 1F 48 8B 43 30 4C 8B A0 28 02 00 00 4D 85 E4 74",
            false
        ),
        Pattern(
            "55 41 57 41 56 41 55 41 54 53 48 83 EC 18 49 89 FE 4C 8B 27 49 8B 44 24 30 48 8B 98 D0 01 00 00 48 85 DB",
            false
        ),
    ), CpuArchitecture.X86 to listOf(
        Pattern(
            "55 89 E5 53 57 56 83 E4 F0 83 EC 20 E8 00 00 00 00 5B 81 C3 2B 79 66 00 8B 7D 08 8B 17 8B 42 18 8B 80 88 01",
            false
        ),
    )
)

internal data class Pattern(val pattern: String, val retval: Boolean)

internal data class PatternByte(val value: Byte, val mask: Byte)

internal fun parsePattern(pattern: String): List<PatternByte> {
    val bytes = mutableListOf<PatternByte>()
    for (byte in pattern.split(" ")) {
        val value: Byte
        val mask: Byte
        when {
            byte == "??" -> {
                value = 0x00
                mask = 0x00
            }

            byte.contains("?") -> {
                value = byte.replace("?", "0").toInt(16).toByte()
                mask = if (byte[0] == '?') 0x0F else 0xF0.toByte()
            }

            else -> {
                value = byte.toInt(16).toByte()
                mask = 0xFF.toByte()
            }
        }
        bytes.add(PatternByte(value, mask))
    }
    return bytes
}

internal fun scanSync(bytes: ByteArray, pattern: String): List<Int> {
    val offsets = mutableListOf<Int>()
    val patternBytes = parsePattern(pattern)

    for (offset in 0..bytes.size - patternBytes.size) {
        var match = true
        for ((patternIndex, patternByte) in patternBytes.withIndex()) {
            val byte = bytes[offset + patternIndex]
            if ((byte and patternByte.mask) != (patternByte.value and patternByte.mask)) {
                match = false
                break
            }
        }
        if (match) {
            offsets.add(offset)
        }
    }
    return offsets
}

internal fun assemble(architecture: CpuArchitecture, retval: Boolean): ByteArray {
    return when (architecture) {
        CpuArchitecture.ARMEABI_V7A -> {
            listOf(
                0x4F, 0xF0, if (retval) 0x01 else 0x00, 0x00,  // mov r0
                0x70, 0x47,                                    // bx lr
            )
        }

        CpuArchitecture.ARM64_V8A -> {
            listOf(
                if (retval) 0x20 else 0x00, 0x00, 0x80, 0x52,  // mov w0, #$retval
                0xC0, 0x03, 0x5F, 0xD6,                        // ret
            )
        }

        CpuArchitecture.X86, CpuArchitecture.X86_64 -> {
            listOf(
                0xB8, if (retval) 0x01 else 0x00, 0x00, 0x00, 0x00,  // mov eax, $retval
                0xC3,                                                // ret
            )
        }

        else -> {
            throw NotImplementedError()
        }
    }.map(Int::toByte).toByteArray()
}

fun disableFlutterTLSVerificationPatch(
    architecturesProvider: () -> List<CpuArchitecture> = { listOf() },
) = rawResourcePatch {
    execute {
        val architectures = architecturesProvider()
        val logger = Logger.getLogger(this::class.java.name)
        logger.info("[+] Pattern version: Jun 17 2026")

        architectures.forEach { arch ->
            val lib = get("$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libflutter.so")
            if (!lib.isFile) return@forEach

            logger.info("[+] Arch: ${arch.arch}")
            logger.info("[+] Platform: android")
            val bytes = lib.readBytes()
            for (pattern in ANDROID_PATTERNS[arch]!!) {
                val matches = scanSync(bytes, pattern.pattern)

                for (offset in matches) {
                    logger.info("[+] ssl_verify_peer_cert found at offset: 0x${offset.toHexString()}")
                    val stub = assemble(arch, pattern.retval)
                    stub.copyInto(bytes, offset)
                }

                if (matches.size > 1) {
                    logger.warning("[!] Multiple matches detected. This can have a negative impact and may crash the app.")
                }
            }
            lib.writeBytes(bytes)
        }
    }
}

val disableAndroidFlutterTLSVerificationPatch =
    disableFlutterTLSVerificationPatch(ANDROID_PATTERNS.keys::toList)