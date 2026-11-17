/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.telegram.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.telegram.misc.extension.requireThisIntact
import app.morphe.patches.telegram.misc.extension.writeStub
import app.morphe.patches.telegram.misc.localcontrols.Mention
import app.morphe.patches.telegram.misc.localcontrols.classDefsMentioning
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlHook
import app.morphe.patches.telegram.misc.localcontrols.controlMembers
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.addInstructionsAtControlFlowLabel
import app.morphe.util.call
import app.morphe.util.definitionReaches
import app.morphe.util.namedRegisters
import app.morphe.util.names.loadsInt
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod

internal const val JOIN_DATES = "$EXTENSION_PACKAGE/misc/JoinDates;"
internal const val JD_CHAT_PARTICIPANT = "Lorg/telegram/tgnet/TLRPC\$ChatParticipant;"
internal const val JD_CHANNEL_PARTICIPANT = "Lorg/telegram/tgnet/TLRPC\$ChannelParticipant;"
internal const val JD_WRAPPED_PARTICIPANT = "Lorg/telegram/tgnet/TLRPC\$TL_chatChannelParticipant;"
internal const val JD_MEMBER_USER = "$JD_CHAT_PARTICIPANT->user_id:J"
internal const val JD_KICKED_BY = "$JD_CHANNEL_PARTICIPANT->kicked_by:J"
internal const val JD_MEMBER_DATE = "$JD_CHAT_PARTICIPANT->date:I"
internal const val JD_USER_STATUS = "Lorg/telegram/messenger/LocaleController;->formatUserStatus(ILorg/telegram/tgnet/TLRPC\$User;[Z[Z)Ljava/lang/String;"
internal const val JD_ONLINE = "Lorg/telegram/messenger/R\$string;->Online:I"
internal const val JD_MEMBER_HOOK = "$JOIN_DATES->member(Ljava/lang/Object;)V"
internal const val JD_CELL_HOOK = "$JOIN_DATES->cell(Ljava/lang/Object;)V"
internal const val JD_UPDATING_HOOK = "$JOIN_DATES->updating(Ljava/lang/Object;)V"
internal const val JD_STATUS_HOOK = "$JOIN_DATES->status(Ljava/lang/String;)Ljava/lang/String;"
internal const val JD_STORED_HOOK = "$JOIN_DATES->stored(Ljava/lang/Object;)V"
internal const val JD_CHANNEL_DATE = "$JD_CHANNEL_PARTICIPANT->date:I"
internal const val JD_CURSOR_INT = "Lorg/telegram/SQLite/SQLiteCursor;->intValue(I)I"
/** The query a group's saved member list is read back with. */
internal const val JD_SAVED_MEMBERS =
    "SELECT us.data, us.status, cu.data, cu.date FROM channel_users_v2 as cu LEFT JOIN users as us ON us.uid = cu.uid WHERE cu.did = "

/** setAdminRole(role, ...): the call a member list makes on each member's row. */
internal val JD_ROLE_PARAMETERS = listOf("Ljava/lang/String;", "Z", "Z", "Z", "Landroid/view/View\$OnClickListener;")

/** The member classes the date is read from. Fixture tests load these alongside the lists. */
internal val JD_TYPES = setOf(JD_CHAT_PARTICIPANT, JD_CHANNEL_PARTICIPANT, JD_WRAPPED_PARTICIPANT)

private const val JD_CELLS = "Lorg/telegram/ui/Cells/"
private const val JD_TL_OBJECT = "Lorg/telegram/tgnet/TLObject;"
private val JD_UNSAFE_SITES = setOf(Opcode.MOVE_EXCEPTION, Opcode.MOVE_RESULT, Opcode.MOVE_RESULT_WIDE, Opcode.MOVE_RESULT_OBJECT,
    Opcode.PACKED_SWITCH_PAYLOAD, Opcode.SPARSE_SWITCH_PAYLOAD, Opcode.ARRAY_PAYLOAD)

