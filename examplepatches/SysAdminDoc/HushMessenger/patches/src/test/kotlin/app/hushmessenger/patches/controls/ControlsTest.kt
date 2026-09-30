package app.hushmessenger.patches.controls

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

class ControlsTest {
    private fun method(registers: Int = 2, body: String = "const/4 v0, 0x1\nreturn v0", returnType: String = "Z") = MutableMethod(
        ImmutableMethod("Lfixture/Gate;", "gate", emptyList(), returnType, AccessFlags.PUBLIC.value,
            null, null, ImmutableMethodImplementation(registers, emptyList(), null, null)),
    ).apply { addInstructionsWithLabels(0, body) }

    @Test fun optOutBranchesToTheUnmodifiedOriginalFirstInstruction() {
        val gate = method()
        val original = gate.implementation!!.instructions.toList()
        gate.injectSwitch("hideStories", "0x0")
        val code = gate.implementation!!.instructions
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        val targetAddress = code.take(2).sumOf { it.codeUnits } + (code[2] as OffsetInstruction).codeOffset
        assertEquals(code.take(5).sumOf { it.codeUnits }, targetAddress)
        assertEquals(original, code.drop(5))
    }

    @Test fun methodsWithNoScratchLocalFailBeforeChangingParameters() {
        val gate = method(registers = 1, body = "const/4 v0, 0x0\nreturn v0")
        val original = gate.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { gate.injectSwitch("hideStories", "0x0") }
        assertEquals(original, gate.implementation!!.instructions.toList())
    }

    @Test fun typingHookRetainsTheOriginalRunnableAndReturnsOnlyWhenEnabled() {
        val runnable = method(body = "return-void", returnType = "V")
        runnable.injectSwitch("suppressTyping", "0x0")
        assertEquals(listOf(Opcode.INVOKE_STATIC, Opcode.MOVE_RESULT, Opcode.IF_EQZ, Opcode.RETURN_VOID, Opcode.RETURN_VOID),
            runnable.implementation!!.instructions.map { it.opcode })
    }

    @Test fun missingOrAmbiguousAnchorsRejectTheApk() {
        assertFailsWith<PatchException> { validateControls(emptyMap()) }
        assertFailsWith<PatchException> { validateControls(expectedHooks.keys.associateWith { listOf(method(), method()) }) }
    }

    @Test fun changedSubtabAndBrowserBodiesFail() {
        assertFailsWith<PatchException> { method().injectSubtabs() }
        assertFailsWith<PatchException> { method().injectBrowserPreference() }
    }

    @Test fun subtabFlagMustBeTheValuePassedToItsSetter() {
        val supplier = "Lcom/facebook/messaging/inboxsubtabs/plugins/subtabs/itemsupplier/InboxSubtabsItemSupplierImplementation;"
        fun subtabs(value: String) = method(registers = 3, returnType = "V", body = """
            iget-object v0, p0, LX/2UL;->A00:$supplier
            iget-object v1, v0, $supplier->A05:Ljava/util/concurrent/atomic/AtomicBoolean;
            const/4 v0, 0x1
            invoke-virtual {v1, $value}, Ljava/util/concurrent/atomic/AtomicBoolean;->set(Z)V
            return-void
        """.trimIndent())
        val original = subtabs("v0")
        original.injectSubtabs()
        assertEquals(7, original.implementation!!.instructions.size)
        val changed = subtabs("v2")
        assertFailsWith<PatchException> { changed.injectSubtabs() }
        assertEquals(5, changed.implementation!!.instructions.size)
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
        val reader = peopleJewelMethod()
        val original = reader.implementation!!.instructions.toList()
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
        assertEquals(original.subList(12, 20), code.subList(14, 22))
        assertSwitch(22, "keepPeopleSection")
        assertEquals(original.drop(20), code.drop(24))
        // Both stock branches still skip to the original "not hidden" return.
        assertEquals(code.lastIndex, code.branchTarget(14))
        assertEquals(code.lastIndex, code.branchTarget(24))
    }

    @Test fun changedNotificationsSuggestionsReaderFailsBeforeEditing() {
        for (changed in listOf(
            peopleJewelMethod(resultRegister = "v3"),
            peopleJewelMethod(key = "LX/JTx;->A00:LX/1BL;"),
            peopleJewelMethod(flags = AccessFlags.PUBLIC.value),
            peopleJewelMethod(serverFlag = "0x1L"),
            peopleJewelMethod(serverTarget = ":hidden"),
        )) {
            val before = changed.implementation!!.instructions.toList()
            assertFailsWith<PatchException> { changed.injectPeopleSection() }
            assertEquals(before, changed.implementation!!.instructions.toList())
        }
    }

    @Test fun browserInjectionRejectsStaticMethodsBeforeUsingTheWrongUriParameter() {
        val browser = MutableMethod(ImmutableMethod(
            "Lcom/facebook/messaging/browser/util/MessengerBrowserLauncher;", "A0L",
            listOf("Landroid/net/Uri;", "Lcom/facebook/auth/usersession/FbUserSession;")
                .map { ImmutableMethodParameter(it, null, null) },
            "Z", AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, null, null,
            ImmutableMethodImplementation(9, emptyList(), null, null),
        )).apply {
            addInstructionsWithLabels(0, "nop\n".repeat(60) + """
                sget-object v0, LX/1D1;->A1U:LX/1BK;
                invoke-interface {v1, v0, v3}, Lcom/facebook/prefs/shared/FbSharedPreferences;->AhC(LX/1BK;Z)Z
                move-result v0
                if-eqz v0, :stock
                return v0
                :stock
                return v0
            """.trimIndent())
        }
        val before = browser.implementation!!.instructions.toList()
        assertFailsWith<PatchException> { browser.injectBrowserPreference() }
        assertEquals(before, browser.implementation!!.instructions.toList())
    }
}
