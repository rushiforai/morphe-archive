package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val BASE_VIDEO_FRAGMENT = "Lcom/ss/android/ugc/aweme/tv/base/BaseVideoFragment;"
private const val MAIN_TV_ACTIVITY = "Lcom/ss/android/ugc/aweme/tv/feed/MainTvActivity;"
private const val BACKGROUND_PLAY = "Lapp/template/extension/extension/BackgroundPlay;"
private const val BACKGROUND_PLAY_MENU = "Lapp/template/extension/extension/BackgroundPlayMenu;"

private const val MORE = "Lcom/ss/android/ugc/aweme/tv/feed/fragment/moremenu/"
private const val MENU_ITEM = "${MORE}a;"
private const val MENU_HOLDER = "${MORE}b\$a;"
private const val MORE_FRAGMENT = "${MORE}MoreMenuFragmentV2;"
private const val MENU_OBSERVERS = "${MORE}MoreMenuFragmentV2\$b;"
private const val MENU_LIST = "Ljava/util/List;"

/** Adds SmartTube-style background playback with an optional audio-only mode. */
@Suppress("unused")
val backgroundPlaybackPatch = bytecodePatch(
    name = "Play in background",
    description = "Adds a More-pane Off / Only audio choice that keeps the current post playing when the TV app is backgrounded.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        val baseVideoFragment = mutableClassDefBy(BASE_VIDEO_FRAGMENT)

        baseVideoFragment.methods.first {
            it.name == "onPauseInternal" && it.parameterTypes.isEmpty()
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $BACKGROUND_PLAY->shouldKeepPlaying(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :continue
                return-void
            """.trimIndent(),
            ExternalLabel("continue", 0),
        )

        baseVideoFragment.methods.first {
            it.name == "rePlayOnResume" && it.parameterTypes.isEmpty()
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $BACKGROUND_PLAY->skipReplayOnResume(Ljava/lang/Object;)Z
                move-result v0
                if-eqz v0, :continue
                return-void
            """.trimIndent(),
            ExternalLabel("continue", 0),
        )

        val activity = mutableClassDefBy(MAIN_TV_ACTIVITY)
        val lifecycle = mapOf(
            "onPause" to "onActivityPause",
            "onResume" to "onActivityResume",
            "onStop" to "onActivityStop",
            "onDestroy" to "onActivityDestroy",
        )
        for ((method, call) in lifecycle) {
            activity.methods.first { it.name == method && it.parameterTypes.isEmpty() }
                .addInstructions(
                    0,
                    "invoke-static {p0}, $BACKGROUND_PLAY->$call(Landroid/app/Activity;)V",
                )
        }

        // Same three More-pane hooks as PlaybackSpeedPatch.kt.
        val observers = mutableClassDefBy(MENU_OBSERVERS).methods
        observers.first {
            it.name == "a" && it.parameterTypes == listOf(MORE_FRAGMENT, MENU_LIST)
        }.addInstructions(
            0,
            "invoke-static {p1}, $BACKGROUND_PLAY_MENU->addToMenu(Ljava/lang/Object;)V",
        )

        mutableClassDefBy(MENU_HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(MENU_ITEM)
        }.addInstructions(
            0,
            "invoke-static {p0, p1}, $BACKGROUND_PLAY_MENU->bindRow(Ljava/lang/Object;Ljava/lang/Object;)V",
        )
    }
}
