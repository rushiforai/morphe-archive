/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.archive

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.freeLocalsAt
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.extension.parameterRegisterNumber
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlCall
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

private const val PATCH = "Disable pull to archive"
internal const val ARCHIVE_PULL = "$EXTENSION_PACKAGE/misc/ArchivePull;"
internal const val KEEPS_OUT = "$ARCHIVE_PULL->keepsOut()Z"
internal const val LEAVES_OUT = "$ARCHIVE_PULL->leavesOut()Z"
internal const val ARCHIVE_MENU = "$ARCHIVE_PULL->menu(Ljava/lang/Object;Ljava/lang/Object;)V"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val HAS_HIDDEN_ARCHIVE = "$MESSAGES_CONTROLLER->hasHiddenArchive()Z"
internal const val ADD_TO_FOLDER = "$MESSAGES_CONTROLLER->addDialogToItsFolder(ILorg/telegram/tgnet/TLRPC\$Dialog;)V"
internal const val DIALOG_FOLDER = "Lorg/telegram/tgnet/TLRPC\$TL_dialogFolder;"
internal const val ARCHIVE_HIDDEN = "Lorg/telegram/messenger/SharedConfig;->archiveHidden:Z"
internal const val APPLICATION_LOADER = "Lorg/telegram/messenger/ApplicationLoader;"
private const val LOADER_INSTANCE = "$APPLICATION_LOADER->applicationLoaderInstance:$APPLICATION_LOADER"
private const val FOLDER_DIALOG_ID = "Lorg/telegram/messenger/DialogObject;->makeFolderDialogId(I)J"
internal const val SELECTED_ACCOUNT = "Lorg/telegram/messenger/UserConfig;->selectedAccount:I"
private const val SAVED_MESSAGES = "Lorg/telegram/messenger/R\$string;->SavedMessages:I"
internal const val ARCHIVED_CHATS = "Lorg/telegram/messenger/R\$string;->ArchivedChats:I"
internal const val ARCHIVE_ICON = "Lorg/telegram/messenger/R\$drawable;->msg_archive:I"
private const val GET_STRING = "Lorg/telegram/messenger/LocaleController;->getString(I)Ljava/lang/String;"
private const val CHAR_SEQUENCE = "Ljava/lang/CharSequence;"
private const val RUNNABLE = "Ljava/lang/Runnable;"
private const val BUNDLE = "Landroid/os/Bundle;"
private val INVOKES = listOf(Opcode.INVOKE_VIRTUAL, Opcode.INVOKE_VIRTUAL_RANGE)

@Suppress("unused")
val disableArchivePullPatch = bytecodePatch(
    name = PATCH,
    description = "Adds a switch, off by default, so pulling down the chat list doesn't bring up a hidden archive. The chat list's menu opens it instead.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        val sites = resolveDisableArchivePull()
        // Assembled on copies first, so a refusal leaves the app untouched.
        insertArchiveAnswer(MutableMethod(ImmutableMethod.of(sites.hidden)))
        insertFolderGate(MutableMethod(ImmutableMethod.of(sites.folder)))
        insertArchiveMenu(MutableMethod(ImmutableMethod.of(sites.menu)), sites.menuIndex, sites.options)
        writeArchiveStubs(sites)
        insertArchiveAnswer(sites.hidden)
        insertFolderGate(sites.folder)
        insertArchiveMenu(sites.menu, sites.menuIndex, sites.options)
        enableStatus("disableArchivePull")
    }
}

/**
 * [hidden] is MessagesController.hasHiddenArchive(), [folder] its addDialogToItsFolder(I, Dialog)
 * and [menu] the chat list's menu, where Telegram's own entries end at [menuIndex] with the menu in
 * [options]. The rest is what the stubs need: the chat list's type, the menu's add, the chat
 * list's presentFragment, and the dialog map and lookup hasHiddenArchive reads.
 */
internal class ArchivePullSites(
    val hidden: MutableMethod,
    val folder: MutableMethod,
    val menu: MutableMethod,
    val menuIndex: Int,
    val options: Int,
    val chats: String,
    val add: MethodReference,
    val present: MethodReference,
    val dialogs: FieldReference,
    val lookup: MethodReference,
)

