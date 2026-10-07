package app.hushmessenger.patches.controls

import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
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
        assertEquals(ExpectedTotals.CONTROLS, patches.size)
        assertEquals(ExpectedTotals.CONTROLS, patches.map { it.name }.toSet().size)
        val shared = patches.map { it.dependencies.filterIsInstance<BytecodePatch>().single() }.toSet()
        assertEquals(1, shared.size)
        assertNull(shared.single().name)
        fun descendants(patch: Patch<*>): Set<Patch<*>> = patch.dependencies.flatMap { setOf(it) + descendants(it) }.toSet()
        for (patch in patches) {
            assertTrue(descendants(patch).all { it.name == null }, "${patch.name} implicitly selects a visible feature")
        }
    }

    // #27: "Long-press Messenger" read as the Messenger title inside the app, where nothing happens.
    @Test fun settingsDirectionsNameTheHomeScreenIcon() {
        val patches = Class.forName("app.hushmessenger.patches.controls.MessengerControlsPatchKt").methods
            .filter { it.name.startsWith("get") && it.returnType == BytecodePatch::class.java }
            .map { it.invoke(null) as BytecodePatch }.filter { it.name != null }
        val directed = patches.filter { "Patch controls" in it.description.orEmpty() }
        assertEquals(ExpectedTotals.DIRECTED_CONTROLS, directed.size)
        for (patch in directed) {
            assertTrue("Long-press Messenger's home screen icon > Patch controls." in patch.description!!, "${patch.name}")
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

    /**
     * Runs a gate's straight-line code against one composite's cache field. The switch is what Settings.enabled answers;
     * static fields read as their own names, so Messenger's markers compare by identity like the real ones.
     */
    private class GateRun(val method: MutableMethod) {
        val fields = mutableMapOf<String, Any?>()
        var switchOn = false
        var switchReads = 0

        fun call(): Boolean {
            val code = method.implementation!!.instructions.toList()
            val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
            val registers = arrayOfNulls<Any>(method.implementation!!.registerCount)
            var result: Any? = null
            var i = 0
            fun jump(instruction: Instruction) { i = addresses.indexOf(addresses[i] + (instruction as OffsetInstruction).codeOffset) }
            while (true) {
                val instruction = code[i]
                val a = (instruction as? OneRegisterInstruction)?.registerA
                val reference = (instruction as? ReferenceInstruction)?.reference?.toString()
                when (instruction.opcode) {
                    Opcode.IGET_OBJECT -> registers[a!!] = fields[reference]
                    Opcode.IPUT_OBJECT -> fields[reference!!] = registers[a!!]
                    Opcode.SGET_OBJECT -> registers[a!!] = reference!!.intern()
                    Opcode.CONST_STRING -> registers[a!!] = (instruction as ReferenceInstruction).reference.toString()
                    Opcode.CONST_4 -> registers[a!!] = (instruction as NarrowLiteralInstruction).narrowLiteral
                    Opcode.INVOKE_STATIC -> {
                        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", reference)
                        switchReads++
                        result = if (switchOn) 1 else 0
                    }
                    Opcode.MOVE_RESULT -> registers[a!!] = result
                    Opcode.IF_EQZ, Opcode.IF_NEZ -> {
                        val zero = registers[a!!].let { it == null || it == 0 }
                        if (zero == (instruction.opcode == Opcode.IF_EQZ)) { jump(instruction); continue }
                    }
                    Opcode.IF_EQ -> {
                        val two = instruction as TwoRegisterInstruction
                        if (registers[two.registerA] === registers[two.registerB]) { jump(instruction); continue }
                    }
                    Opcode.RETURN -> return registers[a!!] == 1
                    else -> fail("unexpected ${instruction.opcode}")
                }
                i++
            }
        }
    }

    /** Messenger's shape: decide once, cache the marker in the composite, then answer from the cache. */
    private val cachingGate = """
        iget-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
        const/4 v6, 0x1
        const/4 v5, 0x0
        if-nez v0, :cached
        sget-object v0, LX/1dj;->A02:Ljava/lang/Object;
        iput-object v0, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
        :cached
        iget-object v1, p0, Lfixture/Gate;->cache:Ljava/lang/Object;
        sget-object v0, LX/1dj;->A03:Ljava/lang/Object;
        if-eq v1, v0, :disabled
        return v6
        :disabled
        return v5
    """.trimIndent()

    // #30: the inbox lists its suppliers' keys and registers their listeners on first use and removes them in later
    // calls, so a gate that changed its answer mid-composite left suggestion work registered with nothing to remove it.
    @Test fun pluginGateKeepsOneAnswerForTheLifeOfItsComposite() {
        val hidden = GateRun(method("Lfixture/Gate;", "gate", 8, "Z", cachingGate).apply { injectPluginGate("people") })
        hidden.switchOn = true
        assertFalse(hidden.call())
        assertEquals("LX/1dj;->A03:Ljava/lang/Object;", hidden.fields["Lfixture/Gate;->cache:Ljava/lang/Object;"])
        hidden.switchOn = false
        assertFalse(hidden.call(), "turning the switch off reopened a composite that already left the plugin out")
        assertEquals(1, hidden.switchReads)

        val shown = GateRun(method("Lfixture/Gate;", "gate", 8, "Z", cachingGate).apply { injectPluginGate("people") })
        assertTrue(shown.call())
        assertEquals("LX/1dj;->A02:Ljava/lang/Object;", shown.fields["Lfixture/Gate;->cache:Ljava/lang/Object;"])
        shown.switchOn = true
        assertTrue(shown.call(), "turning the switch on removed a plugin the composite had already started")

        // The next composite reads the switch again.
        val next = GateRun(method("Lfixture/Gate;", "gate", 8, "Z", cachingGate).apply { injectPluginGate("people") })
        next.switchOn = true
        assertFalse(next.call())
    }

    @Test fun pluginGateLatchRejectsAChangedGateBeforeEditing() {
        val changed = method("Lfixture/Gate;", "gate", 8, "Z", cachingGate.replace("if-eq", "if-ne"))
        val original = changed.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { changed.injectPluginGate("people") }
        assertEquals(original, changed.implementation!!.instructions.toList())
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

    @Test fun messenger581AdExitsEachKeepTheirOwnResultRegister() {
        val body = "goto/16 :first_exit\n" + "nop\n".repeat(1449) + ":first_exit\nreturn-object v7\n" +
            "nop\n".repeat(8) + "return-object v2\n" + "nop\n".repeat(3)
        activeProfile = PROFILE_346213494
        try {
            val method = method("LX/2LJ;", "D3q", 24, IMMUTABLE_LIST, body)
            method.injectAdFilter()
            val code = method.implementation!!.instructions
            val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
            val filters = code.filter { (it as? ReferenceInstruction)?.reference.toString().contains("->filterInboxAds(") }
            assertEquals(listOf(7, 2), filters.map { (it as FiveRegisterInstruction).registerC })
            val kept = code.indices.filter { code[it].opcode == Opcode.IF_EQZ }.map { index ->
                code[addresses.indexOf(addresses[index] + (code[index] as OffsetInstruction).codeOffset)]
            }
            assertEquals(listOf(7, 2), kept.map { (it as com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction).registerA })
            for (changed in listOf(body.replace("return-object v2", "return-object v7"), body.replace("return-object v7", "return-object v5"))) {
                assertFailsWith<PatchException> { method("LX/2LJ;", "D3q", 24, IMMUTABLE_LIST, changed).injectAdFilter() }
            }
        } finally {
            activeProfile = BASE_PROFILE
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

    private fun folderRow(type: String, key: String) = key + "\nnew-instance v0, $type\ninvoke-direct/range {v0 .. v8}, $type-><init>(" +
        "Landroid/content/Context;LX/HHA;LX/IXL;$DRAWER_KEY$DRAWER_METADATA" + "Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;)V\n"
    private val settingsKey = "sget-object v4, $SETTINGS_KEY->A00:$SETTINGS_KEY"
    private val qrKey = "new-instance v4, ${DRAWER_MODEL}FolderNameDrawerFolderKey;"

    @Test fun folderRowTypeComesFromTheSettingsRowAlone() {
        val id = "LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;"
        fun builder(rows: String) = fixtureMethod(id, rows + "const/4 v0, 0x0\nreturn-object v0", 10)
        assertEquals("LX/HRf;", builder(folderRow("LX/HRf;", settingsKey)).menuFolderItemType())
        // 581 builds the QR code row in the same method, from the same row class and its own folder key.
        val both = builder(folderRow("LX/HRf;", settingsKey) + folderRow("LX/HRf;", qrKey))
        assertEquals("LX/HRf;", both.menuFolderItemType())
        assertEquals(2, both.settingsRowCall())
        for (changed in listOf(
            folderRow("LX/HRf;", settingsKey) + "new-instance v2, LX/HRg;\n",
            folderRow("LX/HRf;", settingsKey) + folderRow("LX/HRf;", settingsKey),
            folderRow("LX/HRf;", qrKey),
            "new-instance v1, LX/HRf;\n",
            "",
        )) assertFailsWith<PatchException> { builder(changed).menuFolderItemType() }
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

    @Test fun originalPhotoHooksReturnTheExtensionsResultOrRunTheStockTranscode() {
        for ((id, registers) in listOf(TRANSCODE_IMAGE to 22, TRANSCODE_IMAGE_ASYNC to 19)) {
            val sync = id == TRANSCODE_IMAGE
            val method = fixtureMethod(id, if (sync) "const/4 v0, 0x0\nreturn-object v0" else "return-void", registers = registers)
            val original = method.implementation!!.instructions.toList()
            method.injectOriginalPhoto()
            val code = method.implementation!!.instructions.toList()
            val call = code[0] as RegisterRangeInstruction
            assertEquals(if (sync) "Lapp/hushmessenger/extension/OriginalPhoto;->sync(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;)[B"
                else "Lapp/hushmessenger/extension/OriginalPhoto;->async(Ljava/lang/String;DDLjava/lang/String;Ljava/util/Map;Ljava/lang/Object;)Z",
                (call as ReferenceInstruction).reference.toString())
            // p1, the URL, is the register after `this`; the range runs through the extras map, or the callback for async.
            val parameterWords = if (sync) 8 else 9
            assertEquals(registers - parameterWords + 1, call.startRegister)
            assertEquals(parameterWords - 1, call.registerCount)
            assertEquals(if (sync) Opcode.MOVE_RESULT_OBJECT else Opcode.MOVE_RESULT, code[1].opcode)
            assertEquals(Opcode.IF_EQZ, code[2].opcode)
            assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
            assertEquals(0, (code[2] as OneRegisterInstruction).registerA)
            assertEquals(if (sync) Opcode.RETURN_OBJECT else Opcode.RETURN_VOID, code[3].opcode)
            // A declined photo branches to the untouched stock body.
            assertEquals(code[2].codeUnits + code[3].codeUnits, (code[2] as OffsetInstruction).codeOffset)
            assertEquals(original, code.drop(4))
        }
        assertFailsWith<PatchException> {
            fixtureMethod(TRANSCODE_IMAGE, "const/4 v0, 0x0\nreturn-object v0", registers = 22,
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value).injectOriginalPhoto()
        }
        assertFailsWith<PatchException> { fixtureMethod(TRANSCODE_IMAGE, "return-void", registers = 8).injectOriginalPhoto() }
        assertFailsWith<PatchException> {
            fixtureMethod(TRANSCODE_IMAGE.replace("transcodeImage", "transcodeVideo"), "return-void", registers = 22).injectOriginalPhoto()
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
