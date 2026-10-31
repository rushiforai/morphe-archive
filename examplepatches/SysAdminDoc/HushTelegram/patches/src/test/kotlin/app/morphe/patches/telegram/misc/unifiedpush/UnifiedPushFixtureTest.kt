/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.unifiedpush

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.extension.localRegisterCount
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.patches.telegram.misc.notifications.MESSAGE_OBJECT
import app.morphe.patches.telegram.misc.notifications.NOTIFICATIONS
import app.morphe.patches.telegram.misc.notifications.SILENCED
import app.morphe.patches.telegram.misc.notifications.TL_USER
import app.morphe.patches.telegram.misc.notifications.silenceNonContactsPatch
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import java.io.File
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.fail
import org.junit.Test

/** PushListenerController's sign-up and wake-up on both declared builds, where UnifiedPush plugs in. */
class UnifiedPushFixtureTest {
    private companion object {
        val EMOJI_CENSUS = FixtureDex.ClassCensus()
    }

    private val hosts = setOf(PUSH_CONTROLLER, MESSAGES_CONTROLLER, "Lorg/telegram/messenger/UserConfig;",
        "Lorg/telegram/tgnet/ConnectionsManager;", "Lorg/telegram/messenger/ApplicationLoader;",
        "Lorg/telegram/messenger/Utilities;", "Lorg/telegram/messenger/DispatchQueue;", "Lorg/telegram/messenger/SharedConfig;",
        "Lorg/telegram/messenger/PushListenerController\$IPushListenerServiceProvider;", NOTIFICATIONS, MESSAGE_OBJECT, TL_USER) +
        REACTION_ALERT_TYPES

    private fun BytecodePatchContext.silentCheck() =
        mutableClassDefBy(NOTIFICATIONS).methods.single { it.name == "isSilentMessage" }
    private fun BytecodePatchContext.status(name: String) =
        (mutableClassDefBy(SETTINGS_STATUS).method(name).controlBody().first() as WideLiteralInstruction).wideLiteral

    /** The silent check's code with the sound hook taken out, for comparing with stock. */
    private fun withoutSoundHook(code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>): List<List<Any?>> {
        val hook = code.indexOfFirst { it.controlRef() == REACTION_QUIET }
        val skipped = if (hook < 0) emptySet() else setOf(hook, hook + 1)
        return code.filterIndexed { i, it -> i !in skipped && it.opcode != Opcode.NOP }
            .map { listOf(it.opcode, it.namedRegisters(), it.controlRef()) }
    }

    /** Right after the reaction flag is read, the extension's answer replaces it before Telegram tests it. */
    private fun assertSoundHook(name: String, code: List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>) {
        val read = code.indexOfFirst { it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == "$MESSAGE_OBJECT->isReactionPush:Z" }
        assertTrue("$name: the reaction flag read", read >= 0)
        val flag = (code[read] as TwoRegisterInstruction).registerA
        assertEquals("$name: the sound hook", listOf(Opcode.INVOKE_STATIC_RANGE, Opcode.MOVE_RESULT),
            code.subList(read + 1, read + 3).map { it.opcode })
        assertEquals(REACTION_QUIET, code[read + 1].controlRef())
        assertEquals(listOf(flag), code[read + 1].namedRegisters())
        assertEquals(listOf(flag), code[read + 2].namedRegisters())
        assertTrue("$name: Telegram's test of the flag", code[read + 3].opcode == Opcode.IF_EQZ || code[read + 3].opcode == Opcode.IF_NEZ)
        assertEquals(listOf(flag), code[read + 3].namedRegisters())
        assertEquals(1, code.count { it.controlRef() == REACTION_QUIET })
    }

    /**
     * Every class with a static-shaped Document lookup taking an int and a long, across the whole
     * build: AnimatedEmojiDrawable among them, whose name R8 changes from build to build.
     */
    private fun emojiLookupClasses(build: File) = FixtureDex.classesWhere(build, EMOJI_CENSUS, { true }) {
        it.returnType == "Lorg/telegram/tgnet/TLRPC\$Document;" && it.parameterTypes.joinToString("") == "IJ"
    }

