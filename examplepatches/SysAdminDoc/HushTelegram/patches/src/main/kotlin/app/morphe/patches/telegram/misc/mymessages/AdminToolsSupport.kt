/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.mymessages

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireStatusMethod
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlShape
import app.morphe.patches.telegram.misc.localcontrols.controlSingle
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.patches.telegram.misc.localcontrols.forEachClassMentioning
import app.morphe.patches.telegram.misc.localcontrols.requireReachable
import app.morphe.util.call
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origParameterTypes
import app.morphe.util.names.origReturnType
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference

internal const val ADMIN_TOOLS = "$EXTENSION_PACKAGE/misc/AdminTools;"
private const val ADMIN_OBJECT = "Ljava/lang/Object;"
private const val ADMIN_ACTIVITY = "Landroid/app/Activity;"
private const val ADMIN_BUNDLE = "Landroid/os/Bundle;"
private const val ADMIN_MESSAGES = "Lorg/telegram/messenger/MessagesController;"
private const val ADMIN_CHAT = "Lorg/telegram/tgnet/TLRPC\$Chat;"
private const val ADMIN_FULL = "Lorg/telegram/tgnet/TLRPC\$ChatFull;"
private const val ADMIN_RIGHTS = "Lorg/telegram/tgnet/TLRPC\$TL_chatAdminRights;"
private const val ADMIN_GET_CHAT = "$ADMIN_MESSAGES->getChat(Ljava/lang/Long;)$ADMIN_CHAT"
private const val ADMIN_GET_FULL = "$ADMIN_MESSAGES->getChatFull(J)$ADMIN_FULL"
private const val OPEN_SEARCH = "open_search"
private const val SELECT_TYPE = "selectType"
private const val INVITE_FIELD = "exported_invite"
private val ADMIN_ZERO = setOf(Opcode.CONST_4, Opcode.CONST_16, Opcode.CONST, Opcode.CONST_WIDE_16, Opcode.CONST_WIDE_32, Opcode.CONST_WIDE)

/**
 * The screens Admin tools opens, as Telegram's member lists [members] open them: the screens' base
 * class's [present] and [parentActivity], the member lists' details setter [membersInfo], Recent
 * Actions [log], and Invite Links [links], whose constructor takes the chat's ID as parameter
 * [linksChatId] of [linksParameters] and zeros for the rest, then [linksInfo] with the chat's
 * details and their [invite] link.
 */
internal class AdminToolsSite(
    val present: String, val parentActivity: String, val members: String, val membersInfo: MethodReference, val log: String,
    val links: String, val linksParameters: List<String>, val linksChatId: Int, val linksInfo: MethodReference, val invite: FieldReference,
)

/**
 * Telegram's member lists are the one screen whose constructor reads both `open_search` and
 * `selectType` from its arguments. Their admin rows open Recent Actions with the chat and Invite
 * Links with the chat's ID and two zeros, then hand Invite Links the chat's details and link, which
 * is where the extension finds those two screens in a build that renamed them.
 */
