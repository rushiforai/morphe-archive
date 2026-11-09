/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chattypefolders

import app.morphe.util.names.origString
import app.morphe.util.names.origDescriptor
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patches.shared.compat.AppCompatibilities
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.enableStatus
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.telegramExtensionPatch
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.patches.telegram.misc.settings.settingsPatch
import app.morphe.util.call
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefByOrNull
import app.morphe.util.namedRegisters
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference

internal const val CHAT_TYPE_FOLDERS = "$EXTENSION_PACKAGE/misc/ChatTypeFolders;"
private const val STRING = "Ljava/lang/String;"
internal const val MESSAGES_CONTROLLER = "Lorg/telegram/messenger/MessagesController;"
internal const val LOCAL_FILTER = "Lorg/telegram/messenger/MessagesController\$DialogFilter;"
internal const val USER_CONFIG = "Lorg/telegram/messenger/UserConfig;"
internal const val CONNECTIONS = "Lorg/telegram/tgnet/ConnectionsManager;"
internal const val SERVER_FILTER = "Lorg/telegram/tgnet/TLRPC\$DialogFilter;"
internal const val NEW_FILTER = "Lorg/telegram/tgnet/TLRPC\$TL_dialogFilter;"
internal const val TITLE = "Lorg/telegram/tgnet/TLRPC\$TL_textWithEntities;"
internal const val UPDATE_FILTER = "Lorg/telegram/tgnet/TLRPC\$TL_messages_updateDialogFilter;"
internal const val UPDATE_ORDER = "Lorg/telegram/tgnet/TLRPC\$TL_messages_updateDialogFiltersOrder;"
internal const val STORAGE = "Lorg/telegram/messenger/MessagesStorage;"
internal const val NOTIFICATIONS = "Lorg/telegram/messenger/NotificationCenter;"
private const val PINS = "Lorg/telegram/messenger/support/LongSparseIntArray;"
private const val LIST = "Ljava/util/ArrayList;"
private const val OBJECT = "Ljava/lang/Object;"
internal const val REQUEST_DELEGATE = "Lorg/telegram/tgnet/RequestDelegate;"
internal const val TL_ERROR = "Lorg/telegram/tgnet/TLRPC\$TL_error;"
internal const val GET_FILTERS = "Lorg/telegram/tgnet/TLRPC\$TL_messages_getDialogFilters;"
internal const val SERVER_FILTERS = "Lorg/telegram/tgnet/TLRPC\$TL_messages_dialogFilters;"

