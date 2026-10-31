/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.externalbrowser

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * Facebook's link mapper on each declared build hands its address to the extension first and keeps
 * the answer in the same register; a mapper without one String address is refused with a reason (#319).
 */
class PageEventsLinkFixtureTest {
    @Before
    @After
    fun forgetTheMatch() = UriIntentMapperFingerprint.clearMatch()

    @Test
    fun `each declared build's link mapper asks the extension about its address first`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                forgetTheMatch()
                val classes = FixtureDex.classesHolding(bundle, URI_MAPPER_LOG)
                val holders = classes.flatMap { it.methods }.filter { method ->
                    method.implementation?.instructions?.any {
                        ((it as? ReferenceInstruction)?.reference as? StringReference)?.string == URI_MAPPER_LOG
                    } == true
                }
                assertEquals("${bundle.name}: one method logs the mapper's address", 1, holders.size)

                val method = with(PatchContexts.of(classes)) { UriIntentMapperFingerprint.method }
                assertTrue("${bundle.name}: the mapper is static", AccessFlags.STATIC.isSet(method.accessFlags))
                val types = method.parameterTypes.map(CharSequence::toString)
                assertEquals("${bundle.name}: the address is the mapper's fifth parameter", 4, types.indexOf("Ljava/lang/String;"))
                val address = method.addressRegister()
                assertEquals(bundle.name, method.implementation!!.registerCount - types.size + 4, address)
                val stock = method.implementation!!.instructions.toList()

                method.routePageEventsLinks()
                val body = method.implementation!!.instructions.toList()
                val call = body[0]
                assertEquals(bundle.name, PAGE_EVENTS_LINK, (call as ReferenceInstruction).reference.toString())
                val passed = if (call.opcode == Opcode.INVOKE_STATIC_RANGE) {
                    assertEquals(bundle.name, 1, (call as RegisterRangeInstruction).registerCount)
                    call.startRegister
                } else {
                    assertEquals(bundle.name, Opcode.INVOKE_STATIC, call.opcode)
                    (call as FiveRegisterInstruction).registerC
                }
                assertEquals("${bundle.name}: the address goes in", address, passed)
                assertEquals(bundle.name, Opcode.MOVE_RESULT_OBJECT, body[1].opcode)
                assertEquals("${bundle.name}: the answer replaces it", address, (body[1] as OneRegisterInstruction).registerA)
                assertEquals("${bundle.name}: the mapper's own first instruction follows", stock[0].opcode, body[2].opcode)
                assertEquals("${bundle.name}: nothing else moved", stock.size + 2, body.size)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `a low address register gets the plain call`() {
        val method = mapper(listOf("Landroid/content/Context;", "Ljava/lang/String;"), registers = 3)
        method.routePageEventsLinks()
        val body = method.implementation!!.instructions.toList()
        assertEquals(Opcode.INVOKE_STATIC, body[0].opcode)
        assertEquals(2, (body[0] as FiveRegisterInstruction).registerC)
        assertEquals(2, (body[1] as OneRegisterInstruction).registerA)
    }

    @Test
    fun `a mapper without one address is refused with the reason`() {
        val none = mapper(listOf("Landroid/content/Context;"), registers = 2)
        assertTrue(assertThrows(PatchException::class.java) { none.routePageEventsLinks() }.message!!.contains("0 String parameters"))
        val two = mapper(listOf("Ljava/lang/String;", "Ljava/lang/String;"), registers = 3)
        assertTrue(assertThrows(PatchException::class.java) { two.routePageEventsLinks() }.message!!.contains("2 String parameters"))
    }

    /** A static mapper taking [parameters], with [registers] registers and a body that returns null. */
    private fun mapper(parameters: List<String>, registers: Int): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lfixture/Mapper;",
            "A04",
            parameters.map { ImmutableMethodParameter(it, null, null) },
            "Landroid/content/Intent;",
            AccessFlags.PUBLIC.value or AccessFlags.STATIC.value,
            null,
            null,
            ImmutableMethodImplementation(registers, emptyList(), null, null),
        ),
    ).apply { addInstructions(0, "const/4 v0, 0x0\nreturn-object v0") }
}
