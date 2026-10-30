package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch

private const val SETTINGS = "Lapp/mightymorphing/extension/joey/MorpheSettings;"
private const val BAR = "Lapp/mightymorphing/extension/joey/EditorBar;"
private const val SIDEBAR = "Lapp/mightymorphing/extension/joey/Sidebar;"
private const val TOOLBAR = "Lapp/mightymorphing/extension/joey/SubredditToolbar;"

@Suppress("unused")
val showHidePatch = bytecodePatch(
    name = "Show/Hide",
    description = "[v1.2: Toolbar reordering & toggle, Up/Down arrows] Choose which comment editor buttons, sidebar entries, and subreddit toolbar items are shown. Adjust viewable options in Joey - Settings - Morphe Settings.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        SettingsHookFingerprint.method.insertAt(
            0,
            """
            invoke-static {}, $SETTINGS->enableShowHide()V
            invoke-static {p0}, $SETTINGS->attach(Landroid/app/Activity;)V
            """,
        )

        val setup = EditorBarFingerprint.method
        setup.insertAt(
            setup.instructions.lastIndex,
            """
            invoke-static {p0}, $BAR->apply(Landroid/app/Activity;)V
            """,
        )

        val build = DrawerBuildFingerprint.method
        build.insertAt(
            build.instructions.lastIndex,
            """
            iget-object v0, p0, Lua/b;->a:Ljava/util/List;
            invoke-static {v0}, $SIDEBAR->apply(Ljava/util/List;)V
            """,
        )

        DrawerOpenFingerprint.method.insertAt(
            0,
            """
            iget-object v0, p0, Lo/o/joey/Activities/HomeActivity${'$'}w0;->b:Lo/o/joey/Activities/HomeActivity;
            invoke-static {v0}, $SIDEBAR->refresh(Landroid/app/Activity;)V
            """,
        )

        BaseActivityPrepareMenuFingerprint.method.insertAt(
            0,
            """
            invoke-static {p0, p1}, $TOOLBAR->apply(Landroid/app/Activity;Landroid/view/Menu;)V
            """,
        )
    }
}
