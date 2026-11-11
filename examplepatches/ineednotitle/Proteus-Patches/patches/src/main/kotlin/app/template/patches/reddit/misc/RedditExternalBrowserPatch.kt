package app.template.patches.reddit.misc

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.template.patches.shared.Constants.REDDIT_COMPATIBILITY

/**
 * Open Reddit links in external browser — Reddit (com.reddit.frontpage)
 *
 * Reddit's outbound-link entry point is
 * `RedditInjectableCustomTabsActivityHelper` (obfuscated as
 * `Lcom/reddit/webembed/util/e;`).  The patch injects a guard at the start of
 * its static `openCustomTab` method: `RedditLinkHelper.openExternal(activity,
 * uri)` builds an `ACTION_VIEW` intent and, when the system accepts it,
 * returns from the original method.  If the intent cannot be launched the
 * stock Custom Tab path still runs (fail-safe).  Off by default.
 *
 * Verified against Reddit 2026.42.0.  The anchor is version-specific because
 * the helper class name is obfuscated.
 */
private const val HELPER =
    "Lapp/template/extension/extension/RedditLinkHelper;"

@Suppress("unused")
val redditExternalBrowserPatch = bytecodePatch(
    name = "Open Reddit links in external browser",
    description = "Opens outbound Reddit links in the default external browser instead of " +
        "Reddit's in-app Custom Tab. Falls back to the in-app tab if launching fails. " +
        "Off by default.",
    default = false,
) {
    compatibleWith(REDDIT_COMPATIBILITY)

    extendWith("extensions/extension.mpe")

    execute {
        val openCustomTab = Fingerprint(
            definingClass = "Lcom/reddit/webembed/util/e;",
            name = "c",
            returnType = "V",
            parameters = listOf(
                "Lcom/reddit/webembed/util/e;",
                "L",
                "Landroid/net/Uri;",
                "Ljava/lang/String;",
                "Landroid/app/Activity;",
                "L",
                "Z",
                "Ljava/lang/String;",
                "I",
            ),
        ).method

        openCustomTab.addInstructions(
            0,
            """
                move-object/from16 v0, p4
                move-object/from16 v1, p2
                invoke-static { v0, v1 }, $HELPER->openExternal(Landroid/app/Activity;Landroid/net/Uri;)Z
                move-result v2
                if-eqz v2, :proteus_external_browser_continue
                return-void
                :proteus_external_browser_continue
            """.trimIndent(),
        )
    }
}
