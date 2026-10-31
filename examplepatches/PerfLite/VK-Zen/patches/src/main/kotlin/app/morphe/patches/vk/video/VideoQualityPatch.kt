package app.morphe.patches.vk.video

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.vk.shared.Constants.COMPATIBILITY_VK

private const val EXTENSION_CLASS = "Lapp/morphe/extension/vk/video/VideoQualityHelper;"

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
    description = "Automatically applies the user's preferred video playback quality (1080p, 720p, 480p, 360p) instead of falling back to Auto adaptive bitrate.",
    default = true
) {
    compatibleWith(COMPATIBILITY_VK)

    extendWith("extensions/vk.mpe")

    execute {
        OneVideoPlayerQualityExtCFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0, p1 }, $EXTENSION_CLASS->getPreferredQuality(Ljava/lang/Object;I)I
                    move-result p1
                """
            )
        }

        OneVideoPlayerQualityExtAFingerprint.method.apply {
            addInstructions(
                0,
                """
                    invoke-static { p0 }, $EXTENSION_CLASS->getForcedQualityDisplay(Ljava/lang/Object;)Ljava/lang/Integer;
                    move-result-object v0
                    if-eqz v0, :cond_original
                    return-object v0
                    :cond_original
                """
            )
        }
    }
}
