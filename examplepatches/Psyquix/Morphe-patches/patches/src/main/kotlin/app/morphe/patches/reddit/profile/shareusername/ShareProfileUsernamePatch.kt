package app.morphe.patches.reddit.profile.shareusername

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.booleanOption
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.reddit.shared.Constants.COMPATIBILITY_REDDIT

private const val EXTENSION_CLASS =
    "Lapp/morphe/extension/reddit/profile/ShareProfileUsername;"

@Suppress("unused")
val shareProfileUsernamePatch = bytecodePatch(
    name = "Share profile as username",
    description = "Shares user profile links as username only."
) {
    compatibleWith(COMPATIBILITY_REDDIT)

    val enabled by booleanOption(
        "Share profile as username",
        default = true
    )

    extendWith("extensions/extension.mpe")

    execute {
        if (enabled != true) return@execute

        // Shorten profile links to the bare username and return it directly:
        // the formatter body below appends tracking params (?utm_*) to
        // whatever it receives, so falling through would re-dirty the name.
        // Non-profile links fall through untouched.
        ShareProfileLinkFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $EXTENSION_CLASS->shortenProfileLink(Ljava/lang/String;)Ljava/lang/String;
                move-result-object v0
                invoke-static {p0, v0}, $EXTENSION_CLASS->wasShortened(Ljava/lang/String;Ljava/lang/String;)Z
                move-result v1
                if-eqz v1, :continue
                return-object v0
                :continue
                nop
            """
        )
    }
}
