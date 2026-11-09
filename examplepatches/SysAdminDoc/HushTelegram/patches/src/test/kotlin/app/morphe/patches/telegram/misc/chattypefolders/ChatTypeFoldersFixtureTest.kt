/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.chattypefolders

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.encodedValue.MutableEncodedValue.Companion.toMutable
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import app.morphe.util.call
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origParameterTypes
import com.android.tools.smali.dexlib2.iface.value.IntEncodedValue
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.value.ImmutableIntEncodedValue
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.origString
import app.morphe.util.names.tgMutableClassDefBy

/** The folder stubs on both declared builds: Telegram's own folder list, limit, update request and local list. */
class ChatTypeFoldersFixtureTest {
    private val hosts = setOf(MESSAGES_CONTROLLER, LOCAL_FILTER, USER_CONFIG, CONNECTIONS, SERVER_FILTER, NEW_FILTER, TITLE,
        UPDATE_FILTER, UPDATE_ORDER, STORAGE, NOTIFICATIONS, "Lorg/telegram/messenger/support/LongSparseIntArray;",
        REQUEST_DELEGATE, TL_ERROR, GET_FILTERS, SERVER_FILTERS)
    private val stubs = listOf("selectedAccount", "signedIn", "userId", "foldersLoaded", "folderCount", "folderId",
        "folderFlags", "folderName", "folderChanges", "folderColor", "folderLimit", "requestDelegate", "errorText",
        "serverFolderColor", "createFolder", "addFolder", "deleteFolder", "dropFolder", "sendFolderOrder", "fetchFolders",
        "setFolderColor")
    private val get = "Ljava/util/ArrayList;->get(I)Ljava/lang/Object;"
    private val isEmpty = "Ljava/util/ArrayList;->isEmpty()Z"
    private val size = "Ljava/util/ArrayList;->size()I"
    private val sparseGet = "Landroid/util/SparseArray;->get(I)Ljava/lang/Object;"

    private fun context(build: File): BytecodePatchContext {
        val host = FixtureDex.classes(build, hosts).values.map(ImmutableClassDef::of)
        assertEquals("${build.name}: Telegram's folder classes", emptySet<String>(), hosts - host.map { it.origType }.toSet())
        val known = host.map { it.type }.toSet()
        return PatchContexts.of(ExtensionDex.classes() + host + savers(build).filter { it.type !in known }.map(ImmutableClassDef::of))
    }

    /**
     * The classes that post on the storage queue and handle local folders, where 13.2 inlined the folder
     * save and delete, and the lambdas they post there. A whole-APK search, so once per build.
     */
    private fun savers(build: File): List<ClassDef> = saverCache.getOrPut(build.path) {
        // The copies' member names read outside the scan, so through this build's table.
        FixtureDex.namedBy(build) {
            val posting = FixtureDex.classesWhere(build, { true }) { m -> m.controlBody().any { it.readsStorageQueue() } }
                .filter { cls -> cls.methods.any { m -> m.controlBody().any { it.controlRef()?.startsWith(LOCAL_FILTER) == true } } }
            val lambdas = posting.flatMap { it.methods }.flatMap { m ->
                m.controlBody().zipWithNext().filter { (read, made) -> read.readsStorageQueue() && made.opcode == Opcode.NEW_INSTANCE }
                    .map { (_, made) -> ((made as ReferenceInstruction).reference as TypeReference).type }
            }.toSet()
            // The queue's own class, whose post the stubs call.
            val queues = posting.flatMap { it.methods }.flatMap { m -> m.controlBody().filter { it.readsStorageQueue() } }
                .map { ((it as ReferenceInstruction).reference as FieldReference).type }.toSet()
            // A lambda can post on the queue itself, so it may already be one of the posting classes.
            (posting + FixtureDex.classes(build, lambdas + queues).values).distinctBy { it.type }
        }
    }

