package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The people search source's result class in the discovery fixture, which these hooks share. */
private const val SS_RESULT = "LX/EBu;"
private const val SS_SOURCE = "LX/CX5;"
private const val SS_TYPE = "LX/N0a;"
private const val SS_SECTION = "LX/Ona;"
private const val SS_LAUNCHER = "LX/1em;"
private const val SS_MAP = "Lcom/google/common/collect/ImmutableMap;"
private const val SS_HOOK_SIZE = 5

internal const val SYNTHETIC_SEARCH_SECTIONS = "$SS_RESULT-><init>(${IMMUTABLE_LIST}Ljava/lang/Integer;I)V"
internal const val SYNTHETIC_SEARCH_ITEMS = "$SS_SECTION-><init>($SS_TYPE$IMMUTABLE_LIST${SS_MAP}Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Z)V"
internal const val SYNTHETIC_AI_CHAT_OPEN = "$SS_LAUNCHER->A00(Landroid/content/Context;LX/0Lz;$FB_USER_SESSION$THREAD_VIEW_PARAMS)Z"

private val SS_CONSTRUCTOR = AccessFlags.PUBLIC.value or AccessFlags.CONSTRUCTOR.value

/** The result constructor as 587 writes it: the list, the status and the count straight into the fields. */
private fun ssResult(id: String = SYNTHETIC_SEARCH_SECTIONS, locals: Int = 0): MutableMethod {
    val self = locals
    return fixtureMethod(id, """
        invoke-direct {v$self}, Ljava/lang/Object;-><init>()V
        iput-object v${self + 1}, v$self, $SS_RESULT->A01:$IMMUTABLE_LIST
        iput-object v${self + 2}, v$self, $SS_RESULT->A02:Ljava/lang/Integer;
        iput v${self + 3}, v$self, $SS_RESULT->A00:I
        return-void
    """.trimIndent(), registers = locals + 4, flags = SS_CONSTRUCTOR)
}

/** The section constructor: the type, then the rows. */
private fun ssSection(id: String = SYNTHETIC_SEARCH_ITEMS) = fixtureMethod(id, """
    invoke-direct {v0}, Ljava/lang/Object;-><init>()V
    iput-object v1, v0, $SS_SECTION->A00:$SS_TYPE
    iput-object v2, v0, $SS_SECTION->A01:$IMMUTABLE_LIST
    return-void
""".trimIndent(), registers = 8, flags = SS_CONSTRUCTOR)

private fun ssTypes(anchor: String = SECTION_TYPE_ANCHOR, type: String = SS_TYPE) = fixtureClass(type, listOf(
    fixtureMethod("$type-><clinit>()V", "const-string v0, \"$anchor\"\nreturn-void", registers = 1,
        flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value),
), superclass = "Ljava/lang/Enum;")

/** The launcher, with three locals before its parameters unless a test says otherwise. */
private fun ssLauncher(locals: Int = 3, spec: String = THREAD_LAUNCHER_SPEC) = fixtureMethod(SYNTHETIC_AI_CHAT_OPEN, """
    const-string v0, "$spec"
    const/4 v0, 0x0
    return v0
""".trimIndent(), registers = locals + 5)

/** The three hooks as the stock build writes them. [source] adds the people search source the result class is found by. */
internal fun searchSectionsFixture(source: Boolean = true): List<MutableClass> = listOfNotNull(
    if (source) fixtureClass(SS_SOURCE, listOf(peopleSearchMethod())) else null,
    fixtureClass(SS_RESULT, listOf(ssResult())),
    ssTypes(),
    fixtureClass(SS_SECTION, listOf(ssSection())),
    fixtureClass(SS_LAUNCHER, listOf(ssLauncher())),
)

private fun MutableMethod.ssCode() = implementation!!.instructions.toList()

private fun Instruction.ssReference() = (this as? ReferenceInstruction)?.reference?.toString()

private fun Instruction.ssRange() = (this as RegisterRangeInstruction).let { it.startRegister until it.startRegister + it.registerCount }.toList()

private fun Instruction.ssKind() = listOf(opcode, (this as? NarrowLiteralInstruction)?.narrowLiteral, ssReference())

class SearchSectionsTest {
    private fun hook(key: String, method: MutableMethod) = injectControl(key, mapOf(key to listOf(method)))

