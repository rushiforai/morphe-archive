/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.bottoken

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.hostsOf
import app.morphe.patcher.extensions.InstructionExtensions.getInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patcher.util.smali.ExternalLabel
import app.morphe.patches.telegram.misc.api.DEBUG_TEST_BACKEND
import app.morphe.patches.telegram.misc.api.TEST_SERVERS_SHOWN
import app.morphe.patches.telegram.misc.api.WRONG_COUNTRY
import app.morphe.patches.telegram.misc.api.testServerSignInPatch
import app.morphe.patches.telegram.misc.extension.CONNECTIONS_MANAGER
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_GATE_SIZE
import app.morphe.patches.telegram.misc.extension.SEND_REQUEST_INTERNAL
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.names.addInstructionsWithLabels
import app.morphe.util.names.origDescriptor
import app.morphe.util.names.origName
import app.morphe.util.names.origRef
import app.morphe.util.names.origType
import app.morphe.util.names.replaceInstruction
import app.morphe.util.names.tgMutableClassDefBy
import app.morphe.util.numberOfParameterRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import java.util.concurrent.ConcurrentHashMap
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/**
 * Bot token sign-in on each declared build: the phone number screen hands itself to the extension
 * at its one return, every stub reaches the member it names, the bot token request becomes a
 * Telegram request, and the gate on ConnectionsManager's send asks the extension first. A build
 * that has moved any of it is left alone and says why.
 */