internal fun BytecodePatchContext.resolveAdminTools(site: MyMessagesSite): AdminToolsSite {
    requireStatusMethod("adminTools")
    controlHook(ADMIN_TOOLS, "rights", listOf(ADMIN_OBJECT), "I")
    controlHook(ADMIN_TOOLS, "chatFull", listOf(ADMIN_OBJECT), ADMIN_OBJECT)
    controlHook(ADMIN_TOOLS, "activity", listOf(ADMIN_OBJECT), ADMIN_ACTIVITY)
    controlHook(ADMIN_TOOLS, "recentActions", listOf(ADMIN_OBJECT), "Z")
    controlHook(ADMIN_TOOLS, "members", listOf(ADMIN_OBJECT, "I", ADMIN_OBJECT), "Z")
    controlHook(ADMIN_TOOLS, "inviteLinks", listOf(ADMIN_OBJECT, ADMIN_OBJECT), "Z")

    // The screens' base class: the first of the chat screen's parents that opens screens of its own kind.
    val base = screenBase(site.chat)
    controlShape(base != null, "the chat screen's base class is missing")
    controlMembers(base!!, "presentFragment($base)Z", "getParentActivity()$ADMIN_ACTIVITY")
    val present = "$base->presentFragment($base)Z"

    val lists = mutableListOf<String>()
    forEachClassMentioning(Mention.allOf(listOf(Mention.string(OPEN_SEARCH), Mention.string(SELECT_TYPE)))) { cls ->
        if (cls.origType.startsWith("Lapp/hushtelegram/")) return@forEachClassMentioning
        if (cls.methods.any { m ->
                m.name == "<init>" && m.parameterTypes.map(CharSequence::toString) == listOf(ADMIN_BUNDLE) &&
                    m.controlBody().mapNotNull { it.controlString() }.let { OPEN_SEARCH in it && SELECT_TYPE in it }
            }) lists += cls.type
    }
    val members = lists.distinct().controlSingle("the member lists")
    controlShape(extendsScreen(members, base), "the member lists aren't a screen")
    val membersClass = tgMutableClassDefBy(members)
    val membersInfo = membersClass.methods.filter { m ->
        !AccessFlags.STATIC.isSet(m.accessFlags) && m.origParameterTypes == listOf(ADMIN_FULL) && m.origReturnType == "V"
    }.controlSingle("the member lists' details setter")
    requireReachable("$members-><init>($ADMIN_BUNDLE)V", false)
    requireReachable(membersInfo.toString(), false)

    // The screens the member lists' rows open, by the constructors they call.
    val logs = mutableSetOf<String>()
    val linkSites = mutableListOf<Triple<List<Instruction>, Int, MethodReference>>()
    for (method in membersClass.methods) {
        val body = method.controlBody()
        for (at in body.indices) {
            val made = body[at].call() ?: continue
            if (made.name != "<init>" || made.definingClass == members || !extendsScreen(made.definingClass, base)) continue
            if (made.origParameterTypes == listOf(ADMIN_CHAT)) logs += made.definingClass
            if (made.origParameterTypes.sorted() == listOf("I", "J", "J")) linkSites += Triple(body, at, made)
        }
    }
    val log = logs.toList().controlSingle("Recent Actions")
    requireReachable("$log-><init>($ADMIN_CHAT)V", false)

    val (body, at, made) = linkSites.controlSingle("Invite Links")
    val links = made.definingClass
    val parameters = made.origParameterTypes
    requireReachable(made.toString(), false)
    // Which of the constructor's parameters gets the chat's ID: R8 reorders them.
    val registers = body[at].namedRegisters()
    var offset = 1
    val roles = parameters.map { type ->
        val register = registers[offset]
        offset += if (type == "J") 2 else 1
        val writer = (at - 1 downTo maxOf(0, at - 8)).map { body[it] }
            .firstOrNull { it.opcode.setsRegister() && (it as? OneRegisterInstruction)?.registerA == register }
        when {
            writer == null -> "unknown"
            type == "J" && writer.opcode == Opcode.IGET_WIDE && writer.controlField()?.definingClass == members -> "id"
            writer.opcode in ADMIN_ZERO && (writer as WideLiteralInstruction).wideLiteral == 0L -> "zero"
            else -> "unknown"
        }
    }
    controlShape(roles.count { it == "id" } == 1 && roles.count { it == "zero" } == parameters.size - 1,
        "Invite Links no longer opens with the chat's ID and zeros: $roles")
    val after = body.drop(at + 1).take(6)
    val invite = after.firstOrNull { it.opcode == Opcode.IGET_OBJECT && it.controlField()?.let { f -> f.definingClass == ADMIN_FULL && f.origName == INVITE_FIELD } == true }
        ?.controlField()
    val linksInfo = after.mapNotNull { it.call() }.firstOrNull { call ->
        call.definingClass == links && call.origReturnType == "V" && call.origParameterTypes.size == 2 && call.origParameterTypes[0] == ADMIN_FULL
    }
    controlShape(invite != null && linksInfo != null, "Invite Links no longer gets the chat's details and link")
    requireReachable(linksInfo.toString(), false)
    requireReachable("${invite!!.definingClass}->${invite.name}:${invite.type}", false)

    controlMembers(ADMIN_MESSAGES, "static getInstance(I)$ADMIN_MESSAGES", "getChat(Ljava/lang/Long;)$ADMIN_CHAT", "getChatFull(J)$ADMIN_FULL")
    controlMembers(ADMIN_CHAT, "creator:Z", "admin_rights:$ADMIN_RIGHTS", "broadcast:Z", "megagroup:Z", "monoforum:Z")
    controlMembers(ADMIN_RIGHTS, "ban_users:Z", "invite_users:Z")
    return AdminToolsSite(present, "$base->getParentActivity()$ADMIN_ACTIVITY", members, membersInfo, log,
        links, parameters, roles.indexOf("id"), linksInfo!!, invite)
}

