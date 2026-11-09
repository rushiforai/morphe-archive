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
import app.morphe.util.names.origDefiningClass
import app.morphe.util.names.origName
import app.morphe.util.names.origType
import app.morphe.util.names.tgClassDefByOrNull
import app.morphe.util.names.tgMutableClassDefBy

/** Every screen's call to the phone formatter, the classes that keep the real number, and the runtime. */
class HidePhoneNumberFixtureTest {
    @Test fun `every screen asks the extension and exported cards keep the real number`() {
        for (build in Fixtures.declaredBuilds()) {
            val name = build.name
            val hosts = hidePhoneHosts(build)
            val context = PatchContexts.of(ExtensionDex.classes() + hosts)
            val site = context.resolveHidePhoneNumber()
            val share = context.resolveContactShare()
            val before = site.calls.associate { (m, indices) -> key(m) to indices.map { m.controlBody()[it].namedRegisters() } }
            assertTrue("$name: the side menu and Settings among ${site.calls.size} callers", site.calls.size >= 15)
            val kept = KEPT.filter { context.tgClassDefByOrNull(it) != null }
            assertTrue("$name: an exported card or link keeps the number", kept.isNotEmpty())
            assertEquals(emptyList<String>(), PatchLogCapture.warnings { hidePhoneNumberPatch.execute(context) })

            for ((method, indices) in site.calls) {
                val body = method.controlBody()
                assertEquals("$name: ${method.definingClass}", before[key(method)],
                    indices.map { body[it].namedRegisters() })
                indices.forEach { assertEquals("$name: ${method.definingClass} asks the extension", SHOWN, body[it].controlRef()) }
            }
            val left = hosts.map { it.type }.filter { !it.startsWith("Lapp/hushtelegram/") }.flatMap { type ->
                val cls = context.tgMutableClassDefBy(type)
                cls.methods.filter { m -> m.controlBody().any { it.controlRef() == site.format } }.map { "${cls.origType}->${it.name}" }
            }
            assertEquals("$name: only the kept classes still format directly", kept.toSet(), left.map { it.substringBefore("->") }.toSet())

            val stub = { n: String -> context.tgMutableClassDefBy(HIDE_PHONE).methods.single { it.origName == n }.controlBody().mapNotNull { it.controlRef() } }
            assertTrue("$name: Telegram's formatting", site.format in stub("stockFormat"))
            assertTrue("$name: the account's number", "$TL_USER->phone:Ljava/lang/String;" in stub("ownPhone"))
            // 13.2 inlines getMaxAccountCount, so the stub counts every slot of the per-account table.
            assertTrue("$name: every account", "$USER_CONFIG->Instance:[$USER_CONFIG" in stub("accounts"))
            assertTrue("$name: every account", context.tgMutableClassDefBy(HIDE_PHONE).methods.single { it.origName == "accounts" }
                .controlBody().any { it.opcode == Opcode.ARRAY_LENGTH })
            assertEquals("$name: the share box asks the runtime once", 1, share.view.controlBody().count { it.controlRef() == STARTS_TICKED })
            for (flag in listOf("hidePhoneNumber", "shareNumberUnticked")) {
                val status = context.tgMutableClassDefBy(SETTINGS_STATUS).methods.single { it.origName == flag }.controlBody()
                assertEquals("$name: $flag", 1L, (status.first() as WideLiteralInstruction).wideLiteral)
            }
        }
    }

    private fun key(m: com.android.tools.smali.dexlib2.iface.Method) = "${m.definingClass}->${m.name}(${m.parameterTypes.joinToString("")})${m.returnType}"
}

/** The formatter, everything that calls it, the account classes the runtime reads, and the add contact screen. */
internal fun hidePhoneHosts(build: java.io.File): List<ClassDef> {
    val formatter = FixtureDex.classesWhere(build, { true }) { m ->
        m.origName == "<init>" && m.controlBody().any { ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == PHONE_FORMATS }
    }.single().type
    return (FixtureDex.classesWhere(build, { true }) { m ->
        m.origDefiningClass == formatter || m.origDefiningClass == USER_CONFIG || m.origDefiningClass == TL_USER ||
            m.controlBody().any { it.opcode != Opcode.NOP && it.controlRef()?.startsWith("$formatter->") == true }
    }.map(ImmutableClassDef::of) + contactShareHosts(build)).distinctBy { it.type }
}