    /**
     * What [stub] does in place of Telegram's [kept] storage call: the call itself with [storage] and [folder],
     * or where 13.2 inlined it, the storage queue read, the lambda posted there, its constructor and the post.
     * Each of those is checked against Telegram's own post of that lambda with that case, and the case
     * against the storage's own [internal] save or delete.
     */
    private fun BytecodePatchContext.storageRefs(name: String, stub: String, kept: String, internal: List<String>,
        storage: Int, folder: Int, savers: List<ClassDef>): List<String> {
        val body = stub(stub)
        if (tgMutableClassDefBy(STORAGE).methods.any { it.origString() == kept }) {
            assertEquals("$name: $stub", listOf(storage, folder), body.single { it.controlRef() == kept }.namedRegisters().take(2))
            return listOf(kept)
        }
        val read = body.indexOfFirst { it.readsStorageQueue() }
        val queue = body[read] as TwoRegisterInstruction
        assertEquals("$name: $stub queue", storage, queue.registerB)
        assertEquals("$name: $stub lambda", Opcode.NEW_INSTANCE, body[read + 1].opcode)
        val lambda = ((body[read + 1] as ReferenceInstruction).reference as TypeReference).type
        val made = (body[read + 1] as OneRegisterInstruction).registerA
        val key = (body[read + 2] as NarrowLiteralInstruction).narrowLiteral
        val keyRegister = (body[read + 2] as OneRegisterInstruction).registerA
        val init = body[read + 3].call()!!
        val passed = body[read + 3].namedRegisters()
        val posted = body[read + 4]
        assertEquals("$name: $stub init", lambda, init.definingClass)
        assertEquals("$name: $stub init", made, passed.first())
        assertEquals("$name: $stub post", listOf(queue.registerA, made), posted.namedRegisters())
        // Telegram posts the same lambda through the same constructor and post, with this case, and its own
        // storage at the place the stub's storage goes.
        val telegram = savers.flatMap { it.methods }.flatMap { m ->
            val b = m.controlBody()
            b.indices.filter { b[it].readsStorageQueue() &&
                ((b.getOrNull(it + 1) as? ReferenceInstruction)?.reference as? TypeReference)?.type == lambda }.map { b to it }
        }
        assertTrue("$name: $stub posts what Telegram posts", telegram.any { (b, at) ->
            val call = (at + 2..minOf(at + 4, b.lastIndex)).firstOrNull { b[it].opcode == Opcode.INVOKE_DIRECT } ?: return@any false
            val args = b[call].namedRegisters()
            val constants = (at + 2 until call).mapNotNull { i ->
                (b[i] as? NarrowLiteralInstruction)?.let { (b[i] as OneRegisterInstruction).registerA to it.narrowLiteral }
            }.toMap()
            b[call].call().toString() == init.toString() && b.getOrNull(call + 1)?.call().toString() == posted.call().toString() &&
                args.size == passed.size && args.indices.all { n -> (args[n] == (b[at] as TwoRegisterInstruction).registerB) == (passed[n] == storage) } &&
                constants[args[passed.indexOf(keyRegister)]] == key
        })
        // The folder goes in at the one object place left.
        val objects = init.parameterTypes.indices.filter { init.parameterTypes[it].startsWith("L") && passed[it + 1] != storage }
        assertEquals("$name: $stub folder", listOf(folder), objects.map { passed[it + 1] })
        // That case runs the storage's own save or delete.
        val lambdaClass = savers.single { it.type == lambda }
        val run = lambdaClass.methods.single { it.name == "run" && it.parameterTypes.isEmpty() }.controlBody()
        val opened = run.drop(switchCaseStart(run, key)!!).take(12)
        // Play's 13.2 moves the case into a method of the lambda's own, which the case calls and returns.
        val own = opened.first().takeIf { it.opcode == Opcode.INVOKE_DIRECT && opened[1].opcode == Opcode.RETURN_VOID }?.call()
            ?.takeIf { it.definingClass == lambda }
        val case = if (own == null) opened else lambdaClass.methods.single { it.name == own.name && it.parameterTypes.isEmpty() }.controlBody().take(12)
        assertTrue("$name: $stub case $key", case.any { c ->
            c.call()?.let { it.origDefiningClass == STORAGE && it.origParameterTypes == internal } == true })
        return listOf(read, read + 1, read + 3, read + 4).map { body[it].controlRef()!! }
    }

    private fun ClassDef.method(name: String) = methods.single { it.origName == name }
    private fun BytecodePatchContext.method(name: String) = tgMutableClassDefBy(CHAT_TYPE_FOLDERS).method(name)
    private fun BytecodePatchContext.stub(name: String) = method(name).controlBody()
    private fun List<Instruction>.refs() = mapNotNull { it.controlRef() }
    private fun BytecodePatchContext.status() =
        (tgMutableClassDefBy(SETTINGS_STATUS).method("chatTypeFolders").controlBody().first() as WideLiteralInstruction).wideLiteral

