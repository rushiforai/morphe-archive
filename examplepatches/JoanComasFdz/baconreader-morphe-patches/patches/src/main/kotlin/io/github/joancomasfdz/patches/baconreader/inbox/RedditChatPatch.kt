// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.inbox

import app.morphe.patcher.extensions.InstructionExtensions.addInstruction
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.patch.resourcePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.util.indexOfFirstInstructionReversedOrThrow
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import io.github.joancomasfdz.patches.baconreader.misc.extension.EXTENSION_PACKAGE
import io.github.joancomasfdz.patches.baconreader.misc.extension.sharedExtensionPatch
import io.github.joancomasfdz.patches.baconreader.misc.settings.markPatchIncluded
import io.github.joancomasfdz.patches.baconreader.misc.settings.settingsPatch
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER
import io.github.joancomasfdz.patches.shared.Constants.COMPATIBILITY_BACONREADER_PREMIUM

private const val EXTENSION_CLASS_DESCRIPTOR = "$EXTENSION_PACKAGE/chat/RedditChatPatch;"

private const val ACTIVITY = "Landroid/app/Activity;"
private const val LISTING = "Lcom/onelouder/baconreader/reddit/Listing;"

/**
 * Adds the chat icon to the app's resources, in the colors of the drawer's own icons: grey PNGs for the light theme
 * and white ones for the dark themes, in 24 dp. The extension finds them by name.
 */
private val chatIconResourcePatch = resourcePatch {
    execute {
        listOf(
            "baconreader_patches_chat_grey" to "#FF757575",
            "baconreader_patches_chat_white" to "#FFFFFFFF",
        ).forEach { (name, color) ->
            get("res/drawable/$name.xml", copy = false).apply {
                parentFile?.mkdirs()
                writeText(chatIcon(color))
            }
        }
    }
}

//
// BaconReader predates Reddit's chat, and Reddit has no public API for it. Reddit's mobile website has the chat,
// but it needs a login to the website: the app's OAuth login doesn't carry over. The chat shows over the main
// screen's post list, below its toolbar, so the drawer stays.
@Suppress("unused")
val redditChatPatch = bytecodePatch(
    name = "Reddit chat",
    description = "Adds Chat to the menu, next to the Inbox, which shows Reddit's chat from its mobile website on " +
        "the main screen. The chat messages Reddit also sends to the inbox are counted next to Chat and notified " +
        "as chat messages instead.",
) {
    compatibleWith(COMPATIBILITY_BACONREADER, COMPATIBILITY_BACONREADER_PREMIUM)

    dependsOn(sharedExtensionPatch, settingsPatch, chatIconResourcePatch)

    execute {
        markPatchIncluded("redditChat")

        hookDrawer()
        hookMainActivity()

        // Reddit chat links open the main screen with the chat, unless the link is forced to the browser.
        LinkProcessorGetIntentFingerprint.method.apply {
            addInstructionsWithLabels(
                0,
                """
                    iget-boolean v0, p0, $LINK_PROCESSOR_DESCRIPTOR->forceBrowser:Z
                    if-nez v0, :original
                    iget-object v0, p0, $LINK_PROCESSOR_DESCRIPTOR->url:Ljava/lang/String;
                    invoke-static { v0 }, $EXTENSION_CLASS_DESCRIPTOR->chatIntent(Ljava/lang/String;)Landroid/content/Intent;
                    move-result-object v0
                    if-eqz v0, :original
                    return-object v0
                """,
                ExternalLabel("original", getInstruction(0)),
            )
        }

        // The chat messages of the app's background message check are counted for Chat, and the rest notified.
        CheckMessagesOnMessagesReceivedFingerprint.let {
            it.method.redirectGetChildren(it.instructionMatches[0].index, "unreadMessages")
        }
        // The inbox leaves the chat messages out.
        InboxAdapterOnCompleteFingerprint.let {
            it.method.redirectGetChildren(it.instructionMatches[0].index, "inboxMessages")
        }
    }
}

private fun BytecodePatchContext.hookDrawer() {
    // Adds Chat to the drawer's items, just before the adapter gets them.
    UpdateDrawerFingerprint.method.apply {
        val setItemsIndex = UpdateDrawerFingerprint.instructionMatches[0].index
        val itemsRegister = getInstruction<FiveRegisterInstruction>(setItemsIndex).registerD
        // iget-object vAdapter, vThis, DrawerHandler->adapter, just before: vThis is a 4-bit copy of p0.
        val handlerRegister = getInstruction<TwoRegisterInstruction>(setItemsIndex - 1).registerB
        addInstruction(
            setItemsIndex,
            "invoke-static { v$handlerRegister, v$itemsRegister }, $EXTENSION_CLASS_DESCRIPTOR->" +
                "addChatItem(${DRAWER_HANDLER_DESCRIPTOR}Ljava/util/List;)V",
        )
    }

    // Opens the chat when Chat is tapped. The method has no free register, but the view (p2) is overwritten with
    // the item's tag before it is read.
    DrawerItemClickFingerprint.method.apply {
        addInstructionsWithLabels(
            0,
            """
                iget-object p2, p0, ${DrawerItemClickFingerprint.classDef.type}->this${'$'}0:$DRAWER_HANDLER_DESCRIPTOR
                invoke-static { p2, p1, p3 }, $EXTENSION_CLASS_DESCRIPTOR->onDrawerItemClick(${DRAWER_HANDLER_DESCRIPTOR}Landroid/widget/AdapterView;I)Z
                move-result p2
                if-eqz p2, :original
                return-void
            """,
            ExternalLabel("original", getInstruction(0)),
        )
    }
}

