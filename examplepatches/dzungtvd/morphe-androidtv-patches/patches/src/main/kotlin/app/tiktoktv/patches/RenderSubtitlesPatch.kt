package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val BASE_VIDEO_FRAGMENT = "Lcom/ss/android/ugc/aweme/tv/base/BaseVideoFragment;"
private const val AWE_ME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val TT_VIDEO_ENGINE = "Lcom/ss/ttvideoengine/TTVideoEngine;"
private const val SUBTITLES = "Lapp/template/extension/extension/Subtitles;"
private const val SUBTITLES_MENU = "Lapp/template/extension/extension/SubtitlesMenu;"

private const val MORE = "Lcom/ss/android/ugc/aweme/tv/feed/fragment/moremenu/"
private const val MENU_ITEM = "${MORE}a;"
private const val MENU_HOLDER = "${MORE}b\$a;"
private const val MORE_FRAGMENT = "${MORE}MoreMenuFragmentV2;"
private const val MENU_OBSERVERS = "${MORE}MoreMenuFragmentV2\$b;"
private const val MENU_LIST = "Ljava/util/List;"

/** Renders TikTok Lite captions and adds the subtitle controls. */
@Suppress("unused")
val renderSubtitlesPatch = bytecodePatch(
    name = "Render Lite subtitles",
    description = "Adds the subtitles button to the player's floating row and draws the post's captions over the video, with SmartTube-style presets, size and position settings in the More pane.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        val playVideo = mutableClassDefBy(BASE_VIDEO_FRAGMENT).methods.first {
            it.name == "playVideo" && it.parameterTypes == listOf(AWE_ME)
        }

        // Both registers are parameters of an instance method, so no register is claimed.
        playVideo.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $SUBTITLES->onPlay(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val engine = mutableClassDefBy(TT_VIDEO_ENGINE)
        for (name in listOf("getCurrentPlaybackTime", "getCurrentPlaybackTimeAsync")) {
            val getter = engine.methods.first { it.name == name && it.parameterTypes.isEmpty() }

            getter.addInstructions(
                0,
                """
                    invoke-static {p0}, $SUBTITLES->noteEngine(Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }

        val observers = mutableClassDefBy(MENU_OBSERVERS).methods
        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_LIST)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $SUBTITLES_MENU->addToMenu(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        mutableClassDefBy(MENU_HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(MENU_ITEM)
        }.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $SUBTITLES_MENU->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_ITEM)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $SUBTITLES_MENU->clicked(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