/**
 * Where each hook goes: the lists that bind a member to a row ([binders], each with the member
 * hook and the row hook), the rows that write a member's last seen line ([cells], each with the
 * hook at its start and one after each place the line's text is made), and the saved member
 * list's reader ([loader], with the hook right before it writes over a member's join date).
 */
internal class MemberJoinDatesPlan(
    val binders: List<MutableMethod>,
    val cells: List<MutableMethod>,
    val loader: MutableMethod,
    private val edits: Map<MutableMethod, List<Pair<Int, String>>>,
) {
    val methods: Set<MutableMethod> get() = edits.keys

    /** Where a method's hooks go, in instruction order. */
    fun sites(method: MutableMethod): List<Int> = edits.getValue(method).map { it.first }.sorted()

    fun applyTo() = edits.forEach { (method, code) -> insert(method, code) }

    /** Puts every hook into a copy of its method first, so one that doesn't fit stops nothing halfway. */
    fun rehearse() = edits.forEach { (method, code) -> insert(MutableMethod(ImmutableMethod.of(method)), code) }

    private fun insert(target: MutableMethod, code: List<Pair<Int, String>>) {
        // From the bottom up, so each index still names the instruction it was found at.
        for ((index, smali) in code.sortedByDescending { it.first }) target.addInstructionsAtControlFlowLabel(index, smali)
    }
}

private class NoJoinDates(why: String) : Exception(why)

private fun joinNeeded(ok: Boolean, why: String) {
    if (!ok) throw NoJoinDates(why)
}

/**
 * Member join dates read the date Telegram already sends with each member of a group. Two lists
 * show members: the Members page (the one list adapter that reads both who removed someone and
 * when they joined) and the list on the group's profile (the adapters that read a member's user ID
 * and then set that row's role). Each gets a hook naming the member it binds and the row it binds
 * it to. The rows themselves get a hook at the start of the method that writes their second line
 * and one after each of the two places that line's last seen text is made, so a row showing a role,
 * a restriction or its own status keeps it. Telegram also saves a group's members with the time it
 * saved them and, reading them back, writes that time over each member's own date, so a hook just
 * before that write keeps the date the member came with. A build where any of it can't be found
 * keeps the rest of the patch.
 *
 * @return the plan, and null; or null and why there's none
 */
internal fun BytecodePatchContext.resolveMemberJoinDates(): Pair<MemberJoinDatesPlan?, String?> = try {
    Pair(memberJoinDatesPlan(), null)
} catch (missing: NoJoinDates) {
    Pair(null, missing.message)
} catch (missing: PatchException) {
    Pair(null, missing.message)
}

private fun Instruction.isVirtualCall() = opcode == Opcode.INVOKE_VIRTUAL || opcode == Opcode.INVOKE_VIRTUAL_RANGE
private fun Instruction.isStaticCall() = opcode == Opcode.INVOKE_STATIC || opcode == Opcode.INVOKE_STATIC_RANGE
private fun Instruction.castType() = if (opcode == Opcode.CHECK_CAST) ((this as ReferenceInstruction).reference as TypeReference).type else null
private fun ControlFlow.onlyFrom(at: Int, from: Int) =
    instructions.indices.filter { at in normal[it] } == listOf(from) && exceptional.none { at in it }
private fun ControlFlow.loops(at: Int): Boolean {
    val seen = mutableSetOf<Int>()
    val pending = ArrayDeque(normal[at] + exceptional[at])
    while (pending.isNotEmpty()) {
        val next = pending.removeFirst()
        if (next == at) return true
        if (seen.add(next)) pending.addAll(normal[next] + exceptional[next])
    }
    return false
}
private fun Instruction.isRoleCall() = isVirtualCall() && call()?.let { c ->
    c.definingClass.startsWith(JD_CELLS) && c.parameterTypes.map { it.toString() } == JD_ROLE_PARAMETERS && c.returnType == "V"
} == true
private fun ClassDef.outsideExtension() = !type.startsWith("Lapp/hushtelegram/")
private fun BytecodePatchContext.mutable(method: Method): MutableMethod =
    tgMutableClassDefBy(method.definingClass).methods.single { it.toString() == method.toString() }

