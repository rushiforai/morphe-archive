package app.morphe.patches.deeptoplay.ad

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.all.library.keepArmNativeLibraryPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.deeptoplay.shared.Constants.COMPATIBILITY_DEEPTOPLAY
import app.morphe.patches.shared.Constants.NATIVE_LIBRARY_DIRECTORY
import app.morphe.patches.shared.patches.cpuArchitectures
import app.morphe.patches.shared.patches.extractMetadataPatch
import app.morphe.patches.shared.patches.packageMetadata

@Suppress("unused")
val hideAdsPatch =
    rawResourcePatch(
        name = "Hide ads",
        description = "Hides ads from stream.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_DEEPTOPLAY)

        dependsOn(
            keepArmNativeLibraryPatch,
            extractMetadataPatch,
            hexPatch(
                block = {
                    when (packageMetadata.versionCode.toInt()) {
                        2230 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:core_models/src/content_model.dart ->
                                // ContentModel.fromJson
                                // ad_campaign -> ads
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0xB000 -> ADD             R2,
                                        // R5, #0x1000
                                        // LDR             R2, [R2,#3]     -> LDR             R2,
                                        // [R2,#1A3]
                                        """
                                            0b 2a 85 e2
                                            03 20 92 e5
                                        """ asPatternTo """
                                            01 2a 85 e2
                                            a3 21 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x14,LSL#12 -> ADD
                                        // X2, X27, #0x1D,LSL#12
                                        // LDR             X2, [X2,#0x108]       -> LDR
                                        // X2, [X2,#0xF50]
                                        """
                                            62 53 40 91
                                            42 84 40 f9
                                        """ asPatternTo """
                                            62 77 40 91
                                            42 a8 47 f9
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