class BotTokenSignInFixtureTest {
    @Test fun `the phone screen hands itself over at its return on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            val sites = context.resolveBotSignIn()
            val stock = ImmutableMethod.of(sites.constructor)
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { botTokenSignInPatch.execute(context) })
            assertHooked(name, stock, sites.constructor, sites.end)
            assertEquals("$name: switch reported", 1L, statusFact(context))
        }
    }

    @Test fun `a branch onto the screen's return reaches the hook too`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val sites = contextFor(build).resolveBotSignIn()
            // Both 13.2 builds fall into the return. A copy with a test that jumps onto it shows a
            // jump lands on the hook as well.
            val early = MutableMethod(ImmutableMethod.of(sites.constructor)).apply {
                addInstructionsWithLabels(sites.end, "if-eqz p0, :hush_return\nnop", ExternalLabel("hush_return", getInstruction(sites.end)))
            }
            val stock = ImmutableMethod.of(early)
            val end = sites.end + 2
            assertTrue("$name: the copy jumps onto the return", end in ControlFlow.of(stock).normal[sites.end])
            insertPhoneScreenHook(early, end)
            assertHooked("$name with a jump", stock, early, end)
            assertTrue("$name: the jump lands on the hook", end in ControlFlow.of(early).normal[sites.end])
        }
    }

    @Test fun `each stub reaches the member it names on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            val sites = context.resolveBotSignIn()
            botTokenSignInPatch.execute(context)
            val stubs = context.tgMutableClassDefBy(BOT_SIGN_IN).methods
            fun shapes(stub: String) = stubs.single { it.origName == stub }.controlBody().map { it.shape() }
            assertEquals("$name: login", listOf(listOf(Opcode.CHECK_CAST, sites.viewType), listOf(Opcode.IGET_OBJECT, sites.loginField),
                listOf(Opcode.RETURN_OBJECT, null)), shapes("login"))
            assertEquals("$name: mode", listOf(listOf(Opcode.CHECK_CAST, sites.loginType), listOf(Opcode.IGET, sites.modeField),
                listOf(Opcode.RETURN, null)), shapes("mode"))
            assertEquals("$name: account", listOf(listOf(Opcode.CHECK_CAST, sites.loginType), listOf(Opcode.INVOKE_VIRTUAL, sites.account),
                listOf(Opcode.MOVE_RESULT, null), listOf(Opcode.RETURN, null)), shapes("account"))
            assertEquals("$name: account getter", "getCurrentAccount()I", sites.account.substringAfter("->"))
            assertEquals("$name: requestDelegate", listOf(listOf(Opcode.CONST_CLASS, DELEGATE), listOf(Opcode.RETURN_OBJECT, null)),
                shapes("requestDelegate"))
            assertEquals("$name: sendRequest", listOf(listOf(Opcode.INVOKE_STATIC, MANAGER_INSTANCE), listOf(Opcode.MOVE_RESULT_OBJECT, null),
                listOf(Opcode.CHECK_CAST, TLOBJECT), listOf(Opcode.CHECK_CAST, DELEGATE), listOf(Opcode.CONST_16, null),
                listOf(Opcode.INVOKE_VIRTUAL, MANAGER_SEND), listOf(Opcode.RETURN_VOID, null)), shapes("sendRequest"))
            val flags = stubs.single { it.origName == "sendRequest" }.controlBody().single { it.opcode == Opcode.CONST_16 }
            assertEquals("$name: sent the way the phone screen sends its own", 10, (flags as NarrowLiteralInstruction).narrowLiteral)
            assertEquals("$name: signedIn", listOf(listOf(Opcode.CHECK_CAST, sites.loginType), listOf(Opcode.CONST_4, null),
                listOf(Opcode.IPUT_BOOLEAN, sites.syncField), listOf(Opcode.CHECK_CAST, AUTHORIZATION_TYPE),
                listOf(Opcode.INVOKE_VIRTUAL, sites.ending), listOf(Opcode.RETURN_VOID, null)), shapes("signedIn"))
            assertTrue("$name: the ending takes the authorization and a flag", sites.ending.endsWith("($AUTHORIZATION_TYPE" + "Z)V"))
            assertEquals("$name: isBot", listOf(listOf(Opcode.INVOKE_STATIC, CONFIG_INSTANCE), listOf(Opcode.MOVE_RESULT_OBJECT, null),
                listOf(Opcode.INVOKE_VIRTUAL, CURRENT_USER), listOf(Opcode.MOVE_RESULT_OBJECT, null), listOf(Opcode.IF_EQZ, null),
                listOf(Opcode.IGET_BOOLEAN, USER_IS_BOT), listOf(Opcode.RETURN, null), listOf(Opcode.CONST_4, null), listOf(Opcode.RETURN, null)),
                shapes("isBot"))
        }
    }

    @Test fun `the bot token request becomes a Telegram request on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            botTokenSignInPatch.execute(context)
            val request = context.tgMutableClassDefBy(BOT_TOKEN_REQUEST)
            assertEquals("$name: extends TLObject", TLOBJECT, request.superclass)
            val init = request.methods.single { it.name == "<init>" }.controlBody()
            assertEquals("$name: builds on TLObject()", listOf(listOf(Opcode.INVOKE_DIRECT_RANGE, "$TLOBJECT-><init>()V")),
                init.filter { it.opcode == Opcode.INVOKE_DIRECT || it.opcode == Opcode.INVOKE_DIRECT_RANGE }.map { it.shape() })
            val call = init.single { it.opcode == Opcode.INVOKE_DIRECT_RANGE } as RegisterRangeInstruction
            val self = request.methods.single { it.name == "<init>" }.let { it.implementation!!.registerCount - it.numberOfParameterRegisters }
            assertEquals("$name: on this", listOf(self, 1), listOf(call.startRegister, call.registerCount))
            val serialize = request.methods.single { it.name == "serializeToStream" }
            assertEquals("$name: overrides TLObject's writer", "($OUTPUT_DATA)V", serialize.origDescriptor)
            assertEquals("$name: writes through the extension", listOf(listOf(Opcode.INVOKE_VIRTUAL, "$BOT_TOKEN_REQUEST->write(Ljava/lang/Object;)V"),
                listOf(Opcode.RETURN_VOID, null)), serialize.controlBody().map { it.shape() })
            val deserialize = request.methods.single { it.name == "deserializeResponse" }
            assertEquals("$name: overrides TLObject's reader", "(${INPUT_DATA}IZ)$TLOBJECT", deserialize.origDescriptor)
            assertEquals("$name: reads an auth.Authorization", listOf(listOf(Opcode.INVOKE_STATIC, READ_AUTHORIZATION),
                listOf(Opcode.MOVE_RESULT_OBJECT, null), listOf(Opcode.RETURN_OBJECT, null)), deserialize.controlBody().map { it.shape() })
            for (method in listOf(serialize, deserialize)) {
                assertTrue("$name: ${method.name} is public", AccessFlags.PUBLIC.isSet(method.accessFlags))
            }
        }
    }

    @Test fun `the send gate asks the extension first on each declared build`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = contextFor(build)
            val stock = ImmutableMethod.of(send(context))
            botTokenSignInPatch.execute(context)
            val after = send(context).controlBody()
            assertEquals("$name: the gate", listOf(listOf(Opcode.INVOKE_STATIC_RANGE, BOT_SIGN_IN_DROP), listOf(Opcode.MOVE_RESULT, null),
                listOf(Opcode.IF_EQZ, null), listOf(Opcode.RETURN_VOID, null)), after.take(SEND_REQUEST_GATE_SIZE).map { it.shape() })
            assertEquals("$name: the stock send is whole below it", stock.controlBody().filter { it.opcode != Opcode.NOP }.map { it.shape() },
                after.drop(SEND_REQUEST_GATE_SIZE).filter { it.opcode != Opcode.NOP }.map { it.shape() })
        }
    }

    @Test fun `every Telegram class the extension names is on each declared build`() {
        val named = ExtensionDex.classes().filter { it.origType == BOT_SIGN_IN || it.origType == BOT_TOKEN_REQUEST }
            .flatMap { it.methods }.flatMap { it.controlBody() }
            .mapNotNull { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string }
            .filter { it.startsWith("org.telegram.tgnet.") && !it.endsWith("$") }
            .map { "L" + it.replace('.', '/') + ";" }.toSet()
        assertEquals("the extension's requests, answers, the sign-in answer and the writer: $named", 15, named.size)
        for (build in Fixtures.declaredBuilds()) {
            val found = FixtureDex.classes(build, named)
            assertEquals("${build.name}: every named class", named, found.keys)
            for ((type, classDef) in found) {
                assertTrue("${build.name}: $type is public", AccessFlags.PUBLIC.isSet(classDef.accessFlags))
                if (AccessFlags.INTERFACE.isSet(classDef.accessFlags)) continue
                assertTrue("${build.name}: $type()", classDef.methods.any {
                    it.name == "<init>" && it.parameterTypes.isEmpty() && AccessFlags.PUBLIC.isSet(it.accessFlags)
                })
            }
        }
    }

    @Test fun `Test server sign-in and bot token sign-in share the phone screen in either order`() {
        for (build in Fixtures.declaredBuilds()) for (testServerFirst in listOf(true, false)) {
            val name = "${build.name} test server ${if (testServerFirst) "first" else "second"}"
            val context = contextFor(build)
            val constructor = context.resolveBotSignIn().constructor
            val patches = if (testServerFirst) listOf(testServerSignInPatch, botTokenSignInPatch) else listOf(botTokenSignInPatch, testServerSignInPatch)
            assertEquals("$name: no warning", emptyList<String>(), PatchLogCapture.warnings { patches.forEach { it.execute(context) } })
            val body = constructor.controlBody()
            assertEquals("$name: each hook once", listOf(1, 1),
                listOf(TEST_SERVERS_SHOWN, BOT_SIGN_IN_PHONE_SCREEN).map { hook -> body.count { it.controlRef() == hook } })
            val end = body.indexOfFirst { it.opcode == Opcode.RETURN_VOID }
            assertEquals("$name: the phone screen hook is right before the return", BOT_SIGN_IN_PHONE_SCREEN, body[end - 1].controlRef())
        }
    }

    @Test fun `a changed phone screen refuses before anything is edited`() {
        class Case(val name: String, val why: String, val hosts: (List<ClassDef>) -> List<ClassDef> = { it },
                   val change: ((BotSignInSites) -> Unit)? = null)
        val cases = listOf(
            Case("mode", "the login screen's mode is missing or ambiguous", change = { sites ->
                val body = sites.constructor.controlBody()
                for (index in body.indices.reversed()) {
                    if (body[index].opcode == Opcode.IF_NEZ && body[index - 1].opcode == Opcode.IGET &&
                        body[index - 1].origRef() == sites.modeField) sites.constructor.replaceInstruction(index, "nop")
                }
            }),
            Case("end", "the phone number screen's end is missing or ambiguous", change = { sites ->
                sites.constructor.replaceInstruction(sites.end - 1, "return-void")
            }),
            Case("callback", "Telegram's request callback changed", hosts = { hosts -> hosts.filter { it.origType != DELEGATE } }),
            Case("answer", "Telegram's sign-in answer is no longer a request answer",
                hosts = { hosts -> hosts.filter { it.origType != AUTHORIZATION_TYPE } }),
        )
        for (build in Fixtures.declaredBuilds()) for (case in cases) {
            val name = "${build.name}: ${case.name}"
            val context = PatchContexts.of(case.hosts(hosts(build)).distinctBy { it.type })
            val constructor = phoneScreenConstructor(context, build)
            case.change?.invoke(context.resolveBotSignIn())
            val before = snapshot(context, constructor)
            try {
                botTokenSignInPatch.execute(context)
                fail("$name was accepted")
            } catch (expected: PatchException) {
                assertTrue("$name: ${expected.message}", expected.message.orEmpty().contains("${case.why} (before editing)"))
            }
            assertEquals("$name: nothing edited", before, snapshot(context, constructor))
            assertEquals("$name: reports no switch", 0L, statusFact(context))
        }
    }

    /**
     * [patched] is [stock] with the hook right before the return at [end], handed this, and every
     * way into the stock return now reaches the hook first.
     */
    private fun assertHooked(name: String, stock: Method, patched: Method, end: Int) {
        val before = stock.controlBody()
        assertEquals("$name: the stock return", Opcode.RETURN_VOID, before[end].opcode)
        val expected = mutableListOf<List<Any?>>()
        for ((index, instruction) in before.withIndex()) {
            if (index == end) expected += listOf(Opcode.INVOKE_STATIC_RANGE, BOT_SIGN_IN_PHONE_SCREEN)
            if (instruction.opcode != Opcode.NOP) expected += instruction.shape()
        }
        val after = patched.controlBody()
        assertEquals("$name: hooked before the return, stock otherwise", expected, after.filter { it.opcode != Opcode.NOP }.map { it.shape() })
        assertEquals("$name: at the stock return's place", listOf(BOT_SIGN_IN_PHONE_SCREEN, null), listOf(after[end].controlRef(), after[end + 1].controlRef()))
        assertEquals("$name: then the return", Opcode.RETURN_VOID, after[end + 1].opcode)
        val call = after[end] as RegisterRangeInstruction
        val self = patched.implementation!!.registerCount - patched.numberOfParameterRegisters
        assertEquals("$name: hands over this", listOf(self, 1), listOf(call.startRegister, call.registerCount))
        val stockFlow = ControlFlow.of(stock)
        val flow = ControlFlow.of(patched)
        val arrivals = stockFlow.normal.indices.filter { end in stockFlow.normal[it] }
        assertTrue("$name: something reaches the stock return", arrivals.isNotEmpty())
        for (from in arrivals) assertTrue("$name: $from reaches the hook", end in flow.normal[from])
        assertTrue("$name: only the hook reaches the return",
            flow.normal.indices.none { it != end && end + 1 in flow.normal[it] } && flow.exceptional.none { end + 1 in it })
        assertEquals("$name: no register added", stock.implementation!!.registerCount, patched.implementation!!.registerCount)
    }

    private fun contextFor(build: File) = PatchContexts.of(hosts(build))

    private fun send(context: BytecodePatchContext): MutableMethod =
        context.tgMutableClassDefBy(CONNECTIONS_MANAGER).methods.single { it.origName == SEND_REQUEST_INTERNAL }

    private fun phoneScreenConstructor(context: BytecodePatchContext, build: File): MutableMethod {
        val view = phoneScreen(build)
        return context.tgMutableClassDefBy(view.type).methods.single { it.name == "<init>" && it.parameterTypes.size == 2 &&
            it.parameterTypes[1].toString() == "Landroid/content/Context;" }
    }

    /** What the patch could edit: the phone screen, the send, the stubs and the request's class. */
    private fun snapshot(context: BytecodePatchContext, constructor: MutableMethod): List<Any?> = listOf(
        constructor.controlBody().map { it.shape() },
        send(context).controlBody().map { it.shape() },
        context.tgMutableClassDefBy(BOT_SIGN_IN).methods.sortedBy { it.name + it.parameterTypes }.map { method -> method.controlBody().map { it.shape() } },
        context.tgMutableClassDefBy(BOT_TOKEN_REQUEST).let { request -> listOf(request.superclass, request.methods.map { it.name }.sorted()) },
    )

    private fun statusFact(context: BytecodePatchContext): Long =
        (context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == "botTokenSignIn" }.controlBody().first()
            as WideLiteralInstruction).wideLiteral

    /** Opcode and Telegram's name for what it touches, with a widened goto read as a goto. */
    private fun Instruction.shape(): List<Any?> = listOf(
        when (opcode) {
            Opcode.GOTO_16, Opcode.GOTO_32 -> Opcode.GOTO
            else -> opcode
        },
        origRef(),
    )

    private companion object {
        const val DELEGATE = "Lorg/telegram/tgnet/RequestDelegate;"
        const val TLOBJECT = "Lorg/telegram/tgnet/TLObject;"
        const val OUTPUT_DATA = "Lorg/telegram/tgnet/OutputSerializedData;"
        const val INPUT_DATA = "Lorg/telegram/tgnet/InputSerializedData;"
        const val AUTHORIZATION_TYPE = "Lorg/telegram/tgnet/TLRPC\$TL_auth_authorization;"
        const val ANY_AUTHORIZATION_TYPE = "Lorg/telegram/tgnet/TLRPC\$auth_Authorization;"
        const val READ_AUTHORIZATION = "$ANY_AUTHORIZATION_TYPE->TLdeserialize(${INPUT_DATA}IZ)$ANY_AUTHORIZATION_TYPE"
        const val MANAGER_INSTANCE = "$CONNECTIONS_MANAGER->getInstance(I)$CONNECTIONS_MANAGER"
        const val MANAGER_SEND = "$CONNECTIONS_MANAGER->sendRequest($TLOBJECT${DELEGATE}I)I"
        const val CONFIG = "Lorg/telegram/messenger/UserConfig;"
        const val CONFIG_INSTANCE = "$CONFIG->getInstance(I)$CONFIG"
        const val CURRENT_USER = "$CONFIG->getCurrentUser()Lorg/telegram/tgnet/TLRPC\$User;"
        const val USER_IS_BOT = "Lorg/telegram/tgnet/TLRPC\$User;->bot:Z"
    }
}

