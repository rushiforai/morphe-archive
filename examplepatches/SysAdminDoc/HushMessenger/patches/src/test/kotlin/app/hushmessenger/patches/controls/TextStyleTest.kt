package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import java.io.File
import java.nio.file.Files
import java.nio.file.Path
import javax.xml.parsers.DocumentBuilderFactory
import org.junit.jupiter.api.Assumptions.assumeTrue
import org.w3c.dom.Element
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val FIELD = "LX/A1k;"
internal const val SYNTHETIC_TEXT_FIELD_SELECTION = "$FIELD->onSelectionChanged(II)V"
private const val TEXT_FIELD_CHANGED = "$FIELD->onTextChanged(Ljava/lang/CharSequence;III)V"
private const val ANDROID_SELECTION = "Landroid/widget/TextView;->onSelectionChanged(II)V"

/** The selection change as Messenger writes it: Android's own, then the input's selection listener. p0 is v2. */
private val SELECTION_BODY = """
    invoke-super {p0, p1, p2}, $ANDROID_SELECTION
    iget-object v1, p0, $FIELD->A09:LX/515;
    if-eqz v1, :done
    const/4 v0, 0x0
    invoke-virtual {v1, v0}, LX/515;->A00(Ljava/lang/Object;)Ljava/lang/Object;
    :done
    return-void
""".trimIndent()

private val TEXT_CHANGED_BODY = """
    invoke-super {p0, p1, p2, p3, p4}, Landroid/widget/TextView;->onTextChanged(Ljava/lang/CharSequence;III)V
    const-string v0, "$TEXT_INPUT_REMEASURE"
    return-void
""".trimIndent()

