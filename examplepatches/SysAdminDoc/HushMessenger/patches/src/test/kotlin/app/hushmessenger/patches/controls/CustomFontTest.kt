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
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertFalse
import kotlin.test.assertTrue

private const val TYPEFACE = "Landroid/graphics/Typeface;"
private const val COLORS = "Landroid/content/res/ColorStateList;"
private const val SET_TYPEFACE = "Landroid/widget/TextView;->setTypeface(${TYPEFACE}I)V"

internal const val FONT_LAYOUT_SETTER = "LX/2Te;->A0D($TYPEFACE)V"
internal const val FONT_RESOLVER = "LX/7V1;->A00(LX/7Uy;LX/7V1;LX/5oI;I)$TYPEFACE"
internal const val FONT_ROBOTO_BUILDER = "LX/1z1;->A00(Landroid/content/Context;Ljava/lang/Integer;)$TYPEFACE"
internal const val FONT_BY_NAME_LOOKUP = "LX/N6z;->A00(Landroid/content/Context;Ljava/lang/String;I)$TYPEFACE"
internal const val FONT_INPUT_FIELD = "LX/5Ri;->A0A($COLORS$COLORS${TYPEFACE}Landroid/graphics/drawable/Drawable;" +
    "Landroid/text/TextUtils\$TruncateAt;Landroid/text/method/MovementMethod;Landroid/widget/EditText;LX/52J;" +
    "Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;[Ljava/lang/String;" +
    "IIIIIIIIIIIZZZZ)V"
internal const val FONT_INPUT_ALIGNED = "LX/O4T;->A08($COLORS$COLORS${TYPEFACE}Landroid/text/Layout\$Alignment;" +
    "Landroid/text/TextUtils\$TruncateAt;Landroid/widget/EditText;Landroid/widget/TextView\$OnEditorActionListener;" +
    "Ljava/lang/CharSequence;Ljava/lang/CharSequence;Ljava/util/List;FFFFIIIIIIIIIIIIIIZZ)V"
internal const val FONT_INPUT_HINTED = "LX/P7u;->A01($COLORS$COLORS${TYPEFACE}Landroid/graphics/drawable/Drawable;" +
    "Landroid/text/TextUtils\$TruncateAt;Landroid/text/method/MovementMethod;Landroid/widget/EditText;Ljava/lang/CharSequence;" +
    "Ljava/lang/CharSequence;Ljava/lang/Integer;Ljava/lang/String;Ljava/util/List;LX/5F6;[Ljava/lang/String;FFFIIIIIIIIIIIZZZZZ)V"

/** Litho's TextLayoutBuilder.setTypeface, cut down to the paint it sets and the string only it holds. Parameters start at v2. */
private val LAYOUT_BODY = """
    iget-object v1, p0, LX/2Te;->A00:Landroid/text/TextPaint;
    invoke-virtual {v1}, Landroid/graphics/Paint;->getTypeface()$TYPEFACE
    move-result-object v0
    if-eq v0, p1, :same
    invoke-virtual {v1, p1}, Landroid/graphics/Paint;->setTypeface($TYPEFACE)$TYPEFACE
    return-void
    :same
    const-string v0, "$FONT_LAYOUT_ANCHOR"
    return-void
""".trimIndent()

/** The repository's resolver: its cache, else the family's name in the refusal. Parameters start at v4. */
private val RESOLVER_BODY = """
    iget-object v0, p1, LX/7V1;->A00:Ljava/util/Map;
    invoke-interface {v0, p0}, Ljava/util/Map;->get(Ljava/lang/Object;)Ljava/lang/Object;
    move-result-object v1
    if-nez v1, :found
    invoke-virtual {p0}, Ljava/lang/Enum;->name()Ljava/lang/String;
    move-result-object v2
    const-string v3, "$FONT_REPOSITORY_ANCHOR"
    new-instance v0, Ljava/lang/IllegalStateException;
    invoke-direct {v0, v3}, Ljava/lang/IllegalStateException;-><init>(Ljava/lang/String;)V
    throw v0
    :found
    check-cast v1, $TYPEFACE
    return-object v1
""".trimIndent()

