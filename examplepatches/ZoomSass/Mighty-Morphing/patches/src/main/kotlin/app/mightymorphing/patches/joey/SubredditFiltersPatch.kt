package app.mightymorphing.patches.joey

import app.mightymorphing.patches.shared.Constants.JOEY
import app.mightymorphing.patches.shared.indexOfReference
import app.mightymorphing.patches.shared.insertAt
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import com.android.tools.smali.dexlib2.Opcode

private const val FILTERS = "Lapp/mightymorphing/extension/joey/SubredditFilters;"

@Suppress("unused")
val subredditFiltersPatch = bytecodePatch(
    name = "Subreddit filter options",
    description = "Adds a subreddit suffix filter and lets you toggle subreddit filters on or off without deleting them. Configure in Joey - Settings - Filters, or from the feed Filter out posts menu.",
) {
    compatibleWith(JOEY)

    extendWith("extensions/extension.mpe")

    execute {
        val filterCreate = FilterSettingsCreateFingerprint.method
        val createReturn = filterCreate.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        filterCreate.insertAt(
            createReturn,
            """
            invoke-static {p0}, $FILTERS->onFilterSettingsCreated(Landroid/app/Activity;)V
            """,
        )

        val filterPause = FilterSettingsPauseFingerprint.method
        val pauseReturn = filterPause.instructions.indexOfLast { it.opcode == Opcode.RETURN_VOID }
        filterPause.insertAt(
            pauseReturn,
            """
            invoke-static {p0}, $FILTERS->onFilterSettingsPaused(Landroid/app/Activity;)V
            """,
        )

        val listRow = SettingsListRowFingerprint.method
        listRow.insertAt(
            listRow.indexOfReference("setOnClickListener") + 1,
            """
            invoke-static {p0, p1, p2, p3, p5}, $FILTERS->decorateListRow(Landroid/view/View;Ljava/util/List;Ljava/lang/String;Landroid/widget/LinearLayout;Ljava/lang/Object;)V
            """,
        )

        val quickDialog = QuickFilterDialogFingerprint.method
        quickDialog.insertAt(
            quickDialog.indexOfReference("Lha/b;->a(Ljava/util/List;)Ljava/util/List;") + 2,
            """
            invoke-static {v0, v2}, $FILTERS->appendQuickFilterItems(Ljava/util/List;Ljava/util/List;)V
            """,
        )

        QuickFilterApplyFingerprint.method.insertAt(
            0,
            """
            iget-object v0, p0, Lha/b${'$'}a;->a:Ljava/util/List;
            invoke-static {v0, p2}, $FILTERS->applyQuickFilterItems(Ljava/util/List;[Ljava/lang/Integer;)V
            """,
        )

        val submissionFilter = SubmissionFilterFingerprint.method
        submissionFilter.insertAt(
            submissionFilter.indexOfReference("Lzd/f;->b(Ljava/util/List;Ljava/lang/String;)Z") + 2,
            """
            sget-object v1, Lza/a;->P:Ljava/util/List;
            invoke-static {v1, v2}, $FILTERS->shouldFilterSubreddit(Ljava/util/List;Ljava/lang/String;)Z
            move-result v1
            """,
        )

        val prefixFilter = SubredditPrefixFilterFingerprint.method
        prefixFilter.insertAt(
            prefixFilter.indexOfReference("Lzd/g1;->g(Ljava/lang/String;Ljava/util/List;)Z"),
            """
            invoke-static {p1, v0}, $FILTERS->shouldFilterSubredditPrefix(Ljava/lang/String;Ljava/util/List;)Z
            move-result p1
            xor-int/lit8 p1, p1, 0x1
            return p1
            """,
        )
    }
}