/** The first of [type] and its parents with a `presentFragment` that takes that class itself, or null. */
private fun BytecodePatchContext.screenBase(type: String): String? {
    var at: String? = type
    repeat(12) {
        val cls = at?.let { tgClassDefByOrNull(it) } ?: return null
        if (cls.methods.any { it.origName == "presentFragment" && it.returnType == "Z" && it.parameterTypes.map(CharSequence::toString) == listOf(cls.type) }) {
            return cls.type
        }
        at = cls.superclass
    }
    return null
}

/** Whether [type] is a class under [base], as far as Telegram's classes go. */
private fun BytecodePatchContext.extendsScreen(type: String, base: String): Boolean {
    var at: String? = tgClassDefByOrNull(type)?.superclass
    repeat(12) {
        if (at == base) return true
        at = at?.let { tgClassDefByOrNull(it)?.superclass } ?: return false
    }
    return false
}

/** The Admin tools stubs' bodies, from the chat screen [site] and the screens [admin] found. */
internal fun BytecodePatchContext.writeAdminToolsStubs(site: MyMessagesSite, admin: AdminToolsSite) {
    val chat = site.chat
    val header = site.header
    // The chat behind a negative dialog ID, read the way My messages reads it, as rights bits.
    writeStub(ADMIN_TOOLS, "rights", 5, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.dialogGetter}
        move-result-wide v0
        const-wide/16 v2, 0x0
        cmp-long v2, v0, v2
        if-gez v2, :none
        neg-long v0, v0
        invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {p0}, ${header.accountGetter}
        move-result v0
        invoke-static {v0}, $ADMIN_MESSAGES->getInstance(I)$ADMIN_MESSAGES
        move-result-object v0
        invoke-virtual {v0, v1}, $ADMIN_GET_CHAT
        move-result-object v0
        if-eqz v0, :none
        iget-boolean v1, v0, $ADMIN_CHAT->monoforum:Z
        if-nez v1, :none
        const/4 v1, 0x1
        iget-boolean v2, v0, $ADMIN_CHAT->creator:Z
        if-eqz v2, :rights
        or-int/lit8 v1, v1, 0x2
        :rights
        iget-object v2, v0, $ADMIN_CHAT->admin_rights:$ADMIN_RIGHTS
        if-eqz v2, :kind
        or-int/lit8 v1, v1, 0x4
        iget-boolean v3, v2, $ADMIN_RIGHTS->ban_users:Z
        if-eqz v3, :invite
        or-int/lit8 v1, v1, 0x20
        :invite
        iget-boolean v3, v2, $ADMIN_RIGHTS->invite_users:Z
        if-eqz v3, :kind
        or-int/lit8 v1, v1, 0x40
        :kind
        iget-boolean v2, v0, $ADMIN_CHAT->broadcast:Z
        if-eqz v2, :group
        or-int/lit8 v1, v1, 0x8
        :group
        iget-boolean v2, v0, $ADMIN_CHAT->megagroup:Z
        if-eqz v2, :done
        or-int/lit8 v1, v1, 0x10
        :done
        return v1
        :none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(ADMIN_TOOLS, "chatFull", 4, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.dialogGetter}
        move-result-wide v0
        neg-long v0, v0
        invoke-virtual {p0}, ${header.accountGetter}
        move-result v2
        invoke-static {v2}, $ADMIN_MESSAGES->getInstance(I)$ADMIN_MESSAGES
        move-result-object v2
        invoke-virtual {v2, v0, v1}, $ADMIN_GET_FULL
        move-result-object v0
        return-object v0
    """)
    writeStub(ADMIN_TOOLS, "activity", 2, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${admin.parentActivity}
        move-result-object v0
        return-object v0
    """)
    // Recent Actions takes the chat itself, as the member lists' row hands it over.
    writeStub(ADMIN_TOOLS, "recentActions", 4, """
        check-cast p0, $chat
        invoke-virtual {p0}, ${header.dialogGetter}
        move-result-wide v0
        neg-long v0, v0
        invoke-static {v0, v1}, Ljava/lang/Long;->valueOf(J)Ljava/lang/Long;
        move-result-object v1
        invoke-virtual {p0}, ${header.accountGetter}
        move-result v0
        invoke-static {v0}, $ADMIN_MESSAGES->getInstance(I)$ADMIN_MESSAGES
        move-result-object v0
        invoke-virtual {v0, v1}, $ADMIN_GET_CHAT
        move-result-object v0
        if-nez v0, :found
        const/4 v0, 0x0
        return v0
        :found
        new-instance v1, ${admin.log}
        invoke-direct {v1, v0}, ${admin.log}-><init>($ADMIN_CHAT)V
        invoke-virtual {p0, v1}, ${admin.present}
        move-result v0
        return v0
    """)
    // The member list of one type, with the arguments and details Telegram's profile screen gives it.
    writeStub(ADMIN_TOOLS, "members", 7, """
        check-cast p0, $chat
        new-instance v0, $ADMIN_BUNDLE
        invoke-direct {v0}, $ADMIN_BUNDLE-><init>()V
        invoke-virtual {p0}, ${header.dialogGetter}
        move-result-wide v1
        neg-long v1, v1
        const-string v3, "chat_id"
        invoke-virtual {v0, v3, v1, v2}, $ADMIN_BUNDLE->putLong(Ljava/lang/String;J)V
        const-string v3, "type"
        invoke-virtual {v0, v3, p1}, $ADMIN_BUNDLE->putInt(Ljava/lang/String;I)V
        new-instance v1, ${admin.members}
        invoke-direct {v1, v0}, ${admin.members}-><init>($ADMIN_BUNDLE)V
        if-eqz p2, :shown
        check-cast p2, $ADMIN_FULL
        invoke-virtual {v1, p2}, ${admin.membersInfo}
        :shown
        invoke-virtual {p0, v1}, ${admin.present}
        move-result v0
        return v0
    """)
    // Invite Links with the chat's ID in its place and zeros in the rest, then the details and their link.
    val arguments = StringBuilder()
    var next = 1
    admin.linksParameters.forEachIndexed { index, type ->
        when {
            index == admin.linksChatId -> arguments.append("""
                invoke-virtual {p0}, ${header.dialogGetter}
                move-result-wide v$next
                neg-long v$next, v$next
            """)
            type == "J" -> arguments.append("const-wide/16 v$next, 0x0\n")
            else -> arguments.append("const/4 v$next, 0x0\n")
        }
        next += if (type == "J") 2 else 1
    }
    val last = next - 1
    writeStub(ADMIN_TOOLS, "inviteLinks", next + 2, """
        check-cast p0, $chat
        check-cast p1, $ADMIN_FULL
        $arguments
        new-instance v0, ${admin.links}
        invoke-direct/range {v0 .. v$last}, ${admin.links}-><init>(${admin.linksParameters.joinToString("")})V
        iget-object v1, p1, ${admin.invite}
        invoke-virtual {v0, p1, v1}, ${admin.linksInfo}
        invoke-virtual {p0, v0}, ${admin.present}
        move-result v0
        return v0
    """)
}