/** The Roboto builder, whose one return is where both of its branches meet. Parameters start at v2. */
private val ROBOTO_BODY = """
    invoke-virtual {p1}, Ljava/lang/Integer;->intValue()I
    move-result v0
    if-nez v0, :medium
    const-string v1, "sans-serif"
    const/4 v0, 0x0
    invoke-static {v1, v0}, $TYPEFACE->create(Ljava/lang/String;I)$TYPEFACE
    move-result-object v1
    goto :done
    :medium
    const-string v1, "sans-serif-medium"
    const/4 v0, 0x0
    invoke-static {v1, v0}, $TYPEFACE->create(Ljava/lang/String;I)$TYPEFACE
    move-result-object v1
    if-nez v1, :done
    const-string v0, "$FONT_ROBOTO_ANCHOR"
    :done
    return-object v1
""".trimIndent()

internal const val FONT_ROBOTO_COPY = "LX/2KO;->A00(Landroid/content/Context;)$TYPEFACE"

/** Family B's instance copy of one Roboto weight, logging under the builder's class. Its return is a branch target too. */
private fun robotoCopyBody(builder: String = "LX/1z1;") = """
    const-string v0, "sans-serif"
    const/4 v1, 0x0
    invoke-static {v0, v1}, $TYPEFACE->create(Ljava/lang/String;I)$TYPEFACE
    move-result-object v0
    if-nez v0, :done
    const-class v1, $builder
    const-string v0, "$FONT_ROBOTO_ANCHOR"
    const/4 v0, 0x0
    :done
    return-object v0
""".trimIndent()

/** MIG's typeface by name: the repository's family of that name, else Android's, then styled. Parameters start at v2. */
private fun byNameBody(repository: String = "LX/7V1;") = """
    invoke-static {p1}, LX/7Uy;->valueOf(Ljava/lang/String;)LX/7Uy;
    move-result-object v0
    invoke-static {v0}, $repository->A01(LX/7Uy;)$TYPEFACE
    move-result-object v0
    if-nez v0, :styled
    const/4 v1, 0x0
    invoke-static {p1, v1}, $TYPEFACE->create(Ljava/lang/String;I)$TYPEFACE
    move-result-object v0
    :styled
    invoke-static {v0, p2}, $TYPEFACE->create(${TYPEFACE}I)$TYPEFACE
    move-result-object v0
    return-object v0
""".trimIndent()

/** A text input's setter, moving its EditText, typeface and style down to the low registers the call needs. */
private fun inputBody(field: Int, style: Int, nullCheck: Boolean = false) = listOfNotNull(
    "move-object/from16 v0, p$field",
    "move-object/from16 v1, p2",
    "if-eqz v1, :skip".takeIf { nullCheck },
    "move/from16 v2, p$style",
    "invoke-virtual {v0, v1, v2}, $SET_TYPEFACE",
    ":skip".takeIf { nullCheck },
    "return-void",
).joinToString("\n")

private val STATIC = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value

private fun fontInput(id: String, body: String) =
    fixtureMethod(id, body, registers = 3 + Regex("\\[*(?:L[^;]+;|[ZBSCIJFD])").findAll(id.substringAfter('(').substringBefore(')')).count(),
        flags = STATIC)

internal fun customFontFixture(): List<MutableClass> = listOf(
    fixtureClass("LX/2Te;", listOf(fixtureMethod(FONT_LAYOUT_SETTER, LAYOUT_BODY, registers = 4))),
    fixtureClass("LX/7V1;", listOf(fixtureMethod(FONT_RESOLVER, RESOLVER_BODY, registers = 8, flags = STATIC))),
    fixtureClass("LX/1z1;", listOf(fixtureMethod(FONT_ROBOTO_BUILDER, ROBOTO_BODY, registers = 4, flags = STATIC))),
    fixtureClass("LX/N6z;", listOf(fixtureMethod(FONT_BY_NAME_LOOKUP, byNameBody(), registers = 5, flags = STATIC))),
    fixtureClass("LX/5Ri;", listOf(fontInput(FONT_INPUT_FIELD, inputBody(field = 6, style = 14)))),
    fixtureClass("LX/O4T;", listOf(fontInput(FONT_INPUT_ALIGNED, inputBody(field = 5, style = 20)))),
    fixtureClass("LX/P7u;", listOf(fontInput(FONT_INPUT_HINTED, inputBody(field = 6, style = 17, nullCheck = true)))),
)

