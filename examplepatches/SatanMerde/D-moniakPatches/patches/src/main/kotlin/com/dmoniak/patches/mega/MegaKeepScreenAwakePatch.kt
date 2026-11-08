package com.dmoniak.patches.mega

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.AccessFlags
import com.dmoniak.patches.shared.Constants.COMPATIBILITY_MEGA
import com.dmoniak.patches.shared.cloneMethodWithAdditionalRegisters
import java.util.logging.Logger

@Suppress("unused")
val megaKeepScreenAwakePatch = bytecodePatch(
    name = "Keep Screen Awake During Transfers & Media - MEGA",
    description = "Keeps the device screen turned on during active file/folder upload and download transfers, camera auto-uploads, and audio/video playback in MEGA, preventing transfers from stalling when the device enters sleep mode.",
) {
    compatibleWith(COMPATIBILITY_MEGA)

    execute {
        val logger = Logger.getLogger(this::class.java.name)
        executeMegaKeepScreenAwakeLogic(logger)
    }
}

fun BytecodePatchContext.executeMegaKeepScreenAwakeLogic(logger: Logger) {
    logger.info("Executing Keep Screen Awake patch for MEGA (mega.privacy.android.app)...")
    var hookedActivities = 0

    val targetActivities = setOf(
        "Lmega/privacy/android/app/presentation/videoplayer/VideoPlayerActivity;",
        "Lmega/privacy/android/app/mediaplayer/AudioPlayerActivity;",
        "Lmega/privacy/android/app/presentation/settings/transfers/TransfersSettingsActivity;",
        "Lmega/privacy/android/app/presentation/filestorage/FileStorageActivity;",
        "Lmega/privacy/android/app/presentation/settings/camerauploads/SettingsCameraUploadsActivity;",
        "Lmega/privacy/android/app/presentation/transfers/preview/LoadingPreviewActivity;"
    )

    classDefForEach { classDef ->
        val type = classDef.type
        val tl = type.lowercase()
        if (tl.startsWith("landroidx/") || tl.startsWith("lkotlin/") || tl.startsWith("ljava/")) {
            return@classDefForEach
        }

        val isTarget = type in targetActivities || (
            tl.contains("mega") && (
                tl.contains("videoplayeractivity") ||
                tl.contains("audioplayeractivity") ||
                tl.contains("transferssettingsactivity") ||
                tl.contains("filestorageactivity")
            ) && !type.contains("$")
        )

        if (isTarget) {
            for (method in classDef.methods.toList()) {
                if (method.implementation == null) continue
                val isStatic = AccessFlags.STATIC.isSet(method.accessFlags)
                val mName = method.name
                val pTypes = method.parameterTypes

                if (!isStatic && mName == "onResume" && pTypes.isEmpty()) {
                    try {
                        val cloned = cloneMethodWithAdditionalRegisters(method, 2)
                        cloned.addInstructions(
                            0,
                            """
                            invoke-virtual/range {p0 .. p0}, Landroid/app/Activity;->getWindow()Landroid/view/Window;
                            move-result-object v0
                            if-eqz v0, :cond_keep_awake
                            const/16 v1, 0x80
                            invoke-virtual {v0, v1}, Landroid/view/Window;->addFlags(I)V
                            :cond_keep_awake
                            """.trimIndent()
                        )
                        hookedActivities++
                        logger.fine("[MEGA Keep Screen Awake] Injected FLAG_KEEP_SCREEN_ON into $type->$mName")
                    } catch (e: Exception) {
                        logger.fine("[MEGA Keep Screen Awake] Skip injection into $type->$mName: ${e.message}")
                    }
                }
            }
        }
    }

    logger.info("[MEGA Keep Screen Awake] Total activities configured: $hookedActivities")
}
