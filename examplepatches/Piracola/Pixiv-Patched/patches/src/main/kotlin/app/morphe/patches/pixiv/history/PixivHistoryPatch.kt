package app.morphe.patches.pixiv.history

import app.morphe.patches.pixiv.shared.PixivConstants

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.bytecodePatch

/**
 * Records what the user opens into local history.
 *
 * Pixiv serves its history list only to premium accounts, so instead of patching the (empty) remote
 * list the works themselves are recorded as the detail screens bind them:
 *  - illustrations and manga arrive at DetailBottomBarView.setWork as the decoded work entity;
 *  - novels are serialised to the reader's web view one by one, so the reader screen brackets the
 *    recording and only the first novel built inside it is taken.
 */
val pixivHistoryPatch: BytecodePatch = bytecodePatch(
    name = "Pixiv Browsing History",
    description = "Records the illustrations, manga and novels opened in the app into an on-device browsing history, and shows it in the app's own history screen (manga and novels apart) instead of Pixiv's server-side list.",
    default = true
) {
    compatibleWith(PixivConstants.PIXIV)

    extendWith("extensions/pixiv.mpe")

    execute {
        val bottomBar = mutableClassDefBy("Ljp/pxv/android/feature/component/androidview/DetailBottomBarView;")
        bottomBar.methods.firstOrNull { it.name == "setWork" && it.parameterTypes.size == 1 }
            ?.addInstructions(
                0,
                "invoke-static/range {p1 .. p1}, Lapp/morphe/extension/pixiv/history/HistoryRecorder;->recordIllust(Ljava/lang/Object;)V"
            )

        val novelActivity =
            mutableClassDefByOrNull("Ljp/pxv/android/feature/novelviewer/noveltext/NovelTextActivity;")
        novelActivity?.methods?.firstOrNull { it.name == "onCreate" && it.parameterTypes.size == 1 }
            ?.addInstructions(
                0,
                "invoke-static {}, Lapp/morphe/extension/pixiv/history/HistoryRecorder;->enterNovelScreen()V"
            )
        novelActivity?.methods?.firstOrNull { it.name == "onDestroy" && it.parameterTypes.isEmpty() }
            ?.addInstructions(
                0,
                "invoke-static {}, Lapp/morphe/extension/pixiv/history/HistoryRecorder;->leaveNovelScreen()V"
            )

        // JavaScriptNovel fields survive R8 with their Kotlin names: id, title, user, cover.
        val javaScriptNovel =
            mutableClassDefByOrNull("Ljp/pxv/android/feature/novelviewer/legacy/JavaScriptNovel;")
        javaScriptNovel?.methods?.firstOrNull { it.name == "<init>" && it.parameterTypes.size == 11 }
            ?.addInstructions(
                0,
                "invoke-static/range {p1 .. p4}, Lapp/morphe/extension/pixiv/history/HistoryRecorder;->recordNovel(JLjava/lang/String;Ljava/lang/Object;)V"
            )

        // The history list screen asks Pixiv's API for the account history (premium only), so the
        // local list takes that screen over instead.
        val historyActivity =
            mutableClassDefByOrNull("Ljp/pxv/android/feature/browsinghistory/list/BrowsingHistoryActivity;")
        historyActivity?.methods?.firstOrNull { it.name == "onCreate" && it.parameterTypes.size == 1 }
            ?.addInstructions(
                1,
                """
                invoke-static/range {p0 .. p0}, Lapp/morphe/extension/pixiv/ui/PatchedSettings;->setupHistory(Landroid/app/Activity;)V
                return-void
                """.trimIndent()
            )
    }
}
