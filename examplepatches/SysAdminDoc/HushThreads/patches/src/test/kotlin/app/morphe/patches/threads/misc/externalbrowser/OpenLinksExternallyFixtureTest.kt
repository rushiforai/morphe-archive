/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.externalbrowser

import app.morphe.ExtensionDex
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
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Open links in browser on each declared build: one browser launcher in the whole build, and the
 * patch asks the extension about its link before the launcher's own first instruction.
 */
class OpenLinksExternallyFixtureTest {
    @Test
    fun `the extension's open takes a context and a link and answers whether the link went out`() {
        val browser = ExtensionDex.classDef("$EXTENSION_PACKAGE/misc/ExternalBrowser;")
        val method = browser.methods.single { it.name == "open" }
        assertTrue(AccessFlags.STATIC.isSet(method.accessFlags) && AccessFlags.PUBLIC.isSet(method.accessFlags))
        assertEquals(OPEN_LINK, "${method.definingClass}->open(${method.parameterTypes.joinToString("")})${method.returnType}")
    }

    @Test
    fun `each declared build asks the extension first thing in its one browser launcher`() {
        for (build in Fixtures.declaredBuilds()) {
            BrowserLauncherFingerprint.clearMatch()
            val where = build.name
            // The launcher, the factory it shares with the three direct callers, and those callers.
            val classes = browserFixture(build).classes
            val launchers = classes.flatMap { it.methods }.filter { it.isLauncher() }
            assertEquals("$where: launchers", 1, launchers.size)
            val launcher = launchers.single()
            val stock = launcher.instructions()

            // Read apart from the patch: the String field the launcher parses as a URI.
            val parse = stock.indexOfFirst { it.method()?.let { m -> m.definingClass == "Ljava/net/URI;" && m.name == "<init>" } == true }
            var parsed = (stock[parse] as FiveRegisterInstruction).registerD
            val linkRead = (parse - 1 downTo 0).first { at ->
                val read = stock[at] as? TwoRegisterInstruction
                stock[at].opcode == Opcode.IGET_OBJECT && read?.registerA == parsed
            }
            val linkField = (stock[linkRead] as ReferenceInstruction).reference as FieldReference
            assertEquals("$where: the link field", "Ljava/lang/String;", linkField.type)
            val launcherClass = classes.single { it.type == launcher.definingClass }
            val contextField = launcherClass.fields.single { it.type == "Landroid/content/Context;" }
            val registers = launcher.implementation!!.registerCount

            val isStatic = AccessFlags.STATIC.isSet(launcher.accessFlags)
            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            openLinksExternallyPatch.execute(context)

            val mutable = context.mutableClassDefBy(launcher.definingClass).methods.single { it.isLauncher() }
            val patched = mutable.instructions()
            if (isStatic) {
                assertEquals("$where: six instructions added", stock.size + 6, patched.size)
                assertEquals("$where: no new registers", registers, mutable.implementation!!.registerCount)
                assertEquals(
                    "$where: hook shape",
                    listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC,
                        Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                    patched.take(6).map { it.opcode },
                )
                val call = patched[2] as FiveRegisterInstruction
                assertEquals(OPEN_LINK, (call as ReferenceInstruction).reference.toString())
                assertEquals(listOf(0, 1), listOf(call.registerC, call.registerD).take(call.registerCount))
                assertEquals(2, call.registerCount)
                assertEquals(0, (patched[3] as OneRegisterInstruction).registerA)
                assertEquals(0, (patched[4] as OneRegisterInstruction).registerA)
                assertEquals("$where: a link that stays goes on to the launcher's own first instruction", 6, patched.target(4))
                assertEquals("$where: the launcher after the hook is the stock one",
                    stock.map { it.opcode }, patched.drop(6).map { it.opcode })
            } else {
                assertEquals("$where: seven instructions added", stock.size + 7, patched.size)
                assertEquals("$where: no new registers", registers, mutable.implementation!!.registerCount)
                assertEquals(
                    "$where: hook shape",
                    listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.IGET_OBJECT, Opcode.IGET_OBJECT, Opcode.INVOKE_STATIC,
                        Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID),
                    patched.take(7).map { it.opcode },
                )
                val self = patched[0] as TwoRegisterInstruction
                assertEquals(where, 2, self.registerA)
                assertEquals(where, registers - 1, self.registerB)
                val contextRead = patched[1] as TwoRegisterInstruction
                assertEquals(where, 0, contextRead.registerA)
                assertEquals(where, 2, contextRead.registerB)
                assertEquals(where, contextField.toString(), (contextRead as ReferenceInstruction).reference.toString())
                val linkReadPatched = patched[2] as TwoRegisterInstruction
                assertEquals(where, 1, linkReadPatched.registerA)
                assertEquals(where, 2, linkReadPatched.registerB)
                assertEquals(where, linkField.toString(), (linkReadPatched as ReferenceInstruction).reference.toString())
                val call = patched[3] as FiveRegisterInstruction
                assertEquals(OPEN_LINK, (call as ReferenceInstruction).reference.toString())
                assertEquals(listOf(0, 1), listOf(call.registerC, call.registerD).take(call.registerCount))
                assertEquals(2, call.registerCount)
                assertEquals(0, (patched[4] as OneRegisterInstruction).registerA)
                assertEquals(0, (patched[5] as OneRegisterInstruction).registerA)
                assertEquals("$where: a link that stays goes on to the launcher's own first instruction", 7, patched.target(5))
                assertEquals("$where: the launcher after the hook is the stock one",
                    stock.map { it.opcode }, patched.drop(7).map { it.opcode })
            }
            assertEquals("$where: one call in the launcher", 1, patched.count { it.method()?.toString() == OPEN_LINK })

            val status = context.mutableClassDefBy(SETTINGS_STATUS).methods
                .single { it.name == "openLinksExternally" }.instructions()
            assertEquals("$where: SettingsStatus.openLinksExternally() answers true", Opcode.CONST_4, status[0].opcode)
            assertEquals(1, (status[0] as NarrowLiteralInstruction).narrowLiteral)
            assertEquals(Opcode.RETURN, status[1].opcode)
        }
    }

    /**
     * The link is found by what the launcher parses. A launcher that parses another parameter, a
     * string it made, or runs anything else before parsing is a launcher the hook can't trust.
     */
    @Test
    fun `a launcher whose link can't be followed back to its string parameter is refused`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = browserFixture(build).classes
            val launcher = classes.flatMap { it.methods }.single { it.isLauncher() }
            val stock = launcher.instructions()
            val parse = stock.indexOfFirst { it.method()?.let { m -> m.definingClass == "Ljava/net/URI;" && m.name == "<init>" } == true }
            val parsed = (stock[parse] as FiveRegisterInstruction).registerD
            val linkRead = (parse - 1 downTo 0).first { at ->
                val read = stock[at] as? TwoRegisterInstruction
                stock[at].opcode == Opcode.IGET_OBJECT && read?.registerA == parsed
            }
            val cases = listOf(
                "another field" to "parses a String that isn't one of its fields",
                "made string" to "runs const-string",
                "no parse" to "never parses a link",
            )
            for ((label, expected) in cases) {
                BrowserLauncherFingerprint.clearMatch()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(launcher.definingClass).methods.single { it.isLauncher() }
                when (label) {
                    "another field" -> {
                        val read = stock[linkRead] as TwoRegisterInstruction
                        mutable.replaceInstruction(linkRead, "iget-object v${read.registerA}, v${read.registerB}, ${launcher.definingClass}->A02:Lcom/instagram/common/session/UserSession;")
                    }
                    "made string" -> mutable.addInstructions(linkRead + 1, "const-string v$parsed, \"https://example.org/\"")
                    "no parse" -> mutable.replaceInstruction(parse, "invoke-direct { v${(stock[parse] as FiveRegisterInstruction).registerC}, v$parsed }, Ljava/net/URL;-><init>(Ljava/lang/String;)V")
                }
                val error = assertThrows("$label: refused", PatchException::class.java) { openLinksExternallyPatch.execute(context) }
                    .message.orEmpty()
                assertTrue("$label: $error", error.contains(expected))
            }
        }
    }

    private fun Method.isLauncher(): Boolean =
        returnType == "V" && instructions().any { it.string() == LAUNCHER_MESSAGE }

    private fun Instruction.method(): MethodReference? = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun Instruction.string(): String? = ((this as? ReferenceInstruction)?.reference as? StringReference)?.string

    /** The index [index]'s branch lands on. */
    private fun List<Instruction>.target(index: Int): Int {
        var address = 0
        val at = IntArray(size) { i -> address.also { address += this[i].codeUnits } }
        return at.indexOfFirst { it == at[index] + (this[index] as OffsetInstruction).codeOffset }
    }

    private fun Method.instructions(): List<Instruction> = implementation?.instructions?.toList().orEmpty()
}
