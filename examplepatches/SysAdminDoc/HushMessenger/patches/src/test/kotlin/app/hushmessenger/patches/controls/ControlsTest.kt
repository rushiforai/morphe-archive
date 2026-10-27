package app.hushmessenger.patches.controls

import app.hushmessenger.patches.CompatMirror
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import java.io.ByteArrayInputStream
import javax.xml.parsers.DocumentBuilderFactory
import kotlin.test.*

private const val SESSION = "Lcom/facebook/auth/usersession/FbUserSession;"

class ControlsTest {
    private fun method(registers: Int = 2, body: String = "const/4 v0, 0x1\nreturn v0", returnType: String = "Z") = MutableMethod(
        ImmutableMethod("Lfixture/Gate;", "gate", emptyList(), returnType, AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null)),
    ).apply { addInstructionsWithLabels(0, body) }

    @Test fun optOutBranchesToTheUnmodifiedOriginalFirstInstruction() {
        val gate = method()
        val original = gate.implementation!!.instructions.toList()
        gate.injectSwitch("$SETTINGS->hideStories()Z", "0x0")
        val code = gate.implementation!!.instructions
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        val targetAddress = code.take(2).sumOf { it.codeUnits } + (code[2] as OffsetInstruction).codeOffset
        assertEquals(code.take(5).sumOf { it.codeUnits }, targetAddress)
        assertEquals(original, code.drop(5))
    }

    @Test fun methodsWithNoScratchLocalFailBeforeChangingParameters() {
        val gate = method(registers = 1, body = "const/4 v0, 0x0\nreturn v0")
        val original = gate.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { gate.injectSwitch("$SETTINGS->hideStories()Z", "0x0") }
        assertEquals(original, gate.implementation!!.instructions.toList())
    }

    /** A bare name would reach the patcher DEX apart from its class, where the catalog check can't match it. */
    @Test fun aSwitchNamesItsWholeSettingsGetter() {
        for (getter in listOf("hideStories", "$SETTINGS->hideStories", "Lapp/hushmessenger/extension/Other;->hideStories()Z")) {
            val gate = method()
            val original = gate.implementation!!.instructions.toList()
            assertFailsWith<PatchException>(getter) { gate.injectSwitch(getter, "0x0") }
            assertEquals(original, gate.implementation!!.instructions.toList())
        }
    }

    @Test fun typingHookRetainsTheOriginalRunnableAndReturnsOnlyWhenEnabled() {
        val runnable = method(body = "return-void", returnType = "V")
        runnable.injectSwitch("$SETTINGS->suppressTyping()Z", "0x0")
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.RETURN_VOID),
            runnable.implementation!!.instructions.map { it.opcode })
    }

    @Test fun missingOrAmbiguousAnchorsRejectTheApk() {
        assertFailsWith<PatchException> { validateControls(emptyMap()) }
        assertFailsWith<PatchException> { validateControls(syntheticHooks.keys.associateWith { listOf(method(), method()) }) }
    }

    @Test fun changedSubtabAndBrowserBodiesFail() {
        assertFailsWith<PatchException> { method().injectSubtabs() }
        assertFailsWith<PatchException> { method().injectBrowserPreference() }
    }

    @Test fun subtabFlagMustBeTheValuePassedToItsSetter() {
        val supplier = "Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;"
        fun subtabs(value: String) = method(registers = 3, returnType = "V", body = """
            iget-object v0, p0, LX/2UL;->A00:$supplier
            iget-object v0, v0, $supplier->A07:LX/21D;
            iget-object v1, v0, LX/21D;->A00:Ljava/util/concurrent/atomic/AtomicBoolean;
            const/4 v0, 0x1
            invoke-virtual {v1, $value}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
            return-void
        """.trimIndent())
        val original = subtabs("v0")
        original.injectSubtabs()
        assertEquals(8, original.implementation!!.instructions.size)
        val changed = subtabs("v2")
        assertFailsWith<PatchException> { changed.injectSubtabs() }
        assertEquals(6, changed.implementation!!.instructions.size)
    }

    @Test fun compatReportRefusesEveryInboxTabsBodyThePatchRefuses() {
        // CompatReport checks the body where it reads the supplier field, so a refused body fails the profile there.
        val supplier = "Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;"
        val body = """
            iget-object v0, p0, LX/2UL;->A00:$supplier
            iget-object v0, v0, $supplier->A07:LX/21D;
            iget-object v1, v0, LX/21D;->A00:Ljava/util/concurrent/atomic/AtomicBoolean;
            const/4 v0, 0x1
            invoke-virtual {v1, v0}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
            return-void
        """.trimIndent()
        fun takenBy(text: String, registers: Int = 3): Pair<Boolean, Boolean> {
            val run = method(registers = registers, returnType = "V", body = text)
            return runCatching { run.validateSubtabs() }.isSuccess to (CompatMirror.subtabsSupplier(run) != null)
        }
        assertEquals(true to true, takenBy(body))
        for ((name, taken) in listOf(
            "the setter's value" to takenBy(body.replace("{v1, v0}", "{v1, v2}")),
            "the value" to takenBy(body.replace("v0, 0x1", "v0, 0x0")),
            "the holder field" to takenBy(body.replace("->A07:", "->A08:")),
            "the flag field" to takenBy(body.replace("LX/21D;->A00:", "LX/21D;->A01:")),
            "the flag's owner" to takenBy(body.replace("LX/21D;->A00:", "LX/21E;->A00:")),
            "the setter" to takenBy(body.replace("->set(Z)V", "->lazySet(Z)V")),
            "the register count" to takenBy(body, registers = 4),
        )) assertEquals(false to false, taken, name)
    }

    @Test fun unsentLabelHookReadsTheRowStraightFromTheWrapperList() {
        messageWrapperFixture().methods.single { it.name == "BWo" }.validateUnsentIndicator()
        // Older releases went through a static helper instead, a shape no supported build has.
        val helper = fixtureMethod("Lfixture/MessageWrapper;->BWo(I)Ljava/lang/String;", """
            invoke-static {p0, p1}, Lfixture/MessageWrapper;->A00(Lfixture/MessageWrapper;I)Lfixture/KKn;
            move-result-object v0
            invoke-interface {v0}, Lfixture/KKn;->BWn()Ljava/lang/String;
            move-result-object v0
            return-object v0
        """.trimIndent(), registers = 3)
        assertFailsWith<PatchException> { helper.validateUnsentIndicator() }
        val otherRegister = fixtureMethod("Lfixture/MessageWrapper;->BWo(I)Ljava/lang/String;", """
            iget-object v0, p0, Lfixture/MessageWrapper;->A00:Ljava/util/List;
            invoke-interface {v0, p1}, Ljava/util/List;->get(I)Ljava/lang/Object;
            move-result-object v0
            check-cast v0, Lfixture/KKn;
            invoke-interface {v0}, Lfixture/KKn;->BWn()Ljava/lang/String;
            move-result-object p1
            return-object p1
        """.trimIndent(), registers = 3)
        assertFailsWith<PatchException> { otherRegister.validateUnsentIndicator() }
    }

    @Test fun unsentFlagHookMustAnswerFromV0OfAnInstanceMethod() {
        messageWrapperFixture().methods.single { it.name == "Btd" }.validateDeltaUnsent()
        fun flag(body: String, registers: Int = 3, flags: Int = AccessFlags.PUBLIC.value) =
            fixtureMethod("Lfixture/MessageWrapper;->Btd(I)Z", body.trimIndent(), registers, flags)
        val stock = """
            invoke-static {p0, p1}, Lfixture/MessageWrapper;->A00(Lfixture/MessageWrapper;I)Lfixture/KKn;
            move-result-object v0
            invoke-interface {v0}, Lfixture/KKn;->Btc()Z
            move-result v0
            return v0
        """
        flag(stock).validateDeltaUnsent()
        val otherRegister = stock.replace("move-result v0", "move-result p1").replace("return v0", "return p1")
        assertFailsWith<PatchException> { flag(otherRegister).validateDeltaUnsent() }
        assertFailsWith<PatchException> { flag(stock, registers = 4).validateDeltaUnsent() }
        val static = stock.replace("{p0, p1}", "{p0, v1}")
        assertFailsWith<PatchException> { flag(static, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value).validateDeltaUnsent() }
    }

    /** 582's three-parameter instance handler and 583's static four-parameter one are refused. */
    @Test fun anOlderRevokeHandlerIsRefused() {
        val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val map = "${SESSION}Ljava/lang/String;Ljava/util/Map;"
        fun revoke(registers: Int, flags: Int = AccessFlags.PUBLIC.value, types: String = "${SESSION}Ljava/lang/String;") = fixtureMethod(
            "Lfixture/Revoke;->A00(Landroid/content/Intent;$types)V", "return-void", registers, flags)
        assertFailsWith<PatchException> { revoke(5).validateKeepUnsent() }
        assertFailsWith<PatchException> { revoke(5, static).validateKeepUnsent() }
        assertFailsWith<PatchException> { revoke(11, static, map).validateKeepUnsent() }
        for (types in listOf("Ljava/lang/String;Ljava/lang/Object;", "Ljava/lang/String;$SESSION"))
            assertFailsWith<PatchException>(types) { revoke(5, types = types).validateKeepUnsent() }
    }

    @Test fun discoveryFindsOnlyTheInstanceRevokeHandler() {
        val static = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value
        val revoke = "const-string v0, \"com.facebook.stella.ipc.messenger.ACTION_REVOKE_MESSAGE\"\nreturn-void"
        fun found(types: String, flags: Int) = mirroredControls(listOf(fixtureClass("Lfixture/Revoke;", listOf(
            fixtureMethod("Lfixture/Revoke;->A00(Landroid/content/Intent;$types)V", revoke, 11, flags))))).getValue("keep_unsent").size
        assertEquals(1, found("${SESSION}Ljava/lang/String;Ljava/util/Map;", AccessFlags.PUBLIC.value))
        assertEquals(0, found("${SESSION}Ljava/lang/String;", AccessFlags.PUBLIC.value))
        assertEquals(0, found("${SESSION}Ljava/lang/String;", static))
        assertEquals(0, found("${SESSION}Ljava/lang/String;Ljava/util/Map;", static))
        assertEquals(0, found("Ljava/lang/String;Ljava/lang/Object;", AccessFlags.PUBLIC.value))
    }

    /** 584 handles the revoke in an instance (Intent, session, String, Map) method, so its Intent is p1. */
    @Test fun theInstanceRevokeHandlerReadsItsIntentFromP1() {
        val map = "${SESSION}Ljava/lang/String;Ljava/util/Map;"
        fun handler(types: String, registers: Int = 11) =
            fixtureMethod("Lfixture/Revoke;->A00(Landroid/content/Intent;$types)V", "return-void", registers, AccessFlags.PUBLIC.value)
        assertEquals(1, handler(map).validateKeepUnsent())
        assertFailsWith<PatchException> { handler("${SESSION}Ljava/lang/String;Ljava/lang/Object;").validateKeepUnsent() }
        assertFailsWith<PatchException> { handler("Ljava/lang/Object;Ljava/lang/String;Ljava/util/Map;").validateKeepUnsent() }
        // p1 lands on v15 with 19 registers and on v16 with 20, where a plain invoke can't reach it.
        handler(map, 19).validateKeepUnsent()
        assertFailsWith<PatchException> { handler(map, 20).validateKeepUnsent() }
        val method = handler(map)
        method.injectKeepUnsent()
        val read = method.implementation!!.instructions.single {
            (it as? ReferenceInstruction)?.reference?.toString() == "Landroid/content/Intent;->getStringExtra(Ljava/lang/String;)Ljava/lang/String;"
        } as FiveRegisterInstruction
        assertEquals(method.parameterRegister(1), read.registerC)
    }

    @Test fun settingsHaveALauncherEntryAndAPrivateProviderWithoutChangingHostPermissions() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(ByteArrayInputStream(
            """<manifest xmlns:android="http://schemas.android.com/apk/res/android"><application><activity android:name="stock.Activity" android:permission="stock.permission" /></application></manifest>""".toByteArray(),
        ))
        document.addSettingsEntry()
        val provider = document.getElementsByTagName("provider").item(0) as org.w3c.dom.Element
        assertEquals("false", provider.getAttribute("android:exported"))
        val activities = document.getElementsByTagName("activity")
        assertEquals("stock.permission", (activities.item(0) as org.w3c.dom.Element).getAttribute("android:permission"))
        val settings = activities.item(1) as org.w3c.dom.Element
        assertEquals("HushMessenger settings", settings.getAttribute("android:label"))
        // Only the alias carries the launcher filter, so hiding it leaves the activity reachable.
        assertEquals(0, settings.getElementsByTagName("intent-filter").length)
        val alias = document.getElementsByTagName("activity-alias").item(0) as org.w3c.dom.Element
        assertEquals("app.hushmessenger.extension.SettingsLauncher", alias.getAttribute("android:name"))
        assertEquals("app.hushmessenger.extension.SettingsActivity", alias.getAttribute("android:targetActivity"))
        assertEquals("android.intent.category.LAUNCHER", (alias.getElementsByTagName("category").item(0) as org.w3c.dom.Element).getAttribute("android:name"))
        assertFailsWith<PatchException> { document.addSettingsEntry() }
    }

    @Test fun notificationsSuggestionsJoinTheStockPreferenceAndSkipTheServerOverride() {
        val serverBranch = 20
        val reader = peopleJewelMethod()
        val original = reader.implementation!!.instructions.toList()
        assertEquals(Opcode.IF_NEZ, original[serverBranch].opcode)
        reader.injectPeopleSection()
        val code = reader.implementation!!.instructions.toList()
        fun assertSwitch(index: Int, method: String) {
            assertEquals("$SETTINGS->$method(Z)Z", (code[index] as ReferenceInstruction).reference.toString())
            assertEquals(listOf(1, 0), (code[index] as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC) })
            assertEquals(Opcode.MOVE_RESULT, code[index + 1].opcode)
            assertEquals(0, (code[index + 1] as OneRegisterInstruction).registerA)
        }
        assertEquals(original.take(12), code.take(12))
        assertSwitch(12, "hidePeopleSection")
        assertEquals(original.subList(12, serverBranch), code.subList(14, serverBranch + 2))
        assertSwitch(serverBranch + 2, "keepPeopleSection")
        assertEquals(original.drop(serverBranch), code.drop(serverBranch + 4))
        // Both stock branches still skip to the original "not hidden" return.
        assertEquals(code.lastIndex, code.branchTarget(14))
        assertEquals(code.lastIndex, code.branchTarget(serverBranch + 4))
    }

    /**
     * 584 and most 584.1 builds keep false in v5 of ten registers, and some 584.1 arm64 builds in v3 of eight. Either
     * works while the default stays a local nothing overwrites before the server branch. 583's reader is refused.
     */
    @Test fun theNotificationsReaderTakesEitherFalseRegisterAndRefuses583s() {
        for (reader in listOf(peopleJewelMethod(), peopleJewelMethod(default = "v3", registers = 8, logger = "v4"))) {
            reader.injectPeopleSection()
            val code = reader.implementation!!.instructions.toList()
            assertEquals("$SETTINGS->hidePeopleSection(Z)Z", (code[12] as ReferenceInstruction).reference.toString())
            assertEquals("$SETTINGS->keepPeopleSection(Z)Z", (code[22] as ReferenceInstruction).reference.toString())
            assertEquals(code.lastIndex, code.branchTarget(14))
        }
        assertEquals(2, listOf(peopleJewelMethod(), peopleJewelMethod(default = "v3", registers = 8, logger = "v4"))
            .count { CompatMirror.peopleSection(it, PREFERENCE_GETTER) != null })
        val flag583 = "72344188615735036L"
        for (changed in listOf(
            // v1 holds the preferences, v8 is a parameter, and v2 takes the logger's result before the server branch.
            peopleJewelMethod(default = "v1"),
            peopleJewelMethod(default = "v8"),
            peopleJewelMethod(default = "v2"),
            // 583's reader: its own flag, false in v3 of eight registers.
            peopleJewelMethod(serverFlag = flag583, default = "v3", registers = 8, logger = "v4"),
            peopleJewelMethod(serverFlag = flag583),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertNull(CompatMirror.peopleSection(changed, PREFERENCE_GETTER))
            assertFailsWith<PatchException> { changed.injectPeopleSection() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    @Test fun changedNotificationsSuggestionsReaderFailsBeforeEditing() {
        for (changed in listOf(
            peopleJewelMethod(resultRegister = "v3"),
            peopleJewelMethod(key = "LX/JTx;->A00:LX/1BL;"),
            peopleJewelMethod(flags = AccessFlags.PUBLIC.value),
            peopleJewelMethod(serverFlag = "0x1L"),
            peopleJewelMethod(serverTarget = ":hidden"),
            // A second load of the flag makes the server branch ambiguous.
            peopleJewelMethod(extraFlag = true),
            // Older readers: one call for the list reset moves the flag to 16, and one without the logger.
            peopleJewelMethod(inlinedReset = true),
            peopleJewelMethod(logged = false),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { changed.injectPeopleSection() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    @Test fun peopleTabListenerGetsEmptySuggestionsOnlyWhileTheSwitchIsOn() {
        val publish = peopleTabMethod()
        val original = publish.implementation!!.instructions.toList()
        publish.injectPeopleTab()
        val code = publish.implementation!!.instructions.toList()
        fun ref(index: Int) = (code[index] as ReferenceInstruction).reference.toString()
        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", ref(1))
        assertEquals(Opcode.IF_EQZ, code[3].opcode)
        assertEquals(11, code.branchTarget(3))
        assertEquals(original, code.drop(11))
        assertEquals("LX/JZ6;->A09:LX/KIH;", ref(4))
        assertEquals("$IMMUTABLE_LIST->of()$IMMUTABLE_LIST", ref(5))
        assertEquals("Ljava/util/Collections;->emptyMap()Ljava/util/Map;", ref(7))
        assertEquals("LX/KIH;->CbW(${IMMUTABLE_LIST}Ljava/util/Map;)V", ref(9))
        assertEquals(listOf(3, 2, 1, 0), (code[9] as FiveRegisterInstruction).let { listOf(it.registerCount, it.registerC, it.registerD, it.registerE) })
        assertEquals(Opcode.RETURN_VOID, code[10].opcode)
    }

    @Test fun searchSuggestionsSourceReturnsNoSectionsOnlyWhileTheSwitchIsOn() {
        val source = peopleSearchMethod()
        val original = source.implementation!!.instructions.toList()
        val at = original.indexOfFirst { it.opcode == Opcode.SGET_OBJECT }
        source.injectPeopleSearch()
        val code = source.implementation!!.instructions.toList()
        assertEquals(original.take(at), code.take(at))
        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", (code[at + 1] as ReferenceInstruction).reference.toString())
        // The check borrows the status register, which the untouched status load overwrites next.
        assertEquals(0, (code[at + 2] as OneRegisterInstruction).registerA)
        assertEquals(at + 6, code.branchTarget(at + 3))
        assertEquals("$IMMUTABLE_LIST->of()$IMMUTABLE_LIST", (code[at + 4] as ReferenceInstruction).reference.toString())
        assertEquals(1, (code[at + 5] as OneRegisterInstruction).registerA)
        assertEquals(original.drop(at), code.drop(at + 6))
    }

    @Test fun changedSearchSuggestionsSourceFailsBeforeEditing() {
        for (changed in listOf(
            peopleSearchMethod(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
            peopleSearchMethod(status = "LX/0R2;->A0N:Ljava/lang/Long;"),
            peopleSearchMethod(wrap = "LX/CW4;->A0m(${IMMUTABLE_LIST}Ljava/lang/Object;)LX/EBu;"),
            peopleSearchMethod(wrap = "LX/CW4;->A0m(${IMMUTABLE_LIST}Ljava/lang/Integer;)LX/EBv;"),
            peopleSearchMethod(statusRegister = "v2"),
            // A path that joins at the status load would skip the check.
            peopleSearchMethod(jumpToStatus = true),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { changed.injectPeopleSearch() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    @Test fun theStoryQueryIsFoundThroughARedexStringTableLookup() {
        val lookup = "LX/Tbl;->A00(I)Ljava/lang/String;"
        val tables = mapOf(lookup to mapOf(7 to STORY_SUGGESTIONS_QUERY, 6 to "SomethingElse"))
        fun caller(key: String, call: String = "invoke-static {v1}, $lookup") = fixtureMethod(PEOPLE_STORY_HOOK,
            "$key\n$call\nmove-result-object v0\nreturn-void", registers = 4,
            flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        assertEquals(setOf(STORY_SUGGESTIONS_QUERY), caller("const/4 v1, 0x7").tableStrings(tables))
        assertEquals(1, caller("const/4 v1, 0x7").implementation!!.instructions.toList().indexOfAnchor(STORY_SUGGESTIONS_QUERY, tables))
        assertEquals(setOf("SomethingElse"), caller("const/4 v1, 0x6").tableStrings(tables))
        // A key loaded into another register, a key that is not in the table, or another table gives no anchor.
        assertEquals(emptySet(), caller("const/4 v2, 0x7").tableStrings(tables))
        assertEquals(emptySet(), caller("const/4 v1, 0x9").tableStrings(tables))
        assertEquals(emptySet(), caller("const/4 v1, 0x7", "invoke-static {v1}, LX/Other;->A00(I)Ljava/lang/String;").tableStrings(tables))
        assertEquals(-1, caller("const/4 v1, 0x9").implementation!!.instructions.toList().indexOfAnchor(STORY_SUGGESTIONS_QUERY, tables))
    }

    @Test fun storyViewerSkipsItsSuggestionsRequestOnlyWhileTheSwitchIsOn() {
        val viewer = peopleStoryMethod()
        val original = viewer.implementation!!.instructions.toList()
        viewer.injectPeopleStory()
        val code = viewer.implementation!!.instructions.toList()
        assertEquals(original.take(4), code.take(4))
        assertEquals("people", (code[4] as ReferenceInstruction).reference.toString())
        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", (code[5] as ReferenceInstruction).reference.toString())
        // The check reuses the flag register, so both ways out leave it as the stock check would.
        assertEquals(0, (code[6] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[7].opcode)
        assertEquals(0, (code[7] as OneRegisterInstruction).registerA)
        assertEquals(code.branchTarget(3), code.branchTarget(7))
        assertEquals(Opcode.RETURN_VOID, code[code.branchTarget(7)].opcode)
        assertEquals(original.drop(4), code.drop(8))
    }

    @Test fun changedStoryViewerRequestFailsBeforeEditing() {
        for (changed in listOf(
            peopleStoryMethod(flags = AccessFlags.PUBLIC.value),
            peopleStoryMethod(checkedFlag = "A0w"),
            peopleStoryMethod(skip = "if-eqz"),
            // A path that joins right after the check would skip it.
            peopleStoryMethod(jumpPastCheck = true),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { changed.injectPeopleStory() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    @Test fun changedPeopleTabPublishFailsBeforeEditing() {
        for (changed in listOf(
            peopleTabMethod(flags = AccessFlags.PUBLIC.value),
            peopleTabMethod(listenerRegister = "v1"),
            peopleTabMethod(listener = "LX/JZ6;->A08:Landroid/content/Context;"),
            peopleTabMethod(call = "LX/KIH;->CbW(${IMMUTABLE_LIST}Ljava/util/List;)V"),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { changed.injectPeopleTab() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    /** The launcher's preference check, read at 60 as in every supported build, with false in [default]. */
    private fun browserCheck(registers: Int = 8, default: Int = 2, branch: String = "if-nez", flags: Int = AccessFlags.PUBLIC.value) =
        MutableMethod(ImmutableMethod(
            MESSENGER_BROWSER_LAUNCHER, "A0L",
            listOf("Landroid/net/Uri;", SESSION).map { ImmutableMethodParameter(it, null, null) },
            "Z", flags, null, null, ImmutableMethodImplementation(registers, emptyList(), null, null),
        )).apply {
            addInstructionsWithLabels(0, "nop\n".repeat(60) + """
                sget-object v0, LX/1D1;->A1U:LX/1BK;
                invoke-interface {v1, v0, v$default}, $PREFERENCE_GETTER
                move-result v0
                $branch v0, :stock
                return v0
                :stock
                return v0
            """.trimIndent())
        }

    @Test fun browserInjectionRejectsStaticMethodsBeforeUsingTheWrongUriParameter() {
        val browser = browserCheck(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)
        val before = browser.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { browser.injectBrowserPreference() }
        assertEquals(before, browser.implementation!!.instructions.toList())
    }

    /** The check keeps false in v2 of eight registers and returns when the answer is on. */
    @Test fun theBrowserCheckTakesTheAnswerBeforeItsBranch() {
        val check = browserCheck()
        assertEquals(63, check.validateBrowserPreference())
        check.injectBrowserPreference()
        val code = check.implementation!!.instructions.toList()
        assertEquals("$SETTINGS->preferExternalBrowser(ZLandroid/net/Uri;)Z", (code[63] as ReferenceInstruction).reference.toString())
        assertEquals(listOf(0, check.parameterRegister(1)), (code[63] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD) })
        assertEquals(Opcode.MOVE_RESULT, code[64].opcode)
        assertEquals(0, (code[64] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[65].opcode)
        // 584.1 arm64 gives the same check nine registers, still with false in v2.
        assertEquals(63, browserCheck(registers = 9).validateBrowserPreference())
        // 582's shape (false in v3 of nine registers, skipping ahead when the answer is off) and any mix of the two are
        // refused before anything changes.
        for ((registers, default, branch) in listOf(
            Triple(9, 3, "if-eqz"), Triple(9, 3, "if-nez"), Triple(8, 2, "if-eqz"), Triple(8, 3, "if-nez"), Triple(9, 2, "if-eqz"),
            Triple(10, 3, "if-eqz"), Triple(10, 2, "if-nez"),
        )) {
            val changed = browserCheck(registers, default, branch)
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException>("$registers $default $branch") { changed.injectBrowserPreference() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    @Test fun theLauncherCheckIsTheBrowserHookAnd582sSkipReasonLoggerIsNot() {
        val check = "$MESSENGER_BROWSER_LAUNCHER->A0L(Landroid/net/Uri;$SESSION)Z"
        val launcher = fixtureClass(MESSENGER_BROWSER_LAUNCHER, listOf(
            fixtureMethod(check, "const/4 v0, 0x0\nreturn v0"),
            // A static method with the same parameters isn't the check.
            fixtureMethod("$MESSENGER_BROWSER_LAUNCHER->A0M(Landroid/net/Uri;$SESSION)Z", "const/4 v0, 0x0\nreturn v0",
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value),
        ))
        // 582 logged the skip reason in a method of its own, and that method was the hook. No 583 build logs it.
        val logger = fixtureClass("LX/1Iab;", listOf(fixtureMethod("LX/1Iab;->A00(Landroid/net/Uri;)Z", """
            const-string v0, "iab_skipped_reason"
            const-string v0, "user_prefers_external"
            const/4 v0, 0x0
            return v0
        """.trimIndent())))
        assertEquals(listOf(check), mirroredControls(listOf(launcher)).getValue("browser").map { it.hookId() })
        assertEquals(listOf(check), mirroredControls(listOf(launcher, logger)).getValue("browser").map { it.hookId() })
        assertTrue(mirroredControls(listOf(logger)).getValue("browser").isEmpty())
    }
}