private fun BytecodePatchContext.memberJoinDatesPlan(): MemberJoinDatesPlan {
    controlHook(JOIN_DATES, "member", listOf("Ljava/lang/Object;"), "V")
    controlHook(JOIN_DATES, "cell", listOf("Ljava/lang/Object;"), "V")
    controlHook(JOIN_DATES, "updating", listOf("Ljava/lang/Object;"), "V")
    controlHook(JOIN_DATES, "status", listOf("Ljava/lang/String;"), "Ljava/lang/String;")
    controlHook(JOIN_DATES, "participantDate", listOf("Ljava/lang/Object;"), "I")
    controlHook(JOIN_DATES, "stored", listOf("Ljava/lang/Object;"), "V")
    controlHook(JOIN_DATES, "channelMember", listOf("Ljava/lang/Object;"), "Ljava/lang/Object;")
    controlMembers(JD_CHAT_PARTICIPANT, "date:I", "user_id:J")
    controlMembers(JD_CHANNEL_PARTICIPANT, "date:I")
    controlMembers(JD_WRAPPED_PARTICIPANT, "channelParticipant:$JD_CHANNEL_PARTICIPANT")
    joinNeeded(tgClassDefByOrNull(JD_WRAPPED_PARTICIPANT)?.superclass == JD_CHAT_PARTICIPANT,
        "a group's wrapped channel member is no longer a group member")
    val edits = linkedMapOf<Method, MutableList<Pair<Int, String>>>()
    fun edit(method: Method, index: Int, smali: String) {
        val opcode = method.controlBody()[index].opcode
        joinNeeded(opcode !in JD_UNSAFE_SITES, "a member list hook would land on a $opcode in ${method.definingClass}")
        edits.getOrPut(method) { mutableListOf() } += index to smali
    }

    // The Members page: its adapter takes each row's member from getItem(position) and binds the row it cast before.
    val pages = classDefsMentioning(Mention.reference(JD_KICKED_BY) and Mention.reference(JD_MEMBER_DATE))
        .filter { it.outsideExtension() }
        .flatMap { owner -> owner.methods.filter { method -> method.controlBody().let { body ->
            body.any { it.controlRef() == JD_KICKED_BY } && body.any { it.controlRef() == JD_MEMBER_DATE } &&
                body.any { it.castType()?.startsWith(JD_CELLS) == true }
        } } }
    joinNeeded(pages.size == 1, "the Members page's list is missing or ambiguous")
    val page = pages.single()
    val pageBody = page.controlBody()
    val items = pageBody.indices.filter { at ->
        pageBody[at].isVirtualCall() && pageBody[at].call()?.let { c ->
            c.definingClass == page.definingClass && c.parameterTypes.map { it.toString() } == listOf("I") && c.returnType == JD_TL_OBJECT
        } == true && pageBody.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT_OBJECT
    }
    joinNeeded(items.size == 1, "the Members page no longer takes one member per row")
    val item = items.single()
    val pageFlow = ControlFlow.of(page)
    val bound = item + 2
    joinNeeded(bound < pageBody.size && pageFlow.onlyFrom(bound, item + 1), "something else reaches the Members page's member")
    val member = pageBody[item + 1].namedRegisters().single()
    val cast = (item downTo 0).firstOrNull { pageBody[it].castType()?.startsWith(JD_CELLS) == true }
    joinNeeded(cast != null, "the Members page's row is missing")
    val pageCell = pageBody[cast!!].castType()!!
    val pageCellRegister = pageBody[cast].namedRegisters().first()
    joinNeeded(pageFlow.definitionReaches(cast, bound, pageCellRegister), "the Members page's row isn't the one it binds")
    edit(page, bound, """
        invoke-static/range {v$member .. v$member}, $JD_MEMBER_HOOK
        invoke-static/range {v$pageCellRegister .. v$pageCellRegister}, $JD_CELL_HOOK
    """)

    // The profile's lists: each reads a member's user ID once and then sets that member's row role.
    val binders = classDefsMentioning(Mention.reference(JD_MEMBER_USER))
        .filter { it.outsideExtension() }
        .flatMap { owner -> owner.methods.filter { it.toString() != page.toString() && it.controlBody().any { i -> i.controlRef() == JD_MEMBER_USER } } }
        .mapNotNull { method ->
            val body = method.controlBody()
            val reads = body.indices.filter { body[it].opcode == Opcode.IGET_WIDE && body[it].controlRef() == JD_MEMBER_USER }
            val roles = body.indices.filter { body[it].isRoleCall() }
            if (reads.size != 1 || roles.size != 1) return@mapNotNull null
            val flow = ControlFlow.of(method)
            // A list looking a member up in a loop (the invite link sheet) isn't binding that member.
            if (!flow.definitionReaches(reads.single(), roles.single()) || flow.loops(reads.single())) return@mapNotNull null
            Triple(method, reads.single(), roles.single())
        }
    joinNeeded(binders.isNotEmpty(), "the profile's member list is missing")
    val roleOwners = binders.map { (method, _, role) -> method.controlBody()[role].call()!!.definingClass }.toSet()
    joinNeeded(roleOwners.size == 1, "the profile's member rows aren't one kind")
    for ((method, read, role) in binders) {
        val body = method.controlBody()
        val participant = body[read].namedRegisters().last()
        val row = body[role].namedRegisters().first()
        edit(method, read, "invoke-static/range {v$participant .. v$participant}, $JD_MEMBER_HOOK")
        edit(method, role, "invoke-static/range {v$row .. v$row}, $JD_CELL_HOOK")
    }

    // The rows: one method writes the second line, with last seen made in one call and "online" in another.
    val cells = (listOf(pageCell) + roleOwners).distinct().map { type ->
        val owner = tgClassDefByOrNull(type)
        joinNeeded(owner != null, "a member row is missing")
        val writers = owner!!.methods.filter { method -> method.controlBody().any { it.controlRef() == JD_USER_STATUS } }
        joinNeeded(writers.size == 1, "a member row's last seen line is missing or ambiguous")
        val writer = writers.single()
        joinNeeded(!AccessFlags.STATIC.isSet(writer.accessFlags) && writer.parameterTypes.map { it.toString() } == listOf("I") &&
            writer.returnType == "V", "a member row's last seen line changed")
        val body = writer.controlBody()
        val flow = ControlFlow.of(writer)
        joinNeeded(flow.normal.none { 0 in it } && flow.exceptional.none { 0 in it }, "something jumps back to the start of a member row")
        writer.requireThisIntact("Member join dates", listOf(0))
        val made = body.indices.filter { body[it].isStaticCall() && body[it].controlRef() == JD_USER_STATUS }
        val online = body.indices.filter { body[it].loadsInt() && body[it].controlRef() == JD_ONLINE }
        joinNeeded(made.size == 1 && online.size == 1, "a member row no longer writes last seen in one place and online in another")
        val word = online.single()
        val wordCall = body.getOrNull(word + 1)
        joinNeeded(wordCall != null && wordCall.isStaticCall() && wordCall.call()?.returnType == "Ljava/lang/String;" &&
            wordCall.namedRegisters().firstOrNull() == body[word].namedRegisters().single(), "a member row's online text changed")
        edit(writer, 0, "invoke-static/range {p0 .. p0}, $JD_UPDATING_HOOK")
        for (result in listOf(made.single() + 1, word + 2)) {
            joinNeeded(body.getOrNull(result)?.opcode == Opcode.MOVE_RESULT_OBJECT && result + 1 < body.size &&
                flow.onlyFrom(result + 1, result), "a member row's last seen text is reached another way")
            val text = body[result].namedRegisters().single()
            edit(writer, result + 1, """
                invoke-static/range {v$text .. v$text}, $JD_STATUS_HOOK
                move-result-object v$text
            """)
        }
        writer
    }

    // The saved member list: reading a member back, Telegram writes the time it saved the list over the member's
    // own join date (and leaves the owner, who has none, joined "now"). The date it came with is kept just before.
    val loaders = classDefsMentioning(Mention.string(JD_SAVED_MEMBERS))
        .filter { it.outsideExtension() }
        .flatMap { owner -> owner.methods.filter { method -> method.controlBody().any { it.controlString() == JD_SAVED_MEMBERS } } }
    joinNeeded(loaders.size == 1, "the saved member list is missing or ambiguous")
    val loader = loaders.single()
    val loaderBody = loader.controlBody()
    val overwrites = loaderBody.indices.filter { loaderBody[it].opcode == Opcode.IPUT && loaderBody[it].controlRef() == JD_CHANNEL_DATE }
    joinNeeded(overwrites.size == 1, "the saved member list no longer sets one member date")
    val overwrite = overwrites.single()
    val (saved, held) = loaderBody[overwrite].namedRegisters()
    val loaderFlow = ControlFlow.of(loader)
    val reads = loaderBody.indices.filter { at ->
        loaderBody[at].controlRef() == JD_CURSOR_INT && loaderBody.getOrNull(at + 1)?.opcode == Opcode.MOVE_RESULT &&
            loaderBody[at + 1].namedRegisters().single() == saved && loaderFlow.definitionReaches(at + 1, overwrite, saved)
    }
    joinNeeded(reads.size == 1, "the saved member list's date no longer comes from the saved row")
    edit(loader, overwrite, "invoke-static/range {v$held .. v$held}, $JD_STORED_HOOK")

    val mutableEdits = edits.entries.associate { (method, code) -> mutable(method) to code.toList() }
    val byMethod = mutableEdits.keys.associateBy { it.toString() }
    return MemberJoinDatesPlan(
        binders = (listOf(page) + binders.map { it.first }).map { byMethod.getValue(it.toString()) },
        cells = cells.map { byMethod.getValue(it.toString()) },
        loader = byMethod.getValue(loader.toString()),
        edits = mutableEdits,
    ).also { it.rehearse() }
}

