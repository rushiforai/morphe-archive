package com.dmoniak.patches.moises

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.hungryshark.util.findMutableMethodOf
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MOISES
import java.util.logging.Logger

@Suppress("unused")
val moisesExportSettingsPatch = bytecodePatch(
    name = "High Quality Audio Export & Audio Tools - Moises",
    description = "Bypasses client-side audio bitrate export caps (enabling 320kbps MP3 and WAV export options) and unlocks unlimited audio pitch shift, tempo changes, Smart Metronome, and chord detection in Moises (v2.7.2 recommandée).",
) {
    compatibleWith(COMPATIBILITY_MOISES)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMoisesExportSettingsLogic(logger)
    }
}

fun BytecodePatchContext.executeMoisesExportSettingsLogic(logger: Logger) {
    logger.info("Executing High Quality Audio Export & Audio Tools patch for Moises...")
    var hookedPoints = 0

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()

        // Skip framework and pairip protection classes
        if (
            tl.startsWith("landroid/") ||
            tl.startsWith("lkotlin/") ||
            tl.startsWith("ljava/") ||
            tl.startsWith("lcom/google/") ||
            tl.startsWith("lcom/pairip/")
        ) return@classDefForEach

        val mutableClass by lazy { mutableClassDefBy(classDef) }

        // Specific hooks for Moises v2.7.2 audio tools & upload pipeline:
        // 1. UploadTrackViewModel.e() -> checks if duration exceeds limit
        if (type == "Lai/moises/ui/uploadtrack/UploadTrackViewModel;") {
            for (method in classDef.methods.toList()) {
                if (method.name == "e" && method.returnType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Moises Audio Tools] Hooked UploadTrackViewModel.e() -> false (bypass duration check)")
                    } catch (e: Exception) {
                        logger.fine("[Moises Audio Tools] Failed to hook UploadTrackViewModel.e: ${e.message}")
                    }
                }
            }
        }

        // 2. UserFeatureFlags:
        //    a() -> mobileAdaptPremiumToFree (Z -> false)
        //    b() -> slowerProcessingTime (Z -> false)
        if (type == "Lai/moises/data/model/UserFeatureFlags;") {
            for (method in classDef.methods.toList()) {
                val mName = method.name
                if ((mName == "a" || mName == "b") && method.returnType == "Z") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x0
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Moises Audio Tools] Hooked UserFeatureFlags.${method.name} -> false")
                    } catch (e: Exception) {
                        logger.fine("[Moises Audio Tools] Failed to hook UserFeatureFlags.${method.name}: ${e.message}")
                    }
                }
            }
        }

        for (method in classDef.methods.toList()) {
            if (method.implementation == null) continue
            val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
            val mName = method.name.lowercase()
            val retType = method.returnType
            val pTypes = method.parameterTypes

            // 1. Hook export format / WAV permissions & Audio Tools
            if (!isStatic && pTypes.isEmpty() && retType == "Z") {
                if (
                    mName == "canexportwav" ||
                    mName == "iswavexportenabled" ||
                    mName == "canexporthq" ||
                    mName == "ishighqualityexportallowed" ||
                    mName == "canexportindividualtracks" ||
                    mName == "canexportseparatedtracks" ||
                    mName == "isunlimitedpitchallowed" ||
                    mName == "isunlimitedpitch" ||
                    mName == "iscountinenabled" ||
                    mName == "candetectchords" ||
                    mName == "ischorddetectionenabled" ||
                    mName == "canexportaudio" ||
                    mName == "canexport320kbps" ||
                    mName == "isexportallowed" ||
                    mName == "ishighresolutionaudioenabled" ||
                    mName == "ismetronomeunlocked" ||
                    mName == "ispitchshiftunlocked" ||
                    mName == "istempochangeunlocked" ||
                    mName == "canchangepitch" ||
                    mName == "canchangetempo" ||
                    mName == "isunlimitedtempo"
                ) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Moises Audio Tools] Hooked boolean ${classDef.type}->${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[Moises Audio Tools] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // 2. Hook format check with 1 parameter (e.g. canExportFormat(format))
            if (!isStatic && pTypes.size == 1 && retType == "Z") {
                if (mName == "canexportformat" || mName == "isformatsupported") {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/4 v0, 0x1
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Moises Audio Tools] Hooked 1-param format check ${classDef.type}->${method.name} -> true")
                    } catch (e: Exception) {
                        logger.fine("[Moises Audio Tools] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }

            // 3. Max bitrate getter -> 320 (kbps)
            if (!isStatic && pTypes.isEmpty() && retType == "I") {
                if (
                    mName == "getmaxexportbitrate" ||
                    mName == "getexportqualitybitrate" ||
                    mName == "getaudioqualitybitrate" ||
                    mName == "getmaxbitrate"
                ) {
                    try {
                        val mutableMethod = mutableClass.findMutableMethodOf(method)
                        mutableMethod.addInstructions(
                            0,
                            """
                            const/16 v0, 0x140
                            return v0
                            """.trimIndent()
                        )
                        hookedPoints++
                        logger.info("[Moises Audio Tools] Hooked bitrate ${classDef.type}->${method.name} -> 320 kbps")
                    } catch (e: Exception) {
                        logger.fine("[Moises Audio Tools] Failed to hook ${method.name}: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[Moises Audio Tools] Total audio tools & export hooks applied: $hookedPoints")
}
