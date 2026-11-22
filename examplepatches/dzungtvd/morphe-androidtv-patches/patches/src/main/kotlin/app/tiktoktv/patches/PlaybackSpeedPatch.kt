package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val BASE_VIDEO_FRAGMENT = "Lcom/ss/android/ugc/aweme/tv/base/BaseVideoFragment;"
private const val TT_VIDEO_ENGINE = "Lcom/ss/ttvideoengine/TTVideoEngine;"
private const val PLAYBACK_SPEED = "Lapp/template/extension/extension/PlaybackSpeed;"
private const val PLAYBACK_SPEED_MENU = "Lapp/template/extension/extension/PlaybackSpeedMenu;"

private const val MORE = "Lcom/ss/android/ugc/aweme/tv/feed/fragment/moremenu/"
private const val MENU_ITEM = "${MORE}a;"
private const val MENU_HOLDER = "${MORE}b\$a;"
private const val MORE_FRAGMENT = "${MORE}MoreMenuFragmentV2;"
private const val MENU_OBSERVERS = "${MORE}MoreMenuFragmentV2\$b;"
private const val MENU_LIST = "Ljava/util/List;"

/** Adds TikTok Lite's playback-speed choices to the More pane. */
@Suppress("unused")
val playbackSpeedPatch = bytecodePatch(
    name = "Playback speed",
    description = "Adds 2x, 1.5x, 1x and 0.5x playback to the player's More pane, applied with the same TTVideoEngine.setPlaybackParams call TikTok Lite uses.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        val playVideo = mutableClassDefBy(BASE_VIDEO_FRAGMENT).methods.first {
            it.name == "playVideo" && it.parameterTypes == listOf(
                "Lcom/ss/android/ugc/aweme/feed/model/Aweme;",
            )
        }

        // Both registers are parameters of an instance method, so no register is claimed.
        playVideo.addInstructions(
            0,
            """
                invoke-static {p0}, $PLAYBACK_SPEED->onPlay(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val engine = mutableClassDefBy(TT_VIDEO_ENGINE)
        for (name in listOf("getCurrentPlaybackTime", "getCurrentPlaybackTimeAsync")) {
            val getter = engine.methods.first { it.name == name && it.parameterTypes.isEmpty() }

            getter.addInstructions(
                0,
                """
                    invoke-static {p0}, $PLAYBACK_SPEED->noteEngine(Ljava/lang/Object;)V
                """.trimIndent(),
            )
        }

        val observers = mutableClassDefBy(MENU_OBSERVERS).methods
        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_LIST)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $PLAYBACK_SPEED_MENU->addToMenu(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        mutableClassDefBy(MENU_HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(MENU_ITEM)
        }.addInstructions(
            0,
            """
                invoke-static {p0, p1}, $PLAYBACK_SPEED_MENU->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_ITEM)
        }.addInstructions(
            0,
            """
                invoke-static {p1}, $PLAYBACK_SPEED_MENU->clicked(Ljava/lang/Object;)V
            """.trimIndent(),
        )
    }
}