/**
 * When a member joined: a channel member's own date, the one inside a group member that wraps a
 * channel member, or a plain group member's. Anything else, a user from search included, is 0.
 * Also the channel member a group member wraps, so a date kept from the saved list is found by either.
 */
internal fun BytecodePatchContext.writeJoinDates() {
    writeStub(JOIN_DATES, "participantDate", 2, """
        instance-of v0, p0, $JD_WRAPPED_PARTICIPANT
        if-eqz v0, :hush_plain
        move-object v0, p0
        check-cast v0, $JD_WRAPPED_PARTICIPANT
        iget-object v0, v0, $JD_WRAPPED_PARTICIPANT->channelParticipant:$JD_CHANNEL_PARTICIPANT
        if-eqz v0, :hush_plain
        iget v0, v0, $JD_CHANNEL_PARTICIPANT->date:I
        if-eqz v0, :hush_plain
        return v0
        :hush_plain
        instance-of v0, p0, $JD_CHANNEL_PARTICIPANT
        if-eqz v0, :hush_chat
        check-cast p0, $JD_CHANNEL_PARTICIPANT
        iget v0, p0, $JD_CHANNEL_PARTICIPANT->date:I
        return v0
        :hush_chat
        instance-of v0, p0, $JD_CHAT_PARTICIPANT
        if-eqz v0, :hush_none
        check-cast p0, $JD_CHAT_PARTICIPANT
        iget v0, p0, $JD_CHAT_PARTICIPANT->date:I
        return v0
        :hush_none
        const/4 v0, 0x0
        return v0
    """)
    writeStub(JOIN_DATES, "channelMember", 2, """
        instance-of v0, p0, $JD_WRAPPED_PARTICIPANT
        if-eqz v0, :hush_none
        check-cast p0, $JD_WRAPPED_PARTICIPANT
        iget-object v0, p0, $JD_WRAPPED_PARTICIPANT->channelParticipant:$JD_CHANNEL_PARTICIPANT
        return-object v0
        :hush_none
        const/4 v0, 0x0
        return-object v0
    """)
}
