package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
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
        assertEquals(25, patches.size)
        assertEquals(25, patches.map { it.name }.toSet().size)
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

    // Mirrors the drawer case of Messenger 580's merged click listener: the row lands in a high register.
    private val folderClick = """
        move-object/from16 v3, p0
        iget-object v1, v3, LX/Jwp;->A00:Ljava/lang/Object;
        check-cast v1, LX/HRn;
        iget-object v0, v3, LX/Jwp;->A01:Ljava/lang/Object;
        move-object/from16 v16, v0
        check-cast v16, LX/HRf;
        iget-object v5, v3, LX/Jwp;->A02:Ljava/lang/Object;
        const/4 v7, 0x1
        const-string v1, "$DRAWER_FOLDER_SELECTED"
        move-object/from16 v2, v16
        iget-object v2, v2, LX/HRf;->A03:Ljava/lang/Object;
        return-void
    """.trimIndent()

    private fun folderClickMethod(body: String = folderClick) =
        fixtureMethod("LX/Jwp;->onClick(Landroid/view/View;)V", body, registers = 20)

    @Test fun drawerFolderClickReturnsForTheHushRowAndRecastsEveryOtherRow() {
        val method = folderClickMethod()
        val original = method.implementation!!.instructions.toList()
        method.injectMenuFolderClick("LX/HRf;")
        val code = method.implementation!!.instructions.toList()
        assertEquals(original.take(6), code.take(6))
        val call = code[6] as RegisterRangeInstruction
        assertEquals(16, call.startRegister)
        assertEquals(1, call.registerCount)
        assertEquals("$SETTINGS->drawerFolderClicked(Ljava/lang/Object;)Ljava/lang/Object;", (call as ReferenceInstruction).reference.toString())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[7].opcode)
        assertEquals(16, (code[7] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[8].opcode)
        assertEquals(Opcode.RETURN_VOID, code[9].opcode)
        // Any other row jumps to a fresh cast so Messenger's own field reads still verify.
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        assertEquals(addresses[10], addresses[8] + (code[8] as OffsetInstruction).codeOffset)
        assertEquals(Opcode.CHECK_CAST, code[10].opcode)
        assertEquals("LX/HRf;", ((code[10] as ReferenceInstruction).reference as TypeReference).type)
        assertEquals(16, (code[10] as OneRegisterInstruction).registerA)
        assertEquals(original.drop(6), code.drop(11))
    }

    @Test fun drawerFolderClickRejectsAMissingMarkerOrAnUnclearRowCast() {
        for (body in listOf(
            folderClick.replace(DRAWER_FOLDER_SELECTED, "HomeDrawerFragmentBase.somethingElse"),
            folderClick.replace("check-cast v16, LX/HRf;", "check-cast v16, LX/HRg;"),
            folderClick.replace("check-cast v1, LX/HRn;", "check-cast v1, LX/HRf;"),
            folderClick.replace("const/4 v7, 0x1", "const/4 v7, 0x1\n" + "nop\n".repeat(12)),
            folderClick.replace("return-void", "const-string v1, \"$DRAWER_FOLDER_SELECTED\"\nreturn-void"),
        )) {
            assertFailsWith<PatchException> { folderClickMethod(body).injectMenuFolderClick("LX/HRf;") }
        }
    }

    @Test fun folderRowTypeComesFromTheSettingsBuilderAlone() {
        val id = "LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;"
        assertEquals("LX/HRf;", fixtureMethod(id, "new-instance v1, LX/HRf;\nconst/4 v0, 0x0\nreturn-object v0").menuFolderItemType())
        assertFailsWith<PatchException> {
            fixtureMethod(id, "new-instance v1, LX/HRf;\nnew-instance v2, LX/HRg;\nconst/4 v0, 0x0\nreturn-object v0").menuFolderItemType()
        }
        assertFailsWith<PatchException> { fixtureMethod(id, "const/4 v0, 0x0\nreturn-object v0").menuFolderItemType() }
    }

    @Test fun keyboardTabFilterReplacesTheOnlyExitAndKeepsItsBranches() {
        val body = "if-eqz v2, :done\nconst/4 v1, 0x0\n:done\nreturn-object v0"
        val method = method("Lcom/facebook/messaging/msys/thread/composer/configuration/xapp/BaseXappComposerConfigurationFactory;",
            "A0P", 8, IMMUTABLE_LIST, body)
        method.injectKeyboardTabs()
        val code = method.implementation!!.instructions.toList()
        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        // The early branch now lands on the filter call that replaced the original return.
        val branchTarget = code[addresses.indexOf((code[0] as OffsetInstruction).codeOffset)]
        assertEquals("$SETTINGS->filterKeyboardTabs(Ljava/util/List;)Ljava/util/List;", (branchTarget as ReferenceInstruction).reference.toString())
        assertEquals(1, (code[3] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[4].opcode)
        assertEquals(0, (code[6] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.RETURN_OBJECT, code.last().opcode)
        assertEquals(0, (code.last() as OneRegisterInstruction).registerA)
        assertEquals(addresses[code.size - 1], addresses[4] + (code[4] as OffsetInstruction).codeOffset)
        assertFailsWith<PatchException> {
            method("LX/Fixture;", "A0P", 8, IMMUTABLE_LIST, "if-eqz v2, :other\nreturn-object v0\n:other\nreturn-object v1").injectKeyboardTabs()
        }
        assertFailsWith<PatchException> { method("LX/Fixture;", "A0P", 1, IMMUTABLE_LIST, "return-object p0").injectKeyboardTabs() }
    }

    @Test fun encryptedTypingFlagIsFilteredBeforeTheMailboxCallReadsIt() {
        val id = "LX/8eb;->A0I(Ljava/lang/String;Z)LX/325;"
        val method = fixtureMethod(id, "const-string v0, \"$TYPING_MAILBOX_CALL\"\nconst/4 v0, 0x0\nreturn-object v0", registers = 13)
        val original = method.implementation!!.instructions.toList()
        method.injectOutgoingTyping()
        val code = method.implementation!!.instructions.toList()
        assertEquals("$SETTINGS->outgoingTyping(Z)Z", (code[0] as ReferenceInstruction).reference.toString())
        assertEquals(12, (code[0] as com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction).registerC)
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(12, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(original, code.drop(2))
        assertFailsWith<PatchException> { fixtureMethod(id, "const/4 v0, 0x0\nreturn-object v0", registers = 20).injectOutgoingTyping() }
        assertFailsWith<PatchException> {
            fixtureMethod("LX/8eb;->A0I(Ljava/lang/String;)LX/325;", "const/4 v0, 0x0\nreturn-object v0").injectOutgoingTyping()
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
