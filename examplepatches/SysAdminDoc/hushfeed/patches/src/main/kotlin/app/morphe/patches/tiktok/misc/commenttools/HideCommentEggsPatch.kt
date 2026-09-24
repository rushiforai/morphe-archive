/*
 * Copyright 2026 Hushfeed contributors
 * https://github.com/SysAdminDoc/hushfeed
 *
 * Built on icysymmetra/tiktok-patches-for-morphe (GPL-3.0).
 */
package app.morphe.patches.tiktok.misc.commenttools

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.tiktok.misc.extension.sharedExtensionPatch
import app.morphe.patches.tiktok.misc.settings.SettingsStatusLoadFingerprint
import app.morphe.patches.tiktok.misc.settings.settingsPatch

private const val EXTENSION_CLASS_DESCRIPTOR = "Lapp/morphe/extension/tiktok/comment/CommentTools;"
private const val COMMENT_SURPRISE = "Lcom/ss/android/ugc/aweme/comment/model/CommentSurprise;"

/**
 * The brand animation that plays over the comment sheet when a comment matches a campaign's
 * trigger. TikTok's server answers such a comment, or a comment page, with a CommentSurprise,
 * and every way the sheet shows one reads it out of a CommentSurpriseStruct: the publish view
 * model and the list helper that start the animation, and the observer that plays it. The
 * struct's one constructor is the only writer of that field, and every read checks it for null
 * straight away (CommentSurpriseAnchorsTest), so a constructor handed null leaves nothing to
 * play. The extension does that only for a surprise a keyword set off: TikTok's own first-comment
 * celebration comes through the same struct and stays. Both classes keep their real names on
 * every fixture.
 *
 * <p>Through 0.58.0 this hooked the method that names comment_easter_egg_trigger. That method
 * only reports the animation to analytics, and its callers start the animation after it
 * returns, so returning from it early left the animation playing.
 */
private object CommentSurpriseStructFingerprint : Fingerprint(
    definingClass = "Lcom/ss/android/ugc/aweme/comment/model/CommentSurpriseStruct;",
    name = "<init>",
    returnType = "V",
    parameters = listOf("Lcom/ss/android/ugc/aweme/comment/model/Comment;", COMMENT_SURPRISE, "Z"),
)

@Suppress("unused")
val hideCommentEggsPatch = bytecodePatch(
    name = "Hide comment popup ads",
    description = "Stops the brand animation that plays over the comment sheet when a comment " +
        "matches an advertiser's trigger word or emoji. Switch: Hushfeed settings > Comments.",
    default = false,
) {
    category("Comments")
    dependsOn(settingsPatch, sharedExtensionPatch)
    compatibleWith(*AppCompatibilities.tiktok4703())

    execute {
        SettingsStatusLoadFingerprint.method.addInstruction(
            0,
            "invoke-static {}, " +
                "Lapp/morphe/extension/tiktok/settings/SettingsStatus;->enableHideCommentEggs()V",
        )

        // p2 is the surprise. Replacing it before the super call is allowed: only `this` has to
        // wait for the constructor it calls.
        CommentSurpriseStructFingerprint.method.addInstructions(
            0,
            """
                invoke-static/range {p2 .. p2},$EXTENSION_CLASS_DESCRIPTOR->commentSurprise(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object p2
                check-cast p2, $COMMENT_SURPRISE
            """,
        )
    }
}
