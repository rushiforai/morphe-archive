package app.morphe.patches.chorkitv.user

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.all.library.keepArmNativeLibraryPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.chorkitv.shared.Constants.COMPATIBILITY_CHORKITV
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import app.morphe.patches.shared.patches.cpuArchitectures
import app.morphe.patches.shared.patches.extractMetadataPatch
import app.morphe.patches.shared.patches.packageMetadata

@Suppress("unused")
val bypassLoginPatch =
    rawResourcePatch(
        name = "Bypass login",
        description = "Bypasses required login.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_CHORKITV)

        dependsOn(
            keepArmNativeLibraryPatch,
            extractMetadataPatch,
            hexPatch(
                block = {
                    when (packageMetadata.versionCode.toInt()) {
                        290 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:goplay_tv/data/models/settings_model.json ->
                                // SettingsModel.fromJson
                                // login_required -> restrict_vpn
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0x9000
                                        // LDR             R2, [R2,#0xB13] -> LDR             R2,
                                        // [R2,#0xB0F]
                                        """
                                            09 2a 85 e2
                                            13 2b 92 e5
                                        """ asPatternTo """
                                            09 2a 85 e2
                                            0f 2b 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x12,LSL#12
                                        // LDR             X2, [X2,#0xF8]        -> LDR
                                        // X2, [X2,#0xF0]
                                        """
                                            62 4b 40 91
                                            42 7c 40 f9
                                        """ asPatternTo """
                                            62 4b 40 91
                                            42 78 40 f9
                                        """ inFile lib
                                    }

                                    else -> {}
                                }
                            }
                        }

                        288 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:goplay_tv/data/models/settings_model.json ->
                                // SettingsModel.fromJson
                                // login_required -> restrict_vpn
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0x8000
                                        // LDR             R2, [R2,#0xA5B] -> LDR             R2,
                                        // [R2,#0xA57]
                                        """
                                            02 29 85 e2
                                            5b 2a 92 e5
                                        """ asPatternTo """
                                            02 29 85 e2
                                            57 2a 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0xF,LSL#12
                                        // LDR             X2, [X2,#0xFB0]      -> LDR
                                        // X2, [X2,#0xFA8]
                                        """
                                            62 3f 40 91
                                            42 d8 47 f9
                                        """ asPatternTo """
                                            62 3f 40 91
                                            42 d4 47 f9
                                        """ inFile lib
                                    }

                                    else -> {}
                                }
                            }
                        }

                        else -> {
                            throw PatchException(
                                "Unsupported version: ${packageMetadata.versionName}",
                            )
                        }
                    }
                },
            ),
        )
    }
