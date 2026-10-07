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
            val old = ImmutableMethod.of(site.dispatch)
            val untouched = hostState(build, context, setOf(key(site.dispatch)))
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
            assertEquals("$name: the chat's answer and every other method", untouched, hostState(build, context, setOf(key(site.dispatch))))

            val stub = context.mutableClassDefBy(VOLUME_KEYS).methods.single { it.name == "stockChatTakesKey" }.controlBody()
            assertEquals(listOf(Opcode.CHECK_CAST, Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), stub.map { it.opcode })
            assertEquals(site.handler.toString(), stub[1].controlRef())
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "keepVideosMuted" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
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
    private fun completeState(build: File, c: BytecodePatchContext) = (hosts(build).map { it.type } + listOf(VOLUME_KEYS, SETTINGS_STATUS))
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

    /** LaunchActivity, and the screen its key dispatch casts to before asking. */
    private fun loadHosts(build: File): List<ClassDef> {
        val launch = FixtureDex.classes(build, setOf(LAUNCH_ACTIVITY)).values.single()
        val dispatch = launch.methods.single { it.toString() == DISPATCH_KEY }.controlBody()
        val chats = dispatch.filter { it.opcode == Opcode.CHECK_CAST }.map { (it as ReferenceInstruction).reference.toString() }
            .filter { type -> dispatch.any { ((it as? ReferenceInstruction)?.reference as? MethodReference)?.definingClass == type } }.toSet()
        return (listOf(launch) + FixtureDex.classes(build, chats).values).map(ImmutableClassDef::of)
    }

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
