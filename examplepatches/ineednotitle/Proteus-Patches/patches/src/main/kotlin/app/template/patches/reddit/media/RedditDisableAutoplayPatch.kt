package app.template.patches.reddit.media

import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY
import app.template.patches.shared.clearBody
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions

/**
 * Disable Reddit video autoplay — Reddit (com.reddit.frontpage)
 *
 * Reddit's own settings use case (`RedditVideoSettingsUseCase`, obfuscated as
 * `Lcom/reddit/domain/media/usecase/f;`) maps the user's "autoplay video
 * previews" preference to `VideoAutoPlaySettingsFlag`.  The patch makes that
 * method always return `NEVER`, so feeds and media cards require an explicit
 * tap before playback.  This is scoped to Reddit and does not touch other
 * apps' ExoPlayer instances.  Off by default.
 *
 * Verified against Reddit 2026.42.0 (the method returns NEVER for the
 * "never" accessibility option and ALWAYS by default).
 */
private const val AUTO_PLAY_FLAG =
    "Lcom/reddit/domain/media/model/VideoAutoPlaySettingsFlag;"

private const val AUTO_PLAY_NEVER =
    "$AUTO_PLAY_FLAG->NEVER:$AUTO_PLAY_FLAG"

@Suppress("unused")
val redditDisableVideoAutoplayPatch = bytecodePatch(
    name = "Disable Reddit video autoplay",
    description = "Forces Reddit's video autoplay preference to 'Never' so videos only play " +
        "after a tap. Scoped to Reddit; off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    execute {
        val method = app.morphe.patcher.Fingerprint(
            definingClass = "Lcom/reddit/domain/media/usecase/f;",
            name = "a",
            returnType = AUTO_PLAY_FLAG,
            parameters = emptyList(),
        ).method

        method.clearBody()
        method.addInstructions(
            0,
            """
                sget-object v0, $AUTO_PLAY_NEVER
                return-object v0
            """.trimIndent(),
        )
    }
}