private fun Method.code() = implementation!!.instructions.toList()
private fun Instruction.reference() = (this as ReferenceInstruction).reference.toString()

/** Checks one injected method the way its kind is hooked: nothing stock moves, and the extension gets the right registers. */
private fun injectAndCheck(hook: String, method: MutableMethod, message: String) {
    val before = method.code()
    val at = method.validateCustomFont(hook)
    val registers = method.implementation!!.registerCount
    injectControl(CUSTOM_FONT, mapOf(hook to listOf(method)))
    val after = method.code()
    when (hook) {
        FONT_LAYOUT -> {
            assertEquals(before, after.drop(2), message)
            val swap = after[0] as FiveRegisterInstruction
            assertEquals(Opcode.INVOKE_STATIC, after[0].opcode, message)
            assertEquals(FONT_LAYOUT_CALL, after[0].reference(), message)
            assertEquals(listOf(1, registers - 1), listOf(swap.registerCount, swap.registerC), message)
            assertEquals(Opcode.MOVE_RESULT_OBJECT, after[1].opcode, message)
            assertEquals(registers - 1, (after[1] as OneRegisterInstruction).registerA, message)
        }
        FONT_INPUT -> {
            val stock = before[at] as FiveRegisterInstruction
            val call = after[at] as FiveRegisterInstruction
            assertEquals(before.size, after.size, message)
            assertEquals(before.filterIndexed { i, _ -> i != at }, after.filterIndexed { i, _ -> i != at }, message)
            assertEquals(Opcode.INVOKE_STATIC, after[at].opcode, message)
            assertEquals(FONT_INPUT_CALL, after[at].reference(), message)
            assertEquals(listOf(3, stock.registerC, stock.registerD, stock.registerE),
                listOf(call.registerCount, call.registerC, call.registerD, call.registerE), message)
        }
        else -> {
            val result = (before[at] as OneRegisterInstruction).registerA
            assertEquals(before.size + 2, after.size, message)
            assertEquals(before.take(at), after.take(at), message)
            val expected = when (hook) {
                FONT_REPOSITORY -> FONT_REPOSITORY_CALL to listOf(result, registers - 4, registers - 1)
                FONT_BY_NAME -> FONT_BY_NAME_CALL to listOf(result, registers - 2)
                else -> FONT_ROBOTO_CALL to listOf(result)
            }
            assertEquals(expected.first, after[at].reference(), message)
            val handed = if (hook == FONT_ROBOTO) (after[at] as RegisterRangeInstruction).let { listOf(it.startRegister) }
                else (after[at] as FiveRegisterInstruction).let { listOf(it.registerC, it.registerD, it.registerE).take(it.registerCount) }
            assertEquals(expected.second, handed, message)
            for (offset in 1..2) {
                assertEquals(if (offset == 1) Opcode.MOVE_RESULT_OBJECT else Opcode.RETURN_OBJECT, after[at + offset].opcode, message)
                assertEquals(result, (after[at + offset] as OneRegisterInstruction).registerA, message)
            }
            assertEquals(before.drop(at + 1), after.drop(at + 3), message)
        }
    }
}

class CustomFontTest {
    @AfterTest fun reset() { activeProfile = SYNTHETIC_PROFILE }

    @Test fun everyFontHookIsFoundByItsStringShapeAndCalls() {
        val found = findCustomFont(customFontFixture())
        validateControls(found, CUSTOM_FONT_HOOKS.toSet())
        assertEquals(mapOf(
            FONT_LAYOUT to listOf(FONT_LAYOUT_SETTER),
            FONT_REPOSITORY to listOf(FONT_RESOLVER),
            FONT_ROBOTO to listOf(FONT_ROBOTO_BUILDER),
            FONT_BY_NAME to listOf(FONT_BY_NAME_LOOKUP),
            FONT_INPUT to listOf(FONT_INPUT_FIELD, FONT_INPUT_ALIGNED, FONT_INPUT_HINTED),
        ), found.mapValues { (_, methods) -> methods.map { it.hookId() } })
        assertEquals(7, found.values.sumOf { it.size })
    }