    @Test fun theFindersAndTheirMirrorTakeTheStockHooks() {
        val found = mirroredControls(searchSectionsFixture())
        assertEquals(setOf(SYNTHETIC_SEARCH_SECTIONS), found.getValue(SEARCH_SECTIONS).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_SEARCH_ITEMS), found.getValue(SEARCH_ITEMS).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_AI_CHAT_OPEN), found.getValue(AI_CHAT_OPEN).map { it.hookId() }.toSet())
    }

    @Test fun theSectionsGoThroughTheExtensionAndBackIntoAnImmutableList() {
        val method = ssResult()
        val before = method.ssCode()
        hook(SEARCH_SECTIONS, method)
        val code = method.ssCode()
        assertEquals(before.size + SS_HOOK_SIZE, code.size)
        assertEquals(Opcode.IF_EQZ, code[0].opcode)
        assertEquals(1, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(SEARCH_SECTIONS_CALL, code[1].ssReference())
        assertEquals(listOf(1), code[1].ssRange())
        assertEquals(Opcode.MOVE_RESULT_OBJECT, code[2].opcode)
        assertEquals(1, (code[2] as OneRegisterInstruction).registerA)
        assertEquals(SEARCH_COPY_LIST, code[3].ssReference())
        assertEquals(listOf(1), code[3].ssRange())
        assertEquals(1, (code[4] as OneRegisterInstruction).registerA)
        assertEquals(before.map { it.ssKind() }, code.drop(SS_HOOK_SIZE).map { it.ssKind() })
    }

    @Test fun theListRegisterIsReadFromTheParametersWhateverTheLocals() {
        val method = ssResult(locals = 6)
        hook(SEARCH_SECTIONS, method)
        val code = method.ssCode()
        assertEquals(7, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(listOf(7), code[1].ssRange())
    }

    /** Hide Meta AI, Hide Suggested and Hide recent reels all ride the one constructor, and it gets one hook. */
    @Test fun aSecondControlOnTheSameConstructorLeavesItAsItIs() {
        val method = ssResult()
        val size = method.ssCode().size
        hook(SEARCH_SECTIONS, method)
        hook(SEARCH_SECTIONS, method)
        hook(SEARCH_SECTIONS, method)
        assertEquals(size + SS_HOOK_SIZE, method.ssCode().size)
    }

    @Test fun theRowsGoThroughWithTheirSectionsType() {
        val method = ssSection()
        val before = method.ssCode()
        hook(SEARCH_ITEMS, method)
        hook(SEARCH_ITEMS, method)
        val code = method.ssCode()
        assertEquals(before.size + SS_HOOK_SIZE, code.size)
        assertEquals(2, (code[0] as OneRegisterInstruction).registerA)
        assertEquals(SEARCH_ITEMS_CALL, code[1].ssReference())
        assertEquals(listOf(1, 2), code[1].ssRange(), "The type and the rows, side by side")
        assertEquals(2, (code[2] as OneRegisterInstruction).registerA)
        assertEquals(SEARCH_COPY_LIST, code[3].ssReference())
        assertEquals(before.map { it.ssKind() }, code.drop(SS_HOOK_SIZE).map { it.ssKind() })
    }

    @Test fun theLauncherSaysHandledForABlockedChatAndOtherwiseRunsAsItWas() {
        val method = ssLauncher()
        val before = method.ssCode()
        hook(AI_CHAT_OPEN, method)
        hook(AI_CHAT_OPEN, method)
        val code = method.ssCode()
        assertEquals(before.size + SS_HOOK_SIZE, code.size)
        assertEquals(AI_CHAT_OPEN_CALL, code[0].ssReference())
        assertEquals(listOf(7), code[0].ssRange(), "The ThreadViewParams parameter")
        assertEquals(Opcode.MOVE_RESULT, code[1].opcode)
        assertEquals(0, (code[1] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_EQZ, code[2].opcode)
        assertEquals(1, (code[3] as NarrowLiteralInstruction).narrowLiteral)
        assertEquals(Opcode.RETURN, code[4].opcode)
        assertEquals(before.map { it.ssKind() }, code.drop(SS_HOOK_SIZE).map { it.ssKind() })
    }

    @Test fun aLauncherWithNoLocalForTheAnswerIsRefused() {
        val method = ssLauncher(locals = 0)
        assertEquals(null, method.aiChatOpenParams())
        assertTrue(findAiChatOpen(listOf(fixtureClass(SS_LAUNCHER, listOf(method)))).isEmpty())
        assertFailsWith<PatchException> { method.validateAiChatOpen() }
    }

    @Test fun onlyTheStockShapesAreTaken() {
        // Another result class than the people source's.
        val other = listOf(fixtureClass(SS_SOURCE, listOf(peopleSearchMethod())), fixtureClass("LX/Other;", listOf(ssResult(SYNTHETIC_SEARCH_SECTIONS.replace(SS_RESULT, "LX/Other;")))))
        assertTrue(findSearchSections(other).isEmpty())
        // No people source to name the result class.
        assertTrue(findSearchSections(searchSectionsFixture(source = false)).isEmpty())
        // Two enums naming the section types, or none.
        assertTrue(findSearchItems(searchSectionsFixture() + ssTypes(type = "LX/N0b;")).isEmpty())
        assertTrue(findSearchItems(searchSectionsFixture().filter { it.type != SS_TYPE } + ssTypes(anchor = "NULL_STATE_GROUPS")).isEmpty())
        // A constructor whose rows don't follow the type.
        val swapped = "$SS_SECTION-><init>($IMMUTABLE_LIST$SS_TYPE${SS_MAP}Ljava/lang/Integer;Ljava/lang/Integer;Ljava/lang/String;Z)V"
        assertEquals(null, fixtureMethod(swapped, "return-void", registers = 8, flags = SS_CONSTRUCTOR).searchItemsSite())
        // 587's constructor, one Integer short of 588's.
        val older = "$SS_SECTION-><init>($SS_TYPE$IMMUTABLE_LIST${SS_MAP}Ljava/lang/Integer;Ljava/lang/String;Z)V"
        assertEquals(null, fixtureMethod(older, "return-void", registers = 7, flags = SS_CONSTRUCTOR).searchItemsSite())
        // A launcher that names another spec.
        assertTrue(findAiChatOpen(listOf(fixtureClass(SS_LAUNCHER, listOf(ssLauncher(spec = "messaging.navigation.Other")))))
            .isEmpty())
        assertFailsWith<PatchException> { fixtureMethod("LX/Other;-><init>()V", "return-void", registers = 1, flags = SS_CONSTRUCTOR).validateSearchSections() }
    }
}
