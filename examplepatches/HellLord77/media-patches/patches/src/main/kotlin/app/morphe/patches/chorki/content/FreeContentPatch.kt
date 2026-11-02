package app.morphe.patches.chorki.content

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
val freeContentPatch =
    rawResourcePatch(
        name = "Free content",
        description = "Marks content as free.",
        default = true,
    ) {
        compatibleWith(COMPATIBILITY_CHORKI)

        dependsOn(
            keepArmNativeLibraryPatch,
            extractMetadataPatch,
            hexPatch(block = {
                when (packageMetadata.versionCode.toInt()) {
                    311 -> {
                        cpuArchitectures.forEach { arch ->
                            var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                            // package:chorki/data/models/content_model.dart ->
                            // ContentModel.toEntity
                            // content_access -> content_access_token
                            when (arch) {
                                CpuArchitecture.ARMEABI_V7A -> {
                                    // ADD             R0, R5, #0xB000
                                    // LDR             R2, [R2,#0x877] -> LDR             R2,
                                    // [R2,#0x87F]
                                    """
                                        0b 2a 85 e2
                                        77 28 92 e5
                                    """ asPatternTo """
                                        0b 2a 85 e2
                                        7f 28 92 e5
                                    """ inFile lib
                                }

                                CpuArchitecture.ARM64_V8A -> {
                                    // ADD             X0, X27, #0x15,LSL#12
                                    // LDR             X0, [X0,#0xA40]       -> LDR
                                    // X0, [X0,#0xA50]
                                    """
                                        62 57 40 91
                                        42 20 45 f9
                                    """ asPatternTo """
                                        62 57 40 91
                                        42 28 45 f9
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
            }),
        )
    }