private fun BytecodePatchContext.hookMainActivity() {
    // An intent for the chat shows it once the first feed opens.
    MainActivityOnCreateFingerprint.method.addInstruction(
        MainActivityOnCreateFingerprint.instructionMatches[0].index + 1,
        "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onMainCreate($ACTIVITY)V",
    )

    // Opening a feed leaves the chat, or shows the chat waiting for the first feed.
    MainActivityOpenLinksetFingerprint.method.apply {
        addInstruction(
            indexOfFirstInstructionReversedOrThrow(Opcode.RETURN_VOID),
            "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onFeedOpened($ACTIVITY)V",
        )
    }

    MainActivityOnResumeFingerprint.method.addInstruction(
        0,
        "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onMainResume($ACTIVITY)V",
    )
    MainActivityOnPauseFingerprint.method.addInstruction(
        0,
        "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onMainPause($ACTIVITY)V",
    )
    MainActivityOnDestroyFingerprint.method.addInstruction(
        0,
        "invoke-static { p0 }, $EXTENSION_CLASS_DESCRIPTOR->onMainDestroy($ACTIVITY)V",
    )

    // Back goes back in the chat, then to the post list.
    MainActivityOnBackPressedFingerprint.method.apply {
        addInstructionsWithLabels(
            0,
            """
                iget-object v0, p0, $MAIN_ACTIVITY_DESCRIPTOR->drawerHandler:$DRAWER_HANDLER_DESCRIPTOR
                invoke-static { p0, v0 }, $EXTENSION_CLASS_DESCRIPTOR->onMainBack(${ACTIVITY}$DRAWER_HANDLER_DESCRIPTOR)Z
                move-result v0
                if-eqz v0, :original
                return-void
            """,
            ExternalLabel("original", getInstruction(0)),
        )
    }

    // While the chat shows, only the toolbar's refresh stays. The menu register (p1) holds the result of
    // super.onPrepareOptionsMenu at the return, so the menu is kept in v0, free after the original code used it.
    MainActivityOnPrepareOptionsMenuFingerprint.method.apply {
        val superIndex = MainActivityOnPrepareOptionsMenuFingerprint.instructionMatches[0].index
        addInstruction(superIndex, "move-object v0, p1")
        addInstruction(
            indexOfFirstInstructionReversedOrThrow(Opcode.RETURN),
            "invoke-static { p0, v0 }, $EXTENSION_CLASS_DESCRIPTOR->prepareMenu(${ACTIVITY}Landroid/view/Menu;)V",
        )
    }

    // Refresh reloads the chat while it shows.
    MainActivityOnOptionsItemSelectedFingerprint.method.apply {
        addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1 }, $EXTENSION_CLASS_DESCRIPTOR->onMenuItem(${ACTIVITY}Landroid/view/MenuItem;)Z
                move-result v0
                if-eqz v0, :original
                return v0
            """,
            ExternalLabel("original", getInstruction(0)),
        )
    }

    // Delivers the files chosen in the chat's file chooser.
    MainActivityOnActivityResultFingerprint.method.apply {
        addInstructionsWithLabels(
            0,
            """
                invoke-static { p0, p1, p2, p3 }, $EXTENSION_CLASS_DESCRIPTOR->onMainActivityResult(${ACTIVITY}IILandroid/content/Intent;)Z
                move-result v0
                if-eqz v0, :original
                return-void
            """,
            ExternalLabel("original", getInstruction(0)),
        )
    }
}

/** Replaces listing.getChildren(type) at the index with the extension method of the same arguments. */
private fun MutableMethod.redirectGetChildren(index: Int, extensionMethod: String) {
    val call = getInstruction<FiveRegisterInstruction>(index)
    replaceInstruction(
        index,
        "invoke-static { v${call.registerC}, v${call.registerD} }, $EXTENSION_CLASS_DESCRIPTOR->" +
            "$extensionMethod(${LISTING}Ljava/lang/Class;)Ljava/util/List;",
    )
}

/** A speech bubble with two lines of text, as an outline like the drawer's other icons. */
private fun chatIcon(color: String) =
    """
    <vector xmlns:android="http://schemas.android.com/apk/res/android"
        android:width="24dp"
        android:height="24dp"
        android:viewportWidth="24"
        android:viewportHeight="24">
        <path
            android:fillColor="#00000000"
            android:strokeColor="$color"
            android:strokeWidth="2"
            android:strokeLineCap="round"
            android:strokeLineJoin="round"
            android:pathData="M3,6A2,2 0,0 1,5,4H19A2,2 0,0 1,21,6V15A2,2 0,0 1,19,17H8L3,21Z M7,9H17 M7,13H14" />
    </vector>
    """.trimIndent()
