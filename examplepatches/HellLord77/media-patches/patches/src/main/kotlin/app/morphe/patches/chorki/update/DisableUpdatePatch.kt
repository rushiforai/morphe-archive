package app.morphe.patches.chorki.update

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
val disableUpdatePatch =
    rawResourcePatch(
        name = "Disable Update",
        description = "Disables forced update.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_CHORKI)

        @Suppress("SpreadOperator")
        dependsOn(
            keepArmNativeLibraryPatch,
            extractMetadataPatch,
            *Array(4) {
                hexPatch(block = {
                    when (packageMetadata.versionCode.toInt()) {
                        311 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:chorki/data/models/settings_model.json ->
                                // SettingsModel.fromJson
                                // min_app_version -> social_link
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0xD000
                                        // LDR             R2, [R2,#0x967] -> LDR
                                        // R2, [R2,#0x947]
                                        """
                                            0d 2a 85 e2
                                            67 29 92 e5
                                        """ asPatternTo """
                                            0d 2a 85 e2
                                            47 29 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x19,LSL#12
                                        // LDR             X2, [X2,#0XBA8]       -> LDR
                                        //    X0, [X0,#0XB68]
                                        """
                                            62 67 40 91
                                            42 d4 45 f9
                                        """ asPatternTo """
                                            62 67 40 91
                                            42 b4 45 f9
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
                })
            },
        )
    }