/** A yes from the extension answers no hidden archive, so the chat list sets up no pull for it. */
internal fun insertArchiveAnswer(target: MutableMethod) {
    target.addInstructionsWithLabels(0, """
        invoke-static {}, $KEEPS_OUT
        move-result v0
        if-eqz v0, :hush_stock
        const/4 v0, 0x0
        return v0
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/** Only the archive's own row asks, so the extension stays out of the sort for every other chat. */
internal fun insertFolderGate(target: MutableMethod) {
    val dialog = target.parameterRegisterNumber(1)
    target.addInstructionsWithLabels(0, """
        instance-of v0, v$dialog, $DIALOG_FOLDER
        if-eqz v0, :hush_stock
        invoke-static {}, $LEAVES_OUT
        move-result v0
        if-eqz v0, :hush_stock
        return-void
    """, ExternalLabel("hush_stock", target.getInstruction(0)))
}

/** The menu goes to the extension after Telegram's own entries and before the app build's. */
internal fun insertArchiveMenu(target: MutableMethod, index: Int, options: Int) {
    val (menu, chats) = target.freeLocalsAt(PATCH, index, 2, highest = 15)
    target.addInstructionsAtControlFlowLabel(index, """
        move-object/from16 v$menu, v$options
        move-object/from16 v$chats, v${target.localRegisterCount()}
        invoke-static {v$menu, v$chats}, $ARCHIVE_MENU
    """.trimIndent())
}

private fun BytecodePatchContext.writeArchiveStubs(sites: ArchivePullSites) {
    writeStub(ARCHIVE_PULL, "hidden", 1, """
        sget-boolean v0, $ARCHIVE_HIDDEN
        return v0
    """)
    writeStub(ARCHIVE_PULL, "archived", 4, """
        sget v0, $SELECTED_ACCOUNT
        invoke-static {v0}, $MESSAGES_CONTROLLER->getInstance(I)$MESSAGES_CONTROLLER
        move-result-object v0
        iget-object v0, v0, ${sites.dialogs.definingClass}->${sites.dialogs.name}:${sites.dialogs.type}
        const/4 v1, 0x1
        invoke-static {v1}, $FOLDER_DIALOG_ID
        move-result-wide v2
        invoke-virtual {v0, v2, v3}, ${sites.lookup.ref()}
        move-result-object v0
        if-eqz v0, :hush_none
        return v1
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    // The menu's add takes the icon, the text and the click in its own order, and some builds a
    // red flag, which an archive entry leaves off.
    val arguments = sites.add.parameterTypes.joinToString(", ") {
        when (it.toString()) {
            "I" -> "v0"
            CHAR_SEQUENCE -> "v1"
            RUNNABLE -> "p1"
            else -> "v2"
        }
    }
    writeStub(ARCHIVE_PULL, "add", 5, """
        check-cast p0, ${sites.add.definingClass}
        sget v0, $ARCHIVE_ICON
        sget v1, $ARCHIVED_CHATS
        invoke-static {v1}, $GET_STRING
        move-result-object v1
        const/4 v2, 0x0
        invoke-virtual {p0, $arguments}, ${sites.add.ref()}
        return-void
    """)
    writeStub(ARCHIVE_PULL, "open", 4, """
        check-cast p0, ${sites.chats}
        new-instance v0, $BUNDLE
        invoke-direct {v0}, $BUNDLE-><init>()V
        const-string v1, "folderId"
        const/4 v2, 0x1
        invoke-virtual {v0, v1, v2}, Landroid/os/BaseBundle;->putInt(Ljava/lang/String;I)V
        new-instance v1, ${sites.chats}
        invoke-direct {v1, v0}, ${sites.chats}-><init>($BUNDLE)V
        invoke-virtual {p0, v1}, ${sites.present.ref()}
        return-void
    """)
}

internal fun BytecodePatchContext.resolveDisableArchivePull(): ArchivePullSites {
    requireStatusMethod("disableArchivePull")
    controlHook(ARCHIVE_PULL, "keepsOut", listOf(), "Z")
    controlHook(ARCHIVE_PULL, "leavesOut", listOf(), "Z")
    controlHook(ARCHIVE_PULL, "menu", listOf("Ljava/lang/Object;", "Ljava/lang/Object;"), "V")
    controlHook(ARCHIVE_PULL, "hidden", listOf(), "Z")
    controlHook(ARCHIVE_PULL, "archived", listOf(), "Z")
    controlHook(ARCHIVE_PULL, "add", listOf("Ljava/lang/Object;", RUNNABLE), "V")
    controlHook(ARCHIVE_PULL, "open", listOf("Ljava/lang/Object;"), "V")

    val controller = mutableClassDefByOrNull(MESSAGES_CONTROLLER)
    controlShape(controller != null, "MessagesController is missing")
    controlShape(staticField(ARCHIVE_HIDDEN), "SharedConfig no longer keeps whether the archive is hidden")
    controlShape(staticField(SELECTED_ACCOUNT), "UserConfig no longer keeps the selected account")
    controlShape(staticField(ARCHIVED_CHATS) && staticField(ARCHIVE_ICON), "the Archived chats text or icon is missing")
    controlShape(controller!!.methods.any { it.ref() == "$MESSAGES_CONTROLLER->getInstance(I)$MESSAGES_CONTROLLER" &&
        AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) }, "MessagesController.getInstance changed")

    // hasHiddenArchive(): the archive is hidden and the account's dialog map holds the archive folder.
    val hidden = controller.methods.filter { it.ref() == HAS_HIDDEN_ARCHIVE && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .controlSingle("hasHiddenArchive")
    val hiddenBody = hidden.controlBody()
    controlShape(hiddenBody.any { it.controlRef() == ARCHIVE_HIDDEN } && hiddenBody.any { it.controlRef() == FOLDER_DIALOG_ID },
        "hasHiddenArchive no longer checks the hidden flag and the archive folder")
    val dialogs = hiddenBody.mapNotNull { instruction -> instruction.takeIf { it.opcode == Opcode.IGET_OBJECT }?.controlField() }
        .filter { it.definingClass == MESSAGES_CONTROLLER && it.name == "dialogs_dict" }.distinct().controlSingle("the account's dialog map")
    val lookup = hiddenBody.mapNotNull { it.takeIf { i -> i.opcode in INVOKES }?.controlCall() }
        .filter { it.definingClass == dialogs.type && it.parameterTypes.map(CharSequence::toString) == listOf("J") && it.returnType == "Ljava/lang/Object;" }
        .distinct().controlSingle("the dialog map's lookup")
    hidden.requireEntryRoom("hasHiddenArchive")

    // addDialogToItsFolder(I, Dialog): the archive's own row always goes to the main list.
    val folder = controller.methods.filter { it.ref() == ADD_TO_FOLDER && !AccessFlags.STATIC.isSet(it.accessFlags) }
        .controlSingle("addDialogToItsFolder")
    val folderBody = folder.controlBody()
    controlShape(folderBody.any { it.opcode == Opcode.INSTANCE_OF && (it as ReferenceInstruction).reference.toString() == DIALOG_FOLDER } &&
        folderBody.any { it.controlField()?.let { f -> f.definingClass == MESSAGES_CONTROLLER && f.name == "dialogsByFolder" } == true },
        "addDialogToItsFolder no longer files the archive's row by its type")
    controlShape(folder.parameterRegisterNumber(1) <= 15, "addDialogToItsFolder's dialog is out of an instance-of's reach")
    folder.requireEntryRoom("addDialogToItsFolder")

    // The chat list's menu hands itself to the app build's own entries after New Group and Saved Messages.
    val menus = mutableListOf<Pair<String, String>>()
    classDefForEach { cls ->
        if (cls.type.startsWith("Lapp/hushtelegram/")) return@classDefForEach
        cls.methods.filter { m -> m.controlBody().any { it.controlCall()?.let { c -> c.definingClass == APPLICATION_LOADER && c.name == "addItemOptions" } == true } }
            .forEach { menus += cls.type to it.ref() }
    }
    val (chats, menuRef) = menus.controlSingle("the chat list's menu")
    val chatList = mutableClassDefBy(chats)
    val menu = chatList.methods.single { it.ref() == menuRef }
    controlShape(!AccessFlags.STATIC.isSet(menu.accessFlags), "the chat list's menu is static")
    val body = menu.controlBody()
    val call = body.indices.filter { body[it].controlCall()?.let { c -> c.definingClass == APPLICATION_LOADER && c.name == "addItemOptions" } == true }
        .controlSingle("the app build's menu entries")
    val itemOptions = body[call].controlCall()!!.parameterTypes.singleOrNull()?.toString()
    controlShape(itemOptions != null && body[call].opcode == Opcode.INVOKE_VIRTUAL && body[call].namedRegisters().size == 2,
        "the app build no longer takes the chat list's menu")
    val options = body[call].namedRegisters()[1]
    val index = call - 2
    controlShape(index > 0 && body[index].opcode == Opcode.SGET_OBJECT && body[index].controlRef() == LOADER_INSTANCE &&
        body[index + 1].opcode == Opcode.IF_EQZ && body[index + 1].namedRegisters() == listOf(body[index].namedRegisters()[0]) &&
        body[index].namedRegisters()[0] != options, "the app build's menu entries are no longer behind one null check")
    menu.requireThisIntact(PATCH, listOf(index))

    // Saved Messages is added with the same add the archive entry uses.
    val saved = body.indexOfFirst { it.controlRef() == SAVED_MESSAGES }
    controlShape(saved in 0 until index, "the chat list's menu no longer has Saved Messages before the app build's entries")
    val add = (saved until index).mapNotNull { at -> body[at].takeIf { it.opcode in INVOKES }?.controlCall() }
        .firstOrNull { it.definingClass == itemOptions }
    val addParameters = add?.parameterTypes?.map(CharSequence::toString).orEmpty()
    controlShape(add != null && addParameters.sorted() in listOf(listOf("I", CHAR_SEQUENCE, RUNNABLE).sorted(), listOf("I", CHAR_SEQUENCE, RUNNABLE, "Z").sorted()),
        "the chat list's menu no longer adds an entry from an icon, a text and a click")

    // Tapping the archive's row opens a new chat list for its folder with presentFragment.
    controlShape(chatList.methods.any { it.name == "<init>" && it.parameterTypes.map(CharSequence::toString) == listOf(BUNDLE) },
        "the chat list can no longer be opened for a folder")
    val presents = mutableSetOf<String>()
    var present: MethodReference? = null
    for (method in chatList.methods) {
        val code = method.controlBody()
        for (at in code.indices) {
            if (code[at].controlRef() != "$DIALOG_FOLDER->folder:Lorg/telegram/tgnet/TLRPC\$TL_folder;") continue
            val made = (at until minOf(code.size, at + 8)).firstOrNull { code[it].opcode == Opcode.NEW_INSTANCE &&
                ((code[it] as ReferenceInstruction).reference as TypeReference).type == chats } ?: continue
            val fragment = code[made].namedRegisters()[0]
            if (code.getOrNull(made + 1)?.controlRef() != "$chats-><init>($BUNDLE)V" || code[made + 1].namedRegisters().firstOrNull() != fragment) continue
            val shown = code.getOrNull(made + 2)?.takeIf { it.opcode == Opcode.INVOKE_VIRTUAL && it.namedRegisters().getOrNull(1) == fragment }?.controlCall() ?: continue
            if (shown.returnType == "Z" && shown.parameterTypes.map(CharSequence::toString) == listOf(chatList.superclass) &&
                (code.subList(at, made).any { it.controlString() == "folderId" })) {
                presents += shown.ref()
                present = shown
            }
        }
    }
    controlShape(presents.size == 1, "opening the archive's folder is missing or ambiguous")
    return ArchivePullSites(hidden, folder, menu, index, options, chats, add!!, present!!, dialogs, lookup)
}

/** A public static field the stubs read, given as `Lowner;->name:type`. */
private fun BytecodePatchContext.staticField(field: String): Boolean {
    val owner = field.substringBefore("->")
    return classDefByOrNull(owner)?.fields?.any { "${it.definingClass}->${it.name}:${it.type}" == field &&
        AccessFlags.STATIC.isSet(it.accessFlags) && AccessFlags.PUBLIC.isSet(it.accessFlags) } == true
}

/** An entry gate borrows v0 before anything runs, and nothing may jump back to the start. */
private fun MutableMethod.requireEntryRoom(what: String) {
    controlShape(localRegisterCount() >= 1, "$what has no local to answer in")
    controlShape(ControlFlow.of(this).normal.none { 0 in it }, "something jumps back to the start of $what")
}

private fun Method.ref() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
private fun MethodReference.ref() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"
