/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.direct.lock

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureCache
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.direct.seen.INSTAGRAM_CHATS
import app.morphe.patches.instagram.direct.seen.MarkReadFixture
import app.morphe.patches.instagram.direct.seen.NativeVisualSeenTest.Companion.fixtures
import app.morphe.patches.instagram.direct.seen.USER_SESSION
import app.morphe.patches.instagram.direct.seen.VisualSeenHookTest.Companion.snapshot
import app.morphe.patches.instagram.direct.seen.readWithoutSeenReceipt
import app.morphe.patches.instagram.direct.seen.visualCode
import app.morphe.patches.instagram.direct.seen.visualReference
import app.morphe.patches.instagram.direct.seen.visualString
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11n
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableStringReference
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Which account is in front, for the locked and hidden chats: every one of Instagram's screens hands
 * itself to the extension first in its base screen's onResume, the extension's session bridge reads
 * the screen's own session, and the account id bridge reads that session's id. "Lock your messages"
 * writes the account id bridge whether or not "Read messages without the seen receipt" is in the
 * build, and the two write it once between them in either order.
 */
class ChatAccountHookTest {
    @Test
    fun theHookAndBothBridgesAreInTheExtension() {
        val accounts = ExtensionDex.classDef(CHAT_ACCOUNTS).methods.filter { publicStatic(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("no screen hook: $accounts", SCREEN_RESUMED.substringAfter("->") in accounts)
        assertTrue("no session bridge: $accounts", "session(Ljava/lang/Object;)Ljava/lang/Object;" in accounts)
        val chats = ExtensionDex.classDef(INSTAGRAM_CHATS).methods.filter { publicStatic(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("no account id bridge: $chats", "accountId(Ljava/lang/Object;)Ljava/lang/String;" in chats)
    }

    @Test
    fun everyScreenTellsTheExtensionFirstAndTheBridgesReadItsSession() {
        val context = PatchContexts.of(listOf(screen(), MarkReadFixture.session(), MarkReadFixture.bridges(), extension()))
        val found = context.findChatAccountTargets()
        assertEquals(SCREEN, found.resume.definingClass)

        hookChatAccounts(found)

        val resume = found.resume.visualCode()
        assertEquals(SCREEN_RESUMED, (resume[0] as ReferenceInstruction).reference.toString())
        assertEquals("hands over this", found.resume.implementation!!.registerCount - 1, (resume[0] as RegisterRangeInstruction).startRegister)
        assertEquals(1, (resume[0] as RegisterRangeInstruction).registerCount)
        assertEquals("then Instagram's own onResume runs as it was", listOf(Opcode.CONST_STRING, Opcode.RETURN_VOID), resume.drop(1).map { it.opcode })
        assertSessionBridge(context, SCREEN, USER_SESSION)
        assertAccountIdWrittenOnce(context)
    }

    @Test
    fun aSessionTheSignedInOneExtendsIsEnough() {
        val context = PatchContexts.of(listOf(screen(session = SESSION_BASE), session(superclass = SESSION_BASE),
            ImmutableClassDef(SESSION_BASE, PUBLIC or AccessFlags.ABSTRACT.value, OBJECT, null, null, null, null, emptyList()),
            MarkReadFixture.bridges(), extension()))

        hookChatAccounts(context.findChatAccountTargets())

        assertSessionBridge(context, SCREEN, SESSION_BASE)
        assertAccountIdWrittenOnce(context)
    }

    @Test
    fun withReadMessagesWithoutTheSeenReceiptTheAccountIdIsWrittenOnceWhicheverRunsFirst() {
        for (lockFirst in listOf(true, false)) {
            val context = PatchContexts.of(MarkReadFixture.classes() + screen() + extension())
            if (lockFirst) {
                hookChatAccounts(context.findChatAccountTargets())
                context.readWithoutSeenReceipt()
            } else {
                context.readWithoutSeenReceipt()
                hookChatAccounts(context.findChatAccountTargets())
            }
            assertAccountIdWrittenOnce(context, "lock first: $lockFirst")
            assertSessionBridge(context, SCREEN, USER_SESSION)
        }
    }

    @Test
    fun aBuildWithoutTheBaseScreenFailsThePatch() = refuses(listOf(MarkReadFixture.session(), MarkReadFixture.bridges(), extension()),
        "screen onResume")

    @Test
    fun aBaseScreenThatLogsSomethingElseFailsThePatch() = refuses(listOf(screen(logs = "Fragment.onResume"),
        MarkReadFixture.session(), MarkReadFixture.bridges(), extension()), "screen onResume")

    @Test
    fun aScreenWithoutItsSessionFailsThePatch() = refuses(listOf(screen(session = null), MarkReadFixture.session(),
        MarkReadFixture.bridges(), extension()), "expected one session $SCREEN answers, found 0")

    @Test
    fun aSessionThatIsntASignedInOneFailsThePatch() = refuses(listOf(screen(session = "Lfixture/Other;"), MarkReadFixture.session(),
        MarkReadFixture.bridges(), extension()), "$SCREEN answers a Lfixture/Other;, which $USER_SESSION isn't")

    @Test
    fun aScreenTheExtensionCantReachFailsThePatch() = refuses(listOf(screen(flags = AccessFlags.ABSTRACT.value), MarkReadFixture.session(),
        MarkReadFixture.bridges(), extension()), "isn't public, so the extension can't reach it")

    @Test
    fun aBuildWithoutTheAccountClassFailsThePatch() = refuses(listOf(screen(), MarkReadFixture.bridges(), extension()),
        "$USER_SESSION is missing")

    @Test
    fun anAccountWithoutAnIdFailsThePatch() = refuses(listOf(screen(), MarkReadFixture.session(userId = false),
        MarkReadFixture.bridges(), extension()), "expected one account id $USER_SESSION answers, found 0")

    @Test
    fun anExtensionWithoutTheScreenHookFailsThePatch() = refuses(listOf(screen(), MarkReadFixture.session(), MarkReadFixture.bridges()),
        "the extension has no $CHAT_ACCOUNTS")

    @Test
    fun anExtensionWithoutTheAccountIdBridgeFailsThePatch() = refuses(listOf(screen(), MarkReadFixture.session(), extension()),
        "extension has no $INSTAGRAM_CHATS")

    @Test
    fun eachDeclaredBuildTellsTheExtensionWhichAccountIsInFront() = fixtures { bundle -> check(bundle.name, accountClasses(bundle)) }

    @Test
    fun eachOtherBuildDoesToo() {
        for (bundle in Fixtures.otherBuilds()) check(bundle.parentFile.name, accountClasses(bundle))
    }

    /** The patch refuses for [why] before anything changes. */
    private fun refuses(input: List<ClassDef>, why: String) {
        val context = PatchContexts.of(input)
        val before = input.associate { it.type to snapshot(it.methods) }
        val refusal = assertThrows(PatchException::class.java) { context.findChatAccountTargets() }
        assertTrue(refusal.message, refusal.message!!.startsWith("$LOCK_PATCH: "))
        assertTrue("refused for something other than \"$why\": ${refusal.message}", why in refusal.message!!)
        input.forEach { assertEquals("${it.type} was edited before refusal", before[it.type], snapshot(context.mutableClassDefBy(it.type).methods)) }
    }

    private fun check(name: String, classes: Map<String, ClassDef>) {
        val context = PatchContexts.of(classes.values)
        val found = context.findChatAccountTargets()
        val screen = found.resume.definingClass
        assertTrue("$name: $screen isn't the base screen", found.resume.visualCode().any { it.visualString() == SCREEN_RESUME })
        val before = classes.mapValues { (_, classDef) -> classDef.methods.map { method -> method.visualCode().map(::shown) } }

        hookChatAccounts(found)

        val first = found.resume.visualCode().first()
        assertEquals("$name: onResume calls $SCREEN_RESUMED", SCREEN_RESUMED, (first as ReferenceInstruction).reference.toString())
        assertEquals("$name: onResume hands over this", found.resume.implementation!!.registerCount - 1, (first as RegisterRangeInstruction).startRegister)
        assertEquals(1, first.registerCount)
        val session = classes.getValue(screen).methods.single { it.name == GET_SESSION }.returnType
        val chain = generateSequence(USER_SESSION) { classes[it]?.superclass }.toList()
        assertTrue("$name: $session is in the account's own chain $chain", session in chain)
        assertSessionBridge(context, screen, session, name)
        assertAccountIdWrittenOnce(context, name)

        for ((type, original) in before) {
            if (type == CHAT_ACCOUNTS || type == INSTAGRAM_CHATS) continue
            val methods = context.mutableClassDefBy(type).methods.toList()
            assertEquals("$name: $type lost or gained a method", original.size, methods.size)
            methods.forEachIndexed { index, method ->
                if ("${method.definingClass}->${method.name}" != "$screen->onResume") {
                    assertEquals("$name: native $type changed", original[index], method.visualCode().map(::shown))
                }
            }
        }
    }

    private fun shown(instruction: Instruction): String = when (val reference = instruction.visualReference()) {
        null -> instruction.opcode.name
        is MethodReference, is FieldReference -> "${instruction.opcode.name} $reference"
        else -> instruction.opcode.name + " " + (instruction.visualString() ?: reference.toString())
    }

    companion object {
        private const val SCREEN = "Lfixture/IgFragment;"
        private const val SESSION_BASE = "Lfixture/SessionBase;"
        private const val OBJECT = "Ljava/lang/Object;"
        private const val STRING = "Ljava/lang/String;"
        private const val PUBLIC = 0x1
        private const val USER_ID = "$USER_SESSION->getUserId()$STRING"

        private val cached = FixtureCache<Map<String, ClassDef>>()

        private fun publicStatic(flags: Int) = AccessFlags.PUBLIC.isSet(flags) && AccessFlags.STATIC.isSet(flags)

        private fun extension(): ClassDef = ImmutableClassDef.of(ExtensionDex.classDef(CHAT_ACCOUNTS))

        /** Instagram's base screen as 450 has it: onResume logs its name, and getSession() is abstract. */
        private fun screen(session: String? = USER_SESSION, logs: String = SCREEN_RESUME, flags: Int = PUBLIC or AccessFlags.ABSTRACT.value): ClassDef =
            ImmutableClassDef(SCREEN, flags, OBJECT, null, null, null, null, listOfNotNull(
                ImmutableMethod(SCREEN, "onResume", emptyList(), "V", PUBLIC, null, null, ImmutableMethodImplementation(2, listOf(
                    ImmutableInstruction21c(Opcode.CONST_STRING, 0, ImmutableStringReference(logs)),
                    ImmutableInstruction10x(Opcode.RETURN_VOID)), null, null)),
                session?.let { ImmutableMethod(SCREEN, GET_SESSION, emptyList(), it, PUBLIC or AccessFlags.ABSTRACT.value, null, null, null) },
            ))

        /** The signed-in session, extending [superclass], which answers its own id. */
        private fun session(superclass: String): ClassDef = ImmutableClassDef(USER_SESSION, PUBLIC, superclass, null, null, null, null,
            listOf(ImmutableMethod(USER_SESSION, "getUserId", emptyList(), STRING, PUBLIC, null, null, ImmutableMethodImplementation(2, listOf(
                ImmutableInstruction11n(Opcode.CONST_4, 0, 0), ImmutableInstruction11x(Opcode.RETURN_OBJECT, 0)), null, null))))

        private fun BytecodePatchContext.bridge(type: String, name: String) = mutableClassDefBy(type).methods.single { it.name == name }.visualCode()

        /** The session bridge casts to [screen] and answers its getSession(), typed [session]. */
        private fun assertSessionBridge(context: BytecodePatchContext, screen: String, session: String, name: String = "") {
            assertEquals("$name: session bridge", listOf(Opcode.CHECK_CAST to screen, Opcode.INVOKE_VIRTUAL to "$screen->$GET_SESSION()$session",
                Opcode.MOVE_RESULT_OBJECT to null, Opcode.RETURN_OBJECT to null),
                context.bridge(CHAT_ACCOUNTS, "session").take(4).map { it.opcode to it.visualReference()?.toString() })
        }

        /** The account id bridge answers the session's getUserId(), written once. */
        private fun assertAccountIdWrittenOnce(context: BytecodePatchContext, name: String = "") {
            val code = context.bridge(INSTAGRAM_CHATS, "accountId")
            assertEquals("$name: account id bridge", listOf(Opcode.CHECK_CAST to USER_SESSION, Opcode.INVOKE_VIRTUAL to USER_ID,
                Opcode.MOVE_RESULT_OBJECT to null, Opcode.RETURN_OBJECT to null), code.take(4).map { it.opcode to it.visualReference()?.toString() })
            assertEquals("$name: written once", 1, code.count { it.visualReference()?.toString() == USER_ID })
        }

        /** Instagram's base screen, the signed-in session and every class it extends, and the extension's two classes. */
        private fun accountClasses(bundle: File): Map<String, ClassDef> = cached.get(bundle) {
            val classes = mutableMapOf<String, ClassDef>()
            FixtureDex.classesHolding(bundle, SCREEN_RESUME).forEach { classes[it.type] = it }
            var wanted = setOf(USER_SESSION)
            while (true) {
                val loaded = FixtureDex.classes(bundle, wanted.filter { it.startsWith("L") && it !in classes }.toSet())
                if (loaded.isEmpty()) break
                classes += loaded
                wanted = loaded.values.mapNotNull { it.superclass }.toSet()
            }
            classes[CHAT_ACCOUNTS] = ImmutableClassDef.of(ExtensionDex.classDef(CHAT_ACCOUNTS))
            classes[INSTAGRAM_CHATS] = ImmutableClassDef.of(ExtensionDex.classDef(INSTAGRAM_CHATS))
            classes
        }
    }
}