private val BOT_SIGN_IN_HOSTS = ConcurrentHashMap<String, List<ClassDef>>()

/** The phone number screen on [build]: the view that labels its Test Backend box. */
private fun phoneScreen(build: File): ClassDef =
    screens(build).single { screen -> screen.methods.any { method -> method.controlBody().any { it.controlRef() == DEBUG_TEST_BACKEND } } }

private val SCREEN_CENSUS = FixtureDex.ClassCensus()

/** The sign-in screens Test server sign-in reads too: the phone view and the one that checks a number's country. */
private fun screens(build: File): List<ClassDef> = FixtureDex.classesWhere(build, SCREEN_CENSUS, { true }) { method ->
    method.controlBody().any { it.controlRef() == DEBUG_TEST_BACKEND || it.controlRef() == WRONG_COUNTRY }
}

/**
 * What bot token sign-in reads or edits on [build]: the sign-in screens, the login screen the phone
 * view belongs to and the fragment it extends, ConnectionsManager, UserConfig and the request
 * classes the patch checks, with the extension.
 */
private fun hosts(build: File): List<ClassDef> = (ExtensionDex.classes() + BOT_SIGN_IN_HOSTS.hostsOf(build.path) {
    val view = phoneScreen(build)
    val login = view.methods.single { it.name == "<init>" && it.parameterTypes.size == 2 }.parameterTypes[0].toString()
    val loginClass = FixtureDex.classes(build, setOf(login)).getValue(login)
    val fragment = FixtureDex.classes(build, setOf(loginClass.superclass!!)).values
    screens(build) + loginClass + fragment + FixtureDex.classes(build, setOf(CONNECTIONS_MANAGER, "Lorg/telegram/messenger/UserConfig;",
        "Lorg/telegram/tgnet/TLRPC\$User;", "Lorg/telegram/messenger/BuildVars;", "Lorg/telegram/tgnet/RequestDelegate;",
        "Lorg/telegram/tgnet/TLObject;", "Lorg/telegram/tgnet/OutputSerializedData;", "Lorg/telegram/tgnet/InputSerializedData;",
        "Lorg/telegram/tgnet/TLRPC\$auth_Authorization;", "Lorg/telegram/tgnet/TLRPC\$TL_auth_authorization;",
        "Lorg/telegram/tgnet/TLRPC\$TL_error;")).values
}).distinctBy { it.type }
