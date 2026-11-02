package app.morphe.patches.deeptotv.ad

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.rawResourcePatch
import app.morphe.patcher.resource.CpuArchitecture
import app.morphe.patches.all.library.keepArmNativeLibraryPatch
import app.morphe.patches.all.misc.hex.hexPatch
import app.morphe.patches.deeptotv.shared.Constants.COMPATIBILITY_DEEPTOTV
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
        compatibleWith(COMPATIBILITY_DEEPTOTV)

        dependsOn(
            keepArmNativeLibraryPatch,
            extractMetadataPatch,
            hexPatch(
                block = {
                    when (packageMetadata.versionCode.toInt()) {
                        204 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:core_models/src/content_model.dart ->
                                // ContentModel.fromJson
                                // ad_campaign -> ads
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        """
                                            09 2a 85 e2
                                            13 29 92 e5
                                        """ asPatternTo """
                                            0d 2a 85 e2
                                            7b 26 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x11,LSL#12 -> ADD
                                        // X2, X27, #0x18,LSL#12
                                        // LDR             X2, [X2,#0x520]       -> LDR
                                        // X2, [X2,#0xB48]
                                        """
                                            62 47 40 91
                                            42 90 42 f9
                                        """ asPatternTo """
                                            62 63 40 91
                                            42 a4 45 f9
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
