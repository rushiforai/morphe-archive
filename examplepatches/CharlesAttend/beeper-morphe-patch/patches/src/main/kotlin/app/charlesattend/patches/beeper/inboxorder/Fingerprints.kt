package app.charlesattend.patches.beeper.inboxorder

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.InstructionLocation.MatchAfterImmediately
import app.morphe.patcher.methodCall
import app.morphe.patcher.resource.ResourceType
import app.morphe.patcher.resourceLiteral
import app.morphe.patcher.string
import com.android.tools.smali.dexlib2.Opcode

/** ORDER BY clause of the inbox lists. */
internal const val INBOX_ORDER_BY = "    ORDER BY R.isInvite = 1 DESC, timestamp DESC"

internal object BooperApplicationOnCreateFingerprint : Fingerprint(
    definingClass = "Lcom/beeper/chat/booper/BooperApplication;",
    name = "onCreate",
    returnType = "V",
    parameters = listOf(),
)

/** Query of the first page of an inbox list (inbox4 ChatListViewModel.buildQuery). */
internal object InboxQueryFingerprint : Fingerprint(
    definingClass = "Lcom/beeper/inbox4/viewmodel/ChatListViewModel\$buildQuery\$1;",
    name = "invokeSuspend",
    filters = listOf(
        string(INBOX_ORDER_BY),
    ),
)

/** Query of each page that the paging source loads (inbox4 ChatListViewModel.buildQuery). */
internal object InboxPagingQueryFingerprint : Fingerprint(
    definingClass = "Lcom/beeper/inbox4/viewmodel/ChatListViewModel\$buildQuery\$2\$2;",
    name = "invokeSuspend",
    filters = listOf(
        string(INBOX_ORDER_BY),
    ),
)

/** Constructor of BeeperLimitOffsetPagingSource, the paging source of the inbox lists. */
internal object InboxPagingSourceConstructorFingerprint : Fingerprint(
    name = "<init>",
    filters = listOf(
        string("BeeperLimitOffsetPagingSource created"),
    ),
)

/** The app calls PagingSource.invalidate() right after this log message. */
internal object InboxPagingInvalidationFingerprint : Fingerprint(
    filters = listOf(
        string("Invalidation signal received, invalidating inbox PagingSource (present="),
        methodCall(
            opcode = Opcode.INVOKE_VIRTUAL,
            parameters = listOf(),
            returnType = "V",
        ),
    ),
)

/** A method of the built-in main Inbox space class. Its toString() is "Inbox". */
internal object InboxSpaceFingerprint : Fingerprint(
    returnType = "Ljava/lang/String;",
    parameters = listOf(),
    filters = listOf(
        string("BI/inbox"),
    ),
)

/**
 * Last items of the inbox title menu for the built-in spaces: "Merge Chats…" and "Settings".
 * The last filter is the call that draws the "Settings" row.
 */
internal object InboxMenuFooterFingerprint : Fingerprint(
    isStatic = true,
    returnType = "V",
    filters = listOf(
        resourceLiteral(ResourceType.STRING, "action_merge_chats"),
        resourceLiteral(ResourceType.STRING, "action_settings"),
        resourceLiteral(ResourceType.DRAWABLE, "settings_24px"),
        // painterResource(id, composer, changed)
        methodCall(opcode = Opcode.INVOKE_STATIC, location = MatchAfterImmediately()),
        // MenuRow(label, icon, color, modifier, trailingIcon, onClick, composer, changed, defaults)
        methodCall(opcode = Opcode.INVOKE_STATIC_RANGE, returnType = "V"),
    ),
)
