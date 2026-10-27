/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.ControlFlow
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import org.junit.AfterClass
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File
import java.lang.ref.SoftReference

/** LaunchActivity, the chat screen, and the runtime. */
class KeepVideosMutedFixtureTest {
    @Test fun `both offers of a volume key to the chat ask the runtime and the chat's answer stays Telegram's`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val site = context.resolveKeepVideosMuted()
            assertEquals("$name: the phone's screen and a tablet's side screen", 2, site.indices.size)
            val turn = context.resolveFullScreenTurn()
            assertEquals("$name", null, turn.missing)
            assertEquals("$name: one turn for each landscape side", 2, turn.calls.size)
            val turnMethod = turn.method!!
            val old = ImmutableMethod.of(site.dispatch)
            val oldTurn = ImmutableMethod.of(turnMethod)
            // The viewer's other orientation calls are checked in their own test.
            val upright = context.resolveVideoUpright(turn)
            val beside = upright.edits.filter { it.signature == turnMethod.toString() }.map { it.index }.toSet()
            val edited = setOf(key(site.dispatch), key(turnMethod)) + upright.edits.map { it.signature }
            val untouched = hostState(build, context, edited)
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { keepVideosMutedPatch.execute(context) })

            val before = old.controlBody()
            val after = site.dispatch.controlBody()
            assertEquals("$name: same length", before.size, after.size)
            for (i in before.indices) {
                if (i in site.indices) {
                    assertEquals(site.handler.toString(), before[i].controlRef())
                    assertEquals(Opcode.INVOKE_STATIC, after[i].opcode)
                    assertEquals("$VOLUME_KEYS->chatTakesKey(Ljava/lang/Object;)Z", after[i].controlRef())
                    assertEquals("$name: the chat", before[i].namedRegisters(), after[i].namedRegisters())
                } else {
                    assertEquals("$name: stock operand $i", before[i].operand(), after[i].operand())
                }
            }
            val a = ControlFlow.of(old)
            val b = ControlFlow.of(site.dispatch)
            assertEquals("$name: same paths", a.normal.toList(), b.normal.toList())
            assertEquals("$name: same handlers", a.exceptional.toList(), b.exceptional.toList())
            assertEquals("$name: the chat's answer and every other method", untouched, hostState(build, context, edited))

            // Both fixed landscape turns hand the activity and Telegram's side to the extension instead.
            val turnBefore = oldTurn.controlBody()
            val turnAfter = turnMethod.controlBody()
            assertEquals("$name: same turn length", turnBefore.size, turnAfter.size)
            for (i in turnBefore.indices) {
                if (i in turn.calls) {
                    assertEquals(SET_ORIENTATION, turnBefore[i].controlRef())
                    assertEquals(Opcode.INVOKE_STATIC, turnAfter[i].opcode)
                    assertEquals(FULL_SCREEN, turnAfter[i].controlRef())
                    assertEquals("$name: the activity and its side", turnBefore[i].namedRegisters(), turnAfter[i].namedRegisters())
                } else if (i !in beside) {
                    assertEquals("$name: stock turn operand $i", turnBefore[i].operand(), turnAfter[i].operand())
                }
            }
            val e = ControlFlow.of(oldTurn)
            val f = ControlFlow.of(turnMethod)
            assertEquals("$name: same turn paths", e.normal.toList(), f.normal.toList())
            assertEquals("$name: same turn handlers", e.exceptional.toList(), f.exceptional.toList())

            val stub = context.mutableClassDefBy(VOLUME_KEYS).methods.single { it.name == "stockChatTakesKey" }.controlBody()
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub.map { it.opcode })
            assertEquals(site.handler.toString(), stub[1].controlRef())
            assertEquals(1L, status(context, "keepVideosMuted"))
            assertEquals(1L, status(context, "videoEitherLandscape"))
            assertEquals(1L, status(context, "videoOnlyFromButton"))
        }
    }

    @Test fun `the video viewer's orientation reads, restores and sensor listener go to the extension in the same registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val turn = context.resolveFullScreenTurn()
            val upright = context.resolveVideoUpright(turn)
            assertEquals("$name", null, upright.missing)
            fun count(hook: String) = upright.edits.count { it.hook == hook }
            assertEquals("$name: the one place the sensor listener starts", 1, count(LISTENER_ON_HOOK))
            // Opening a video stops it when the phone can't sense turns, and letting a player go stops it
            // behind a null check. Closing the viewer comes through the second, so it gives the screen back.
            val offs = upright.edits.filter { it.hook == LISTENER_OFF_HOOK }.map { off ->
                context.mutableClassDefBy(off.type).methods.single { it.toString() == off.signature }.controlBody()[off.index - 1].opcode
            }
            assertEquals("$name: both places the sensor listener stops", 2, offs.size)
            assertEquals("$name: both places the sensor listener stops", setOf(Opcode.IF_EQZ, Opcode.IGET_OBJECT), offs.toSet())
            assertTrue("$name: the orientation Telegram saves is read", count(REQUESTED_HOOK) >= 1)
            assertTrue("$name: full screen ends in at least three places", count(RESTORE_HOOK) >= 3)
            assertTrue("$name: the two landscape turns stay the button's",
                upright.edits.none { it.signature == turn.method.toString() && it.index in turn.calls })
            val before = upright.edits.groupBy { it.signature }.mapValues { (signature, _) ->
                val type = upright.edits.first { it.signature == signature }.type
                ImmutableMethod.of(context.mutableClassDefBy(type).methods.single { it.toString() == signature })
            }
            assertEquals("$name", emptyList<String>(), PatchLogCapture.warnings { keepVideosMutedPatch.execute(context) })
            for ((signature, old) in before) {
                val type = upright.edits.first { it.signature == signature }.type
                val now = context.mutableClassDefBy(type).methods.single { it.toString() == signature }
                val a = old.controlBody()
                val b = now.controlBody()
                assertEquals("$name: $signature keeps its length", a.size, b.size)
                val here = upright.edits.filter { it.signature == signature }.associateBy { it.index }
                for (i in a.indices) {
                    val edit = here[i]
                    if (edit != null) {
                        assertEquals(Opcode.INVOKE_STATIC, b[i].opcode)
                        assertEquals(edit.hook, b[i].controlRef())
                        assertEquals("$name: $signature $i registers", a[i].namedRegisters(), b[i].namedRegisters())
                    } else if (i !in turn.calls || signature != turn.method.toString()) {
                        assertEquals("$name: $signature stock operand $i", a[i].operand(), b[i].operand())
                    }
                }
                val x = ControlFlow.of(old)
                val y = ControlFlow.of(now)
                assertEquals("$name: $signature same paths", x.normal.toList(), y.normal.toList())
                assertEquals("$name: $signature same handlers", x.exceptional.toList(), y.exceptional.toList())
            }
            assertEquals(1L, status(context, "videoOnlyFromButton"))
        }
    }

    @Test fun `a viewer whose sensor listener moved keeps the rest of the patch and goes on without the upright switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val c = context(build)
            val upright = c.resolveVideoUpright(c.resolveFullScreenTurn())
            val on = upright.edits.single { it.hook == LISTENER_ON_HOOK }
            val method = c.mutableClassDefBy(on.type).methods.single { it.toString() == on.signature }
            method.replaceInstruction(on.index, "nop")
            val warnings = PatchLogCapture.warnings { keepVideosMutedPatch.execute(c) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "in one place (0)" in warnings.single() && "keeps a video upright" in warnings.single())
            assertEquals(1L, status(c, "keepVideosMuted"))
            assertEquals(1L, status(c, "videoEitherLandscape"))
            assertEquals(0L, status(c, "videoOnlyFromButton"))
            for (edit in upright.edits.filter { it.hook != LISTENER_ON_HOOK }) {
                val m = c.mutableClassDefBy(edit.type).methods.single { it.toString() == edit.signature }
                assertTrue("${build.name}: ${edit.signature} ${edit.index} stays Telegram's", m.controlBody()[edit.index].controlRef() != edit.hook)
            }
        }
    }

    @Test fun `a full screen button that changed keeps the volume keys and goes on without the turning switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val c = context(build)
            val method = c.resolveFullScreenTurn().method!!
            method.controlBody().indices.filter { method.controlBody()[it].controlRef() == GET_ROTATION }
                .forEach { method.replaceInstruction(it, "nop") }
            val before = method.state()
            val warnings = PatchLogCapture.warnings { keepVideosMutedPatch.execute(c) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "in one place (0)" in warnings.single() && "goes on without" in warnings.single())
            assertEquals("${build.name}: the full screen button stays Telegram's", before, method.state())
            assertEquals(1L, status(c, "keepVideosMuted"))
            assertEquals(0L, status(c, "videoEitherLandscape"))
            assertEquals(0L, status(c, "videoOnlyFromButton"))
        }
    }

    @Test fun `a changed dispatch, chat or runtime refuses before any method changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val mutations: List<Pair<String, (BytecodePatchContext, KeepVideosMutedSite) -> Unit>> = listOf(
                "no cast before the offer" to { _, s -> s.indices.forEach { s.dispatch.replaceInstruction(it - 1, "nop") } },
                "the answer isn't read" to { _, s -> s.dispatch.replaceInstruction(s.indices.first() + 1, "nop") },
                "the answer no longer plays a video" to { c, s -> val m = c.mutableClassDefBy(s.handler.definingClass).methods.single { it.toString() == s.handler.toString() }
                    m.replaceInstruction(m.controlBody().indexOfFirst { it.controlRef()?.endsWith("->setNoSoundHintShowed(Z)V") == true }, "nop") },
                "private answer" to { c, s -> val m = c.mutableClassDefBy(s.handler.definingClass).methods.single { it.toString() == s.handler.toString() }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "keepVideosMuted" } },
                "private volume hook" to { c, _ -> val h = c.mutableClassDefBy(VOLUME_KEYS).methods.single { it.name == "chatTakesKey" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing stock stub" to { c, _ -> c.mutableClassDefBy(VOLUME_KEYS).methods.removeAll { it.name == "stockChatTakesKey" } },
                "missing turn flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "videoEitherLandscape" } },
                "missing upright flag" to { c, _ -> c.mutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.name == "videoOnlyFromButton" } },
                "private upright hook" to { c, _ -> val h = c.mutableClassDefBy(VIDEO_UPRIGHT).methods.single { it.name == "restore" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "private turn hook" to { c, _ -> val h = c.mutableClassDefBy(VIDEO_TURN).methods.single { it.name == "fullScreen" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
            )
            for ((case, change) in mutations) {
                val c = context(build)
                change(c, c.resolveKeepVideosMuted())
                val before = completeState(build, c)
                assertThrows("${build.name}: $case", PatchException::class.java) { keepVideosMutedPatch.execute(c) }
                assertEquals("${build.name}: $case preserves every method, path and build fact", before, completeState(build, c))
            }
        }
    }

    private fun context(build: File) = PatchContexts.of(ExtensionDex.classes() + hosts(build))
    private fun status(c: BytecodePatchContext, name: String) =
        (c.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == name }.controlBody().first() as WideLiteralInstruction).wideLiteral
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(VOLUME_KEYS, VIDEO_TURN, VIDEO_UPRIGHT, SETTINGS_STATUS))
        .filter { c.classDefByOrNull(it) != null }.associateWith { type -> c.mutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.mutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /** LaunchActivity, the screen its key dispatch casts to before asking, and the video viewer's full screen button. */
    private fun loadHosts(build: File): List<ClassDef> {
        val launch = FixtureDex.classes(build, setOf(LAUNCH_ACTIVITY)).values.single()
        val dispatch = launch.methods.single { it.toString() == DISPATCH_KEY }.controlBody()
        val chats = dispatch.filter { it.opcode == Opcode.CHECK_CAST }.map { (it as ReferenceInstruction).reference.toString() }
            .filter { type -> dispatch.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == type } }.toSet()
        val turns = FixtureDex.classesWhere(build, { true }) { m ->
            val refs = m.instructions().mapNotNull { (it as? ReferenceInstruction)?.reference?.toString() }
            refs.any { it.startsWith("$PHOTO_VIEWER->") } &&
                refs.any { it == SET_ORIENTATION || it == GET_ORIENTATION || it == LISTENER_ON || it == LISTENER_OFF }
        }
        return (listOf(launch) + FixtureDex.classes(build, chats).values).map(ImmutableClassDef::of) + turns
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), (this as? ReferenceInstruction)?.reference?.toString(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
