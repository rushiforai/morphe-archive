/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.folders

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableCapability
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.patchLog
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val FOLDER_TABS = "$EXTENSION_PACKAGE/misc/FolderTabs;"
internal const val MAIN_UNREAD = "Lorg/telegram/messenger/MessagesStorage;->getMainUnreadCount()I"
internal const val FILTER_UNREAD = "Lorg/telegram/messenger/MessagesController\$DialogFilter;->unreadCount:I"
private const val FILTERS = "Lorg/telegram/messenger/MessagesController;->getDialogFilters()Ljava/util/ArrayList;"

@Suppress("unused")
val hideFolderCountersPatch = bytecodePatch(
    name = "Hide folder tab counters",
    description = "Hides the unread count on each folder tab above the chat list, for a calmer look. A second switch, " +
        "Open a folder at launch, opens the chat list on a folder you pick instead of All Chats. Both start off. Turn " +
        "them on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val counter = resolveHideFolderCounters()
        requireLaunchFolderRuntime()
        // The folder at launch switch rides along while the catalog is held. A build without its shape
        // keeps the counters and leaves the switch out.
        val launch = resolveLaunchFolder()
        // Assembled on a copy first, so a refusal leaves the app untouched.
        insertCounterAnswer(MutableMethod(ImmutableMethod.of(counter)))
        // The runtime's stubs before anything of Telegram's changes. Nothing calls them until the pick
        // is in and its flag is on, so one that doesn't build leaves the switch out, not the patch.
        val missing = launch.missing ?: try {
            writeLaunchFolderStubs(launch.refs!!)
            null
        } catch (failed: Exception) {
            "the folder pick's stubs don't build (${failed.javaClass.simpleName}: ${failed.message})"
        }
        // Hide All Chats builds on the folder pick, and a build without its shape leaves only that switch out.
        requireAllChatsRuntime()
        val allChats = if (missing == null) resolveAllChats(launch) else null
        val shown = allChats?.let {
            it.missing ?: try {
                writeAllChatsStubs(launch.refs!!, it.refs!!)
                null
            } catch (failed: Exception) {
                "the tabs without All Chats' stubs don't build (${failed.javaClass.simpleName}: ${failed.message})"
            }
        } ?: missing
        // Hidden chats ride along the same way, each switch left out on its own.
        requireHiddenChatsRuntime()
        val hidden = resolveHiddenChats()
        val unhidden = hidden.missing ?: try {
            writeHiddenChatsStubs(hidden.sort!!.toString())
            null
        } catch (failed: Exception) {
            "the hidden chats' stubs don't build (${failed.javaClass.simpleName}: ${failed.message})"
        }
        // The long press item rides on the hiding, and a menu without its shape leaves only the item out.
        val menu = if (unhidden == null) resolveHideMenu() else null
        val noMenu = menu?.let {
            it.missing ?: try {
                writeHideMenuStubs(it.refs!!)
                null
            } catch (failed: Exception) {
                "the long press item's stubs don't build (${failed.javaClass.simpleName}: ${failed.message})"
            }
        }
        insertCounterAnswer(counter)
        enableStatus("hideFolderCounters")
        if (missing == null) {
            // Ahead of the folder pick, whose instruction would move the later indices.
            if (shown == null) {
                allChats!!.apply()
                enableCapability("hideAllChats")
            } else {
                patchLog.warning("Hide folder tab counters: $shown. The patch goes on without hiding All Chats.")
            }
            launch.apply()
            enableCapability("launchFolder")
        } else {
            patchLog.warning("Hide folder tab counters: $missing. The patch goes on without opening a folder at launch.")
        }
        if (unhidden == null) {
            hidden.apply()
            enableCapability("hiddenChats")
            if (noMenu == null) {
                menu!!.apply()
            } else {
                patchLog.warning("Hide folder tab counters: $noMenu. Hidden chats go on without Hide from chat list in the long press menu.")
            }
        } else {
            patchLog.warning("Hide folder tab counters: $unhidden. The patch goes on without hiding chats.")
        }
    }
}

/** The extension answers first, and a yes counts zero, which the tab draws as no badge. */
internal fun insertCounterAnswer(target: MutableMethod) {
    target.addInstructionsWithLabels(0, """
        invoke-static {}, $FOLDER_TABS->countersHidden()Z
        move-result v0
        if-eqz v0, :hush_stock
        const/4 v0, 0x0
        return v0
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/**
 * The chat list answers the tab strip's question "how many unread in tab N": All Chats from the
 * storage's main count, every other folder from its own unread count.
 */
internal fun BytecodePatchContext.resolveHideFolderCounters(): MutableMethod {
    requireStatusMethod("hideFolderCounters")
    controlHook(FOLDER_TABS, "countersHidden", listOf(), "Z")
    val found = mutableListOf<Pair<String, String>>()
    forEachClassMentioning(Mention.allReferences(listOf(MAIN_UNREAD, FILTERS, FILTER_UNREAD))) { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        cls.methods.filter { m ->
            !AccessFlags.STATIC.isSet(m.accessFlags) && m.returnType == "I" && m.parameterTypes.map(CharSequence::toString) == listOf("I") &&
                m.controlBody().map { it.controlRef() }.let { refs -> MAIN_UNREAD in refs && FILTERS in refs && FILTER_UNREAD in refs }
        }.forEach { found += cls.type to ref(it) }
    }
    val (type, wanted) = found.controlSingle("folder tab counter")
    val counter = mutableClassDefBy(type).methods.single { ref(it) == wanted }
    controlShape(counter.implementation!!.registerCount >= 3, "the folder tab counter has no register to answer in")
    controlShape(ControlFlow.of(counter).normal.none { 0 in it }, "something jumps back to the start of the folder tab counter")
    return counter
}

private fun ref(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