private fun selection(body: String = SELECTION_BODY, owner: String = FIELD, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(SYNTHETIC_TEXT_FIELD_SELECTION.replace(FIELD, owner), body.replace(FIELD, owner), registers = 5, flags = flags)

private fun textChanged(owner: String = FIELD, id: String = TEXT_FIELD_CHANGED) =
    fixtureMethod(id.replace(FIELD, owner), TEXT_CHANGED_BODY, registers = 6)

/**
 * The Litho text input with its selection change and the onTextChanged that names its remeasure, the Litho spec that
 * names the same remeasure but isn't a view, and another EditText with a selection change of its own.
 */
internal fun textFieldFixture(
    selectionMethod: MutableMethod? = selection(),
    changedMethod: MutableMethod? = textChanged(),
    superclass: String = EDIT_TEXT,
): List<MutableClass> = listOf(
    fixtureClass(FIELD, listOfNotNull(selectionMethod, changedMethod), superclass = superclass),
    fixtureClass("LX/5QA;", listOf(fixtureMethod("LX/5QA;->A0v(LX/1Su;Ljava/lang/Object;[Ljava/lang/Object;)Ljava/lang/Object;",
        "const-string v0, \"$TEXT_INPUT_REMEASURE\"\nconst/4 v0, 0x0\nreturn-object v0",
        flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)), superclass = "LX/1QA;"),
    fixtureClass("LX/Zq1;", listOf(selection(owner = "LX/Zq1;")), superclass = EDIT_TEXT),
)

private fun Method.code() = implementation!!.instructions.toList()

class TextStyleTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun Element.children(tag: String) = (0 until childNodes.length)
        .mapNotNull { childNodes.item(it) as? Element }.filter { it.tagName == tag }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(TEXT_STYLE).map { it.hookId() }.toSet()

    @Test fun theMenuEntriesStartDisabledAndOpenTheStyleScreen() {
        val document = DocumentBuilderFactory.newInstance().newDocumentBuilder().parse(
            "<manifest package=\"com.facebook.orca\"><application/></manifest>".byteInputStream())
        document.addTextStyle()
        val application = document.getElementsByTagName("application").item(0) as Element
        val entries = (0 until application.childNodes.length).map { application.childNodes.item(it) as Element }
        assertEquals(listOf("activity", "activity-alias", "activity-alias"), entries.map { it.tagName }, "An alias comes after its activity")
        assertEquals(TEXT_STYLE_ACTIVITY, entries[0].getAttribute("android:name"))
        assertEquals("false", entries[0].getAttribute("android:exported"))
        assertEquals(TEXT_STYLE_ENTRIES, entries.drop(1).map { it.getAttribute("android:name") to it.getAttribute("android:label") })
        for (alias in entries.drop(1)) {
            assertEquals(TEXT_STYLE_ACTIVITY, alias.getAttribute("android:targetActivity"))
            assertEquals("false", alias.getAttribute("android:enabled"), "Hidden until the extension sees the switch on")
            assertEquals("false", alias.getAttribute("android:exported"))
            val filter = alias.children("intent-filter").single()
            assertEquals(listOf("android.intent.action.PROCESS_TEXT"), filter.children("action").map { it.getAttribute("android:name") })
            assertEquals(listOf("android.intent.category.DEFAULT"), filter.children("category").map { it.getAttribute("android:name") })
            assertEquals(listOf("text/plain"), filter.children("data").map { it.getAttribute("android:mimeType") })
        }
    }

    @Test fun theExtensionKnowsTheEntriesByTheSameNames() {
        val root = File("..")
        val manifest = root.resolve("extensions/messenger/src/main/AndroidManifest.xml").readText()
        val source = root.resolve("extensions/messenger/src/main/java/app/hushmessenger/extension/TextStyleActivity.java").readText()
        assertTrue("android:name=\"$TEXT_STYLE_ACTIVITY\"" in manifest)
        for ((name, label) in TEXT_STYLE_ENTRIES) {
            assertTrue("android:name=\"$name\" android:targetActivity=\"$TEXT_STYLE_ACTIVITY\" android:label=\"$label\"" in manifest, name)
            assertTrue("\"$name\"" in source, name)
        }
        assertTrue("static final String KEY = \"$TEXT_STYLE\";" in source)
        assertEquals("L${TEXT_STYLE_ACTIVITY.replace('.', '/')};->textFieldSelected(Landroid/view/View;)V", TEXT_FIELD_SELECTED)
        assertTrue("public static void textFieldSelected(View field)" in source)
    }

    @Test fun theHookIsTheSelectionChangeOfTheOneEditTextThatNamesTheRemeasure() {
        assertEquals(setOf(SYNTHETIC_TEXT_FIELD_SELECTION), found(textFieldFixture()))
        for (profile in listOf(SYNTHETIC_PROFILE, BASE_PROFILE)) {
            assertEquals(1, profile.hooks.getValue(TEXT_STYLE).size)
            assertTrue(profile.hooks.getValue(TEXT_STYLE).single().endsWith(";->onSelectionChanged(II)V"))
        }
        validateControls(mirroredControls(textFieldFixture()), setOf(TEXT_STYLE))
    }

    @Test fun nothingUnlessThereIsExactlyOneOfEach() {
        val cases = mapOf(
            "no remeasure" to textFieldFixture(changedMethod = null),
            "not an EditText" to textFieldFixture(superclass = "Landroid/widget/TextView;"),
            "the remeasure outside onTextChanged" to textFieldFixture(changedMethod = textChanged(id = "$FIELD->A00(Ljava/lang/CharSequence;III)V")),
            "two EditTexts name it" to textFieldFixture() + fixtureClass("LX/Zq2;", listOf(textChanged(owner = "LX/Zq2;")), superclass = EDIT_TEXT),
            "no selection change" to textFieldFixture(selectionMethod = null),
            "a selection change without Android's own" to textFieldFixture(selectionMethod = selection(SELECTION_BODY.replace("invoke-super {p0, p1, p2}, $ANDROID_SELECTION\n", ""))),
            "Android's own on another view" to textFieldFixture(selectionMethod = selection(SELECTION_BODY.replace("invoke-super {p0,", "invoke-super {v1,"))),
            "Android's own twice" to textFieldFixture(selectionMethod = selection(SELECTION_BODY.replace("iget-object v1",
                "invoke-super {p0, p1, p2}, $ANDROID_SELECTION\niget-object v1"))),
            // Static, p0 is the first parameter and not a view.
            "a static selection change" to textFieldFixture(selectionMethod = selection("invoke-super {p0, p1, v0}, $ANDROID_SELECTION\nreturn-void",
                flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(TEXT_STYLE)) }
        }
    }

    @Test fun theSelectionChangeHandsTheFieldToTheExtensionBeforeAnythingElse() {
        val method = selection()
        val before = method.code()
        injectControl(TEXT_STYLE, mapOf(TEXT_STYLE to listOf(method)))
        val code = method.code()
        val call = code[0] as FiveRegisterInstruction
        assertEquals(Opcode.INVOKE_STATIC, call.opcode)
        assertEquals(TEXT_FIELD_SELECTED, (call as ReferenceInstruction).reference.toString())
        assertEquals(listOf(1, 2), listOf(call.registerCount, call.registerC), "this, which is p0")
        // Messenger's own selection change follows unchanged, and Off and Pause run only that.
        assertEquals(before, code.drop(1))
    }

    @Test fun anUnusableMethodRefusesTheSwitchBeforeAnyEdit() {
        val cases = mapOf(
            "no call to Android's own" to selection(SELECTION_BODY.replace("invoke-super {p0, p1, p2}, $ANDROID_SELECTION\n", "")),
            "Android's own on another view" to selection(SELECTION_BODY.replace("invoke-super {p0,", "invoke-super {v1,")),
            "another method" to textChanged(),
        )
        for ((case, bad) in cases) {
            val badBefore = bad.code()
            assertFailsWith<PatchException>(case) { injectControl(TEXT_STYLE, mapOf(TEXT_STYLE to listOf(bad))) }
            assertEquals(badBefore, bad.code(), case)
        }
    }

    @Test fun everySupportedBuildHooksItsTextInputsSelectionChange() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val hooks = findTextStyleField(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(activeProfile.hooks.getValue(TEXT_STYLE), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(TEXT_STYLE to hooks), setOf(TEXT_STYLE))
            val method = MutableMethod(hooks.single())
            val before = method.code().map { it.opcode }
            method.injectTextStyleField()
            val call = method.code()[0]
            assertEquals(TEXT_FIELD_SELECTED, (call as ReferenceInstruction).reference.toString(), code)
            assertEquals(method.parameterRegister(0), (call as FiveRegisterInstruction).registerC, code)
            assertEquals(before, method.code().drop(1).map { it.opcode }, code)
        }
    }
}
