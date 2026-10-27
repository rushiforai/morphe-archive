package app.noam.patches.geocaching.offline

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.instructions
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.removeInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstructions
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.smali.ExternalLabel
import app.noam.patches.geocaching.misc.extension.extensionHookPatch
import app.noam.patches.geocaching.shared.Constants
import app.noam.patches.geocaching.shared.forcePremiumIn
import com.android.tools.smali.dexlib2.Opcode

internal object ListHubPageFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/listhub/n;",
    name = "c",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Lkj8;", "Lkotlin/coroutines/jvm/internal/ContinuationImpl;"),
)

internal object ListDetailsOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/activities/GeocacheListDetailsActivity;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf("Landroid/os/Bundle;"),
)

internal object ListDetailsOnStartFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/activities/GeocacheListDetailsActivity;",
    name = "onStart",
    returnType = "V",
    parameters = emptyList(),
)

internal object ListDetailsOnStopFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/activities/GeocacheListDetailsActivity;",
    name = "onStop",
    returnType = "V",
    parameters = emptyList(),
)

internal object CreateListFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/activities/CreateListActivity;",
    name = "A",
    returnType = "V",
    parameters = emptyList(),
)

/** ListHubRepository.deleteList: the server delete behind the hub's Delete list. */
internal object ListHubDeleteFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/listhub/l;",
    name = "a",
    returnType = "Ljava/lang/Object;",
    parameters = listOf("Ljava/lang/String;", "Lou1;"),
)

internal object ListDetailsMenuFingerprint : Fingerprint(
    definingClass = "Lcom/groundspeak/geocaching/intro/activities/GeocacheListDetailsActivity;",
    name = "onCreateOptionsMenu",
    returnType = "Z",
    parameters = listOf("Landroid/view/Menu;"),
)

/**
 * Feeds the device-local lists into the app's original Lists hub, opens their saved caches locally,
 * and makes "Create a List" create one on the device instead of on the Premium-only server.
 */
internal val listsLocalPatch = bytecodePatch(
    name = "Local lists",
    description = "Lists kept on the device: the Lists tab opens without Premium, Create a List makes them there, and " +
        "Add to list saves the cache into the list you pick so it opens offline.",
) {
    compatibleWith(Constants.COMPATIBILITY)

    dependsOn(extensionHookPatch, addToListReroutePatch)

    execute {
        forcePremiumIn("Lcom/groundspeak/geocaching/intro/listhub/ListHubFragment;", "onViewCreated")

        ListHubPageFingerprint.method.addInstructions(
            0,
            """
                invoke-static { p0 }, ${Constants.GC_OFFLINE_LIST_UI}->createListPage(Ljava/lang/Object;)Ljava/lang/Object;
                move-result-object v0
                return-object v0
            """,
        )

        ListDetailsOnCreateFingerprint.method.apply {
            val superIndex = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
            require(superIndex >= 0) { "List detail super.onCreate not found" }
            val continuation = getInstruction(superIndex + 1)
            addInstructionsWithLabels(
                superIndex + 1,
                """
                    invoke-static { p0 }, ${Constants.GC_OFFLINE_LIST_UI}->showOfflineList(Landroid/app/Activity;)Z
                    move-result v0
                    if-eqz v0, :noam_stock_list
                    return-void
                """,
                ExternalLabel("noam_stock_list", continuation),
            )
        }

        ListDetailsOnStartFingerprint.method.apply {
            val superIndex = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
            require(superIndex >= 0) { "List detail super.onStart not found" }
            val continuation = getInstruction(superIndex + 1)
            addInstructionsWithLabels(
                superIndex + 1,
                """
                    invoke-static { p0 }, ${Constants.GC_OFFLINE_LIST_UI}->isOfflineList(Landroid/app/Activity;)Z
                    move-result v0
                    if-eqz v0, :noam_stock_start
                    return-void
                """,
                ExternalLabel("noam_stock_start", continuation),
            )
        }

        ListDetailsOnStopFingerprint.method.apply {
            val superIndex = instructions.indexOfFirst { it.opcode == Opcode.INVOKE_SUPER }
            require(superIndex >= 0) { "List detail super.onStop not found" }
            removeInstructions(superIndex + 1, instructions.size - superIndex - 1)
            addInstructions(
                superIndex + 1,
                """
                    invoke-static { p0 }, ${Constants.GC_OFFLINE_LIST_UI}->finishListStop(Landroid/app/Activity;)V
                    return-void
                """,
            )
        }
        CreateListFingerprint.method.replaceInstructions(
            0,
            """
                invoke-static/range { p0 .. p0 }, ${Constants.GC_LOCAL_LISTS}->createFromActivity(Landroid/app/Activity;)V
                return-void
            """,
        )

        // Local lists are deleted on the device; the server would answer 401 for a list it never had.
        ListHubDeleteFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static/range { p1 .. p1 }, ${Constants.GC_LOCAL_LISTS}->deleteIfLocal(Ljava/lang/String;)Z
                move-result v0
                if-eqz v0, :noam_server_delete
                sget-object v0, Lszb;->a:Lszb;
                return-object v0
            """,
            ExternalLabel("noam_server_delete", ListHubDeleteFingerprint.method.getInstruction(0)),
        )

        ListDetailsMenuFingerprint.method.addInstructionsWithLabels(
            0,
            """
                invoke-static { p0 }, ${Constants.GC_OFFLINE_LIST_UI}->isOfflineList(Landroid/app/Activity;)Z
                move-result v0
                if-eqz v0, :noam_stock_menu
                const/4 v0, 0x0
                return v0
            """,
            ExternalLabel("noam_stock_menu", ListDetailsMenuFingerprint.method.getInstruction(0)),
        )
    }
}
