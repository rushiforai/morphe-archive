package app.morphe.patches.all.misc.flutter

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.all.misc.hex.maskedHexPatch
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import java.util.logging.Logger

// https://github.com/NVISOsecurity/disable-flutter-tls-verification
fun disableFlutterTLSVerificationPatch(
    architecturesProvider: () -> List<CpuArchitecture> = { emptyList() },
) = rawResourcePatch {
    val architectures = architecturesProvider()
    val logger = Logger.getLogger(this::class.java.name)

    logger.info("[+] Pattern version: Jun 17 2026")
    logger.info("[+] Platform: android")
    architectures.forEach { arch ->
        val lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libflutter.so"

        dependsOn(
            maskedHexPatch(
                true, ignoreMissingReplacements = true
            ) {
                when (arch) {
                    CpuArchitecture.ARMEABI_V7A -> {
                        // mov r0, #0
                        // bx lr
                        "2D E9 F? 4? D0 F8 00 80 81 46 D8 F8 18 00 D0 F8" asPatternTo """
                            4F F0 00 00
                            70 47
                        """ inFile lib
                    }

                    CpuArchitecture.ARM64_V8A -> {
                        // mov w0, #0
                        // ret
                        "F? 0F 1C F8 F? 5? 01 A9 F? 5? 02 A9 F? ?? 03 A9 ?? ?? ?? ?? 68 1A 40 F9" asPatternTo """
                            00 00 80 52
                            C0 03 5F D6
                        """ inFile lib
                        "F? 43 01 D1 FE 67 01 A9 F8 5F 02 A9 F6 57 03 A9 F4 4F 04 A9 13 00 40 F9 F4 03 00 AA 68 1A 40 F9" asPatternTo """
                            00 00 80 52
                            C0 03 5F D6
                        """ inFile lib
                        "FF 43 01 D1 FE 67 01 A9 ?? ?? 06 94 ?? 7? 06 94 68 1A 40 F9 15 15 41 F9 B5 00 00 B4 B6 4A 40 F9" asPatternTo """
                            00 00 80 52
                            C0 03 5F D6
                        """ inFile lib

                        // mov w0, #1
                        // ret
                        "FF ?3 01 D1 F? ?? 01 A9 ?? ?? ?? 94 ?? ?? ?? 52 48 00 00 39 1A 50 40 F9 DA 02 00 B4 48 03 40 F9" asPatternTo """
                            20 00 80 52
                            C0 03 5F D6
                        """ inFile lib
                    }

                    CpuArchitecture.X86 -> {
                        // xor eax, eax
                        // ret
                        "55 89 E5 53 57 56 83 E4 F0 83 EC 20 E8 00 00 00 00 5B 81 C3 2B 79 66 00 8B 7D 08 8B 17 8B 42 18 8B 80 88 01" asPatternTo """
                            31 C0
                            C3
                        """ inFile lib
                    }

                    CpuArchitecture.X86_64 -> {
                        // xor eax, eax
                        // ret
                        "55 41 57 41 56 41 55 41 54 53 50 49 89 F? 4? 8B ?? 4? 8B 4? 30 4C 8B ?? ?? 0? 00 00 4D 85 ?? 74 1? 4D 8B" asPatternTo """
                            31 C0
                            C3
                        """ inFile lib
                        "55 41 57 41 56 41 55 41 54 53 48 83 EC 18 49 89 FF 48 8B 1F 48 8B 43 30 4C 8B A0 28 02 00 00 4D 85 E4 74" asPatternTo """
                            31 C0
                            C3
                        """ inFile lib
                        "55 41 57 41 56 41 55 41 54 53 48 83 EC 18 49 89 FE 4C 8B 27 49 8B 44 24 30 48 8B 98 D0 01 00 00 48 85 DB" asPatternTo """
                            31 C0
                            C3
                        """ inFile lib
                    }

                    else -> throw PatchException("Unsupported architecture: ${arch.arch}")
                }
            })
    }
}

