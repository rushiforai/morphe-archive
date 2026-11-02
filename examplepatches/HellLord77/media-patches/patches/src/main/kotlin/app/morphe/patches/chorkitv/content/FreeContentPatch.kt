package app.morphe.patches.chorkitv.content

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
val freeContentPatch =
    rawResourcePatch(
        name = "Free content",
        description = "Marks content as free.",
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

                                // package:goplay_tv/data/models/content_model.dart ->
                                // ContentModel.toEntity
                                // content_access -> id
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0x6000
                                        // LDR             R2, [R2,#0x93F]  -> LDR             R2,
                                        // [R2,#0x90B]
                                        """
                                            06 2a 85 e2
                                            3f 29 92 e5
                                        """ asPatternTo """
                                            06 2a 85 e2
                                            0b 29 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X2, X27, #0xB,LSL#12
                                        // LDR             X2, [X2,#0xDB0]      -> LDR
                                        // X2, [X2,#0xD48]
                                        """
                                            62 2f 40 91
                                            42 d8 46 f9
                                        """ asPatternTo """
                                            62 2f 40 91
                                            42 a4 46 f9
                                        """ inFile lib
                                    }

                                    else -> {}
                                }
                            }
                        }

                        288 -> {
                            cpuArchitectures.forEach { arch ->
                                var lib = "$NATIVE_LIBRARY_DIRECTORY/${arch.arch}/libapp.so"

                                // package:goplay_tv/data/models/content_model.dart ->
                                // ContentModel.toEntity
                                // content_access -> id
                                when (arch) {
                                    CpuArchitecture.ARMEABI_V7A -> {
                                        // ADD             R2, R5, #0x5000
                                        // LDR             R2, [R2,#0x1E3]  -> LDR             R2,
                                        // [R2,#0x1AF]
                                        """
                                            05 2a 85 e2
                                            e3 21 92 e5
                                        """ asPatternTo """
                                            05 2a 85 e2
                                            af 21 92 e5
                                        """ inFile lib
                                    }

                                    CpuArchitecture.ARM64_V8A -> {
                                        // ADD             X0, X27, #8,LSL#12
                                        // LDR             X0, [X0,#0xF00]    -> LDR             X0,
                                        // [X0,#0xE98]
                                        """
                                            62 23 40 91
                                            42 80 47 f9
                                        """ asPatternTo """
                                            62 23 40 91
                                            42 4c 47 f9
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