    private fun context(build: File, withEmojiLookup: Boolean = true): BytecodePatchContext {
        val host = FixtureDex.classes(build, hosts).values.map(ImmutableClassDef::of)
        assertEquals("${build.name}: Telegram's push classes", hosts.size, host.size)
        val lookups = if (withEmojiLookup) emojiLookupClasses(build).map(ImmutableClassDef::of) else emptyList()
        return PatchContexts.of(ExtensionDex.classes() + host + lookups.filter { it.type !in hosts })
    }

    private fun ClassDef.method(name: String) = methods.single { it.name == name }
    private fun BytecodePatchContext.stub(name: String) = mutableClassDefBy(UNIFIED_PUSH).method(name).controlBody()
    private fun List<com.android.tools.smali.dexlib2.iface.instruction.Instruction>.refs() =
        map { (it as? ReferenceInstruction)?.reference?.toString() }

    @Test fun `every sign-up asks the extension for its token and type, and the stubs reach Telegram`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val plan = context.resolveUnifiedPush()
            assertEquals("$name: Telegram signs up four accounts", 4, plan.accounts)
            val old = ImmutableMethod.of(plan.signUp)
            val stockSilent = ImmutableMethod.of(context.silentCheck()).controlBody()
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { unifiedPushPatch.execute(context) })

            val before = old.controlBody()
            val after = plan.signUp.controlBody()
            assertEquals("$name: four instructions in front", before.size + 4, after.size)
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT),
                after.take(4).map { it.opcode })
            assertEquals("$UNIFIED_PUSH->token(ILjava/lang/String;)Ljava/lang/String;", after[0].controlRef())
            assertEquals("$UNIFIED_PUSH->type(I)I", after[2].controlRef())
            // The parameters themselves take the answers, so the rest of the method reads them as before.
            val type = plan.signUp.implementation!!.registerCount - 2
            assertEquals(listOf(type, type + 1), after[0].namedRegisters())
            assertEquals(listOf(type + 1), after[1].namedRegisters())
            assertEquals(listOf(type), after[2].namedRegisters())
            assertEquals(listOf(type), after[3].namedRegisters())
            for (i in before.indices) {
                assertEquals("$name: stock $i", listOf(before[i].opcode, before[i].namedRegisters(), before[i].controlRef()),
                    listOf(after[i + 4].opcode, after[i + 4].namedRegisters(), after[i + 4].controlRef()))
            }

            assertEquals(listOf(SEND_REGISTRATION, null), context.stub("sendToTelegram").refs())
            assertEquals(listOf(PUSH_STRING, null), context.stub("telegramToken").refs())
            assertEquals(listOf(POST_INIT, null), context.stub("startTelegram").refs())
            assertEquals(listOf(STAGE_QUEUE, POST_RUNNABLE, null), context.stub("onStageQueue").refs())
            val wake = context.stub("wakeAccounts")
            assertEquals(listOf(USER_CONFIG_INSTANCE, CLIENT_ACTIVATED, INTERNAL_PUSH, CONNECTIONS_INSTANCE, RESUME_NETWORK),
                wake.refs().filterNotNull())
            assertEquals(4, (wake.first { it.opcode == Opcode.CONST_16 } as NarrowLiteralInstruction).narrowLiteral)
            // Nothing in the stub counts down processRemoteMessage's latch, which a Firebase push may be waiting on.
            assertTrue(wake.none { it.controlRef()?.contains("countDown") == true })
            assertEquals(listOf(GET_PUSH_PROVIDER, HAS_SERVICES, REQUEST_PUSH_TOKEN),
                context.stub("requestPushToken").refs().filterNotNull())
            for (stub in listOf("sendToTelegram", "telegramToken", "startTelegram", "onStageQueue", "wakeAccounts", "requestPushToken")) {
                val method = context.mutableClassDefBy(UNIFIED_PUSH).method(stub)
                assertTrue("$name: $stub", AccessFlags.PUBLIC.isSet(method.accessFlags) && AccessFlags.STATIC.isSet(method.accessFlags))
            }
            val status = context.mutableClassDefBy(SETTINGS_STATUS).method("unifiedPush").controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)

            // The update loop hands each reactions update and each edited message (a private chat's
            // reactions) over right after its cast, with itself.
            val loop = context.mutableClassDefBy(MESSAGES_CONTROLLER).method("processUpdateArray")
            val code = loop.controlBody()
            for (type in listOf(REACTIONS_UPDATE, EDIT_UPDATE)) {
                val cast = code.indexOfFirst { it.opcode == Opcode.CHECK_CAST && it.controlRef() == type }
                val update = code[cast].namedRegisters().single()
                assertEquals("$name: the hook after the $type cast", listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC_RANGE),
                    code.subList(cast + 1, cast + 4).map { it.opcode })
                val scratch = code[cast + 1].namedRegisters()
                assertEquals(update, scratch[1])
                assertEquals(listOf(scratch[0] + 1, loop.localRegisterCount()), code[cast + 2].namedRegisters())
                assertEquals("$REACTION_ALERTS->changed(Ljava/lang/Object;Ljava/lang/Object;)V", code[cast + 3].controlRef())
                assertEquals(listOf(scratch[0], scratch[0] + 1), code[cast + 3].namedRegisters())
            }
            assertEquals(2, code.count { it.controlRef() == "$REACTION_ALERTS->changed(Ljava/lang/Object;Ljava/lang/Object;)V" })
            val reactions = context.mutableClassDefBy(SETTINGS_STATUS).method("reactionAlerts").controlBody()
            assertEquals(1L, (reactions.first() as WideLiteralInstruction).wideLiteral)

            // Telegram's silent notification check asks the extension whether a reaction stays silent (#41).
            val silent = context.silentCheck().controlBody()
            assertSoundHook(name, silent)
            assertEquals("$name: the rest of the check is stock", withoutSoundHook(stockSilent), withoutSoundHook(silent))
            assertEquals(1L, context.status("reactionSound"))
        }
    }

    @Test fun `a custom emoji reaction asks Telegram's one lookup of loaded custom emoji`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val lookups = emojiLookupClasses(build).flatMap { owner -> owner.methods.filter { isEmojiLookup(owner, it) } }
            assertEquals("$name: one lookup in the whole app", 1, lookups.size)
            val context = context(build)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { unifiedPushPatch.execute(context) })
            val stub = context.mutableClassDefBy(REACTION_ALERTS).method("emojiDocument")
            assertTrue(name, AccessFlags.PUBLIC.isSet(stub.accessFlags) && AccessFlags.STATIC.isSet(stub.accessFlags))
            val code = stub.controlBody()
            assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), code.map { it.opcode })
            assertEquals(listOf(lookups.single().toString(), null, null), code.refs())
            // The account and both halves of the document ID, as the stub got them.
            assertEquals(listOf(1, 2, 3), code[0].namedRegisters())
        }
    }

    @Test fun `a build without the custom emoji lookup keeps reaction notifications for plain emoji`() {
        val context = context(Fixtures.declaredBuilds().first(), withEmojiLookup = false)
        val warnings = PatchLogCapture.warnings { unifiedPushPatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("without custom emoji"))
        assertEquals(1L, context.status("reactionAlerts"))
        val code = context.mutableClassDefBy(REACTION_ALERTS).method("emojiDocument").controlBody()
        assertTrue("the extension's own null stays", code.none { it.opcode == Opcode.INVOKE_STATIC })
    }

    @Test fun `the sound hook and Silence non-contacts share the silent check in either order`() {
        for (build in Fixtures.declaredBuilds()) {
            for (silenceFirst in listOf(true, false)) {
                val name = "${build.name}, Silence non-contacts ${if (silenceFirst) "first" else "second"}"
                val context = context(build)
                val stock = ImmutableMethod.of(context.silentCheck()).controlBody()
                val patches = if (silenceFirst) listOf(silenceNonContactsPatch, unifiedPushPatch) else listOf(unifiedPushPatch, silenceNonContactsPatch)
                assertEquals(name, emptyList<String>(), PatchLogCapture.warnings { patches.forEach { it.execute(context) } })
                val code = context.silentCheck().controlBody()
                assertEquals(name, SILENCED, code[0].controlRef())
                assertSoundHook(name, code)
                assertEquals(name, withoutSoundHook(stock), withoutSoundHook(code.drop(5)))
                assertEquals(name, 1L, context.status("reactionSound"))
                assertEquals(name, 1L, context.status("silenceNonContacts"))
            }
        }
    }

    @Test fun `a build whose silent check no longer reads the reaction flag keeps UnifiedPush without the sound`() {
        val context = context(Fixtures.declaredBuilds().first())
        val check = context.silentCheck()
        check.replaceInstruction(check.controlBody().indexOfFirst {
            it.opcode == Opcode.IGET_BOOLEAN && it.controlRef() == "$MESSAGE_OBJECT->isReactionPush:Z"
        }, "nop")
        val untouched = check.controlBody().map { it.opcode to it.namedRegisters() }
        val warnings = PatchLogCapture.warnings { unifiedPushPatch.execute(context) }
        assertEquals(1, warnings.size)
        assertTrue(warnings.single(), warnings.single().contains("no longer reads the reaction flag once"))
        assertEquals(untouched, check.controlBody().map { it.opcode to it.namedRegisters() })
        assertEquals(1L, context.status("unifiedPush"))
        assertEquals(1L, context.status("reactionAlerts"))
        assertEquals(0L, context.status("reactionSound"))
    }

    @Test fun `a build without either reactions cast keeps UnifiedPush and leaves the update loop alone`() {
        for ((type, what) in listOf(REACTIONS_UPDATE to "a reactions update", EDIT_UPDATE to "an edited message")) {
            val context = context(Fixtures.declaredBuilds().first())
            val loop = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.name == "processUpdateArray" }
            loop.replaceInstruction(loop.controlBody().indexOfFirst {
                it.opcode == Opcode.CHECK_CAST && it.controlRef() == type
            }, "nop")
            val untouched = loop.controlBody().map { it.opcode to it.namedRegisters() }
            val warnings = PatchLogCapture.warnings { unifiedPushPatch.execute(context) }
            assertEquals(what, 1, warnings.size)
            assertTrue(warnings.single(), warnings.single().contains("no longer casts $what once"))
            assertEquals(what, untouched, loop.controlBody().map { it.opcode to it.namedRegisters() })
            assertEquals(1L, (context.mutableClassDefBy(SETTINGS_STATUS).method("unifiedPush").controlBody().first()
                as WideLiteralInstruction).wideLiteral)
            assertEquals(0L, (context.mutableClassDefBy(SETTINGS_STATUS).method("reactionAlerts").controlBody().first()
                as WideLiteralInstruction).wideLiteral)
        }
    }

    @Test fun `a changed sign-up or wake-up refuses before anything is edited`() {
        val build = Fixtures.declaredBuilds().first()
        val shapes = listOf<Pair<String, (BytecodePatchContext) -> Unit>>(
            "Telegram's push sign-up no longer runs on its stage queue" to { context ->
                val signUp = context.resolveUnifiedPush().signUp
                val post = signUp.controlBody().indexOfFirst { it.controlRef() == POST_RUNNABLE }
                signUp.replaceInstruction(post, "nop")
            },
            "Telegram's device sign-up no longer sends the push type as its token type" to { context ->
                val register = context.mutableClassDefBy(MESSAGES_CONTROLLER).methods.single { it.toString() == REGISTER_FOR_PUSH }
                val write = register.controlBody().indexOfFirst { it.controlRef() == TOKEN_TYPE }
                register.replaceInstruction(write, "nop")
            },
            "Telegram's wake-up no longer reconnects each signed-in account" to { context ->
                val wake = context.mutableClassDefBy(PUSH_CONTROLLER).methods.single { it.name == "onDecryptError" }
                val resume = wake.controlBody().indexOfFirst { it.controlRef() == RESUME_NETWORK }
                wake.replaceInstruction(resume, "nop")
            },
        )
        for ((why, change) in shapes) {
            val context = context(build)
            change(context)
            val signUp = context.mutableClassDefBy(PUSH_CONTROLLER).methods.single { it.toString() == SEND_REGISTRATION }
            val untouched = signUp.controlBody().map { it.opcode to it.namedRegisters() }
            val stub = context.stub("sendToTelegram").map { it.opcode }
            try {
                unifiedPushPatch.execute(context)
                fail("$why: the patch went ahead")
            } catch (refused: PatchException) {
                assertTrue("$why: ${refused.message}", refused.message!!.contains(why))
            }
            assertEquals(why, untouched, signUp.controlBody().map { it.opcode to it.namedRegisters() })
            assertEquals(why, stub, context.stub("sendToTelegram").map { it.opcode })
            assertEquals(why, 0L, (context.mutableClassDefBy(SETTINGS_STATUS).method("unifiedPush").controlBody().first()
                as WideLiteralInstruction).wideLiteral)
        }
    }
}