    @Test fun eachKindIsHookedWithoutMovingAStockInstruction() {
        for ((hook, methods) in findCustomFont(customFontFixture())) for (method in methods) {
            injectAndCheck(hook, method as MutableMethod, "$hook ${method.hookId()}")
        }
    }

    @Test fun theRobotoBuildersBranchesStillMeetAtItsReturnThroughTheCall() {
        val builder = fixtureMethod(FONT_ROBOTO_BUILDER, ROBOTO_BODY, registers = 4, flags = STATIC)
        val at = builder.validateCustomFont(FONT_ROBOTO)
        assertTrue(at in builder.jumpTargets())
        builder.injectCustomFont(FONT_ROBOTO)
        assertTrue(at in builder.jumpTargets())
        assertEquals(FONT_ROBOTO_CALL, builder.code()[at].reference())
    }

    @Test fun familyBsInstanceCopiesOfTheRobotoBuilderAreHookedBesideIt() {
        val copy = fixtureClass("LX/2KO;", listOf(fixtureMethod(FONT_ROBOTO_COPY, robotoCopyBody(), registers = 4)))
        val found = findCustomFont(customFontFixture() + copy)
        assertEquals(listOf(FONT_ROBOTO_BUILDER, FONT_ROBOTO_COPY), found.getValue(FONT_ROBOTO).map { it.hookId() })
        for (method in found.getValue(FONT_ROBOTO)) injectAndCheck(FONT_ROBOTO, method as MutableMethod, method.hookId())
        // A holder that doesn't name the builder's class isn't a copy, and the builder goes unfound with it.
        val stray = fixtureClass("LX/2KO;", listOf(fixtureMethod(FONT_ROBOTO_COPY, robotoCopyBody("LX/Abc;"), registers = 4)))
        assertTrue(findCustomFont(customFontFixture() + stray).getValue(FONT_ROBOTO).isEmpty())
        assertFailsWith<PatchException> { fixtureMethod(FONT_ROBOTO_COPY, robotoCopyBody("LX/Abc;"), registers = 4).validateCustomFont(FONT_ROBOTO) }
    }

    @Test fun anInputCallOnARangeStopsThePatch() {
        val ranged = inputBody(field = 6, style = 14).replace("invoke-virtual {v0, v1, v2}", "invoke-virtual/range {v0 .. v2}")
        val input = fontInput(FONT_INPUT_FIELD, ranged)
        assertTrue(input.isFontInput())
        assertFailsWith<PatchException> { input.validateCustomFont(FONT_INPUT) }
        val twice = inputBody(field = 6, style = 14).replace("return-void", "invoke-virtual {v0, v1, v2}, $SET_TYPEFACE\nreturn-void")
        assertFailsWith<PatchException> { fontInput(FONT_INPUT_FIELD, twice).validateCustomFont(FONT_INPUT) }
    }

    @Test fun aBranchOntoTheLayoutsStartStopsThePatch() {
        val looped = ":start\n" + LAYOUT_BODY.replace("const-string v0, \"$FONT_LAYOUT_ANCHOR\"\nreturn-void",
            "const-string v0, \"$FONT_LAYOUT_ANCHOR\"\nif-eqz v1, :start\nreturn-void")
        assertTrue("if-eqz v1, :start" in looped)
        val layout = fixtureMethod(FONT_LAYOUT_SETTER, looped, registers = 4)
        assertTrue(layout.isFontLayout())
        assertFailsWith<PatchException> { layout.validateCustomFont(FONT_LAYOUT) }
        // The typeface parameter past v15 can't go through a plain call.
        assertFailsWith<PatchException> { fixtureMethod(FONT_LAYOUT_SETTER, LAYOUT_BODY, registers = 18).validateCustomFont(FONT_LAYOUT) }
    }