    /** The register each parameter arrives in; none of these stubs takes a long. */
    private fun Method.param(index: Int) = implementation!!.registerCount - parameters.size + index

    /** The first register of the one instruction that names [reference], which carries the value or the receiver. */
    private fun BytecodePatchContext.first(stub: String, reference: String): Int =
        stub(stub).single { it.controlRef() == reference }.namedRegisters().first()

    private fun BytecodePatchContext.assertParams(name: String, stub: String, uses: List<Pair<String, Int>>) {
        val method = method(stub)
        for ((reference, index) in uses) assertEquals("$name: $stub $reference", method.param(index), first(stub, reference))
    }

    /** The request [stub] sends goes out with the callback it was handed in parameter [reply], cast to Telegram's. */
    private fun BytecodePatchContext.assertSentWith(name: String, stub: String, reply: Int) {
        val method = method(stub)
        val body = stub(stub)
        val cast = body.single { it.controlRef() == REQUEST_DELEGATE }
        assertEquals("$name: $stub", Opcode.CHECK_CAST, cast.opcode)
        assertEquals("$name: $stub cast", method.param(reply), cast.namedRegisters().single())
        assertEquals("$name: $stub callback", method.param(reply), body.single { it.controlRef() == SEND_REQUEST }.namedRegisters()[2])
        assertTrue("$name: $stub", body.indexOf(cast) < body.indexOfFirst { it.controlRef() == SEND_REQUEST })
    }

