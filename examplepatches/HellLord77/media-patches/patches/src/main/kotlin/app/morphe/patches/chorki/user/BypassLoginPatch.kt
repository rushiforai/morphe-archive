package app.morphe.patches.chorki.user

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.all.library.keepArmNativeLibraryPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.chorki.shared.Constants.COMPATIBILITY_CHORKI
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
        compatibleWith(COMPATIBILITY_CHORKI)

        dependsOn(
            keepArmNativeLibraryPatch,
            extractMetadataPatch,
            hexPatch(
                block = {
                    when (packageMetadata.versionCode.toInt()) {
                        311 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:chorki/data/models/settings_model.json ->
                                // SettingsModel.fromJson
                                // login_required -> restrict_vpn
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0xD000
                                        // LDR             R2, [R2,#0x9D7] -> LDR             R2,
                                        // [R2,#0x917]
                                        """
                                            0d 2a 85 e2
                                            d7 29 92 e5
                                        """ asPatternTo """
                                            0d 2a 85 e2
                                            17 29 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x19,LSL#12
                                        // LDR             X2, [X2,#0xC88]       -> LDR
                                        // X2, [X2,#0xB08]
                                        """
                                            62 67 40 91
                                            42 44 46 f9
                                        """ asPatternTo """
                                            62 67 40 91
                                            42 84 45 f9
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
