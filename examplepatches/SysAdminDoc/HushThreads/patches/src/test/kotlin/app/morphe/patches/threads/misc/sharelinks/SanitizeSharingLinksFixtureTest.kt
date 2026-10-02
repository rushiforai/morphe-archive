/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.sharelinks

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.extensions.InstructionExtensions.replaceInstruction
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.threads.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.threads.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Assert.assertThrows
import org.junit.Test
import java.io.File

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
    fun `an unrelated String store before the response field is not sanitized`() {
        for (build in Fixtures.declaredBuilds()) {
            PermalinkResponseParserFingerprint.clearMatch()
            val classes = parserClasses(build)
            val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val store = (created until stock.size).first { stock[it].opcode == Opcode.IPUT_OBJECT && stock[it].field()?.type == "Ljava/lang/String;" }
            val original = stock[store] as TwoRegisterInstruction
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            val mutable = context.mutableClassDefBy(parser.definingClass).methods.single { it.name == parser.name }
            mutable.addInstructions(
                store,
                "iput-object v${original.registerA}, v${original.registerB}, Lfixture/Unrelated;->label:Ljava/lang/String;",
            )

            sanitizeSharingLinksPatch.execute(context)

            val after = mutable.instructions()
            val call = after.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == sanitize }
            assertEquals("the sanitizer immediately precedes the owned response field", stock[store].field(), after[call + 2].field())
        }
    }

    @Test
    fun `response selection tolerates decoys and aliases but rejects duplicate or overwritten receivers`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = parserClasses(build)
            val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val owner = ((stock[created] as ReferenceInstruction).reference as TypeReference).type
            val store = (created until stock.size).first { stock[it].opcode == Opcode.IPUT_OBJECT && stock[it].field()?.type == "Ljava/lang/String;" }
            val original = stock[store] as TwoRegisterInstruction
            val field = stock[store].field()!!
            val cases = listOf(
                Triple("unrelated allocation", created, "new-instance v2, Lfixture/Decoy;\ninvoke-direct { v2 }, Lfixture/Decoy;-><init>()V"),
                Triple("wrong receiver", store, "iput-object v${original.registerA}, v2, $field"),
                Triple("aliases", store, "move-object v2, v${original.registerB}\nconst/4 v${original.registerB}, 0x0\nmove-object v${original.registerB}, v2\ncheck-cast v${original.registerB}, $owner"),
                Triple("duplicate stores", store, "iput-object v${original.registerA}, v${original.registerB}, $field"),
                Triple("overwritten receiver", store, "const/4 v${original.registerB}, 0x0"),
            )
            for ((label, index, code) in cases) {
                PermalinkResponseParserFingerprint.clearMatch()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(parser.definingClass).methods.single { it.name == parser.name }
                mutable.addInstructions(index, code)
                if (label == "duplicate stores" || label == "overwritten receiver") {
                    val error = assertThrows(PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }
                    assertTrue("$label: diagnostic identifies candidates", error.message.orEmpty().contains("candidates"))
                } else {
                    sanitizeSharingLinksPatch.execute(context)
                    val after = mutable.instructions()
                    val call = after.indexOfFirst { (it as? ReferenceInstruction)?.reference?.toString() == sanitize }
                    assertTrue("$label: sanitizer installed", call >= 0)
                    assertEquals("$label: owned field", field, after[call + 2].field())
                    assertEquals("$label: original receiver", original.registerB, (after[call + 2] as TwoRegisterInstruction).registerB)
                }
            }
        }
    }

    @Test
    fun `each declared build parses the permalink once, and the link is cleaned before it's kept`() {
        for (build in Fixtures.declaredBuilds()) {
            PermalinkResponseParserFingerprint.clearMatch()
            val where = build.name
            val classes = parserClasses(build)
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

    @Test
    fun constructorOwnershipAndWideTypeNameWrites() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = parserClasses(build)
            val parser = classes.flatMap { it.methods }.single { it.isPermalinkParser() }
            val stock = parser.instructions()
            val typeName = stock.indexOfFirst { it.string() == "XDTPermalinkResponse" }
            val created = (typeName until stock.size).first { stock[it].opcode == Opcode.NEW_INSTANCE }
            val constructor = (created + 1 until stock.size).first { stock[it].opcode == Opcode.INVOKE_DIRECT }
            val call = (stock[constructor] as ReferenceInstruction).reference as MethodReference
            val receiver = (stock[constructor] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerC
            val store = (constructor + 1 until stock.size).first { stock[it].opcode == Opcode.IPUT_OBJECT }
            val owner = ((stock[created] as ReferenceInstruction).reference as TypeReference).type
            for (variant in listOf("wide before allocation", "wide before constructor", "unrelated constructor", "cast alias")) {
                PermalinkResponseParserFingerprint.clearMatch()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(parser.definingClass).methods.single { it.name == parser.name }
                when (variant) {
                    "wide before allocation", "wide before constructor" -> {
                        mutable.replaceInstruction(typeName, "const-string v3, \"XDTPermalinkResponse\"")
                        mutable.replaceInstruction(constructor, "invoke-direct { v$receiver, v3 }, $call")
                        mutable.addInstructions(if (variant == "wide before allocation") created else constructor, "const-wide/16 v2, 0x0")
                    }
                    "unrelated constructor" -> mutable.replaceInstruction(constructor,
                        "invoke-direct { v$receiver, v${(stock[typeName] as OneRegisterInstruction).registerA} }, Lfixture/Unrelated;-><init>(Ljava/lang/String;)V")
                    else -> mutable.addInstructions(store, "check-cast v$receiver, Ljava/lang/Object;\ncheck-cast v$receiver, $owner")
                }
                if (variant == "cast alias") {
                    sanitizeSharingLinksPatch.execute(context)
                    assertEquals(1, mutable.instructions().count { (it as? ReferenceInstruction)?.reference?.toString() == sanitize })
                } else {
                    val error = assertThrows(PatchException::class.java) { sanitizeSharingLinksPatch.execute(context) }
                    assertTrue("$variant: identifies candidate refusal", error.message.orEmpty().contains("candidates"))
                }
            }
        }
    }

    private fun parserClasses(build: File): List<ClassDef> {
        val parsers = FixtureDex.classesWhere(build, { dex -> "XDTPermalinkResponse" in dex.stringSection }) {
            it.isPermalinkParser()
        }
        val allocated = parsers.flatMap { it.methods }.filter { it.isPermalinkParser() }.flatMap { it.instructions() }
            .filter { it.opcode == Opcode.NEW_INSTANCE }.map { ((it as ReferenceInstruction).reference as TypeReference).type }.toMutableSet()
        val hierarchy = mutableMapOf<String, String?>()
        FixtureDex.forEach(build) { dex -> dex.classes.forEach { hierarchy[it.type] = it.superclass } }
        for (type in allocated.toList()) {
            var parent = hierarchy[type]
            while (parent != null && allocated.add(parent)) parent = hierarchy[parent]
        }
        return parsers + FixtureDex.classes(build, allocated).values
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
