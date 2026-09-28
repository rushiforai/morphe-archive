package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.*

class ExpandedControlsTest {
    private fun method(owner: String, name: String, registers: Int, returnType: String, body: String) = MutableMethod(
        ImmutableMethod(owner, name, emptyList(), returnType, AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null)),
    ).apply { addInstructionsWithLabels(0, body) }

    @Test fun catalogExposesTwentyIndependentControlsWithOneSharedExtension() {
        val patches = Class.forName("app.hushmessenger.patches.controls.MessengerControlsPatchKt").methods
            .filter { it.name.startsWith("get") && it.returnType == BytecodePatch::class.java }
            .map { it.invoke(null) as BytecodePatch }.filter { it.name != null }
        assertEquals(20, patches.size)
        assertEquals(20, patches.map { it.name }.toSet().size)
        val shared = patches.map { it.dependencies.filterIsInstance<BytecodePatch>().single() }.toSet()
        assertEquals(1, shared.size)
        assertNull(shared.single().name)
        fun descendants(patch: Patch<*>): Set<Patch<*>> = patch.dependencies.flatMap { setOf(it) + descendants(it) }.toSet()
        for (patch in patches) {
            assertTrue(descendants(patch).all { it.name == null }, "${patch.name} implicitly selects a visible feature")
        }
    }

    @Test fun selectingPeopleDoesNotRequireAnyUnselectedHook() {
        val first = method("LX/1pm;", "A0C", 8, "Z", "const/4 v0, 0x1\nreturn v0")
        val second = method("LX/2Wl;", "A04", 8, "Z", "const/4 v0, 0x1\nreturn v0")
        val matches = mapOf("people" to listOf(first, second))
        validateControls(matches, setOf("people"))
        assertFailsWith<PatchException> { validateControls(matches, setOf("people", "moments")) }
        assertFailsWith<PatchException> { validateControls(mapOf("people" to listOf(first, first)), setOf("people")) }
        assertFailsWith<PatchException> { validateControls(mapOf("people" to listOf(first)), setOf("people")) }
    }

    @Test fun genericGateKeepsTheOriginalFirstInstructionOnTheDisabledBranch() {
        val method = method("Lfixture/Gate;", "gate", 2, "Z", "const/4 v0, 0x1\nreturn v0")
        val original = method.implementation!!.instructions.toList()
        method.injectFeatureSwitch("people")
        val code = method.implementation!!.instructions
        val target = code.take(3).sumOf { it.codeUnits } + (code[3] as OffsetInstruction).codeOffset
        assertEquals(code.take(6).sumOf { it.codeUnits }, target)
        assertEquals(original, code.drop(6))
        assertEquals("people", (code[0] as ReferenceInstruction).reference.toString())
        assertFailsWith<PatchException> {
            method("Lfixture/Gate;", "gate", 1, "Z", "return p0").injectFeatureSwitch("people")
        }
    }

    @Test fun aChangedPluginBranchPolarityIsRejectedBeforeInjection() {
        val body = """
            iget-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
            const/4 v6, 0x1
            const/4 v5, 0x0
            iget-object v1, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
            sget-object v0, LX/1dj;->A03:Ljava/lang/Object;
            if-eq v1, v0, :disabled
            return v6
            :disabled
            return v5
        """.trimIndent()
        method("Lfixture/Gate;", "gate", 8, "Z", body).validatePluginGate()
        assertFailsWith<PatchException> {
            method("Lfixture/Gate;", "gate", 8, "Z", body.replace("if-eq", "if-ne")).validatePluginGate()
        }
        assertFailsWith<PatchException> {
            method("Lfixture/Gate;", "gate", 8, "Z", body.replace("return v5", "return v6")).validatePluginGate()
        }
    }

    @Test fun pluginPolarityConstantsCannotAliasOrBeOverwritten() {
        val body = """
            iget-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
            const/4 v6, 0x1
            const/4 v5, 0x0
            iget-object v1, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
            sget-object v0, LX/1dj;->A03:Ljava/lang/Object;
            if-eq v1, v0, :disabled
            return v6
            :disabled
            return v5
        """.trimIndent()
        for (changed in listOf(
            body.replace("v5", "v6"),
            body.replace("iget-object v1", "const/4 v6, 0x0\niget-object v1"),
            body.replace("iget-object v1", "const-wide/16 v4, 0x0\niget-object v1"),
        )) {
            assertFailsWith<PatchException> {
                method("Lfixture/Gate;", "gate", 8, "Z", changed).validatePluginGate()
            }
        }
    }

    @Test fun adExitReplacementCoversIncomingBranchesAndPreservesTheOriginalResultRegister() {
        val body = "goto/16 :first_exit\n" + "nop\n".repeat(915) + ":first_exit\nreturn-object v5\n" +
            "nop\n".repeat(14) + "return-object v5\n" + "nop\n".repeat(3)
        val method = method("LX/2Wl;", "D2i", 24, IMMUTABLE_LIST, body)
        method.injectAdFilter()
        val code = method.implementation!!.instructions
        val branchAddress = (code[0] as OffsetInstruction).codeOffset
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        val target = code[addresses.indexOf(branchAddress)]
        assertEquals(Opcode.INVOKE_STATIC, target.opcode)
        assertEquals("$SETTINGS->filterInboxAds(Ljava/util/List;)Ljava/util/List;", (target as ReferenceInstruction).reference.toString())
        assertEquals(2, code.count { (it as? ReferenceInstruction)?.reference.toString().contains("->filterInboxAds(") })
        for (index in code.indices.filter { code[it].opcode == Opcode.IF_EQZ }) {
            val returnAddress = addresses[index] + (code[index] as OffsetInstruction).codeOffset
            val returnInstruction = code[addresses.indexOf(returnAddress)]
            assertEquals(Opcode.RETURN_OBJECT, returnInstruction.opcode)
            assertEquals(5, (returnInstruction as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA)
        }
        assertFailsWith<PatchException> {
            method("LX/2Wl;", "D2i", 24, IMMUTABLE_LIST, body.replace("return-object v5", "return-object v6")).injectAdFilter()
        }
    }

    @Test fun featureMetadataIsSpecificAndDuplicateSelectionIsRejected() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(ByteArrayInputStream(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application /></manifest>""".toByteArray(),
        ))
        document.addSettingsEntry()
        document.addFeature("people")
        document.addFeature("moments")
        val metadata = document.getElementsByTagName("meta-data")
        assertEquals(2, metadata.length)
        assertEquals(setOf("hush.feature.people", "hush.feature.moments"), (0 until metadata.length).map {
            (metadata.item(it) as org.w3c.dom.Element).getAttribute("android:name")
        }.toSet())
        assertEquals(1, document.getElementsByTagName("provider").length)
        assertEquals(2, document.getElementsByTagName("activity").length)
        assertFailsWith<PatchException> { document.addFeature("people") }
    }
}
