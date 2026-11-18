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

internal const val SYNTHETIC_IN_CHAT_MENU = "$REACTIONS_BAR->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V"

/** ReactionsBarFragment's onViewCreated as 587 starts it, cut down: nine registers, so p0 is v6 and the view v7. */
private val REACTIONS_VIEW_BODY = """
    const/4 v5, 0x0
    iget-object v0, p0, $ANDROIDX_FRAGMENT->mView:Landroid/view/View;
    invoke-super {p0, p1, p2}, $DIALOG_FRAGMENT->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V
    return-void
""".trimIndent()

private fun reactionsView(id: String = SYNTHETIC_IN_CHAT_MENU, flags: Int = AccessFlags.PUBLIC.value) =
    fixtureMethod(id, REACTIONS_VIEW_BODY, 9, flags)

private fun reactionsBar(method: MutableMethod = reactionsView(), type: String = REACTIONS_BAR): MutableClass =
    fixtureClass(type, listOf(method), superclass = DIALOG_FRAGMENT)

/** DialogFragment with its onStart and the in-chat menu with its onViewCreated, for the complete discovery fixture. */
internal fun menuBlurFixture(): List<MutableClass> = listOf(dialogFragment(), reactionsBar())

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as? ReferenceInstruction)?.reference?.toString()

class MenuBlurTest {
    @AfterTest fun reset() {
        activeProfile = SYNTHETIC_PROFILE
    }

    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(MENU_BLUR)

    @Test fun findsDialogFragmentsOnStartAndTheInChatMenusView() {
        assertEquals(listOf(SYNTHETIC_MENU_BLUR, SYNTHETIC_IN_CHAT_MENU), found(menuBlurFixture()).map { it.hookId() })
        validateControls(mirroredControls(menuBlurFixture()), setOf(MENU_BLUR))
        assertEquals(setOf(SYNTHETIC_MENU_BLUR, SYNTHETIC_IN_CHAT_MENU), SYNTHETIC_PROFILE.hooks.getValue(MENU_BLUR))
        for ((code, profile) in controlProfiles) {
            assertTrue("$REACTIONS_BAR->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V" in profile.hooks.getValue(MENU_BLUR), "$code")
        }
    }

    /** #162: on 587 the menu on a pressed message is drawn in the chat, with no dialog for onStart to show. */
    @Test fun withoutTheInChatMenuTheSwitchIsRefused() {
        val cases = mapOf(
            "no in-chat menu" to listOf(dialogFragment()),
            "an in-chat menu under another name" to listOf(dialogFragment(), reactionsBar(type = "LX/0AN;",
                method = reactionsView("LX/0AN;->onViewCreated(Landroid/view/View;Landroid/os/Bundle;)V"))),
            "a static onViewCreated" to listOf(dialogFragment(), reactionsBar(fixtureMethod(SYNTHETIC_IN_CHAT_MENU,
                REACTIONS_VIEW_BODY.replace("p0", "v6").replace("p1", "v7").replace("p2", "v8"), 9,
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
        )
        for ((case, classes) in cases) {
            assertEquals(listOf(SYNTHETIC_MENU_BLUR), found(classes).map { it.hookId() }, case)
            assertFailsWith<PatchException>(case) { validateControls(mirroredControls(classes), setOf(MENU_BLUR)) }
        }
    }

    @Test fun theInChatMenusViewGoesToTheExtensionBeforeMessengersOwnSetup() {
        val method = reactionsView()
        val before = method.code()
        injectControl(MENU_BLUR, mapOf(MENU_BLUR to listOf(method)))
        val code = method.code()
        val call = code.first() as RegisterRangeInstruction
        assertEquals(Opcode.INVOKE_STATIC_RANGE, code.first().opcode)
        assertEquals(MENU_BLUR_IN_CHAT_CALL, code.first().reference())
        assertEquals(7 to 1, call.startRegister to call.registerCount)
        assertStockKept(before, code.drop(1), "onViewCreated")
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
            val inChat = MutableMethod(hooks.single { it.definingClass == REACTIONS_BAR })
            val stock = inChat.code()
            inChat.injectMenuBlur()
            assertEquals(MENU_BLUR_IN_CHAT_CALL, inChat.code().first().reference(), code)
            assertEquals(inChat.parameterRegister(1), (inChat.code().first() as RegisterRangeInstruction).startRegister, code)
            assertStockKept(stock, inChat.code().drop(1), code)
            val method = MutableMethod(hooks.single { it.definingClass != REACTIONS_BAR })
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
