package app.morphe.patches.deeptoplay.content

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
val freeContentPatch =
    rawResourcePatch(
        name = "Free content",
        description = "Marks content as free.",
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
                                // content_access -> id
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0xA000 -> ADD             R2,
                                        // R5, #0x5000
                                        // LDR             R2, [R2,#0xF8B] -> LDR             R2,
                                        // [R2,#0x7DB]
                                        """
                                            0a 2a 85 e2
                                            8b 2f 92 e5
                                        """ asPatternTo """
                                            05 2a 85 e2
                                            db 27 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0x14,LSL#12 -> ADD
                                        // X2, X27, #9,LSL#12
                                        // LDR             X2, [X2,#0x18]        -> LDR
                                        // X2, [X2,#0x758]
                                        """
                                            62 53 40 91
                                            42 0c 40 f9
                                        """ asPatternTo """
                                            62 27 40 91
                                            42 ac 43 f9
                                        """ inFile lib
                                    }

                                    else -> {}
                                }

                                // package:core_models/src/content_model.dart ->
                                // ContentModel.fromJson
                                // ContentAccess.unspecified -> ContentAccess.free
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             LR, R5, #0xA000 -> ADD             LR,
                                        // R5, #0x13000
                                        // LDR             LR, [LR,#0xF97] -> LDR             LR,
                                        // [LR,#0x2A3]
                                        """
                                            0a ea 85 e2
                                            97 ef 9e e5
                                        """ asPatternTo """
                                            13 ea 85 e2
                                            a3 e2 9e e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X16, X27, #0x14,LSL#12 -> ADD
                                        // X16, X27, #0x23,LSL#12
                                        // LDR             X16, [X16,#0x30]       -> LDR
                                        // X16, [X16,0x9A0]
                                        """
                                            70 53 40 91
                                            10 1a 40 f9
                                        """ asPatternTo """
                                            70 8f 40 91
                                            10 d2 44 f9
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
