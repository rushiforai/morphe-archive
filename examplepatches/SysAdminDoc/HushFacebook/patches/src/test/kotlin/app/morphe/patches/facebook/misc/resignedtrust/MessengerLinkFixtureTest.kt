/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.resignedtrust

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.misc.extension.localRegisterCount
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * The Messenger link test's anchors on every Facebook build the bundle declares: one flag reader
 * holding both flags' names, built from the session alone, with one public read of each flag; and
 * Facebook's Context-to-session lookups, all ending with the same call. Then the fill, run on those
 * classes: each stub calls what it stands for with its own parameter, and patched() answers true.
 * Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class MessengerLinkFixtureTest {
    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    @Test
    fun `each declared build has the reader and a session lookup, and the stubs call them`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val readers = FixtureDex.classesHolding(bundle, OPT_OUT_FLAG)
                    .filterNot { it.type.startsWith(EXTENSION_CLASSES) }
                    .filter { flagReads(it, OPT_OUT_FLAG).size == 1 && flagReads(it, TRIGGERED_FLAG).size == 1 && builtFromSession(it) }
                assertEquals("$name: flag readers", 1, readers.size)
                val reader = readers.single()
                assertTrue("$name: ${reader.type} isn't public", AccessFlags.PUBLIC.isSet(reader.accessFlags))
                val optOut = flagReads(reader, OPT_OUT_FLAG).single()
                val triggered = flagReads(reader, TRIGGERED_FLAG).single()
                assertTrue("$name: the two reads are one method", optOut.name != triggered.name)

                val shaped = FixtureDex.methodsWhere(bundle, dexFilter = { true }) { method ->
                    method.returnType == FB_USER_SESSION && AccessFlags.STATIC.isSet(method.accessFlags) &&
                        method.parameterTypes.map(CharSequence::toString) == listOf("Landroid/content/Context;")
                }
                val owners = FixtureDex.classes(bundle, shaped.map { it.definingClass }.toSet())
                val lookups = shaped.mapNotNull { method -> sessionLookupEnd(owners.getValue(method.definingClass), method)?.let { method to it } }
                assertTrue("$name: no session lookup among ${shaped.map { it.definingClass + "->" + it.name }}", lookups.isNotEmpty())
                assertEquals("$name: the lookups' last calls", 1, lookups.map { it.second }.toSet().size)

                val context = PatchContexts.of(listOf(reader) + lookups.map { owners.getValue(it.first.definingClass) }.distinctBy { it.type } +
                    ExtensionDex.classDef(MESSENGER_LINK_CHECK))
                val anchors = context.findMessengerLinkAnchors()
                assertEquals("$name: the reader found", reader.type, anchors.reader.type)
                context.fillMessengerLinkStubs(anchors)

                val stubs = context.mutableClassDefBy(MESSENGER_LINK_CHECK).methods
                fun stub(stubName: String) = stubs.single { it.name == stubName }.code()

                val session = stub(SESSION_STUB)
                assertEquals("$name: the session stub's call", Opcode.INVOKE_STATIC_RANGE, session[0].opcode)
                assertEquals("$name: the session stub's lookup", anchors.session.definingClass + "->" + anchors.session.name,
                    session[0].call!!.let { it.definingClass + "->" + it.name })
                assertEquals("$name: the session stub's answer", Opcode.RETURN_OBJECT, session[2].opcode)

                val readerStub = stubs.single { it.name == READER_STUB }
                val built = readerStub.code()
                // Parameter registers only: the unfilled body can compile to the one register p0 has.
                val sessionRegister = readerStub.localRegisterCount()
                val spareRegister = sessionRegister + 1
                assertEquals("$name: the reader stub's cast register", sessionRegister, (built[0] as OneRegisterInstruction).registerA)
                assertEquals("$name: the reader stub builds the reader in its spare parameter", spareRegister,
                    (built[1] as OneRegisterInstruction).registerA)
                val init = built[2] as FiveRegisterInstruction
                assertEquals("$name: the constructor's registers", listOf(spareRegister, sessionRegister), listOf(init.registerC, init.registerD))
                assertEquals("$name: the reader stub's answer register", spareRegister, (built[3] as OneRegisterInstruction).registerA)
                assertEquals("$name: the reader stub's cast", FB_USER_SESSION, ((built[0] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: the reader stub's new object", reader.type, ((built[1] as ReferenceInstruction).reference as TypeReference).type)
                assertEquals("$name: the reader stub's constructor", "${reader.type}-><init>",
                    built[2].call!!.let { it.definingClass + "->" + it.name })

                for ((stubName, read) in listOf(OPT_OUT_STUB to optOut, TRIGGERED_STUB to triggered)) {
                    val code = stub(stubName)
                    assertEquals("$name: the $stubName stub's cast", reader.type, ((code[0] as ReferenceInstruction).reference as TypeReference).type)
                    assertEquals("$name: the $stubName stub's read", "${reader.type}->${read.name}()${read.returnType}",
                        code[1].call!!.let { it.definingClass + "->" + it.name + "()" + it.returnType })
                    assertEquals("$name: the $stubName stub's answer", Opcode.RETURN_OBJECT, code[3].opcode)
                }
                assertEquals("$name: patched() doesn't answer true", 1,
                    (stub(PATCHED_STUB)[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
