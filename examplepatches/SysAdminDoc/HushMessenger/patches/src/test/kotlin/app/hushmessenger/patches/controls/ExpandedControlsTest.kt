package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patcher.patch.Patch
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
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

    // Descriptions name the settings page, since "Long-press Messenger" (#27) read as the title inside the app.
    @Test fun settingsDirectionsNameTheSettingsPage() {
        val patches = Class.forName("app.hushmessenger.patches.controls.MessengerControlsPatchKt").methods
            .filter { it.name.startsWith("get") && it.returnType == BytecodePatch::class.java }
            .map { it.invoke(null) as BytecodePatch }.filter { it.name != null }
        val directed = patches.filter { "HushMessenger settings > Controls" in it.description.orEmpty() }
        assertEquals(ExpectedTotals.DIRECTED_CONTROLS, directed.size)
        for (patch in directed) {
            assertTrue("Turn it on in HushMessenger settings > Controls." in patch.description!!, "${patch.name}")
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

    @Test fun compatReportRefusesEveryPluginGateThePatchRefuses() {
        // CompatReport checks the gates' shape where it reads their sentinel, so a refused gate fails the profile there.
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
        fun takenBy(text: String): Pair<Boolean, Boolean> {
            val gate = method("Lfixture/Gate;", "gate", 8, "Z", text)
            return runCatching { gate.validatePluginGate() }.isSuccess to CompatMirror.pluginGate(gate)
        }
        assertEquals(true to true, takenBy(body))
        for (changed in listOf(
            body.replace("if-eq", "if-ne"),
            body.replace("return v5", "return v6"),
            body.replace("v5", "v6"),
            body.replace("iget-object v1", "const/4 v6, 0x0\niget-object v1"),
            body.replace("iget-object v1", "const-wide/16 v4, 0x0\niget-object v1"),
            body.replace("v6, 0x1", "v6, 0x0").replace("v5, 0x0", "v5, 0x1"),
            body.replace("iget-object v1, p0, Lfixture/Gate;->cache", "iget-object v1, p0, Lfixture/Gate;->other"),
            body.replace("iget-object v0, p0", "iget-object v2, p0"),
        )) assertEquals(false to false, takenBy(changed), changed)

        // 584.1 reuses the false register in a systrace handler that only rethrows; one that can reach a return can't.
        val handled = body.replace("iget-object v1", "goto :check\nmove-exception v5\nthrow v5\n:check\niget-object v1")
        assertEquals(true to true, takenBy(handled))
        for (changed in listOf(
            handled.replace("throw v5", "throw v1"),
            handled.replace("throw v5", "return v5"),
            handled.replace("throw v5", "const/4 v5, 0x1\nthrow v5"),
            handled.replace("throw v5", "if-eqz v5, :disabled\nthrow v5"),
        )) assertEquals(false to false, takenBy(changed), changed)
    }

    @Test fun rethrowOnlyHandlersAreTheOnlyWritesTheGateCheckSkips() {
        val handler = """
            const/4 v1, 0x0
            return v1
            :handler
            move-exception v5
            invoke-static {}, LX/0Ap;->A00()V
            throw v5
        """.trimIndent()
        fun skipped(text: String, tries: Boolean = false): Pair<Set<Int>, Set<Int>> {
            val code = method("Lfixture/Gate;", "gate", 8, "Z", text).implementation!!.instructions.toList()
            val start = code.take(2).sumOf { it.codeUnits }
            val blocks = if (tries) listOf(ImmutableTryBlock(start, code[2].codeUnits + code[3].codeUnits,
                listOf(ImmutableExceptionHandler(null, 0)))) else emptyList()
            return rethrowOnlyWrites(code, blocks) to CompatMirror.rethrowOnlyWrites(code, blocks)
        }
        assertEquals(setOf(2) to setOf(2), skipped(handler))
        for (changed in listOf(
            handler.replace("throw v5", "throw v1"),
            handler.replace("throw v5", "return v5\nthrow v5"),
            handler.replace("invoke-static {}, LX/0Ap;->A00()V", "if-eqz v5, :handler"),
            handler.replace("const/4 v1", ":out\nconst/4 v1").replace("invoke-static {}, LX/0Ap;->A00()V", "goto :out"),
            handler.replace("invoke-static {}, LX/0Ap;->A00()V", "const/4 v5, 0x0"),
        )) assertEquals(emptySet<Int>() to emptySet(), skipped(changed), changed)
        assertEquals(emptySet<Int>() to emptySet(), skipped(handler, tries = true), "a handler inside a try block can be caught again")
    }

    // Modelled on the drawer case of Messenger's merged click listener, where the row lands in a high register.
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

    @Test fun a5841ClickWithAnAlreadyTypedRowFieldNeedsNoCast() {
        val method = fixtureMethod("LX/Jwp;->onClick(Landroid/view/View;)V", """
            move-object/from16 v3, p0
            iget-object v0, v3, LX/Jwp;->A01:LX/HRf;
            move-object/from16 v16, v0
            iget-object v0, v3, LX/Jwp;->A02:Ljava/lang/Object;
            const-string v1, "$DRAWER_FOLDER_SELECTED"
            return-void
        """.trimIndent(), registers = 20)
        method.injectMenuFolderClick("LX/HRf;")
        val code = method.implementation!!.instructions.toList()
        val call = code.filterIsInstance<RegisterRangeInstruction>().single {
            (it as ReferenceInstruction).reference.toString() == "$SETTINGS->drawerFolderClicked(Ljava/lang/Object;)Ljava/lang/Object;"
        }
        assertEquals(16, call.startRegister)
        assertTrue(code.any { instruction ->
            instruction.opcode == Opcode.CHECK_CAST && (instruction as OneRegisterInstruction).registerA == 16 &&
                ((instruction as ReferenceInstruction).reference as TypeReference).type == "LX/HRf;"
        })
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
        // Messenger builds the QR code row in the same method, from the same row class and its own folder key.
        val both = builder(folderRow("LX/HRf;", settingsKey) + folderRow("LX/HRf;", qrKey))
        assertEquals("LX/HRf;", both.menuFolderItemType())
        assertEquals(2, both.settingsRowCall())
        for (changed in listOf(
            // 582's main family built each row's icon in place, straight into the constructor's icon argument (v3).
            // 583 creates no row icons in the builder, so one made there is refused.
            "new-instance v3, LX/KGb;\n" + folderRow("LX/HRf;", settingsKey),
            folderRow("LX/HRf;", settingsKey) + "new-instance v2, LX/HRg;\n",
            "new-instance v2, LX/KGb;\n" + folderRow("LX/HRf;", settingsKey),
            folderRow("LX/HRf;", settingsKey) + folderRow("LX/HRf;", settingsKey),
            folderRow("LX/HRf;", qrKey),
            "new-instance v1, LX/HRf;\n",
            "",
        )) assertFailsWith<PatchException> { builder(changed).menuFolderItemType() }
    }

    @Test fun anIconBuiltInPlaceBeforeThe5841SettingsRowIsAccepted() {
        val id = "LX/HFb;->Ax1(LX/0MG;)Ljava/util/ArrayList;"
        val icon = "sget-object v1, LX/1jj;->A66:LX/1jj;\nsget-object v3, LX/UD9;->A00:LX/UD9;\n" +
            "new-instance v2, LX/KGb;\ninvoke-direct {v2, v1, v3}, LX/KGb;-><init>(LX/1jj;LX/UD9;)V\n" +
            "move-object v3, v2\n"
        val method = fixtureMethod(id, icon + folderRow("LX/HRf;", settingsKey) + "const/4 v0, 0x0\nreturn-object v0", 10)
        assertEquals("LX/HRf;", method.menuFolderItemType())
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

    @Test fun originalPhotoPicksTheJavaTranscoderAndSizesItsDecode() {
        val config = fixtureMethod(TRANSCODE_CONFIG, TRANSCODE_CONFIG_BODY, registers = 16)
        val stockConfig = config.implementation!!.instructions.toList()
        config.injectOriginalPhoto()
        val configCode = config.implementation!!.instructions.toList()
        val pick = configCode[configCode.size - 2] as RegisterRangeInstruction
        assertEquals("Lapp/hushmessenger/extension/OriginalPhoto;->transcodeConfig(Ljava/util/Map;)V", (pick as ReferenceInstruction).reference.toString())
        assertEquals(2, pick.startRegister)
        assertEquals(1, pick.registerCount)
        assertEquals(Opcode.RETURN_OBJECT, configCode.last().opcode)
        assertEquals(2, (configCode.last() as OneRegisterInstruction).registerA)
        assertEquals(stockConfig.dropLast(1), configCode.dropLast(2))
        // The branch that skipped the put still lands on the call, which took over the return's place.
        assertTrue(configCode.size - 2 in config.jumpTargets())

        val decode = fixtureMethod(DECODE_BITMAP, DECODE_BITMAP_BODY, registers = 22)
        val stockDecode = decode.implementation!!.instructions.toList()
        decode.injectOriginalPhoto()
        val decodeCode = decode.implementation!!.instructions.toList()
        // p1 to p5, the URL and the two limits, are v17 to v21; each new limit lands back in its own pair.
        for ((at, name) in listOf(0 to "decodeWidth", 2 to "decodeHeight")) {
            val call = decodeCode[at] as RegisterRangeInstruction
            assertEquals("Lapp/hushmessenger/extension/OriginalPhoto;->$name(Ljava/lang/String;DD)D", (call as ReferenceInstruction).reference.toString())
            assertEquals(17, call.startRegister)
            assertEquals(5, call.registerCount)
            assertEquals(Opcode.MOVE_RESULT_WIDE, decodeCode[at + 1].opcode)
            assertEquals(if (at == 0) 18 else 20, (decodeCode[at + 1] as OneRegisterInstruction).registerA)
        }
        val swapped = decodeCode[5] as RegisterRangeInstruction
        assertEquals("Lapp/hushmessenger/extension/OriginalPhoto;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;",
            (swapped as ReferenceInstruction).reference.toString())
        assertEquals(11, swapped.startRegister)
        assertEquals(1, swapped.registerCount)
        assertEquals(stockDecode.filterIndexed { i, _ -> i != 1 }, decodeCode.drop(4).filterIndexed { i, _ -> i != 1 })

        val customScale = fixtureMethod(DECODE_BITMAP,
            DECODE_BITMAP_BODY.replace("Landroid/graphics/Bitmap;->createScaledBitmap", "LX/UKC;->A0G"), 22)
        customScale.injectOriginalPhoto()
        assertTrue(customScale.implementation!!.instructions.any {
            (it as? ReferenceInstruction)?.reference?.toString() ==
                "Lapp/hushmessenger/extension/OriginalPhoto;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;"
        })

        val refused = listOf(
            TRANSCODE_CONFIG to TRANSCODE_CONFIG_BODY.replace("ENABLE_UIT_TRANSCODING", "ENABLE_UIT_V2"),
            TRANSCODE_CONFIG to TRANSCODE_CONFIG_BODY.replace("return-object v2", "if-eqz v1, :again\nreturn-object v2\n:again\nreturn-object v2"),
            DECODE_BITMAP to DECODE_BITMAP_BODY.replace("move-result-object v1\nmove-wide",
                "move-result-object v1\ninvoke-static {v11}, Landroid/graphics/BitmapFactory;->decodeFile(Ljava/lang/String;)Landroid/graphics/Bitmap;\nmove-wide"),
            DECODE_BITMAP to DECODE_BITMAP_BODY.replace(
                "invoke-static {v1, v2, v4, v5}, Landroid/graphics/Bitmap;->createScaledBitmap(Landroid/graphics/Bitmap;IIZ)Landroid/graphics/Bitmap;",
                "invoke-static {v1}, LX/Fixture;->scale(Landroid/graphics/Bitmap;)Landroid/graphics/Bitmap;"),
            DECODE_BITMAP to ":top\n" + DECODE_BITMAP_BODY.replace("return-object v1", "if-eqz v1, :top\nreturn-object v1"),
        )
        for ((id, body) in refused) assertFailsWith<PatchException>(body) { fixtureMethod(id, body, registers = 22).injectOriginalPhoto() }
        assertFailsWith<PatchException> {
            fixtureMethod(DECODE_BITMAP, DECODE_BITMAP_BODY, registers = 22, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value).injectOriginalPhoto()
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