internal const val SELECTED_ACCOUNT = "$USER_CONFIG->selectedAccount:I"
internal const val USER_CONFIG_INSTANCE = "$USER_CONFIG->getInstance(I)$USER_CONFIG"
internal const val CLIENT_ACTIVATED = "$USER_CONFIG->isClientActivated()Z"
internal const val CLIENT_USER_ID = "$USER_CONFIG->getClientUserId()J"
internal const val IS_PREMIUM = "$USER_CONFIG->isPremium()Z"
internal const val CONTROLLER_INSTANCE = "$MESSAGES_CONTROLLER->getInstance(I)$MESSAGES_CONTROLLER"
internal const val FILTERS = "$MESSAGES_CONTROLLER->dialogFilters:Ljava/util/ArrayList;"
internal const val FILTERS_LOADED = "$MESSAGES_CONTROLLER->dialogFiltersLoaded:Z"
internal const val LIMIT_DEFAULT = "$MESSAGES_CONTROLLER->dialogFiltersLimitDefault:I"
internal const val LIMIT_PREMIUM = "$MESSAGES_CONTROLLER->dialogFiltersLimitPremium:I"
internal const val FILTERS_BY_ID = "$MESSAGES_CONTROLLER->dialogFiltersById:Landroid/util/SparseArray;"
internal const val ADD_FILTER = "$MESSAGES_CONTROLLER->addFilter(${LOCAL_FILTER}Z)V"
internal const val REMOVE_FILTER = "$MESSAGES_CONTROLLER->removeFilter($LOCAL_FILTER)V"
internal const val STORAGE_INSTANCE = "$STORAGE->getInstance(I)$STORAGE"
internal const val SAVE_FILTER = "$STORAGE->saveDialogFilter(${LOCAL_FILTER}ZZ)V"
internal const val DELETE_FILTER = "$STORAGE->deleteDialogFilter($LOCAL_FILTER)V"
internal const val NOTIFICATIONS_INSTANCE = "$NOTIFICATIONS->getInstance(I)$NOTIFICATIONS"
internal const val FILTERS_UPDATED = "$NOTIFICATIONS->dialogFiltersUpdated:I"
internal const val LOCAL_INIT = "$LOCAL_FILTER-><init>()V"
internal const val LOCAL_ID = "$LOCAL_FILTER->id:I"
internal const val LOCAL_FLAGS = "$LOCAL_FILTER->flags:I"
internal const val LOCAL_NAME = "$LOCAL_FILTER->name:$STRING"
internal const val LOCAL_COLOR = "$LOCAL_FILTER->color:I"
internal const val LOCAL_UNREAD = "$LOCAL_FILTER->unreadCount:I"
internal const val LOCAL_PENDING_UNREAD = "$LOCAL_FILTER->pendingUnreadCount:I"
internal const val LOCAL_ALWAYS = "$LOCAL_FILTER->alwaysShow:$LIST"
internal const val LOCAL_NEVER = "$LOCAL_FILTER->neverShow:$LIST"
internal const val LOCAL_ENTITIES = "$LOCAL_FILTER->entities:$LIST"
internal const val LOCAL_PINNED = "$LOCAL_FILTER->pinnedDialogs:$PINS"
internal const val PINS_SIZE = "$PINS->size()I"
internal const val CONNECTIONS_INSTANCE = "$CONNECTIONS->getInstance(I)$CONNECTIONS"
internal const val SEND_REQUEST = "$CONNECTIONS->sendRequest(Lorg/telegram/tgnet/TLObject;Lorg/telegram/tgnet/RequestDelegate;)I"
internal const val NEW_FILTER_INIT = "$NEW_FILTER-><init>()V"
internal const val UPDATE_INIT = "$UPDATE_FILTER-><init>()V"
internal const val FILTER_ID = "$SERVER_FILTER->id:I"
internal const val FILTER_TITLE = "$SERVER_FILTER->title:$TITLE"
internal const val TITLE_TEXT = "$TITLE->text:$STRING"
internal const val FILTER_CONTACTS = "$SERVER_FILTER->contacts:Z"
internal const val FILTER_NON_CONTACTS = "$SERVER_FILTER->non_contacts:Z"
internal const val FILTER_GROUPS = "$SERVER_FILTER->groups:Z"
internal const val FILTER_BROADCASTS = "$SERVER_FILTER->broadcasts:Z"
internal const val FILTER_BOTS = "$SERVER_FILTER->bots:Z"
internal const val UPDATE_FLAGS = "$UPDATE_FILTER->flags:I"
internal const val UPDATE_ID = "$UPDATE_FILTER->id:I"
internal const val UPDATE_FILTER_FIELD = "$UPDATE_FILTER->filter:$NEW_FILTER"
internal const val ORDER_INIT = "$UPDATE_ORDER-><init>()V"
internal const val ORDER_IDS = "$UPDATE_ORDER->order:$LIST"
internal const val ERROR_TEXT = "$TL_ERROR->text:$STRING"
internal const val GET_FILTERS_INIT = "$GET_FILTERS-><init>()V"
internal const val SERVER_FILTERS_LIST = "$SERVER_FILTERS->filters:$LIST"
internal const val FILTER_FLAGS = "$SERVER_FILTER->flags:I"
internal const val FILTER_COLOR = "$SERVER_FILTER->color:I"
/** The one method of Telegram's request callback, as `name(parameters)result`. */
internal const val DELEGATE_RUN = "run(Lorg/telegram/tgnet/TLObject;$TL_ERROR)V"
/** dialogFilter's flag 27, set when the folder has a tag color. */
internal const val FILTER_HAS_COLOR = 1 shl 27

/** The chat type bits of a local folder's flags, as ChatTypeFolders compares them. */
internal val TYPE_FLAGS = listOf(
    "$MESSAGES_CONTROLLER->DIALOG_FILTER_FLAG_CONTACTS:I" to 1,
    "$MESSAGES_CONTROLLER->DIALOG_FILTER_FLAG_NON_CONTACTS:I" to 2,
    "$MESSAGES_CONTROLLER->DIALOG_FILTER_FLAG_GROUPS:I" to 4,
    "$MESSAGES_CONTROLLER->DIALOG_FILTER_FLAG_CHANNELS:I" to 8,
    "$MESSAGES_CONTROLLER->DIALOG_FILTER_FLAG_BOTS:I" to 16,
)
/** Every chat type bit at once, the one of these constants 13.2 still keeps as a field. */
internal const val ALL_CHATS_FLAG = "$MESSAGES_CONTROLLER->DIALOG_FILTER_FLAG_ALL_CHATS:I"
internal const val STORAGE_QUEUE = "$STORAGE->storageQueue:Lorg/telegram/messenger/DispatchQueue;"

/**
 * 13.2 inlines saveDialogFilter and deleteDialogFilter into their callers, which read the storage queue
 * and post one of R8's merged lambdas there, its case [key] running the internal save or delete. A stub
 * posts the same lambda with the same case. [roles] says what each constructor parameter gets:
 * "storage", "filter", "flag" (false, as the stubs save) or "key". Every reference is the build's own,
 * as read: the queue's class has no name of its own in every table.
 */
