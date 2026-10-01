package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val VIEWER = "Lcom/facebook/messaging/montage/viewer/MontageViewerFragment;"
private const val LAUNCHER = "Lcom/facebook/presence/note/ui/nux/controller/NotesNuxController;->" +
    "A01(Landroidx/fragment/app/Fragment;LX/Ocr;Ljava/util/List;LX/5MS;Lkotlin/jvm/functions/Function1;)Ljava/lang/Object;"
private const val CARD_CHECK = "$VIEWER->A0x($VIEWER)Z"
private const val DATE_KEY = "LX/JVI;->A0E:LX/1BL;"
private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

/** The daily cap: shown fewer than three times today, or not yet today. */
private fun cardCheck(key: String = DATE_KEY, id: String = CARD_CHECK, flags: Int = STATIC) = fixtureMethod(id, """
    sget-object v0, $key
    sget-object v1, LX/JVI;->A08:LX/1BL;
    const/4 v0, 0x1
    return v0
""".trimIndent(), registers = 4, flags = flags)

/** The launcher's body cut down to the parts discovery and validation read. */
private fun launcher(body: String = """
    const-string v0, "arg_nux_type"
    const-string v1, "$NOTES_TIP_SHEET"
    const/4 v0, 0x0
    return-object v0
""".trimIndent(), id: String = LAUNCHER, registers: Int = 18, flags: Int = AccessFlags.PUBLIC.value or AccessFlags.FINAL.value) =
    fixtureMethod(id, body, registers, flags)

private fun reference(instruction: Instruction) = (instruction as ReferenceInstruction).reference.toString()

class GrowthPromptsTest {
    private fun found(vararg classes: ClassDef) = findControls(classes.toList())

    @Test fun theStoryCardCheckIsFoundThroughItsDateKey() {
        val viewer = fixtureClass(VIEWER, listOf(cardCheck()))
        assertEquals(listOf(CARD_CHECK), found(storyCardKeyHolder(), viewer).getValue("growth_story_card").map { it.hookId() })
        // Without the key's initializer nothing marks the check.
        assertTrue(found(viewer).getValue("growth_story_card").isEmpty())
        // Reading a neighbouring key, as an instance method, or with another shape doesn't count.
        for (method in listOf(
            cardCheck(key = "LX/JVI;->A0T:LX/1BL;"),
            cardCheck(flags = AccessFlags.PUBLIC.value),
            cardCheck(id = "$VIEWER->A0x()Z"),
            cardCheck(id = "$VIEWER->A0x($VIEWER)I"),
        )) assertTrue(found(storyCardKeyHolder(), fixtureClass(VIEWER, listOf(method))).getValue("growth_story_card").isEmpty(), method.hookId())
    }

    @Test fun theStoryCardCheckAnswersNoWhileTheSwitchIsOn() {
        val method = cardCheck()
        val before = method.implementation!!.instructions.toList()
        injectControl("growth", mapOf("growth_story_card" to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals("growth", reference(code[0]))
        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", reference(code[1]))
        assertEquals(Opcode.IF_EQZ, code[3].opcode)
        assertEquals(6, code.branchTarget(3))
        assertEquals(0L, (code[4] as WideLiteralInstruction).wideLiteral)
        assertEquals(Opcode.RETURN, code[5].opcode)
        assertEquals(before, code.drop(6))
    }

    @Test fun theNotesTipLauncherIsFoundThroughItsSheetTag() {
        val controller = fixtureClass(LAUNCHER.substringBefore("->"), listOf(launcher()))
        assertEquals(listOf(LAUNCHER), found(controller).getValue("growth_notes").map { it.hookId() })
        val withoutArgument = launcher("const-string v1, \"$NOTES_TIP_SHEET\"\nconst/4 v0, 0x0\nreturn-object v0")
        val statically = launcher(flags = STATIC)
        val boolean = launcher(id = LAUNCHER.replace(")Ljava/lang/Object;", ")Z"),
            body = "const-string v0, \"arg_nux_type\"\nconst-string v1, \"$NOTES_TIP_SHEET\"\nconst/4 v0, 0x0\nreturn v0")
        for (method in listOf(withoutArgument, statically, boolean)) {
            assertTrue(found(fixtureClass(method.definingClass, listOf(method))).getValue("growth_notes").isEmpty(), method.hookId())
        }
    }

    @Test fun theNotesTipLauncherAnswersShowedNothingWhileTheSwitchIsOn() {
        val method = launcher()
        val before = method.implementation!!.instructions.toList()
        injectControl("growth", mapOf("growth_notes" to listOf(method)))
        val code = method.implementation!!.instructions.toList()
        assertEquals("growth", reference(code[0]))
        assertEquals("$SETTINGS->enabled(Ljava/lang/String;)Z", reference(code[1]))
        assertEquals(Opcode.IF_EQZ, code[3].opcode)
        assertEquals(6, code.branchTarget(3))
        // A suspend call's caller casts the answer to Boolean, so it has to be Boolean.FALSE and never null.
        assertEquals("Ljava/lang/Boolean;->FALSE:Ljava/lang/Boolean;", reference(code[4]))
        assertEquals(Opcode.RETURN_OBJECT, code[5].opcode)
        assertEquals(before, code.drop(6))
    }

    @Test fun aNotesTipLauncherThatChangedShapeIsRejected() {
        fun rejects(method: MutableMethod) =
            assertFailsWith<PatchException> { method.injectNotesTips() }
        rejects(launcher(flags = STATIC))
        rejects(launcher("const-string v1, \"$NOTES_TIP_SHEET\"\nconst/4 v0, 0x0\nreturn-object v0"))
        rejects(launcher(id = LAUNCHER.replace(")Ljava/lang/Object;", ")Ljava/lang/Boolean;")))
        // Every register holds a parameter, so there's no room for the switch check.
        rejects(launcher(registers = 6))
    }
}