    @Test fun repositoryAndByNameRegistersHaveToStillHoldTheirParameters() {
        // The weight past v15 can't go through a plain call.
        // Its parameters past v15 come down to low registers first, the way real code reaches them.
        val highBody = "move-object/from16 v4, p0\nmove-object/from16 v5, p1\n" +
            RESOLVER_BODY.replace("p1,", "v5,").replace("{v0, p0}", "{v0, v4}").replace("{p0}", "{v4}")
        val high = fixtureMethod(FONT_RESOLVER, highBody, registers = 20, flags = STATIC)
        assertTrue(high.isFontRepository())
        assertFailsWith<PatchException> { high.validateCustomFont(FONT_REPOSITORY) }
        // A long or double third parameter moves the weight a register further, so the shape itself refuses it.
        for (wide in listOf("J", "D")) {
            assertFalse(fixtureMethod(FONT_RESOLVER.replace("LX/5oI;I)", "${wide}I)"), RESOLVER_BODY, registers = 9, flags = STATIC)
                .isFontRepository())
        }
        // A family register written before the return no longer holds the family.
        val reused = RESOLVER_BODY.replace("check-cast v1", "const/4 p0, 0x0\ncheck-cast v1")
        assertFailsWith<PatchException> { fixtureMethod(FONT_RESOLVER, reused, registers = 8, flags = STATIC).validateCustomFont(FONT_REPOSITORY) }
        val renamed = byNameBody().replace("move-result-object v0\nreturn-object v0", "move-result-object v0\nconst/4 p1, 0x0\nreturn-object v0")
        assertFailsWith<PatchException> { fixtureMethod(FONT_BY_NAME_LOOKUP, renamed, registers = 5, flags = STATIC).validateCustomFont(FONT_BY_NAME) }
        val twoReturns = byNameBody().replace("move-result-object v0\n:styled", "move-result-object v0\nreturn-object v0\n:styled")
        assertFailsWith<PatchException> { fixtureMethod(FONT_BY_NAME_LOOKUP, twoReturns, registers = 5, flags = STATIC).validateCustomFont(FONT_BY_NAME) }
    }

    @Test fun aSecondHolderOfAnAnchorLeavesItsHookUnfound() {
        val copy = fixtureClass("LX/2Tf;", listOf(fixtureMethod(FONT_LAYOUT_SETTER.replace("LX/2Te;", "LX/2Tf;"),
            LAYOUT_BODY.replace("LX/2Te;", "LX/2Tf;"), registers = 4)))
        val found = findCustomFont(customFontFixture() + copy)
        assertTrue(found.getValue(FONT_LAYOUT).isEmpty())
        assertFailsWith<PatchException> { validateControls(found, setOf(FONT_LAYOUT)) }
        // A second resolver also takes the by-name lookup with it, since it can't tell which one it asks.
        val resolver = fixtureClass("LX/7V2;", listOf(fixtureMethod(FONT_RESOLVER.replace("LX/7V1;", "LX/7V2;"),
            RESOLVER_BODY.replace("LX/7V1;", "LX/7V2;"), registers = 8, flags = STATIC)))
        val twice = findCustomFont(customFontFixture() + resolver)
        assertTrue(twice.getValue(FONT_REPOSITORY).isEmpty() && twice.getValue(FONT_BY_NAME).isEmpty())
        assertFailsWith<PatchException> { validateControls(twice, CUSTOM_FONT_HOOKS.toSet()) }
    }

    @Test fun aByNameLookupThatAsksAnotherClassIsntTheFontLookup() {
        val other = fixtureClass("LX/N6z;", listOf(fixtureMethod(FONT_BY_NAME_LOOKUP, byNameBody("LX/Abc;"), registers = 5, flags = STATIC)))
        val found = findCustomFont(customFontFixture().filter { it.type != "LX/N6z;" } + other)
        assertTrue(found.getValue(FONT_BY_NAME).isEmpty())
        assertFalse(found.getValue(FONT_REPOSITORY).isEmpty())
    }

    @Test fun everySupportedBuildHasSevenFontHooksAndEachHooksCleanly() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            activeProfile = controlProfileFor(code)
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val found = findCustomFont(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            validateControls(found, CUSTOM_FONT_HOOKS.toSet())
            // The layout, the repository, the Roboto builder, the by-name lookup and three text inputs. Family B adds two
            // instance copies of the builder.
            assertEquals(6 + found.getValue(FONT_ROBOTO).size, found.values.sumOf { it.size }, code)
            assertTrue(found.getValue(FONT_ROBOTO).size in setOf(1, 3), code)
            for ((hook, methods) in found) for (method in methods) injectAndCheck(hook, MutableMethod(method), "$code ${method.hookId()}")
        }
    }
}
