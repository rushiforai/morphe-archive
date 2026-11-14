package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableField
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** androidx's DialogFragment as Redex names it in the synthetic builds. */
private const val DIALOG_FRAGMENT = "LX/0AL;"
internal const val SYNTHETIC_MENU_BLUR = "$DIALOG_FRAGMENT->onStart()V"
private const val SHOW = "invoke-virtual {v1}, Landroid/app/Dialog;->show()V"

/** DialogFragment.onStart as 587 has it, cut down: four registers, so p0 is v3, and mDialog shown from v1. */
private val ON_START_BODY = """
    invoke-super {p0}, $ANDROIDX_FRAGMENT->onStart()V
    iget-object v1, p0, $DIALOG_FRAGMENT->mDialog:Landroid/app/Dialog;
    if-eqz v1, :done
    const/4 v0, 0x0
    iput-boolean v0, p0, $DIALOG_FRAGMENT->mViewDestroyed:Z
    $SHOW
    iget-object v0, p0, $DIALOG_FRAGMENT->mDialog:Landroid/app/Dialog;
    invoke-virtual {v0}, Landroid/app/Dialog;->getWindow()Landroid/view/Window;
    move-result-object v0
    :done
    return-void
""".trimIndent()

private fun onStart(body: String = ON_START_BODY, id: String = SYNTHETIC_MENU_BLUR) = fixtureMethod(id, body, 4)

private fun dialogField(owner: String, flags: Int = AccessFlags.PUBLIC.value) =
    ImmutableField(owner, "mDialog", "Landroid/app/Dialog;", flags, null, null, null)

private fun dialogFragment(
    method: MutableMethod = onStart(),
    type: String = DIALOG_FRAGMENT,
    superclass: String = ANDROIDX_FRAGMENT,
    interfaces: List<String> = DIALOG_FRAGMENT_LISTENERS.toList(),
    fieldFlags: Int? = AccessFlags.PUBLIC.value,
): MutableClass = fixtureClass(type, listOf(method), interfaces = interfaces, superclass = superclass,
    extraFields = listOfNotNull(fieldFlags?.let { dialogField(type, it) }))

/** DialogFragment with its onStart, for the complete discovery fixture. */
internal fun menuBlurFixture(): List<MutableClass> = listOf(dialogFragment())

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class MenuBlurTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MENU_BLUR)

    @Test fun findsDialogFragmentsOnStart() {
        assertEquals(listOf(SYNTHETIC_MENU_BLUR), found(menuBlurFixture()).map { it.hookId() })
        validateControls(mirroredControls(menuBlurFixture()), setOf(MENU_BLUR))
        assertEquals(setOf(SYNTHETIC_MENU_BLUR), SYNTHETIC_PROFILE.hooks.getValue(MENU_BLUR))
    }

    @Test fun lookalikesAreNotFound() {
        val cases = mapOf(
            "a class that isn't a Fragment" to listOf(dialogFragment(superclass = "Ljava/lang/Object;")),
            "a Fragment that only listens for dismiss" to listOf(dialogFragment(interfaces = DIALOG_FRAGMENT_LISTENERS.take(1))),
            "no mDialog field" to listOf(dialogFragment(fieldFlags = null)),
            "a static mDialog" to listOf(dialogFragment(fieldFlags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value)),
            "two DialogFragments" to listOf(dialogFragment(), dialogFragment(onStart(id = "LX/0AM;->onStart()V"), type = "LX/0AM;")),
            "no show" to listOf(dialogFragment(onStart(ON_START_BODY.replace("$SHOW\n", "")))),
            "two shows" to listOf(dialogFragment(onStart(ON_START_BODY.replace(SHOW, "$SHOW\n$SHOW")))),
            "a dialog from somewhere else" to listOf(dialogFragment(onStart(ON_START_BODY.replace(SHOW,
                "iget-object v1, p0, $DIALOG_FRAGMENT->A00:Landroid/app/Dialog;\n$SHOW")))),
            "the dialog written over" to listOf(dialogFragment(onStart(ON_START_BODY.replace(SHOW, "const/4 v1, 0x0\n$SHOW")))),
            "p0 written over" to listOf(dialogFragment(onStart(ON_START_BODY.replace("invoke-super {p0}, $ANDROIDX_FRAGMENT->onStart()V",
                "invoke-super {p0}, $ANDROIDX_FRAGMENT->onStart()V\nconst/4 p0, 0x0")))),
            "a jump to just past the show" to listOf(dialogFragment(onStart(ON_START_BODY.replace(SHOW, "$SHOW\n:after")
                .replace("move-result-object v0", "move-result-object v0\nif-eqz v0, :after")))),
            "a static onStart" to listOf(dialogFragment(fixtureMethod(SYNTHETIC_MENU_BLUR, ON_START_BODY.replace("p0", "v3"), 4,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
        )
        for ((case, classes) in cases) {
            assertTrue(found(classes).isEmpty(), case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MENU_BLUR)) }
        }
    }

    @Test fun aChangedOnStartIsRefusedAndLeftAsItWas() {
        val method = onStart(ON_START_BODY.replace(SHOW, "$SHOW\n$SHOW"))
        val before = method.code()
        assertFailsWith<PatchException> { method.injectMenuBlur() }
        assertEquals(before, method.code())
    }

    @Test fun theDialogGoesToTheExtensionRightAfterItsShown() {
        val method = onStart()
        val before = method.code()
        injectControl(MENU_BLUR, mapOf(MENU_BLUR to listOf(method)))
        val code = method.code()
        val show = code.indexOfFirst { it.reference() == "Landroid/app/Dialog;->show()V" }
        val call = code[show + 1] as RegisterRangeInstruction
        assertEquals(MENU_BLUR_CALL, code[show + 1].reference())
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code[show + 1].opcode)
        assertEquals(1 to 1, call.startRegister to call.registerCount)
        assertStockKept(before, code.filterIndexed { i, _ -> i != show + 1 }, "onStart")
    }

    @Test fun everySupportedBuildHooksDialogFragmentsOnStart() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val classes = dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes }
            val hooks = findMenuBlur(classes)
            assertEquals(activeProfile.hooks.getValue(MENU_BLUR), hooks.map { it.hookId() }.toSet(), code)
            validateControls(mapOf(MENU_BLUR to hooks), setOf(MENU_BLUR))
            val method = MutableMethod(hooks.single())
            val (at, dialog) = method.menuBlurSite()!!
            val before = method.code()
            method.injectMenuBlur()
            val after = method.code()
            assertEquals("Landroid/app/Dialog;->show()V", after[at - 1].reference(), code)
            assertEquals(MENU_BLUR_CALL, after[at].reference(), code)
            assertEquals(dialog, (after[at] as RegisterRangeInstruction).startRegister, code)
            assertStockKept(before, after.filterIndexed { i, _ -> i != at }, code)
        }
    }
}
