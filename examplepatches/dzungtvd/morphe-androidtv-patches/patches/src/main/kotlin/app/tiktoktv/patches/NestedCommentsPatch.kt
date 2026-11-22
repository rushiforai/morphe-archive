package app.tiktoktv.patches

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.tiktoktv.patches.shared.Constants.COMPATIBILITY_TIKTOK_TV

private const val FRAGMENT = "LCommentListFragmentV2;"
private const val OBSERVERS = "LCommentListFragmentV2\$b;"
private const val VIEW_MODEL = "Lcom/ss/android/ugc/aweme/tv/comment/b/a;"
private const val KEY_HANDLER = "LCommentListFragmentV2\$c;"
private const val ADAPTER = "Lcom/ss/android/ugc/aweme/tv/comment/fragment/b;"
private const val HOLDER = "Lcom/ss/android/ugc/aweme/tv/comment/fragment/b\$a;"
private const val COMMENT = "Lcom/ss/android/ugc/aweme/comment/model/Comment;"
private const val AWEME = "Lcom/ss/android/ugc/aweme/feed/model/Aweme;"
private const val ITEM_LIST = "Lcom/ss/android/ugc/aweme/comment/model/CommentItemList;"
private const val VIEW = "Landroid/view/View;"
private const val KEY_EVENT = "Landroid/view/KeyEvent;"
private const val NESTED = "Lapp/template/extension/extension/NestedComments;"

/** Ports SmartTube's nested-comments interaction onto the TV comment sheet. */
@Suppress("unused")
val nestedCommentRepliesPatch = bytecodePatch(
    name = "Nested comment replies",
    description = "Shows a comment's reply count in the row and opens its replies in a SmartTube-style sub-pane on CENTER, with BACK returning to the comment list. Fully D-pad operable.",
    default = true,
) {
    compatibleWith(COMPATIBILITY_TIKTOK_TV)
    extendWith("extensions/extension.mpe")

    execute {
        mutableClassDefBy(FRAGMENT).methods.first {
            it.name == "onResume" && it.parameterTypes.isEmpty()
        }.addInstructions(
            0,
            """
                invoke-static {p0}, $NESTED->bindFragment(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        val observers = mutableClassDefBy(OBSERVERS).methods

        observers.first {
            it.name == "a" && it.parameterTypes == listOf(FRAGMENT, AWEME)
        }.addInstructions(
            0,
            """
                invoke-static {p0}, $NESTED->onAwemeChanged(Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // A reply pane replaces the adapter list, but the grid's selection listener still treats it
        // as the top-level list and asks for "the next page" whenever the selected reply is near the
        // end. Forward that signal to the open pane (SmartTube paginates replies on scroll) instead
        // of running the native top-level load-more.
        mutableClassDefBy(VIEW_MODEL).methods.first {
            it.name == "h" && it.parameterTypes.isEmpty()
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static {}, $NESTED->onLoadMoreRequested()Z
                move-result v0
                if-eqz v0, :continue
                return-void
            """.trimIndent(),
            ExternalLabel("continue", 0),
        )

        // The row click dispatcher overwrites p0 with isLogin() as its first act, so the boolean
        // result parked there is safe; a handled click returns before the original like/compose.
        mutableClassDefBy(HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(ADAPTER, HOLDER, COMMENT, VIEW)
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0, p1, p2, p3}, $NESTED->onClick(Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;Ljava/lang/Object;)Z
                move-result p0
                if-eqz p0, :continue
                return-void
            """.trimIndent(),
            ExternalLabel("continue", 0),
        )

        // BACK lands here; the handler overwrites p1 (the KeyEvent) immediately, so parking the
        // result there is safe. 0 = a replies pane was popped (consumed, stay open); 1 = fall
        // through to the stock body, which closes the comment pane.
        mutableClassDefBy(KEY_HANDLER).methods.first {
            it.name == "c" && it.parameterTypes == listOf(KEY_EVENT)
        }.addInstructionsWithLabels(
            0,
            """
                invoke-static {p0}, $NESTED->onBack(Ljava/lang/Object;)I
                move-result p1
                if-nez p1, :continue
                return p1
            """.trimIndent(),
            ExternalLabel("continue", 0),
        )

        // After the full original bind, append the inline reply count to the date line.
        val bind = mutableClassDefBy(HOLDER).methods.first {
            it.name == "a" && it.parameterTypes == listOf(COMMENT)
        }
        bind.addInstructions(
            bind.instructions.lastIndex,
            """
                invoke-static {p0, p1}, $NESTED->bindAffordance(Ljava/lang/Object;Ljava/lang/Object;)V
            """.trimIndent(),
        )

        // After the native list update, re-assert the replies pane so load-more cannot clobber it.
        val listObserver = observers.first {
            it.name == "a" && it.parameterTypes == listOf(FRAGMENT, ITEM_LIST)
        }
        listObserver.addInstructions(
            listObserver.instructions.lastIndex,
            """
                invoke-static {}, $NESTED->syncList()V
            """.trimIndent(),
        )
    }
}
