/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 */
package app.morphe.patches.threads.misc.externalbrowser

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
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.StringReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

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
            val classes = launcherClasses(build)
            val launchers = classes.flatMap { it.methods }.filter { it.isLauncher() }
            assertEquals("$where: launchers", 1, launchers.size)
            val launcher = launchers.single()
            val stock = launcher.instructions()

            // Read apart from the patch: the string the launcher parses as a URI, back to its parameter.
            val parse = stock.indexOfFirst { it.method()?.let { m -> m.definingClass == "Ljava/net/URI;" && m.name == "<init>" } == true }
            var parsed = (stock[parse] as FiveRegisterInstruction).registerD
            for (at in parse - 1 downTo 0) {
                val move = stock[at] as? TwoRegisterInstruction ?: continue
                if (stock[at].opcode.name.startsWith("move-object") && move.registerA == parsed) parsed = move.registerB
            }
            val registers = launcher.implementation!!.registerCount
            val first = registers - launcher.parameterTypes.size
            assertEquals("$where: the link is the eighth parameter", first + 7, parsed)
            assertEquals("Ljava/lang/String;", launcher.parameterTypes[7].toString())
            assertEquals("Landroid/content/Context;", launcher.parameterTypes[0].toString())

            val context = PatchContexts.of(ExtensionDex.classes() + classes)
            openLinksExternallyPatch.execute(context)

            val mutable = context.mutableClassDefBy(launcher.definingClass).methods.single { it.isLauncher() }
            val patched = mutable.instructions()
            assertEquals("$where: six instructions added", stock.size + 6, patched.size)
            assertEquals("$where: no new registers", registers, mutable.implementation!!.registerCount)
            assertEquals(
                "$where: hook shape",
                listOf(Opcode.MOVE_OBJECT_FROM16, Opcode.MOVE_OBJECT_FROM16, Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT,
                    Opcode.IF_EQZ, Opcode.RETURN_VOID),
                patched.take(6).map { it.opcode },
            )
            assertEquals("$where: the context into v0", listOf(0, first), (patched[0] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
            assertEquals("$where: the link into v1", listOf(1, parsed), (patched[1] as TwoRegisterInstruction).let { listOf(it.registerA, it.registerB) })
            val call = patched[2] as FiveRegisterInstruction
            assertEquals(OPEN_LINK, (call as ReferenceInstruction).reference.toString())
            assertEquals(listOf(0, 1), listOf(call.registerC, call.registerD).take(call.registerCount))
            assertEquals(2, call.registerCount)
            assertEquals(0, (patched[3] as OneRegisterInstruction).registerA)
            assertEquals(0, (patched[4] as OneRegisterInstruction).registerA)
            assertEquals("$where: a link that stays goes on to the launcher's own first instruction", 6, patched.target(4))
            assertEquals("$where: the launcher after the hook is the stock one",
                stock.map { it.opcode }, patched.drop(6).map { it.opcode })
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
            val classes = launcherClasses(build)
            val launcher = classes.flatMap { it.methods }.single { it.isLauncher() }
            val stock = launcher.instructions()
            val parse = stock.indexOfFirst { it.method()?.let { m -> m.definingClass == "Ljava/net/URI;" && m.name == "<init>" } == true }
            val parsed = (stock[parse] as FiveRegisterInstruction).registerD
            val first = launcher.implementation!!.registerCount - launcher.parameterTypes.size
            val moveAt = (0 until parse).single { (stock[it] as? TwoRegisterInstruction)?.registerA == parsed }
            val cases = listOf(
                // The session parameter in place of the link.
                "session" to "parses parameter 2, a Lcom/instagram/common/session/UserSession;",
                // A local that holds the context, followed back through the launcher's own copy of it.
                "context copy" to "parses parameter 0, a Landroid/content/Context;",
                "made string" to "runs const-string",
                "no parse" to "never parses a link",
            )
            for ((label, expected) in cases) {
                BrowserLauncherFingerprint.clearMatch()
                val context = PatchContexts.of(ExtensionDex.classes() + classes)
                val mutable = context.mutableClassDefBy(launcher.definingClass).methods.single { it.isLauncher() }
                when (label) {
                    "session" -> mutable.replaceInstruction(moveAt, "move-object/from16 v$parsed, v${first + 2}")
                    "context copy" -> {
                        val copy = (0 until moveAt).single { stock[it].opcode == Opcode.MOVE_OBJECT && (stock[it] as TwoRegisterInstruction).registerB == first }
                        mutable.replaceInstruction(moveAt, "move-object/from16 v$parsed, v${(stock[copy] as TwoRegisterInstruction).registerA}")
                    }
                    "made string" -> mutable.addInstructions(parse, "const-string v$parsed, \"https://example.org/\"")
                    "no parse" -> mutable.replaceInstruction(parse, "invoke-direct { v${(stock[parse] as FiveRegisterInstruction).registerC}, v$parsed }, Ljava/net/URL;-><init>(Ljava/lang/String;)V")
                }
                val error = assertThrows("$label: refused", PatchException::class.java) { openLinksExternallyPatch.execute(context) }
                    .message.orEmpty()
                assertTrue("$label: $error", error.contains(expected))
            }
        }
    }

    private fun launcherClasses(build: File): List<ClassDef> =
        FixtureDex.classesWhere(build, { dex -> LAUNCHER_MESSAGE in dex.stringSection }) { it.isLauncher() }

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
