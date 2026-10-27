package io.github.sabopura.morphe.patches.youtube.danmaku

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.intOption
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ThreeRegisterInstruction
import io.github.sabopura.morphe.patches.youtube.Constants.YOUTUBE
import io.github.sabopura.morphe.patches.youtube.shared.enableFeature
import io.github.sabopura.morphe.patches.youtube.shared.playerHooksPatch
import io.github.sabopura.morphe.patches.youtube.shared.replaceExtensionConstant
import java.util.logging.Logger

private const val EXTENSION_CLASS =
    "Lio/github/sabopura/morphe/extension/youtube/danmaku/DanmakuController;"
private val logger = Logger.getLogger("Morphe.YouTube.Danmaku")

@Suppress("unused")
val danmakuPatch = bytecodePatch(
    name = "Danmaku comments",
    description = "Flows regular comments, live chat, and chat replays over videos like NicoNico/bilibili, " +
        "with native in-app settings, NG words, and no API key.",
    default = true,
) {
    dependsOn(playerHooksPatch, danmakuResourcePatch)
    compatibleWith(YOUTUBE)

    val fontSizeOption = intOption(
        key = "danmaku_font_size",
        default = 22,
        title = "Font size",
        description = "Danmaku text size in sp (12-48).",
        required = true,
    ) { value -> value != null && value in 12..48 }

    val opacityOption = intOption(
        key = "danmaku_opacity",
        default = 90,
        title = "Opacity",
        description = "Danmaku opacity percentage (20-100).",
        required = true,
    ) { value -> value != null && value in 20..100 }

    val durationOption = intOption(
        key = "danmaku_duration",
        default = 8,
        title = "Travel duration",
        description = "Seconds for a comment to cross the player (3-20).",
        required = true,
    ) { value -> value != null && value in 3..20 }

    val laneCoverageOption = intOption(
        key = "danmaku_lane_coverage",
        default = 65,
        title = "Vertical coverage",
        description = "Percentage of player height available to comments (20-100).",
        required = true,
    ) { value -> value != null && value in 20..100 }

    val maxCommentsOption = intOption(
        key = "danmaku_max_comments",
        default = 200,
        title = "Maximum comments",
        description = "Maximum comments retained in memory for the current video (20-500).",
        required = true,
    ) { value -> value != null && value in 20..500 }

    val maxLengthOption = intOption(
        key = "danmaku_max_length",
        default = 100,
        title = "Maximum characters",
        description = "First-run limit for excluding long comments (20-300).",
        required = true,
    ) { value -> value != null && value in 20..300 }

    extendWith("extensions/youtube.mpe")

    execute {
        // Start one cancellable background fetch session for the visible video.
        // Explicit class scope also avoids the patcher's classFingerprint overload
        // throwing from matchOrNull when only the legacy child no longer matches.
        val videoIdClass = VideoIdParentFingerprint.originalClassDef
        val videoIdMatch = VideoIdFingerprint.matchOrNull(videoIdClass)
            ?: DelegatingVideoIdFingerprint.matchAll(videoIdClass, 1..1).single().also { match ->
                val writer = match.instructionMatches[2].getMethodCalled()
                check(writer.definingClass == match.method.definingClass && isVideoIdMapWriter(writer)) {
                    "YouTube video id delegate no longer writes its id argument to the player map"
                }
            }
        videoIdMatch.method.apply {
            val index = videoIdMatch.instructionMatches[1].index
            val register = getInstruction<OneRegisterInstruction>(index).registerA
            addInstruction(
                index + 1,
                "invoke-static {v$register}, " +
                    "$EXTENSION_CLASS->setVideoId(Ljava/lang/String;)V",
            )
        }

        // Copy only YouTube's current in-memory account headers. The extension never persists them.
        BuildRequestFingerprint.method.apply {
            val index = indexOfNewUrlRequestBuilder(this)
            check(index >= 0) { "YouTube Cronet request builder call was not found" }
            addInstruction(
                index,
                "invoke-static/range {p1 .. p1}, " +
                    "$EXTENSION_CLASS->captureRequestHeaders(Ljava/util/Map;)V",
            )
        }

        // Capture the full video duration so untimestamped comments can be spread across it.
        VideoLengthFingerprint.method.apply {
            val lengthIndex = VideoLengthFingerprint.instructionMatches.last().index
            val lengthRegister = getInstruction<ThreeRegisterInstruction>(lengthIndex).registerB
            addInstruction(
                lengthIndex,
                "invoke-static {v$lengthRegister, v${lengthRegister + 1}}, " +
                    "$EXTENSION_CLASS->setVideoLength(J)V",
            )
        }

        logger.info("Installed API-key-free background comment, video id, and length hooks")
    }

    finalize {
        enableFeature("danmaku")
        fun replaceConfig(methodName: String, value: Int) =
            replaceExtensionConstant(EXTENSION_CLASS, methodName, value)

        replaceConfig("configFontSizeSp", fontSizeOption.value ?: 22)
        replaceConfig("configOpacityPercent", opacityOption.value ?: 90)
        replaceConfig("configTravelDurationSeconds", durationOption.value ?: 8)
        replaceConfig("configLaneCoveragePercent", laneCoverageOption.value ?: 65)
        replaceConfig("configMaxComments", maxCommentsOption.value ?: 200)
        replaceConfig("configMaxLength", maxLengthOption.value ?: 100)
    }
}