    @Test fun `the stubs reach Telegram's folders and do what its own folder screens do`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { chatTypeFoldersPatch.execute(context) })

            assertEquals(listOf(SELECTED_ACCOUNT), context.stub("selectedAccount").refs())
            assertEquals(listOf(USER_CONFIG_INSTANCE, CLIENT_ACTIVATED), context.stub("signedIn").refs())
            assertEquals(listOf(USER_CONFIG_INSTANCE, CLIENT_USER_ID), context.stub("userId").refs())
            assertEquals(Opcode.MOVE_RESULT_WIDE, context.stub("userId")[3].opcode)
            assertEquals(listOf(CONTROLLER_INSTANCE, FILTERS_LOADED), context.stub("foldersLoaded").refs())
            assertEquals(listOf(CONTROLLER_INSTANCE, FILTERS, "Ljava/util/ArrayList;->size()I"), context.stub("folderCount").refs())
            for ((stub, read) in listOf("folderId" to LOCAL_ID, "folderFlags" to LOCAL_FLAGS, "folderName" to LOCAL_NAME,
                "folderColor" to LOCAL_COLOR)) {
                assertEquals("$name: $stub", listOf(CONTROLLER_INSTANCE, FILTERS, get, LOCAL_FILTER, read), context.stub(stub).refs())
                context.assertParams(name, stub, listOf(CONTROLLER_INSTANCE to 0))
                assertEquals("$name: $stub index", context.method(stub).param(1), context.stub(stub).single { it.controlRef() == get }.namedRegisters()[1])
            }
            assertEquals(listOf(CONTROLLER_INSTANCE, FILTERS, get, LOCAL_FILTER, LOCAL_COLOR, LOCAL_ENTITIES, isEmpty,
                LOCAL_ALWAYS, isEmpty, LOCAL_NEVER, isEmpty, LOCAL_PINNED, PINS_SIZE), context.stub("folderChanges").refs())
            // A set color is 0 or more; no color is -1, as Telegram reads a folder without one.
            val changes = context.stub("folderChanges")
            assertTrue(name, changes.any { it.opcode == Opcode.IF_LTZ })
            // One bit each, in ChatTypeFolders' order, all into the register that's returned.
            val bits = changes.filter { it.opcode == Opcode.OR_INT_LIT8 }
            assertEquals(name, listOf(1, 2, 4, 8, 16), bits.map { (it as NarrowLiteralInstruction).narrowLiteral })
            val result = (changes.last { it.opcode == Opcode.RETURN } as OneRegisterInstruction).registerA
            assertTrue(name, bits.all { it.namedRegisters() == listOf(result, result) })
            assertEquals(listOf(CONTROLLER_INSTANCE, USER_CONFIG_INSTANCE, IS_PREMIUM, LIMIT_PREMIUM, LIMIT_DEFAULT),
                context.stub("folderLimit").refs())

            // The callback the extension's Proxy answers, and the error text it reads from a refusal.
            val callback = context.stub("requestDelegate")
            assertEquals(listOf(REQUEST_DELEGATE), callback.refs())
            assertEquals(name, Opcode.CONST_CLASS, callback.first().opcode)
            assertEquals(listOf(TL_ERROR, ERROR_TEXT), context.stub("errorText").refs())
            context.assertParams(name, "errorText", listOf(TL_ERROR to 0, ERROR_TEXT to 0))

            // A folder's color in the server's list: the folder with this id, its color only with flag 27 set.
            val colors = context.stub("serverFolderColor")
            assertEquals(listOf(SERVER_FILTERS, SERVER_FILTERS_LIST, size, get, SERVER_FILTER, FILTER_ID, FILTER_FLAGS,
                FILTER_COLOR), colors.refs())
            context.assertParams(name, "serverFolderColor", listOf(SERVER_FILTERS to 0))
            assertTrue(name, colors.single { it.opcode == Opcode.IF_EQ }.namedRegisters().contains(context.method("serverFolderColor").param(1)))
            assertEquals(name, FILTER_HAS_COLOR, (colors.single { it.opcode == Opcode.CONST_HIGH16 } as NarrowLiteralInstruction).narrowLiteral)
            assertTrue(name, colors.any { it.opcode == Opcode.AND_INT_2ADDR })
            assertEquals(name, listOf(-1, -2), colors.filter { it.opcode == Opcode.CONST_4 }
                .map { (it as NarrowLiteralInstruction).narrowLiteral }.filter { it < 0 })
            // The color returned is the one read from the folder that matched.
            val read = colors.single { it.controlRef() == FILTER_COLOR }.namedRegisters()
            assertEquals(name, read[0], (colors[colors.indexOfFirst { it.controlRef() == FILTER_COLOR } + 1] as OneRegisterInstruction).registerA)
            assertEquals(name, colors.single { it.controlRef() == FILTER_ID }.namedRegisters()[1], read[1])

            assertEquals(listOf(NEW_FILTER, NEW_FILTER_INIT, FILTER_ID, TITLE, "$TITLE-><init>()V", TITLE_TEXT, FILTER_TITLE,
                FILTER_CONTACTS, FILTER_NON_CONTACTS, FILTER_GROUPS, FILTER_BROADCASTS, FILTER_BOTS, UPDATE_FILTER, UPDATE_INIT,
                UPDATE_ID, UPDATE_FLAGS, UPDATE_FLAGS, UPDATE_FILTER_FIELD, CONNECTIONS_INSTANCE, REQUEST_DELEGATE, SEND_REQUEST),
                context.stub("createFolder").refs())
            context.assertParams(name, "createFolder", listOf(FILTER_ID to 1, TITLE_TEXT to 2, FILTER_CONTACTS to 3,
                FILTER_NON_CONTACTS to 4, FILTER_GROUPS to 5, FILTER_BROADCASTS to 6, FILTER_BOTS to 7, UPDATE_ID to 1,
                CONNECTIONS_INSTANCE to 0))
            context.assertSentWith(name, "createFolder", 8)
            // The filter flag is set before the filter goes in, so the request carries it.
            assertTrue(name, context.stub("createFolder").any { it.opcode == Opcode.OR_INT_LIT8 })

            val posters = savers(build)
            val add = context.stub("addFolder").refs()
            val saved = context.storageRefs(name, "addFolder", SAVE_FILTER, listOf(LOCAL_FILTER, "Z"), 1, 0, posters)
            assertEquals(listOf(LOCAL_FILTER, LOCAL_INIT, LOCAL_ID, LOCAL_NAME, LOCAL_FLAGS, LOCAL_COLOR, LOCAL_UNREAD,
                LOCAL_PENDING_UNREAD, CONTROLLER_INSTANCE, ADD_FILTER, STORAGE_INSTANCE) + saved + listOf(NOTIFICATIONS_INSTANCE,
                FILTERS_UPDATED, "[Ljava/lang/Object;"), add.dropLast(1))
            val post = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origString() == REMOVE_FILTER }
                .controlBody().refs().first { it.startsWith("$NOTIFICATIONS->") && it.endsWith("(I[Ljava/lang/Object;)V") }
            assertEquals(name, post, add.last())
            context.assertParams(name, "addFolder", listOf(LOCAL_ID to 1, LOCAL_NAME to 2, LOCAL_FLAGS to 3,
                CONTROLLER_INSTANCE to 0, STORAGE_INSTANCE to 0, NOTIFICATIONS_INSTANCE to 0))

            // Delete sends only the request; the folder leaves the list through dropFolder once the server says yes.
            val delete = context.stub("deleteFolder")
            assertEquals(listOf(UPDATE_FILTER, UPDATE_INIT, UPDATE_ID, CONNECTIONS_INSTANCE, REQUEST_DELEGATE, SEND_REQUEST),
                delete.refs())
            context.assertParams(name, "deleteFolder", listOf(UPDATE_ID to 1, CONNECTIONS_INSTANCE to 0))
            context.assertSentWith(name, "deleteFolder", 2)
            assertEquals(name, delete.first { it.controlRef() == UPDATE_FILTER }.namedRegisters().first(),
                delete.single { it.controlRef() == SEND_REQUEST }.namedRegisters()[1])
            assertTrue(name, delete.none { it.controlRef() == UPDATE_FILTER_FIELD })

            assertEquals(listOf(CONTROLLER_INSTANCE, FILTERS_BY_ID, sparseGet, LOCAL_FILTER, REMOVE_FILTER, STORAGE_INSTANCE) +
                context.storageRefs(name, "dropFolder", DELETE_FILTER, listOf(LOCAL_FILTER), 0, 1, posters),
                context.stub("dropFolder").refs())
            context.assertParams(name, "dropFolder", listOf(CONTROLLER_INSTANCE to 0, STORAGE_INSTANCE to 0))
            assertEquals(name, context.method("dropFolder").param(1),
                context.stub("dropFolder").single { it.controlRef() == sparseGet }.namedRegisters()[1])

            // Every folder id in the list, All chats too, goes into the order request, which the extension
            // sees right before it is sent, so a moved All Chats can go out first.
            val order = context.stub("sendFolderOrder")
            val outgoing = "$CHAT_TYPE_FOLDERS->outgoingOrder(Ljava/lang/Object;)V"
            assertEquals(listOf(UPDATE_ORDER, ORDER_INIT, ORDER_IDS, CONTROLLER_INSTANCE, FILTERS, size,
                get, LOCAL_FILTER, LOCAL_ID, "Ljava/lang/Integer;->valueOf(I)Ljava/lang/Integer;",
                "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z", outgoing, CONNECTIONS_INSTANCE, REQUEST_DELEGATE, SEND_REQUEST),
                order.refs())
            context.assertParams(name, "sendFolderOrder", listOf(CONTROLLER_INSTANCE to 0, CONNECTIONS_INSTANCE to 0))
            context.assertSentWith(name, "sendFolderOrder", 1)
            val request = order.first { it.controlRef() == UPDATE_ORDER }.namedRegisters().first()
            assertEquals(name, request, order.single { it.controlRef() == SEND_REQUEST }.namedRegisters()[1])
            assertEquals(name, listOf(request), order.single { it.controlRef() == outgoing }.namedRegisters())
            assertEquals(name, order.single { it.controlRef() == ORDER_IDS }.namedRegisters()[0],
                order.single { it.controlRef() == "Ljava/util/ArrayList;->add(Ljava/lang/Object;)Z" }.namedRegisters()[0])
            assertTrue(name, order.any { it.opcode == Opcode.GOTO } && order.any { it.opcode == Opcode.IF_GE })

            val fetch = context.stub("fetchFolders")
            assertEquals(listOf(GET_FILTERS, GET_FILTERS_INIT, CONNECTIONS_INSTANCE, REQUEST_DELEGATE, SEND_REQUEST), fetch.refs())
            context.assertParams(name, "fetchFolders", listOf(CONNECTIONS_INSTANCE to 0))
            context.assertSentWith(name, "fetchFolders", 1)
            assertEquals(name, fetch.first { it.controlRef() == GET_FILTERS }.namedRegisters().first(),
                fetch.single { it.controlRef() == SEND_REQUEST }.namedRegisters()[1])

            // The color goes on the folder with this id, saved as an edit is and posted as removeFilter posts.
            val recolor = context.stub("setFolderColor").refs()
            val folder = context.stub("setFolderColor").single { it.controlRef() == LOCAL_FILTER }.namedRegisters().single()
            assertEquals(listOf(CONTROLLER_INSTANCE, FILTERS_BY_ID, sparseGet, LOCAL_FILTER, LOCAL_COLOR, STORAGE_INSTANCE) +
                context.storageRefs(name, "setFolderColor", SAVE_FILTER, listOf(LOCAL_FILTER, "Z"), 1, folder, posters) +
                listOf(NOTIFICATIONS_INSTANCE, FILTERS_UPDATED, "[Ljava/lang/Object;"), recolor.dropLast(1))
            assertEquals(name, post, recolor.last())
            context.assertParams(name, "setFolderColor", listOf(CONTROLLER_INSTANCE to 0, LOCAL_COLOR to 2,
                STORAGE_INSTANCE to 0, NOTIFICATIONS_INSTANCE to 0))
            assertEquals(name, context.method("setFolderColor").param(1),
                context.stub("setFolderColor").single { it.controlRef() == sparseGet }.namedRegisters()[1])
            assertEquals(name, folder, context.stub("setFolderColor").single { it.controlRef() == LOCAL_COLOR }.namedRegisters()[1])

            for (stub in stubs) {
                val method = context.method(stub)
                assertTrue("$name: $stub", AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
                // Every register a stub names fits the register count it was written with.
                for (instruction in method.controlBody()) {
                    assertTrue("$name: $stub ${instruction.opcode}",
                        instruction.namedRegisters().all { it < method.implementation!!.registerCount })
                }
            }
            assertEquals(1L, context.status())
        }
    }

    /** Makes the bots bit something else, wherever this build keeps its starting value. */
    private fun BytecodePatchContext.changeBotsFlag() {
        val controller = tgMutableClassDefBy(MESSAGES_CONTROLLER)
        val bots = TYPE_FLAGS.last().first
        // 13.2 keeps only ALL_CHATS, so there the bots bit moves inside it.
        val (flag, value) = if (controller.fields.any { it.origString() == bots }) bots to 0x20 else ALL_CHATS_FLAG to 0x2f
        val field = controller.fields.single { it.origString() == flag }
        if (field.initialValue is IntEncodedValue) field.initialValue = ImmutableIntEncodedValue(value).toMutable()
        val init = controller.methods.singleOrNull { it.origName == "<clinit>" } ?: return
        val body = init.controlBody()
        val put = body.indexOfFirst { it.opcode == Opcode.SPUT && it.controlRef() == flag }
        if (put < 0) return
        val register = (body[put] as OneRegisterInstruction).registerA
        val set = (put - 1 downTo 0).first { (body[it] as? OneRegisterInstruction)?.registerA == register }
        init.replaceInstruction(set, "const/16 v$register, 0x${value.toString(16)}")
    }

    @Test fun `changed folder flags, a changed list update or an unreachable member refuse before anything is written`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "Telegram's folder chat type flags changed" to { context -> context.changeBotsFlag() },
            "Telegram's folder list update changed" to { context ->
                val remove = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origString() == REMOVE_FILTER }
                val at = remove.controlBody().indexOfFirst { it.opcode == Opcode.SGET && it.controlRef() == FILTERS_UPDATED }
                remove.replaceInstruction(at, "const/4 v0, 0x0")
            },
            "$REMOVE_FILTER isn't reachable from the extension" to { context ->
                val remove = context.tgMutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.origString() == REMOVE_FILTER }
                remove.accessFlags = remove.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
            },
            "$UPDATE_FILTER_FIELD isn't reachable from the extension" to { context ->
                val update = context.tgMutableClassDefBy(UPDATE_FILTER)
                val field = update.fields.single { it.origString() == UPDATE_FILTER_FIELD }
                field.accessFlags = field.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
            },
            // A callback the Proxy can't implement, from the extension's package, leaves every answer unheard.
            "Telegram's request callback changed" to { context ->
                val delegate = context.tgMutableClassDefBy(REQUEST_DELEGATE)
                delegate.accessFlags = delegate.accessFlags and AccessFlags.PUBLIC.value.inv()
            },
            "$FILTER_COLOR isn't reachable from the extension" to { context ->
                val filter = context.tgMutableClassDefBy(SERVER_FILTER)
                val field = filter.fields.single { it.origString() == FILTER_COLOR }
                field.accessFlags = field.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            val untouched = stubs.associateWith { stub -> context.stub(stub).map { it.opcode } }
            change(context)
            try {
                chatTypeFoldersPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, untouched, stubs.associateWith { stub -> context.stub(stub).map { it.opcode } })
            assertEquals(why, 0L, context.status())
        }
    }

    private companion object {
        val saverCache = mutableMapOf<String, List<ClassDef>>()
    }
}
