/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.sharelinks

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Sanitize sharing links on each declared build: one parser of the permalink answer in the whole
 * build, and the patch sends the link it parses through the extension right before the response
 * object keeps it.
 */
class SanitizeSharingLinksFixtureTest {
    private val sanitize = "$EXTENSION_PACKAGE/misc/LinkCleaner;->sanitizeShared(Ljava/lang/String;)Ljava/lang/String;"

    @Test
    fun `the extension's link cleaner takes and answers a string`() {
        val cleaner = ExtensionDex.classDef("$EXTENSION_PACKAGE/misc/LinkCleaner;")
        val method = cleaner.methods.single { it.name == "sanitizeShared" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(listOf("Ljava/lang/String;"), method.parameterTypes.map { it.toString() })
        assertEquals("Ljava/lang/String;", method.returnType)
    }

    @Test
    fun `each declared build parses the permalink once, and the link is cleaned before it's kept`() {
        for (build in Fixtures.declaredBuilds()) {
            val where = build.name
            val classes = FixtureDex.classesWhere(build, { dex -> "XDTPermalinkResponse" in dex.stringSection }) {
                it.isPermalinkParser()
            }
            val parsers = classes.flatMap { it.methods }.filter { it.isPermalinkParser() }
            assertEquals("$where: permalink parsers", 1, parsers.size)
            val parser = parsers.single()

            // Read apart from the patch: the object created after the type name, and its String field.
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val response = ((stock[created] as ReferenceInstruction).reference as TypeReference).type
            val store = (created until stock.size).first {
                stock[it].opcode == Opcode.IPUT_OBJECT && (stock[it].field()?.type == "Ljava/lang/String;")
            }
            assertEquals("$where: the String goes into the response it created", response, stock[store].field()!!.definingClass)
            val link = (stock[store] as TwoRegisterInstruction).registerA

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            sanitizeSharingLinksPatch.execute(context)

            val patched = context.mutableClassDefBy(parser.definingClass).methods
                .single { it.name == parser.name && it.parameterTypes.map(CharSequence::toString) == parser.parameterTypes.map(CharSequence::toString) }
                .instructions()
            assertEquals("$where: two instructions added", stock.size + 2, patched.size)
            val call = patched[store]
            assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals(sanitize, (call as ReferenceInstruction).reference.toString())
            assertEquals("$where: the call reads the link", link, (call as RegisterRangeInstruction).startRegister)
            assertEquals(1, call.registerCount)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, patched[store + 1].opcode)
            assertEquals("$where: the clean link replaces it", link, (patched[store + 1] as OneRegisterInstruction).registerA)
            assertEquals("$where: then the response keeps it", stock[store].field(), patched[store + 2].field())
            assertEquals("$where: one call in the parser", 1, patched.count { (it as? ReferenceInstruction)?.reference?.toString() == sanitize })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.name == "sanitizeSharingLinks" }.instructions()
            assertEquals("$where: SettingsStatus.sanitizeSharingLinks() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    private fun Method.isPermalinkParser(): Boolean {
        if (name != "unsafeParseFromJson" || returnType != "Ljava/lang/Object;") return false
        val strings = instructions().mapNotNull { it.string() }.toSet()
        return "permalink" in strings && "XDTPermalinkResponse" in strings
    }

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    private fun Instruction.field(): FieldReference? = (this as? ReferenceInstruction)?.reference as? FieldReference

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}