internal data class PostedFolderStorage(val queue: String, val lambda: String, val init: String, val post: String,
    val key: Int, val roles: List<String>) {
    /** The post, with the storage and folder in [storage] and [filter], false in [zero], and three free registers from [free]. */
    fun smali(storage: Int, filter: Int, zero: Int, free: Int): String {
        val passed = roles.map { when (it) { "storage" -> storage; "filter" -> filter; "flag" -> zero; else -> free + 2 } }
        val load = if (key in Short.MIN_VALUE..Short.MAX_VALUE) "const/16" else "const"
        return """
            iget-object v$free, v$storage, $queue
            new-instance v${free + 1}, $lambda
            $load v${free + 2}, $key
            invoke-direct {v${free + 1}, ${passed.joinToString { "v$it" }}}, $init
            invoke-virtual {v$free, v${free + 1}}, $post
        """
    }
}

/** How the stubs save and delete a folder: Telegram's own storage methods where [save] and [delete] are null. */
internal class ChatTypeFoldersSite(val post: String, val save: PostedFolderStorage?, val delete: PostedFolderStorage?)

/** A read of MessagesStorage's storage queue, whatever the queue's class is called. */
internal fun Instruction.readsStorageQueue() = opcode == Opcode.IGET_OBJECT &&
    ((this as ReferenceInstruction).reference as FieldReference).let { it.origDefiningClass == STORAGE && it.origName == "storageQueue" }

/**
 * Where [key]'s case of the first switch in [body] starts, or null. A key the table doesn't list runs
 * on from the switch, which is where R8 puts one of a merged lambda's cases (Play's 13.2 folder delete).
 */
internal fun switchCaseStart(body: List<Instruction>, key: Int): Int? {
    val at = IntArray(body.size + 1).also { a -> body.forEachIndexed { i, instruction -> a[i + 1] = a[i] + instruction.codeUnits } }
    val switch = body.indexOfFirst { it.opcode == Opcode.PACKED_SWITCH || it.opcode == Opcode.SPARSE_SWITCH }
    if (switch < 0) return null
    val payload = body.getOrNull(at.indexOf(at[switch] + (body[switch] as OffsetInstruction).codeOffset)) as? SwitchPayload ?: return null
    val offset = payload.switchElements.singleOrNull { it.key == key }?.offset ?: return (switch + 1).takeIf { it in body.indices }
    return at.indexOf(at[switch] + offset).takeIf { it in body.indices }
}

/**
 * Null where MessagesStorage keeps [method]; else the one lambda Telegram posts on the storage queue in
 * its place, whose case calls the storage's internal [what] with [internal] as its parameters.
 */
private fun BytecodePatchContext.postedFolderStorage(method: String, what: String, internal: List<String>): PostedFolderStorage? {
    if (tgClassDefByOrNull(STORAGE)?.methods?.any { it.origString() == method } != false) return null
    val found = mutableSetOf<PostedFolderStorage>()
    forEachClassMentioning(Mention.reference(STORAGE_QUEUE) and Mention.type(LOCAL_FILTER)) { cls ->
        cls.methods.forEach { m ->
            val body = m.controlBody()
            for (i in body.indices) {
                if (!body[i].readsStorageQueue()) continue
                val (queue, storage) = (body[i] as TwoRegisterInstruction).let { it.registerA to it.registerB }
                val made = body.getOrNull(i + 1)?.takeIf { it.opcode == Opcode.NEW_INSTANCE } ?: continue
                val lambda = ((made as ReferenceInstruction).reference as TypeReference).type
                val build = (i + 2..minOf(i + 4, body.lastIndex)).firstOrNull { body[it].opcode == Opcode.INVOKE_DIRECT } ?: continue
                val init = body[build].call() ?: continue
                val passed = body[build].namedRegisters()
                val lambdaRegister = (made as OneRegisterInstruction).registerA
                if (init.definingClass != lambda || init.name != "<init>" || passed.firstOrNull() != lambdaRegister) continue
                val posted = body.getOrNull(build + 1) ?: continue
                if (posted.opcode != Opcode.INVOKE_VIRTUAL || posted.namedRegisters() != listOf(queue, lambdaRegister) ||
                    posted.call()?.parameterTypes?.map { it.toString() } != listOf("Ljava/lang/Runnable;")) continue
                val constants = (i + 2 until build).mapNotNull { at ->
                    (body[at] as? NarrowLiteralInstruction)?.let { (body[at] as OneRegisterInstruction).registerA to it.narrowLiteral }
                }.toMap()
                val roles = init.parameterTypes.mapIndexed { n, type ->
                    val register = passed.getOrNull(n + 1)
                    when {
                        type.toString() == "I" && register in constants -> "key"
                        type.toString() == "Z" -> "flag"
                        !type.startsWith("L") -> "?"
                        register == storage -> "storage"
                        else -> "filter"
                    }
                }
                if (listOf("storage", "filter", "key").any { role -> roles.count { it == role } != 1 } || roles.count { it == "flag" } > 1 || "?" in roles) continue
                val key = constants.getValue(passed[roles.indexOf("key") + 1])
                // The case for that key calls the storage's internal save or delete, itself or, on Play's 13.2,
                // through a method of the lambda's own that the case calls alone.
                val lambdaClass = tgClassDefByOrNull(lambda) ?: continue
                val run = lambdaClass.methods.singleOrNull { it.name == "run" && it.parameterTypes.isEmpty() }?.controlBody().orEmpty()
                val start = switchCaseStart(run, key) ?: continue
                var case = run.drop(start).take(12).takeWhile { it.opcode != Opcode.RETURN_VOID && it.opcode != Opcode.GOTO }
                case.singleOrNull()?.takeIf { it.opcode == Opcode.INVOKE_DIRECT }?.call()
                    ?.takeIf { it.definingClass == lambda && it.parameterTypes.isEmpty() }?.let { own ->
                        case = lambdaClass.methods.singleOrNull { it.name == own.name && it.parameterTypes.isEmpty() }?.controlBody().orEmpty().take(12)
                    }
                if (case.none { c -> c.opcode == Opcode.INVOKE_VIRTUAL && c.call()?.let { call ->
                        call.origDefiningClass == STORAGE && call.origParameterTypes == internal && call.returnType == "V" } == true }) continue
                found += PostedFolderStorage((body[i] as ReferenceInstruction).reference.toString(), lambda, init.toString(),
                    posted.call().toString(), key, roles)
            }
        }
    }
    controlShape(found.size == 1, "Telegram's folder $what is missing or ambiguous (${found.size} posts)")
    val site = found.single()
    requireReachable(site.queue, false)
    requireReachable(site.init, false)
    requireReachable(site.post, false)
    return site
}

