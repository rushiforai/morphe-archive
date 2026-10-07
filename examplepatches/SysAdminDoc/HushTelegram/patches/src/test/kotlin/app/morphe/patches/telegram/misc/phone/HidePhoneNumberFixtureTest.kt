/*
 * Copyright 2026 HushTelegram contributors
 * https://github.com/SysAdminDoc/HushTelegram
 */
package app.morphe.patches.telegram.misc.phone

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.telegram.misc.extension.PatchLogCapture
import app.morphe.patches.telegram.misc.extension.SETTINGS_STATUS
import app.morphe.patches.telegram.misc.localcontrols.controlBody
import app.morphe.patches.telegram.misc.localcontrols.controlRef
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/** Every screen's call to the phone formatter, the classes that keep the real number, and the runtime. */
class HidePhoneNumberFixtureTest {
    @Test fun `every screen asks the extension and exported cards keep the real number`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = loadHosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveHidePhoneNumber()
            val before = site.calls.associate { (m, indices) -> key(m) to indices.map { m.controlBody()[it].namedRegisters() } }
            assertTrue("$name: the side menu and Settings among ${site.calls.size} callers", site.calls.size >= 15)
            val kept = KEPT.filter { context.classDefByOrNull(it) != null }
            assertTrue("$name: an exported card or link keeps the number", kept.isNotEmpty())
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hidePhoneNumberPatch.execute(context) })

            for ((method, indices) in site.calls) {
                val body = method.controlBody()
                assertEquals("$name: ${method.definingClass}", before[key(method)],
                    indices.map { body[it].namedRegisters() })
                indices.forEach { assertEquals("$name: ${method.definingClass} asks the extension", SHOWN, body[it].controlRef()) }
            }
            val left = hosts.map { it.type }.filter { !it.startsWith("Lapp/hushtelegram/") }.flatMap { type ->
                context.mutableClassDefBy(type).methods.filter { m -> m.controlBody().any { it.controlRef() == site.format } }.map { "$type->${it.name}" }
            }
            assertEquals("$name: only the kept classes still format directly", kept.toSet(), left.map { it.substringBefore("->") }.toSet())

            val stub = { n: String -> context.mutableClassDefBy(HIDE_PHONE).methods.single { it.name == n }.controlBody().mapNotNull { it.controlRef() } }
            assertTrue("$name: Telegram's formatting", site.format in stub("stockFormat"))
            assertTrue("$name: the account's number", "$TL_USER->phone:Ljava/lang/String;" in stub("ownPhone"))
            assertTrue("$name: every account", "$USER_CONFIG->getMaxAccountCount()I" in stub("accounts"))
            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "hidePhoneNumber" }.controlBody()
            assertEquals(1L, (status.first() as WideLiteralInstruction).wideLiteral)
        }
    }

    private fun key(m: com.android.tools.smali.dexlib2.iface.Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"

    /** The formatter, everything that calls it, and the account classes the runtime reads. */
    private fun loadHosts(build: java.io.File): List<ClassDef> {
        val formatter = FixtureDex.classesWhere(build, { true }) { m ->
            m.name == "<init>" && m.controlBody().any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PHONE_FORMATS }
        }.single().type
        return FixtureDex.classesWhere(build, { true }) { m ->
            m.definingClass == formatter || m.definingClass == USER_CONFIG || m.definingClass == TL_USER ||
                m.controlBody().any { it.opcode != Opcode.NOP && it.controlRef()?.startsWith("$formatter->") == true }
        }.map(ImmutableClassDef::of)
    }
}
