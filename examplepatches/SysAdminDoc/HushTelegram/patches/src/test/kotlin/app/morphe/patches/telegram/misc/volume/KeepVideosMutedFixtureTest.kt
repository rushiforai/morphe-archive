/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.volume

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.util.names.origRef
import app.morphe.util.names.replaceInstruction
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlField
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
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origString
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

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
            val sound = context.resolveVideoSound()
            val beside = (upright.edits + sound.edits).filter { it.signature == turnMethod.toString() }.map { it.index }.toSet()
            val edited = setOf(key(site.dispatch), key(turnMethod)) + upright.edits.map { it.signature } + sound.edits.map { it.signature }
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

            val stub = context.tgMutableClassDefBy(VOLUME_KEYS).methods.single { it.origName == "stockChatTakesKey" }.controlBody()
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub.map { it.opcode })
            assertEquals(site.handler.toString(), stub[1].controlRef())
            assertEquals(1L, status(context, "keepVideosMuted"))
            assertEquals(1L, status(context, "videoEitherLandscape"))
            assertEquals(1L, status(context, "videoOnlyFromButton"))
            assertEquals(1L, status(context, "videoStartsSilent"))
        }
    }

    @Test fun `the video viewer's mute and volume calls go to the extension in the same registers`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val context = context(build)
            val sound = context.resolveVideoSound()
            assertEquals("$name", null, sound.missing)
            val mute = sound.setMute!!
            val volume = sound.setVolume!!
            assertEquals("$name: one player", mute.definingClass, volume.definingClass)
            // A video starting, buffering, showing its first frame, the cast button and the editor's sound button.
            assertEquals("$name: every place the viewer mutes its player", 5, sound.edits.count { it.hook == SET_MUTE_HOOK })
            // Volume keys, the editor's tap and the editor starting a video.
            assertEquals("$name: every place the viewer sets its player's volume", 3, sound.edits.count { it.hook == SET_VOLUME_HOOK })
            assertEquals("$name: the window's volume keys", 1,
                sound.edits.count { it.hook == SET_VOLUME_HOOK && "->dispatchKeyEvent(Landroid/view/KeyEvent;)Z" in it.signature })
            val turn = context.resolveFullScreenTurn()
            val others = context.resolveVideoUpright(turn).edits.map { it.signature to it.index }.toSet() +
                turn.calls.map { turn.method.toString() to it }
            val before = sound.edits.groupBy { it.signature }.mapValues { (signature, edits) ->
                ImmutableMethod.of(context.tgMutableClassDefBy(edits.first().type).methods.single { it.toString() == signature })
            }
            // The window's key dispatch also hands its player and the key to the extension first.
            val key = sound.key!!
            val window = before.getValue(key.signature)
            val windowRegisters = window.implementation!!.registerCount
            assertEquals("$name: the window's own register", windowRegisters - 2, key.window)
            assertEquals("$name: the key's register", windowRegisters - 1, key.event)
            assertTrue("$name: a local to read into", key.scratch < key.window)
            assertEquals("$name: the viewer the window reads from itself", key.viewer, window.controlBody().first {
                it.opcode == Opcode.IGET_OBJECT && it.namedRegisters()[1] == key.window && it.controlRef()!!.endsWith(":$PHOTO_VIEWER")
            }.controlField())
            assertEquals("$name: the viewer's player", mute.definingClass, key.player.type)
            assertEquals("$name: a viewer field", key.viewer.type, key.player.definingClass)
            assertEquals("$name", emptyList<String>(), PatchLogCapture.warnings { keepVideosMutedPatch.execute(context) })
            for ((signature, old) in before) {
                val here = sound.edits.filter { it.signature == signature }.associateBy { it.index }
                val now = context.tgMutableClassDefBy(here.values.first().type).methods.single { it.toString() == signature }
                val a = old.controlBody()
                val shift = if (signature == key.signature) 3 else 0
                val head = now.controlBody().take(shift)
                if (shift > 0) {
                    assertEquals("$name: the key hook", listOf(Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC), head.map { it.opcode })
                    assertEquals("$name: the window's viewer", listOf(key.scratch, key.window), head[0].namedRegisters())
                    assertEquals(key.viewer, head[0].controlField())
                    assertEquals("$name: the viewer's player", listOf(key.scratch, key.scratch), head[1].namedRegisters())
                    assertEquals(key.player, head[1].controlField())
                    assertEquals(VOLUME_KEY_HOOK, head[2].controlRef())
                    assertEquals("$name: the player and the key", listOf(key.scratch, key.event), head[2].namedRegisters())
                }
                val b = now.controlBody().drop(shift)
                assertEquals("$name: $signature keeps its length", a.size, b.size)
                for (i in a.indices) {
                    val edit = here[i]
                    if (edit != null) {
                        assertEquals(if (edit.hook == SET_MUTE_HOOK) mute.toString() else volume.toString(), a[i].controlRef())
                        assertEquals(Opcode.INVOKE_STATIC, b[i].opcode)
                        assertEquals(edit.hook, b[i].controlRef())
                        assertEquals("$name: $signature $i the player and its value", a[i].namedRegisters(), b[i].namedRegisters())
                    } else if ((signature to i) !in others) {
                        assertEquals("$name: $signature stock operand $i", a[i].operand(), b[i].operand())
                    }
                }
                val x = ControlFlow.of(old)
                val y = ControlFlow.of(now)
                fun Array<List<Int>>.past(shift: Int) = drop(shift).map { next -> next.map { it - shift } }
                assertEquals("$name: $signature same paths", x.normal.toList(), y.normal.past(shift))
                assertEquals("$name: $signature same handlers", x.exceptional.toList(), y.exceptional.past(shift))
                assertEquals("$name: the key hook runs straight into Telegram's", (1..shift).map { listOf(it) }, y.normal.take(shift))
            }
            val stubs = context.tgMutableClassDefBy(VIDEO_SOUND).methods
            for ((stub, call) in listOf("stockSetMute" to mute, "stockSetVolume" to volume)) {
                val body = stubs.single { it.origName == stub }.controlBody()
                assertEquals("$name: $stub", listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.RETURN_VOID), body.map { it.opcode })
                assertEquals("$name: $stub", call.toString(), body[1].controlRef())
            }
            assertEquals(1L, status(context, "videoStartsSilent"))
        }
    }

    @Test fun `a viewer whose volume keys changed keeps the rest of the patch and goes on without the silent start switch`() {
        for (build in Fixtures.declaredBuilds()) {
            val c = context(build)
            val sound = c.resolveVideoSound()
            val keys = sound.edits.single { it.hook == SET_VOLUME_HOOK && "->dispatchKeyEvent(" in it.signature }
            c.tgMutableClassDefBy(keys.type).methods.single { it.toString() == keys.signature }.replaceInstruction(keys.index, "nop")
            val warnings = PatchLogCapture.warnings { keepVideosMutedPatch.execute(c) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "in one place (0)" in warnings.single() && "starts videos without sound" in warnings.single())
            assertEquals(1L, status(c, "keepVideosMuted"))
            assertEquals(1L, status(c, "videoOnlyFromButton"))
            assertEquals(0L, status(c, "videoStartsSilent"))
            for (edit in sound.edits.filter { it !== keys }) {
                val m = c.tgMutableClassDefBy(edit.type).methods.single { it.toString() == edit.signature }
                assertTrue("${build.name}: ${edit.signature} ${edit.index} stays Telegram's", m.controlBody()[edit.index].controlRef() != edit.hook)
            }
            val window = c.tgMutableClassDefBy(keys.type).methods.single { it.toString() == keys.signature }
            assertTrue("${build.name}: no key hook", window.controlBody().none { it.controlRef() == VOLUME_KEY_HOOK })
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
                context.tgMutableClassDefBy(off.type).methods.single { it.toString() == off.signature }.controlBody()[off.index - 1].opcode
            }
            assertEquals("$name: both places the sensor listener stops", 2, offs.size)
            assertEquals("$name: both places the sensor listener stops", setOf(Opcode.IF_EQZ, Opcode.IGET_OBJECT), offs.toSet())
            assertTrue("$name: the orientation Telegram saves is read", count(REQUESTED_HOOK) >= 1)
            assertTrue("$name: full screen ends in at least three places", count(RESTORE_HOOK) >= 3)
            assertTrue("$name: the two landscape turns stay the button's",
                upright.edits.none { it.signature == turn.method.toString() && it.index in turn.calls })
            val before = upright.edits.groupBy { it.signature }.mapValues { (signature, _) ->
                val type = upright.edits.first { it.signature == signature }.type
                ImmutableMethod.of(context.tgMutableClassDefBy(type).methods.single { it.toString() == signature })
            }
            val soundAt = context.resolveVideoSound().edits.map { it.signature to it.index }.toSet()
            assertEquals("$name", emptyList<String>(), PatchLogCapture.warnings { keepVideosMutedPatch.execute(context) })
            for ((signature, old) in before) {
                val type = upright.edits.first { it.signature == signature }.type
                val now = context.tgMutableClassDefBy(type).methods.single { it.toString() == signature }
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
                    } else if ((i !in turn.calls || signature != turn.method.toString()) && (signature to i) !in soundAt) {
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
            val method = c.tgMutableClassDefBy(on.type).methods.single { it.toString() == on.signature }
            method.replaceInstruction(on.index, "nop")
            val warnings = PatchLogCapture.warnings { keepVideosMutedPatch.execute(c) }
            assertEquals("${build.name}: $warnings", 1, warnings.size)
            assertTrue(warnings.single(), "in one place (0)" in warnings.single() && "keeps a video upright" in warnings.single())
            assertEquals(1L, status(c, "keepVideosMuted"))
            assertEquals(1L, status(c, "videoEitherLandscape"))
            assertEquals(0L, status(c, "videoOnlyFromButton"))
            for (edit in upright.edits.filter { it.hook != LISTENER_ON_HOOK }) {
                val m = c.tgMutableClassDefBy(edit.type).methods.single { it.toString() == edit.signature }
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
                "the answer no longer plays a video" to { c, s -> val m = c.tgMutableClassDefBy(s.handler.definingClass).methods.single { it.toString() == s.handler.toString() }
                    m.replaceInstruction(m.controlBody().indexOfFirst { it.controlRef()?.endsWith("->setNoSoundHintShowed(Z)V") == true }, "nop") },
                "private answer" to { c, s -> val m = c.tgMutableClassDefBy(s.handler.definingClass).methods.single { it.toString() == s.handler.toString() }
                    m.accessFlags = m.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing build flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "keepVideosMuted" } },
                "private volume hook" to { c, _ -> val h = c.tgMutableClassDefBy(VOLUME_KEYS).methods.single { it.origName == "chatTakesKey" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing stock stub" to { c, _ -> c.tgMutableClassDefBy(VOLUME_KEYS).methods.removeAll { it.origName == "stockChatTakesKey" } },
                "missing turn flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "videoEitherLandscape" } },
                "missing upright flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "videoOnlyFromButton" } },
                "private upright hook" to { c, _ -> val h = c.tgMutableClassDefBy(VIDEO_UPRIGHT).methods.single { it.origName == "restore" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "private turn hook" to { c, _ -> val h = c.tgMutableClassDefBy(VIDEO_TURN).methods.single { it.origName == "fullScreen" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing silent start flag" to { c, _ -> c.tgMutableClassDefBy(SETTINGS_STATUS).methods.removeAll { it.origName == "videoStartsSilent" } },
                "private sound hook" to { c, _ -> val h = c.tgMutableClassDefBy(VIDEO_SOUND).methods.single { it.origName == "setMute" }
                    h.accessFlags = h.accessFlags and AccessFlags.PUBLIC.value.inv() or AccessFlags.PRIVATE.value },
                "missing sound stub" to { c, _ -> c.tgMutableClassDefBy(VIDEO_SOUND).methods.removeAll { it.origName == "stockSetVolume" } },
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
        (c.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == name }.controlBody().first() as WideLiteralInstruction).wideLiteral
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(VOLUME_KEYS, VIDEO_TURN, VIDEO_UPRIGHT, VIDEO_SOUND, SETTINGS_STATUS))
        .filter { c.tgClassDefByOrNull(it) != null }.associateWith { type -> c.tgMutableClassDefBy(type).let { cls ->
            listOf(cls.accessFlags, cls.methods.map { key(it) to it.state() }) } }
    private fun hostState(build: File, c: BytecodePatchContext, except: Set<String>) = hosts(build)
        .flatMap { c.tgMutableClassDefBy(it.type).methods }.filter { key(it) !in except }.associate { key(it) to it.state() }

    private fun hosts(build: File): List<ClassDef> {
        val identity = FixtureDex.inputIdentity(build)
        return HOSTS[identity]?.get() ?: loadHosts(build).also {
            if (HOSTS.size >= 2) HOSTS.clear()
            HOSTS[identity] = SoftReference(it)
        }
    }

    /**
     * LaunchActivity, the screen its key dispatch casts to before asking, the video viewer's full
     * screen button and orientation calls, and the viewer's code that reads one of its flags and
     * calls something with a boolean or a float, which holds every mute and volume call.
     */
    private fun loadHosts(build: File): List<ClassDef> {
        val launch = FixtureDex.classes(build, setOf(LAUNCH_ACTIVITY)).values.single()
        val dispatch = launch.methods.single { it.toString() == DISPATCH_KEY }.controlBody()
        val chats = dispatch.filter { it.opcode == Opcode.CHECK_CAST }.map { (it as ReferenceInstruction).reference.origString() }
            .filter { type -> dispatch.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.origDefiningClass == type } }.toSet()
        val turns = FixtureDex.classesWhere(build, { true }) { m ->
            val refs = m.instructions().mapNotNull { it.origRef() }
            refs.any { it.startsWith("$PHOTO_VIEWER->") } &&
                (refs.any { it == SET_ORIENTATION || it == GET_ORIENTATION || it == LISTENER_ON || it == LISTENER_OFF } ||
                    refs.any { it.startsWith("$PHOTO_VIEWER->") && it.endsWith(":Z") } && refs.any { it.endsWith("(Z)V") || it.endsWith("(F)V") })
        }
        // The viewer's player, whose mute and volume calls the extension makes.
        val players = turns.flatMap { cls -> cls.methods.flatMap { it.instructions() } }
            .filter { it.opcode == Opcode.INVOKE_VIRTUAL }
            .mapNotNull { (it as ReferenceInstruction).reference as? MethodReference }
            .filter { it.returnType == "V" && it.parameterTypes.map(CharSequence::toString).let { p -> p == listOf("Z") || p == listOf("F") } }
            .map { it.origDefiningClass }.filter { it.startsWith("Lorg/telegram/") && it != PHOTO_VIEWER }.toSet() -
            turns.map { it.origType }.toSet()
        return (listOf(launch) + FixtureDex.classes(build, chats).values + FixtureDex.classes(build, players).values).map(ImmutableClassDef::of) + turns
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.state(): List<Any?> {
        val body = controlBody(); val flow = if (body.isEmpty()) null else ControlFlow.of(this)
        return listOf(accessFlags, implementation?.registerCount, body.map { it.operand() }, body.map { listOf(it.codeUnits, (it as? OffsetInstruction)?.codeOffset) },
            flow?.normal?.toList(), flow?.exceptional?.toList())
    }
    private fun Instruction.operand() = listOf(opcode, namedRegisters(), origRef(),
        (this as? WideLiteralInstruction)?.wideLiteral)
    private fun key(m: Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    companion object {
        private val HOSTS = mutableMapOf<String, SoftReference<List<ClassDef>>>()
        @AfterClass @JvmStatic fun releaseFixtures() { HOSTS.clear() }
    }
}