@Suppress("unused")
val chatTypeFoldersPatch = bytecodePatch(
    name = "Folders by chat type",
    description = "Makes Private, Groups, Channels and Bots folders in one tap. They're Telegram's own folders, so they " +
        "show as tabs above the chat list and on your other devices too. Turning it off removes the ones it made, " +
        "unless you renamed or changed them. Starts off. Turn it on in HushTelegram settings > Chat list.",
    default = true,
) {
    category("Chats")
    dependsOn(settingsPatch, telegramExtensionPatch)
    compatibleWith(*AppCompatibilities.telegram())
    execute {
        writeChatTypeFolderStubs(resolveChatTypeFolders())
        enableStatus("chatTypeFolders")
    }
}

/** Reads `dialogFilters.get(index)` of the account into v0, as a local folder. */
private const val FOLDER_AT = """
    invoke-static {p0}, $CONTROLLER_INSTANCE
    move-result-object v0
    iget-object v0, v0, $FILTERS
    invoke-virtual {v0, p1}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
    move-result-object v0
    check-cast v0, $LOCAL_FILTER
"""

/** A save of the folder in [filter] with storage in [storage], false in [zero] and three registers free from [free]. */
private fun ChatTypeFoldersSite.saveFolder(storage: Int, filter: Int, zero: Int, free: Int) =
    save?.smali(storage, filter, zero, free) ?: "const/4 v$free, 0x1\ninvoke-virtual {v$storage, v$filter, v$zero, v$free}, $SAVE_FILTER"

