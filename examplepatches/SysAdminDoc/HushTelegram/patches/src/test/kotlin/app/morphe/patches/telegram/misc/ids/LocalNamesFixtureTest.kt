/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.ids

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod.Companion.toMutable
import app.morphe.patches.telegram.misc.analytics.GhostModeFixtureTest
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_INTERNAL
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlString
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.SwitchPayload
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction30t
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/** Rename on this phone's places (#104), on each build's own code. */
class LocalNamesFixtureTest {
    @Test fun `each hook goes where it reads only its own method's values and the stock code runs on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val (found, missing) = context.resolveLocalNames()
            assertNull("$name: $missing", missing)
            val hook = found!!
            val stock = hook.methods.associateWith { ImmutableMethod.of(it) }
            hook.applyTo()

            // putUser, putChat and processUpdateArray each hand over this and their first parameter, first thing.
            for ((method, call) in listOf(hook.putUser to LN_USER_HOOK, hook.putChat to LN_CHAT_HOOK, hook.updates to LN_UPDATES_HOOK)) {
                val case = "$name: ${method.origName}"
                assertEquals("$case: register count", stock.getValue(method).implementation!!.registerCount, method.implementation!!.registerCount)
                val first = method.controlBody().first()
                assertEquals("$case: hook", Opcode.INVOKE_STATIC_RANGE, first.opcode)
                assertEquals("$case: hook", call, first.origRef())
                val p0 = method.implementation!!.registerCount - ins(method)
                assertEquals("$case: the hook reads this and the first parameter", listOf(p0, p0 + 1), first.namedRegisters())
                assertStockKept(case, stock.getValue(method), method, 0..0)
                assertEquals("$case: the hook sits outside every try block", emptyList<Int>(), ControlFlow.of(method).exceptional[0])
            }

            // Each database writer takes the hook's answer in place of the item it took off its list.
            assertEquals("$name: two writers", listOf("putUsersInternal", "putChatsInternal"), hook.stored.map { it.method.origName })
            for ((site, call) in hook.stored.zip(listOf(LN_STORED_USER, LN_STORED_CHAT))) {
                val case = "$name: ${site.method.origName}"
                assertEquals("$case: register count", stock.getValue(site.method).implementation!!.registerCount,
                    site.method.implementation!!.registerCount)
                val body = site.method.controlBody()
                val at = site.cast + 1
                val self = site.method.implementation!!.registerCount - 2
                assertEquals("$case: cast", Opcode.CHECK_CAST, body[site.cast].opcode)
                assertEquals("$case: the hook", listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST),
                    body.subList(at, at + 3).map { it.opcode })
                assertEquals("$case: the hook", call, body[at].origRef())
                assertEquals("$case: this and the item", listOf(self, site.register), body[at].namedRegisters())
                assertEquals("$case: the answer goes back where the item was", listOf(site.register), body[at + 1].namedRegisters())
                assertEquals("$case: and is cast as the item was", listOf(site.register), body[at + 2].namedRegisters())
                assertEquals("$case: and is cast as the item was", body[site.cast].origRef(), body[at + 2].origRef())
                assertStockKept(case, stock.getValue(site.method), site.method, at..at + 2)
            }

            // The request gate asks first thing in the send, with the connection manager, the request and its callback.
            val send = hook.gate.method!!
            GhostModeFixtureTest.assertGates(name, stock.getValue(send), send, LN_OUTGOING)
        }
    }

    @Test fun `a mention and the phone's contacts get Telegram's name and the stock code runs on`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val (found, missing) = context.resolveLocalNames()
            assertNull("$name: $missing", missing)
            val mentions = mentions(context, build)
            assertTrue("$name: Telegram's mentions", mentions.size >= 2)
            val phoneBook = context.tgMutableClassDefBy(LN_CONTACTS).methods.single { it.origName == "applyContactToPhoneBook" }
            val stock = (mentions.map { it.first } + phoneBook).distinct().associateWith { ImmutableMethod.of(it) }
            found!!.applyTo()

            // Each mention asks the hook for its text where it asked Telegram's first name call, with the same user and flag.
            for ((method, sites) in mentions.groupBy({ it.first }, { it.second })) {
                val case = "$name: ${method.definingClass}->${method.name}"
                val old = stock.getValue(method)
                assertEquals("$case: register count", old.implementation!!.registerCount, method.implementation!!.registerCount)
                val before = old.controlBody()
                val after = method.controlBody()
                val expected = shape(old, IntRange.EMPTY).toMutableList()
                for (at in sites) {
                    assertEquals("$case: the hook at $at", LN_MENTION_HOOK, after[at].origRef())
                    assertEquals("$case: the hook at $at", before[at].opcode, after[at].opcode)
                    assertEquals("$case: the user and flag at $at", before[at].namedRegisters(), after[at].namedRegisters())
                    val place = before.take(at).count { it.opcode != Opcode.NOP }
                    expected[place] = expected[place].toMutableList().also { it[2] = LN_MENTION_HOOK }
                }
                assertEquals("$case: everything else as it was", expected, shape(method, IntRange.EMPTY))
                assertEquals("$case: handlers", handlers(old), handlers(method))
            }
            assertEquals("$name: no mention still takes Telegram's first name", emptyList<String>(),
                mentions(context, build).map { (method, at) -> "${method.definingClass}->${method.name} at $at" })

            // The phone's contacts are written from what the hook hands back, first thing.
            val case = "$name: applyContactToPhoneBook"
            assertEquals("$case: register count", stock.getValue(phoneBook).implementation!!.registerCount, phoneBook.implementation!!.registerCount)
            val body = phoneBook.controlBody()
            val p0 = phoneBook.implementation!!.registerCount - ins(phoneBook)
            assertEquals("$case: the hook", listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT_OBJECT, Opcode.CHECK_CAST), body.take(3).map { it.opcode })
            assertEquals("$case: the hook", LN_PHONE_BOOK_HOOK, body[0].origRef())
            assertEquals("$case: this, the writes and the user", listOf(p0, p0 + 1, p0 + 2), body[0].namedRegisters())
            assertEquals("$case: the answer goes back where the user was", listOf(p0 + 2), body[1].namedRegisters())
            assertEquals("$case: and is cast as the user was", listOf(p0 + 2), body[2].namedRegisters())
            assertEquals("$case: and is cast as the user was", DC_USER, body[2].origRef())
            assertStockKept(case, stock.getValue(phoneBook), phoneBook, 0..2)
            assertEquals("$case: the hook sits outside every try block", emptyList<Int>(), ControlFlow.of(phoneBook).exceptional[0])
        }
    }

    @Test fun `in the patch Special contacts still reads first`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = context(build)
            val names = context.resolveLocalNames().first!!
            val special = context.resolveSpecialContacts().first!!
            assertEquals(names.putUser, special.putUser)
            assertEquals(names.updates, special.updates)
            names.applyTo()
            special.applyTo()
            assertEquals("${build.name}: putUser", listOf(SC_USER_HOOK, LN_USER_HOOK), names.putUser.controlBody().take(2).map { it.origRef() })
            assertEquals("${build.name}: processUpdateArray", listOf(SC_UPDATES_HOOK, LN_UPDATES_HOOK),
                names.updates.controlBody().take(2).map { it.origRef() })
        }
    }

    @Test fun `every Telegram field the runtime reads is a public field on each build`() {
        val fields = mapOf(
            DC_USER to listOf("id", "first_name", "last_name", "phone", "self", "contact", "mutual_contact"),
            LN_CHAT to listOf("id", "title"),
            "Lorg/telegram/tgnet/tl/TL_update\$TL_updateUserName;" to listOf("user_id", "first_name", "last_name"),
            "Lorg/telegram/tgnet/TLRPC\$TL_contacts_addContact;" to listOf("id", "first_name", "last_name", "phone"),
            "Lorg/telegram/tgnet/TLRPC\$TL_inputUser;" to listOf("user_id"),
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_editChatTitle;" to listOf("chat_id", "title"),
            "Lorg/telegram/tgnet/TLRPC\$TL_channels_editTitle;" to listOf("channel", "title"),
            "Lorg/telegram/tgnet/TLRPC\$TL_inputChannel;" to listOf("channel_id"),
            "Lorg/telegram/tgnet/TLRPC\$TL_inputMediaContact;" to listOf("first_name", "last_name", "phone_number", "vcard"),
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendMedia;" to listOf("media"),
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_editMessage;" to listOf("media"),
            "Lorg/telegram/tgnet/TLRPC\$TL_messages_sendMultiMedia;" to listOf("multi_media"),
            "Lorg/telegram/tgnet/TLRPC\$TL_inputSingleMedia;" to listOf("media"),
            "Lorg/telegram/tgnet/TLRPC\$TL_contacts_importContacts;" to listOf("contacts"),
            "Lorg/telegram/tgnet/TLRPC\$TL_inputPhoneContact;" to listOf("phone", "first_name", "last_name"),
            "Lorg/telegram/tgnet/tl/TL_bots\$setBotInfo;" to listOf("bot", "name"),
        )
        // The database is handed a copy of the user or chat, made with no arguments.
        val copied = listOf("Lorg/telegram/tgnet/TLRPC\$TL_user;", "Lorg/telegram/tgnet/TLRPC\$TL_channel;", "Lorg/telegram/tgnet/TLRPC\$TL_chat;")
        for (build in Fixtures.declaredBuilds()) {
            val classes = HashMap<String, ClassDef>()
            var wanted = fields.keys + copied
            while (wanted.isNotEmpty()) {
                val found = FixtureDex.classes(build, wanted)
                classes.putAll(found)
                wanted = found.values.mapNotNull { it.superclass }.filter { it.startsWith("Lorg/telegram/") && it !in classes }.toSet()
            }
            for ((type, names) in fields) {
                assertNotNull("${build.name}: $type", classes[type])
                val line = generateSequence(classes[type]) { classes[it.superclass ?: ""] }.toList()
                for (field in names) {
                    assertTrue("${build.name}: $type.$field", line.any { owner ->
                        owner.fields.any { it.name == field && AccessFlags.PUBLIC.isSet(it.accessFlags) && !AccessFlags.STATIC.isSet(it.accessFlags) }
                    })
                }
            }
            for (type in copied) {
                assertNotNull("${build.name}: $type", classes[type])
                assertTrue("${build.name}: $type()", classes[type]!!.methods.any { it.name == "<init>" && it.parameterTypes.isEmpty() })
            }
        }
    }

    @Test fun `a build missing what the hooks need gets no hook and a reason and keeps its code`() {
        val cases: List<Pair<String, (BytecodePatchContext) -> Unit>> = listOf(
            "MessagesController.putChat is missing" to { c -> c.tgMutableClassDefBy(SC_CONTROLLER).methods.removeAll { it.origName == "putChat" } },
            "MessagesController.putUser is missing" to { c -> c.tgMutableClassDefBy(SC_CONTROLLER).methods.removeAll { it.origName == "putUser" } },
            "MessagesStorage.putUsersInternal is missing" to { c -> c.tgMutableClassDefBy(LN_STORAGE).methods.removeAll { it.origName == "putUsersInternal" } },
            "MessagesStorage.putChatsInternal no longer runs" to { c -> statement(c, "putChatsInternal", LN_CHATS_STATEMENT) },
            "no boolean method localNames()" to { c -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "localNames" } },
            "currentAccount" to { c -> c.tgMutableClassDefBy(SC_BASE).fields.removeAll { it.origName == "currentAccount" } },
            "storedUser runtime hook" to { c -> c.tgMutableClassDefBy(LOCAL_NAMES).methods.removeAll { it.origName == "storedUser" } },
            "outgoing runtime hook" to { c -> c.tgMutableClassDefBy(LOCAL_NAMES).methods.removeAll { it.origName == "outgoing" } },
            "jumps back to the start of MessagesController.putChat" to { c -> jumpTo(c, SC_CONTROLLER, "putChat") { 0 } },
            "jumps into MessagesStorage.putUsersInternal" to { c -> jumpTo(c, LN_STORAGE, "putUsersInternal") { body ->
                body.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.origRef() == DC_USER } + 1 } },
            "request sends" to { c -> c.tgMutableClassDefBy(CONNECTIONS_MANAGER).methods.removeAll { it.origName == SEND_REQUEST_INTERNAL } },
            "mentionName runtime hook" to { c -> c.tgMutableClassDefBy(LOCAL_NAMES).methods.removeAll { it.origName == "mentionName" } },
            "phoneBookUser runtime hook" to { c -> c.tgMutableClassDefBy(LOCAL_NAMES).methods.removeAll { it.origName == "phoneBookUser" } },
            "ContactsController.applyContactToPhoneBook is missing" to { c ->
                c.tgMutableClassDefBy(LN_CONTACTS).methods.removeAll { it.origName == "applyContactToPhoneBook" } },
            "jumps back to the start of ContactsController.applyContactToPhoneBook" to { c -> jumpTo(c, LN_CONTACTS, "applyContactToPhoneBook") { 0 } },
            "no mention of a person" to { c ->
                val hosts = mutableListOf<String>()
                c.classDefForEach { cls -> if (cls.methods.any { mentionCalls(it).isNotEmpty() }) hosts += cls.type }
                hosts.forEach { type -> c.tgMutableClassDefBy(type).methods.removeAll { mentionCalls(it).isNotEmpty() } }
            },
        )
        for (build in Fixtures.declaredBuilds()) for ((why, change) in cases) {
            val context = context(build)
            change(context)
            val before = state(context, build)
            val (hook, missing) = context.resolveLocalNames()
            assertNull("${build.name}: $why", hook)
            assertNotNull("${build.name}: $why", missing)
            assertTrue("${build.name}: expected \"$why\" in \"$missing\"", why in missing!!)
            assertEquals("${build.name}: $why leaves every method as it was", before, state(context, build))
        }
    }

    private fun context(build: File): BytecodePatchContext {
        val types = setOf(SC_CONTROLLER, SC_BASE, DC_USER, LN_CHAT, LN_STORAGE, CONNECTIONS_MANAGER, LN_CONTACTS)
        val telegram = FixtureDex.classes(build, types)
        assertEquals("${build.name}: every class the hooks read", types, telegram.keys)
        return PatchContexts.of((ExtensionDex.classes() + telegram.values + mentionHosts(build)).distinctBy { it.type })
    }

    /** Every mention in [c]'s classes that make one, as its method and where it asks for the name. */
    private fun mentions(c: BytecodePatchContext, build: File): List<Pair<Method, Int>> = mentionHosts(build).flatMap { host ->
        c.tgMutableClassDefBy(host.type).methods.flatMap { method -> mentionCalls(method).map { method to it } }
    }

    /** Registers the method's parameters take, this included. */
    private fun ins(method: Method) = 1 + method.parameterTypes.map { it.toString() }.sumOf { if (it == "J" || it == "D") 2 else 1 }

    /**
     * The stock body with the hook at [added] left out of the changed one, NOPs left out of both:
     * operands, branches and handlers, with GOTO_16 and GOTO_32 read as GOTO. A branch onto a NOP
     * reads as the kept instruction that NOP runs into, and the step into the hook as the step past it.
     */
    private fun assertStockKept(case: String, stock: Method, changed: Method, added: IntRange) {
        val before = shape(stock, IntRange.EMPTY)
        val after = shape(changed, added)
        assertEquals("$case: stock instructions", before.size, after.size)
        for (i in before.indices) assertEquals("$case: stock instruction $i", before[i], after[i])
        assertEquals("$case: handlers", handlers(stock), handlers(changed))
        val flow = ControlFlow.of(changed)
        assertTrue("$case: nothing else jumps onto the hook", flow.normal.withIndex().none { (at, to) -> at != added.first - 1 && added.first in to } &&
            flow.exceptional.none { added.first in it })
        for (at in added) assertEquals("$case: the hook runs straight on", listOf(at + 1), flow.normal[at])
    }

    private fun shape(method: Method, skip: IntRange): List<List<Any?>> {
        val body = method.controlBody()
        val flow = ControlFlow.of(method)
        val kept = body.indices.filter { it !in skip && body[it].opcode != Opcode.NOP }
        val place = kept.withIndex().associate { (at, index) -> index to at }
        fun at(target: Int): Any = if (target in skip) at(skip.last + 1) else place[target]
            ?: "a nop before ${kept.firstOrNull { it > target }?.let { place[it] } ?: "the end"}"
        fun places(targets: List<Int>) = targets.map { at(it) }
        return kept.map { i ->
            val instruction = body[i]
            listOf(kind(instruction.opcode), instruction.namedRegisters(), instruction.origRef(), (instruction as? WideLiteralInstruction)?.wideLiteral,
                (instruction as? SwitchPayload)?.switchElements?.map { it.key }, places(flow.normal[i]), places(flow.exceptional[i]))
        }
    }

    private fun handlers(method: Method) = method.implementation!!.tryBlocks.map { block -> block.exceptionHandlers.map { it.exceptionType } }

    private fun kind(opcode: Opcode) = if (opcode == Opcode.GOTO_16 || opcode == Opcode.GOTO_32) Opcode.GOTO else opcode

    /** Swaps [owner]'s [name] for a copy that ends with a jump to the instruction [target] picks. */
    private fun jumpTo(c: BytecodePatchContext, owner: String, name: String, target: (List<Instruction>) -> Int) {
        val type = c.tgMutableClassDefBy(owner)
        val method = type.methods.single { it.origName == name }
        val body = method.controlBody()
        val implementation = method.implementation!!
        type.methods.remove(method)
        type.methods.add(ImmutableMethod(method.definingClass, method.name, method.parameters, method.returnType, method.accessFlags,
            method.annotations, method.hiddenApiRestrictions, ImmutableMethodImplementation(implementation.registerCount,
                body + ImmutableInstruction30t(Opcode.GOTO_32, -body.drop(target(body)).sumOf { it.codeUnits }), implementation.tryBlocks,
                emptyList())).toMutable())
    }

    /** Swaps [name]'s [statement] for another, as a build that writes somewhere else would. */
    private fun statement(c: BytecodePatchContext, name: String, statement: String) {
        val method = c.tgMutableClassDefBy(LN_STORAGE).methods.single { it.origName == name }
        val at = method.controlBody().indexOfFirst { it.controlString()?.startsWith(statement) == true }
        val register = method.controlBody()[at].namedRegisters().single()
        method.replaceInstruction(at, "const-string v$register, \"INSERT INTO other VALUES(?)\"")
    }

    private fun state(c: BytecodePatchContext, build: File) =
        (listOf(SC_CONTROLLER, SC_BASE, LN_STORAGE, CONNECTIONS_MANAGER, LN_CONTACTS, SETTINGS_STATUS, LOCAL_NAMES) + mentionHosts(build).map { it.type })
        .associateWith { type ->
            val owner = c.tgMutableClassDefBy(type)
            listOf(owner.fields.map { "$it" }.sorted(), owner.methods.associate { method ->
                "$method" to listOf(method.accessFlags, method.implementation?.registerCount,
                    method.controlBody().map { listOf(it.opcode, it.namedRegisters(), it.origRef()) })
            })
        }
}

private val MENTION_HOSTS = HashMap<String, List<ClassDef>>()

/** Each build's classes that make a mention, read once, since finding them reads the whole app. */
internal fun mentionHosts(build: File): List<ClassDef> = synchronized(MENTION_HOSTS) {
    MENTION_HOSTS.getOrPut(FixtureDex.inputIdentity(build)) {
        FixtureDex.classesWhere(build, { true }) { mentionCalls(it).isNotEmpty() }
            .also { assertTrue("${build.name}: classes that make a mention", it.isNotEmpty()) }
    }
}

/**
 * Where [method] asks Telegram's first name call for a user's name and makes a SpannableString of
 * it right after: the text a mention puts in the message being typed. Read more loosely than the
 * patch reads it, so a build that moves a mention around a little still turns up here, unhooked.
 */
internal fun mentionCalls(method: Method): List<Int> {
    val body = method.controlBody()
    return body.indices.filter { at ->
        body[at].origRef() == LN_FIRST_NAME &&
            body.subList(at + 1, minOf(body.size, at + 9)).any { it.origRef()?.startsWith("Landroid/text/SpannableString;") == true }
    }
}
