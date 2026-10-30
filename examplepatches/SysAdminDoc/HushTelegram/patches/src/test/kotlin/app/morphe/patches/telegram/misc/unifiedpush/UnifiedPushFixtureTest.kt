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
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
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
    private val hosts = setOf(PUSH_CONTROLLER, MESSAGES_CONTROLLER, "Lorg/telegram/messenger/UserConfig;",
        "Lorg/telegram/tgnet/ConnectionsManager;", "Lorg/telegram/messenger/ApplicationLoader;",
        "Lorg/telegram/messenger/Utilities;", "Lorg/telegram/messenger/DispatchQueue;", "Lorg/telegram/messenger/SharedConfig;",
        "Lorg/telegram/messenger/PushListenerController\$IPushListenerServiceProvider;") + REACTION_ALERT_TYPES

    private fun context(build: File): BytecodePatchContext {
        val host = FixtureDex.classes(build, hosts).values.map(ImmutableClassDef::of)
        assertEquals("${build.name}: Telegram's push classes", hosts.size, host.size)
        return PatchContexts.of(ExtensionDex.classes() + host)
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
        }
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