private fun BytecodePatchContext.writeChatTypeFolderStubs(site: ChatTypeFoldersSite) {
    val post = site.post
    writeStub(CHAT_TYPE_FOLDERS, "selectedAccount", 1, """
        sget v0, $SELECTED_ACCOUNT
        return v0
    """)
    writeStub(CHAT_TYPE_FOLDERS, "signedIn", 1, """
        invoke-static {p0}, $USER_CONFIG_INSTANCE
        move-result-object p0
        invoke-virtual {p0}, $CLIENT_ACTIVATED
        move-result p0
        return p0
    """)
    writeStub(CHAT_TYPE_FOLDERS, "userId", 3, """
        invoke-static {p0}, $USER_CONFIG_INSTANCE
        move-result-object v0
        invoke-virtual {v0}, $CLIENT_USER_ID
        move-result-wide v0
        return-wide v0
    """)
    writeStub(CHAT_TYPE_FOLDERS, "foldersLoaded", 1, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object p0
        iget-boolean p0, p0, $FILTERS_LOADED
        return p0
    """)
    writeStub(CHAT_TYPE_FOLDERS, "folderCount", 1, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object p0
        iget-object p0, p0, $FILTERS
        invoke-virtual {p0}, Ljava/util/ArrayList;->size()I
        move-result p0
        return p0
    """)
    for ((stub, read) in listOf("folderId" to "iget v0, v0, $LOCAL_ID\n return v0",
        "folderFlags" to "iget v0, v0, $LOCAL_FLAGS\n return v0",
        "folderName" to "iget-object v0, v0, $LOCAL_NAME\n return-object v0",
        "folderColor" to "iget v0, v0, $LOCAL_COLOR\n return v0")) {
        writeStub(CHAT_TYPE_FOLDERS, stub, 3, FOLDER_AT + read)
    }
    // One bit for each thing you can set on a folder besides its name and chat types, as ChatTypeFolders.COLOR
    // and the rest. ChatTypeFolders decides which of them make a folder yours.
    writeStub(CHAT_TYPE_FOLDERS, "folderChanges", 5, FOLDER_AT + """
        const/4 v2, 0x0
        iget v1, v0, $LOCAL_COLOR
        if-ltz v1, :hush_no_color
        or-int/lit8 v2, v2, 0x1
        :hush_no_color
        iget-object v1, v0, $LOCAL_ENTITIES
        invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v1
        if-nez v1, :hush_no_emoji
        or-int/lit8 v2, v2, 0x2
        :hush_no_emoji
        iget-object v1, v0, $LOCAL_ALWAYS
        invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v1
        if-nez v1, :hush_none_added
        or-int/lit8 v2, v2, 0x4
        :hush_none_added
        iget-object v1, v0, $LOCAL_NEVER
        invoke-virtual {v1}, Ljava/util/ArrayList;->isEmpty()Z
        move-result v1
        if-nez v1, :hush_none_left_out
        or-int/lit8 v2, v2, 0x8
        :hush_none_left_out
        iget-object v1, v0, $LOCAL_PINNED
        invoke-virtual {v1}, $PINS_SIZE
        move-result v1
        if-eqz v1, :hush_none_pinned
        or-int/lit8 v2, v2, 0x10
        :hush_none_pinned
        return v2
    """)
    // What Telegram's own folder screen allows you to make: All chats takes one of Premium's places.
    writeStub(CHAT_TYPE_FOLDERS, "folderLimit", 2, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        invoke-static {p0}, $USER_CONFIG_INSTANCE
        move-result-object p0
        invoke-virtual {p0}, $IS_PREMIUM
        move-result p0
        if-eqz p0, :hush_free
        iget p0, v0, $LIMIT_PREMIUM
        add-int/lit8 p0, p0, -0x1
        return p0
        :hush_free
        iget p0, v0, $LIMIT_DEFAULT
        return p0
    """)
    // Telegram's request callback, for the extension's Proxy, and the name of the error a request was refused with.
    writeStub(CHAT_TYPE_FOLDERS, "requestDelegate", 1, """
        const-class v0, $REQUEST_DELEGATE
        return-object v0
    """)
    writeStub(CHAT_TYPE_FOLDERS, "errorText", 1, """
        check-cast p0, $TL_ERROR
        iget-object p0, p0, $ERROR_TEXT
        return-object p0
    """)
    // A folder's tag color in the server's list, the way MessagesStorage reads it when it loads that list:
    // the color with flag 27 set, -1 without, and -2 when the list doesn't have the folder.
    writeStub(CHAT_TYPE_FOLDERS, "serverFolderColor", 7, """
        check-cast p0, $SERVER_FILTERS
        iget-object v0, p0, $SERVER_FILTERS_LIST
        invoke-virtual {v0}, Ljava/util/ArrayList;->size()I
        move-result v1
        const/4 v2, 0x0
        :hush_next
        if-ge v2, v1, :hush_missing
        invoke-virtual {v0, v2}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
        move-result-object v3
        check-cast v3, $SERVER_FILTER
        iget v4, v3, $FILTER_ID
        if-eq v4, p1, :hush_found
        add-int/lit8 v2, v2, 0x1
        goto :hush_next
        :hush_found
        iget v4, v3, $FILTER_FLAGS
        const/high16 v1, 0x8000000
        and-int/2addr v4, v1
        if-eqz v4, :hush_no_color
        iget v4, v3, $FILTER_COLOR
        return v4
        :hush_no_color
        const/4 v4, -0x1
        return v4
        :hush_missing
        const/4 v4, -0x2
        return v4
    """)
    // The request Telegram's own folder screen sends for a new folder, with only chat types in it.
    writeStub(CHAT_TYPE_FOLDERS, "createFolder", 12, """
        new-instance v0, $NEW_FILTER
        invoke-direct {v0}, $NEW_FILTER_INIT
        iput p1, v0, $FILTER_ID
        new-instance v1, $TITLE
        invoke-direct {v1}, $TITLE-><init>()V
        iput-object p2, v1, $TITLE_TEXT
        iput-object v1, v0, $FILTER_TITLE
        iput-boolean p3, v0, $FILTER_CONTACTS
        iput-boolean p4, v0, $FILTER_NON_CONTACTS
        iput-boolean p5, v0, $FILTER_GROUPS
        iput-boolean p6, v0, $FILTER_BROADCASTS
        iput-boolean p7, v0, $FILTER_BOTS
        new-instance v1, $UPDATE_FILTER
        invoke-direct {v1}, $UPDATE_INIT
        iput p1, v1, $UPDATE_ID
        iget v2, v1, $UPDATE_FLAGS
        or-int/lit8 v2, v2, 0x1
        iput v2, v1, $UPDATE_FLAGS
        iput-object v0, v1, $UPDATE_FILTER_FIELD
        invoke-static {p0}, $CONNECTIONS_INSTANCE
        move-result-object v0
        check-cast p8, $REQUEST_DELEGATE
        invoke-virtual {v0, v1, p8}, $SEND_REQUEST
        return-void
    """)
    // What Telegram's folder screen does with a new folder, called here once the server has it: into
    // the list at the end and the database, with its unread count to be worked out, then the tabs redrawn.
    writeStub(CHAT_TYPE_FOLDERS, "addFolder", 10, """
        new-instance v0, $LOCAL_FILTER
        invoke-direct {v0}, $LOCAL_INIT
        iput p1, v0, $LOCAL_ID
        iput-object p2, v0, $LOCAL_NAME
        iput p3, v0, $LOCAL_FLAGS
        const/4 v1, -0x1
        iput v1, v0, $LOCAL_COLOR
        iput v1, v0, $LOCAL_UNREAD
        iput v1, v0, $LOCAL_PENDING_UNREAD
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v1
        const/4 v2, 0x0
        invoke-virtual {v1, v0, v2}, $ADD_FILTER
        invoke-static {p0}, $STORAGE_INSTANCE
        move-result-object v1
        ${site.saveFolder(1, 0, 2, 3)}
        invoke-static {p0}, $NOTIFICATIONS_INSTANCE
        move-result-object v1
        sget v2, $FILTERS_UPDATED
        const/4 v3, 0x0
        new-array v3, v3, [Ljava/lang/Object;
        invoke-virtual {v1, v2, v3}, $post
        return-void
    """)
    // Telegram's own Delete folder: an update with no filter in it, and once the server says yes, out of
    // the list and database.
    writeStub(CHAT_TYPE_FOLDERS, "deleteFolder", 5, """
        new-instance v0, $UPDATE_FILTER
        invoke-direct {v0}, $UPDATE_INIT
        iput p1, v0, $UPDATE_ID
        invoke-static {p0}, $CONNECTIONS_INSTANCE
        move-result-object v1
        check-cast p2, $REQUEST_DELEGATE
        invoke-virtual {v1, v0, p2}, $SEND_REQUEST
        return-void
    """)
    writeStub(CHAT_TYPE_FOLDERS, "dropFolder", 7, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        iget-object v1, v0, $FILTERS_BY_ID
        invoke-virtual {v1, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;
        move-result-object v1
        if-eqz v1, :hush_gone
        check-cast v1, $LOCAL_FILTER
        invoke-virtual {v0, v1}, $REMOVE_FILTER
        invoke-static {p0}, $STORAGE_INSTANCE
        move-result-object v0
        ${site.delete?.smali(0, 1, 0, 2) ?: "invoke-virtual {v0, v1}, $DELETE_FILTER"}
        :hush_gone
        return-void
    """)
    // What Telegram's folder screen sends after a reorder: every folder id, All chats included, as the list has them.
    writeStub(CHAT_TYPE_FOLDERS, "sendFolderOrder", 8, """
        new-instance v0, $UPDATE_ORDER
        invoke-direct {v0}, $ORDER_INIT
        iget-object v1, v0, $ORDER_IDS
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v2
        iget-object v2, v2, $FILTERS
        invoke-virtual {v2}, Ljava/util/ArrayList;->size()I
        move-result v3
        const/4 v4, 0x0
        :hush_next
        if-ge v4, v3, :hush_send
        invoke-virtual {v2, v4}, Ljava/util/ArrayList;->get(I)Ljava/lang/Object;
        move-result-object v5
        check-cast v5, $LOCAL_FILTER
        iget v5, v5, $LOCAL_ID
        invoke-static {v5}, Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;
        move-result-object v5
        invoke-virtual {v1, v5}, Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z
        add-int/lit8 v4, v4, 0x1
        goto :hush_next
        :hush_send
        invoke-static {v0}, $CHAT_TYPE_FOLDERS->outgoingOrder(Ljava/lang/Object;)V
        invoke-static {p0}, $CONNECTIONS_INSTANCE
        move-result-object v2
        check-cast p1, $REQUEST_DELEGATE
        invoke-virtual {v2, v0, p1}, $SEND_REQUEST
        return-void
    """)
    // The request Telegram sends when it loads folders from the server, for the tag colors it gave the new ones.
    writeStub(CHAT_TYPE_FOLDERS, "fetchFolders", 4, """
        new-instance v0, $GET_FILTERS
        invoke-direct {v0}, $GET_FILTERS_INIT
        invoke-static {p0}, $CONNECTIONS_INSTANCE
        move-result-object v1
        check-cast p1, $REQUEST_DELEGATE
        invoke-virtual {v1, v0, p1}, $SEND_REQUEST
        return-void
    """)
    // What loading the server's list does to a folder's color: set, saved as Telegram's folder screen saves
    // an edit, and the tabs redrawn.
    writeStub(CHAT_TYPE_FOLDERS, "setFolderColor", 9, """
        invoke-static {p0}, $CONTROLLER_INSTANCE
        move-result-object v0
        iget-object v0, v0, $FILTERS_BY_ID
        invoke-virtual {v0, p1}, Landroid/util/SparseArray;->get(I)Ljava/lang/Object;
        move-result-object v0
        if-eqz v0, :hush_gone
        check-cast v0, $LOCAL_FILTER
        iput p2, v0, $LOCAL_COLOR
        invoke-static {p0}, $STORAGE_INSTANCE
        move-result-object v1
        const/4 v2, 0x0
        ${site.saveFolder(1, 0, 2, 3)}
        invoke-static {p0}, $NOTIFICATIONS_INSTANCE
        move-result-object v1
        sget v2, $FILTERS_UPDATED
        const/4 v3, 0x0
        new-array v3, v3, [Ljava/lang/Object;
        invoke-virtual {v1, v2, v3}, $post
        :hush_gone
        return-void
    """)
}

/**
 * Nothing in Telegram is hooked: the extension asks for folders through stubs, from the switch.
 * The stubs call Telegram's account, folder and request members from the extension's package, so
 * each one has to be public, and a local folder's chat type bits have to be the ones the extension
 * compares, which MessagesController's static initializer sets. NotificationCenter's post method
 * is renamed by R8, so it's taken from the call removeFilter makes to say the folders changed.
 *
 * @return the post method's reference
 */
internal fun BytecodePatchContext.resolveChatTypeFolders(): ChatTypeFoldersSite {
    requireStatusMethod("chatTypeFolders")
    controlHook(CHAT_TYPE_FOLDERS, "selectedAccount", emptyList(), "I")
    controlHook(CHAT_TYPE_FOLDERS, "signedIn", listOf("I"), "Z")
    controlHook(CHAT_TYPE_FOLDERS, "userId", listOf("I"), "J")
    controlHook(CHAT_TYPE_FOLDERS, "foldersLoaded", listOf("I"), "Z")
    controlHook(CHAT_TYPE_FOLDERS, "folderCount", listOf("I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "folderId", listOf("I", "I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "folderFlags", listOf("I", "I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "folderName", listOf("I", "I"), STRING)
    controlHook(CHAT_TYPE_FOLDERS, "folderChanges", listOf("I", "I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "folderColor", listOf("I", "I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "folderLimit", listOf("I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "requestDelegate", emptyList(), "Ljava/lang/Class;")
    controlHook(CHAT_TYPE_FOLDERS, "errorText", listOf(OBJECT), STRING)
    controlHook(CHAT_TYPE_FOLDERS, "serverFolderColor", listOf(OBJECT, "I"), "I")
    controlHook(CHAT_TYPE_FOLDERS, "createFolder", listOf("I", "I", STRING, "Z", "Z", "Z", "Z", "Z", OBJECT), "V")
    controlHook(CHAT_TYPE_FOLDERS, "addFolder", listOf("I", "I", STRING, "I"), "V")
    controlHook(CHAT_TYPE_FOLDERS, "deleteFolder", listOf("I", "I", OBJECT), "V")
    controlHook(CHAT_TYPE_FOLDERS, "dropFolder", listOf("I", "I"), "V")
    controlHook(CHAT_TYPE_FOLDERS, "sendFolderOrder", listOf("I", OBJECT), "V")
    controlHook(CHAT_TYPE_FOLDERS, "outgoingOrder", listOf(OBJECT), "V")
    controlHook(CHAT_TYPE_FOLDERS, "fetchFolders", listOf("I", OBJECT), "V")
    controlHook(CHAT_TYPE_FOLDERS, "setFolderColor", listOf("I", "I", "I"), "V")

    // Telegram calls a request's callback through RequestDelegate's one method, and the extension answers
    // it with a Proxy that knows only that method, so the interface has to be exactly that.
    val delegate = tgMutableClassDefByOrNull(REQUEST_DELEGATE)
    controlShape(delegate != null && AccessFlags.PUBLIC.isSet(delegate.accessFlags) &&
        AccessFlags.INTERFACE.isSet(delegate.accessFlags) &&
        delegate.methods.map { "${it.origName}${it.origDescriptor}" } == listOf(DELEGATE_RUN),
        "Telegram's request callback changed")

    val controller = tgMutableClassDefByOrNull(MESSAGES_CONTROLLER)
    controlShape(controller != null, "MessagesController is missing")
    // A starting value the compiler moved into the class's static values, or failing that, the last
    // constant the register held when the static initializer puts it, straight through.
    val stored = mutableMapOf<String, Int?>()
    for (field in controller!!.staticFields) {
        (field.initialValue as? IntEncodedValue)?.let { stored[field.origString()] = it.value }
    }
    val init = controller.methods.singleOrNull { it.origName == "<clinit>" }?.controlBody().orEmpty()
    val constants = mutableMapOf<Int, Int>()
    for (instruction in init) {
        val register = (instruction as? OneRegisterInstruction)?.registerA ?: continue
        when {
            instruction.opcode in setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST) ->
                constants[register] = (instruction as NarrowLiteralInstruction).narrowLiteral
            instruction.opcode == Opcode.SPUT -> instruction.controlRef()?.let { stored[it] = constants[register] }
            // 13.2 builds ALL_CHATS by or-ing its bits together.
            instruction.opcode in setOf(Opcode.OR_INT_LIT8, Opcode.OR_INT_LIT16) -> {
                val from = constants[(instruction as TwoRegisterInstruction).registerB]
                if (from == null) constants.remove(register) else constants[register] = from or (instruction as NarrowLiteralInstruction).narrowLiteral
            }
            instruction.opcode == Opcode.OR_INT_2ADDR -> {
                val (a, b) = constants[register] to constants[(instruction as TwoRegisterInstruction).registerB]
                if (a == null || b == null) constants.remove(register) else constants[register] = a or b
            }
            else -> constants.remove(register)
        }
    }
    // 13.2 folds the five chat type constants into their uses and keeps only ALL_CHATS, their union.
    val typeFields = TYPE_FLAGS.map { it.first }
    controlShape(if (controller.staticFields.any { it.origString() in typeFields }) TYPE_FLAGS.all { (field, bit) -> stored[field] == bit }
        else stored[ALL_CHATS_FLAG] == TYPE_FLAGS.sumOf { it.second }, "Telegram's folder chat type flags changed")

    // removeFilter reads dialogFiltersUpdated and hands it straight to NotificationCenter's post.
    val remove = controller.methods.singleOrNull { it.origString() == REMOVE_FILTER }?.controlBody().orEmpty()
    val read = remove.indexOfFirst { it.opcode == Opcode.SGET && it.controlRef() == FILTERS_UPDATED }
    val post = if (read < 0) null else remove.drop(read + 1).firstOrNull { it.opcode == Opcode.INVOKE_VIRTUAL }?.call()
    controlShape(post != null && post.origDefiningClass == NOTIFICATIONS &&
        post.controlShape(listOf("I", "[Ljava/lang/Object;"), "V"), "Telegram's folder list update changed")

    for ((reference, static) in listOf(SELECTED_ACCOUNT to true, USER_CONFIG_INSTANCE to true, CLIENT_ACTIVATED to false,
        CLIENT_USER_ID to false, IS_PREMIUM to false, CONTROLLER_INSTANCE to true, FILTERS to false, FILTERS_LOADED to false,
        LIMIT_DEFAULT to false, LIMIT_PREMIUM to false, FILTERS_BY_ID to false, ADD_FILTER to false, REMOVE_FILTER to false,
        STORAGE_INSTANCE to true, NOTIFICATIONS_INSTANCE to true,
        FILTERS_UPDATED to true, post.toString() to false, LOCAL_INIT to false, LOCAL_ID to false, LOCAL_FLAGS to false,
        LOCAL_NAME to false, LOCAL_COLOR to false, LOCAL_UNREAD to false, LOCAL_PENDING_UNREAD to false,
        LOCAL_ALWAYS to false, LOCAL_NEVER to false, LOCAL_ENTITIES to false, LOCAL_PINNED to false, PINS_SIZE to false,
        CONNECTIONS_INSTANCE to true, SEND_REQUEST to false, NEW_FILTER_INIT to false, UPDATE_INIT to false,
        "$TITLE-><init>()V" to false, FILTER_ID to false, FILTER_TITLE to false, TITLE_TEXT to false,
        FILTER_CONTACTS to false, FILTER_NON_CONTACTS to false, FILTER_GROUPS to false, FILTER_BROADCASTS to false,
        FILTER_BOTS to false, UPDATE_FLAGS to false, UPDATE_ID to false, UPDATE_FILTER_FIELD to false,
        ORDER_INIT to false, ORDER_IDS to false, ERROR_TEXT to false, GET_FILTERS_INIT to false,
        SERVER_FILTERS_LIST to false, FILTER_FLAGS to false, FILTER_COLOR to false)) {
        requireReachable(reference, static)
    }
    val save = postedFolderStorage(SAVE_FILTER, "save", listOf(LOCAL_FILTER, "Z"))
    if (save == null) requireReachable(SAVE_FILTER, false)
    val delete = postedFolderStorage(DELETE_FILTER, "delete", listOf(LOCAL_FILTER))
    if (delete == null) requireReachable(DELETE_FILTER, false)
    return ChatTypeFoldersSite(post.toString(), save, delete)
}
