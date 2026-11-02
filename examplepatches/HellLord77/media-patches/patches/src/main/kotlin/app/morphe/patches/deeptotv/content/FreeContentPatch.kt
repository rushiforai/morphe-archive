package app.morphe.patches.deeptotv.content

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
val freeContentPatch =
    rawResourcePatch(
        name = "Free content",
        description = "Marks content as free.",
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
                                // content_access -> id
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0x9000 -> ADD             R2,
                                        // R5, #0x2000
                                        // LDR             R2, [R2,#0x89B] -> LDR             R2,
                                        // [R2,#0x483]
                                        """
                                            09 2a 85 e2
                                            9b 28 92 e5
                                        """ asPatternTo """
                                            02 2a 85 e2
                                            83 24 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x11,LSL#12 -> NOP
                                        // LDR             X2, [X2,#0x430]       -> LDR
                                        // X2, [X2,#0x4814]
                                        """
                                            62 47 40 91
                                            42 18 42 f9
                                        """ asPatternTo """
                                            1f 20 03 d5
                                            62 0f 64 f9
                                        """ inFile lib
                                    }

                                    else -> {}
                                }

                                // package:core_models/src/content_model.dart ->
                                // ContentModel.fromJson
                                // ContentAccess.unspecified -> ContentAccess.free
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             LR, R5, #0x9000 -> ADD             LR,
                                        // R5, #0x12000
                                        // LDR             LR, [LR,#0x8A7] -> LDR             LR,
                                        // [LR,#0x4D3]
                                        """
                                            09 ea 85 e2
                                            a7 e8 9e e5
                                        """ asPatternTo """
                                            12 ea 85 e2
                                            d3 e4 9e e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {}

                                    else -> {
                                        // ADD             X16, X27, #0x11,LSL#12 -> ADD
                                        // X16, X27, #0x21,LSL#12
                                        // LDR             X16, [X16,#0x448]      -> LDR
                                        // X16, [X16,0x540]
                                        """
                                            70 47 40 91
                                            10 26 42 f9
                                        """ asPatternTo """
                                            70 87 40 91
                                            10 a2 42 f9
                                        """ inFile lib
                                    }
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
