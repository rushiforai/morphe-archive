package app.morphe.patches.vkvideo.video

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.Option
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.stringOption
import app.morphe.patches.vkvideo.shared.Constants.COMPATIBILITY_VK_VIDEO

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vkvideo/video/VideoQualityHelper;"

// The option value travels in the method name: the hooked methods have no guaranteed free register
// to hold a string constant.
private val qualitySuffixes = mapOf(
    "auto" to "Auto",
    "1080" to "1080",
    "720" to "720",
    "480" to "480",
    "360" to "360",
)

// OneVideoPlayerQualityExt
// c: sets player quality, receives (OneVideoPlayer, int)
internal object OneVideoPlayerQualityExtCFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "OneVideoPlayerQualityExt.kt" },
    returnType = "V",
    parameters = listOf("Lone/video/player/OneVideoPlayer;", "I")
)

// a: retrieves player quality, receives (OneVideoPlayer) -> Integer
internal object OneVideoPlayerQualityExtAFingerprint : Fingerprint(
    custom = { _, classDef -> classDef.sourceFile == "OneVideoPlayerQualityExt.kt" && !classDef.type.contains("$") },
    returnType = "Ljava/lang/Integer;",
    parameters = listOf("Lone/video/player/OneVideoPlayer;")
)

@Suppress("unused")
val videoQualityPatch = bytecodePatch(
    name = "Video quality preference",
    description = "Plays videos at the selected resolution instead of falling back to Auto adaptive bitrate, and shows that resolution in the player quality menu.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK_VIDEO)

    extendWith("extensions/vkvideo.mpe")

    val qualityOption: Option<String> = stringOption(
        key = "quality",
        default = "1080",
        values = mapOf(
            "auto" to "Auto (player default)",
            "1080" to "1080p Full HD",
            "720" to "720p HD",
            "480" to "480p",
            "360" to "360p",
        ),
        title = "Preferred quality",
        description = "Resolution applied when a video starts. A quality picked manually in the player is kept.",
        required = true,
    ) { it == null || qualitySuffixes.containsKey(it) }

    execute {
        val suffix = qualitySuffixes[qualityOption.value] ?: "1080"

        OneVideoPlayerQualityExtCFingerprint.methodOrNull?.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->getPreferredQuality$suffix(Ljava/lang/Object;I)I
                    move-result p1
                """
            )
        }

        // In Auto mode the display hook always returns null, and writing its result into v0 would
        // clobber the player reference the original body still needs, so the hook is only added
        // when a resolution is actually forced.
        if (suffix != "Auto") {
            OneVideoPlayerQualityExtAFingerprint.methodOrNull?.apply {
                addInstructions(
                    0,
                    """
                        invoke-static { p0 }, $EXTENSION_CLASS->getForcedQualityDisplay$suffix(Ljava/lang/Object;)Ljava/lang/Integer;
                        move-result-object v0
                        if-eqz v0, :cond_original
                        return-object v0
                        :cond_original
                    """
                )
            }
        }

        println("VideoQualityPatch: forcing $suffix")
    }
}
