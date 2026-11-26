package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.DexFileFactory
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.Opcodes
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableExceptionHandler
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableTryBlock
import java.nio.file.Files
import java.nio.file.Path
import org.junit.jupiter.api.Assumptions.assumeTrue
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

private const val BADGE_HOST = "LX/7QS;"
internal const val SYNTHETIC_UNREAD_BADGE = "$BADGE_HOST->A0D(Ljava/lang/String;Ljava/lang/String;IIIII)V"

/**
 * Build 347617503's badge count, cut down: the trace it opens with, its log line with the total copied out of the
 * fourth parameter, and the total it goes on to add up. Its 27 registers put p0 in v19 and the total in v23.
 */
private val BADGE_BODY = """
    const-string v4, "Badging - UnreadInboxItemsCalculator - recalc source="
    move-object/from16 v8, v19
    const-string v1, "$BADGE_COUNT_TRACE"
    new-instance v3, Ljava/lang/StringBuilder;
    const-string v0, "$BADGE_TOTAL_LOG"
    invoke-virtual {v3, v0}, Ljava/lang/StringBuilder;->append(Ljava/lang/String;)Ljava/lang/StringBuilder;
    move/from16 v1, v23
    invoke-virtual {v3, v1}, Ljava/lang/StringBuilder;->append(I)Ljava/lang/StringBuilder;
    int-to-long v2, v1
    return-void
""".trimIndent()

/** Smali bodies are trimmed flush left, so a pattern that carries indentation would quietly leave the body stock. */
private fun String.badgeChanged(target: String, replacement: String): String {
    assertTrue(contains(target), "the fixture body no longer contains: $target")
    return replace(target, replacement)
}

private fun badgeCount(body: String = BADGE_BODY, id: String = SYNTHETIC_UNREAD_BADGE, registers: Int = 27,
    flags: Int = AccessFlags.PUBLIC.value): MutableMethod = fixtureMethod(id, body, registers = registers, flags = flags)

internal fun unreadBadgeFixture(counts: List<MutableMethod> = listOf(badgeCount())): List<MutableClass> =
    counts.groupBy { it.definingClass }.map { (type, methods) -> fixtureClass(type, methods) }

private fun MutableMethod.badgeInstructions(): List<Instruction> = implementation!!.instructions.toList()

/** The count with a catch-all try over its first instruction. */
private fun badgeTried(): MutableMethod {
    val plain = badgeCount()
    val code = plain.badgeInstructions()
    val tried = ImmutableMethodImplementation(27, code, listOf(ImmutableTryBlock(0, code[0].codeUnits,
        listOf(ImmutableExceptionHandler(null, code.dropLast(1).sumOf { it.codeUnits })))), null)
    return MutableMethod(ImmutableMethod(plain.definingClass, plain.name, plain.parameters, plain.returnType, plain.accessFlags, null, null, tried))
}

/** The total goes through the extension first thing, and nothing stock moves or changes. */
private fun assertBadgeHooked(before: List<Instruction>, after: List<Instruction>, first: Int, label: String) {
    val call = after[0]
    assertEquals(Opcode.INVOKE_STATIC_RANGE, call.opcode, label)
    assertEquals(BADGE_TOTAL_HELPER, (call as ReferenceInstruction).reference.toString(), label)
    assertEquals(first, (call as RegisterRangeInstruction).startRegister, label)
    assertEquals(BADGE_COUNT_PARAMETERS.size + 1, call.registerCount, label)
    assertEquals(Opcode.MOVE_RESULT, after[1].opcode, label)
    assertEquals(first + 1 + BADGE_TOTAL_PARAMETER, (after[1] as OneRegisterInstruction).registerA, label)
    assertStockKept(before, after.drop(2), label)
}

class UnreadBadgeTest {
    private fun found(classes: List<MutableClass>) = mirroredControls(classes).getValue(UNREAD_BADGE).map { it.hookId() }.toSet()

    @Test fun theBadgeCountIsFoundByItsTrace() {
        assertEquals(setOf(SYNTHETIC_UNREAD_BADGE), found(unreadBadgeFixture()))
        validateControls(mirroredControls(unreadBadgeFixture()), setOf(UNREAD_BADGE))
        assertEquals(setOf(SYNTHETIC_UNREAD_BADGE), SYNTHETIC_PROFILE.hooks.getValue(UNREAD_BADGE))
        assertEquals(1, BASE_PROFILE.hooks.getValue(UNREAD_BADGE).size)
    }

    @Test fun lookalikesAreNotTheCount() {
        val other = "LX/7QT;->A0D(Ljava/lang/String;Ljava/lang/String;IIIII)V"
        val cases = mapOf(
            "a static count" to listOf(badgeCount(flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value, registers = 26)),
            "a count with one number fewer" to listOf(badgeCount(id = "$BADGE_HOST->A0D(Ljava/lang/String;Ljava/lang/String;IIII)V")),
            "one with no trace" to listOf(badgeCount(BADGE_BODY.badgeChanged(BADGE_COUNT_TRACE, "UnreadInboxItemsCalculator"))),
            // The extension counts again by the count's shape, so a second method of that shape on the class is refused.
            "a second method of its shape" to listOf(badgeCount(), badgeCount("return-void", id = "$BADGE_HOST->A0E(Ljava/lang/String;Ljava/lang/String;IIIII)V")),
            "two counts" to listOf(badgeCount(), badgeCount(id = other)),
        )
        for ((case, counts) in cases) assertEquals(emptySet(), found(unreadBadgeFixture(counts)), case)
    }

    @Test fun aChangedCountIsRefused() {
        val cases = mapOf(
            "the total logged from another parameter" to badgeCount(BADGE_BODY.badgeChanged("move/from16 v1, v23", "move/from16 v1, v22")),
            "the total logged later on" to badgeCount(BADGE_BODY.badgeChanged("move/from16 v1, v23", "nop\nnop\nnop\nmove/from16 v1, v23")),
            "nothing logged" to badgeCount(BADGE_BODY.badgeChanged("const-string v0, \"$BADGE_TOTAL_LOG\"", "const-string v0, \" open=\"")),
            "a jump onto its first instruction" to badgeCount(":top\n" + BADGE_BODY.badgeChanged("return-void", "if-eqz v1, :top\nreturn-void")),
            "a try over its first instruction" to badgeTried(),
        )
        for ((case, method) in cases) assertFailsWith<PatchException>(case) { method.validateUnreadBadge() }
    }

    @Test fun messengersTotalGoesThroughTheExtensionFirstThing() {
        val method = badgeCount()
        val before = method.badgeInstructions()
        assertEquals(19, method.validateUnreadBadge())
        injectControl(UNREAD_BADGE, mapOf(UNREAD_BADGE to listOf(method)))
        assertBadgeHooked(before, method.badgeInstructions(), 19, "fixture")
    }

    /** Both read-here patches ask for the badge, and it has to go in once however many of them do. */
    @Test fun aSecondPatchFindsTheHookAlreadyIn() {
        val method = badgeCount()
        injectControl(LOCAL_READ, mapOf(UNREAD_BADGE to listOf(method)))
        val once = method.badgeInstructions()
        assertTrue(method.unreadBadgeHooked())
        injectControl(MARK_READ_LOCALLY, mapOf(UNREAD_BADGE to listOf(method)))
        assertEquals(once, method.badgeInstructions())
    }

    @Test fun everySupportedBuildsCountTakesTheHook() {
        val root = System.getenv("HUSH_NATIVE_FIXTURES")
        assumeTrue(root != null, "Set HUSH_NATIVE_FIXTURES to the exact stock fixture directory")
        val apks = Files.list(Path.of(root!!)).use { it.filter { p -> p.toString().endsWith(".apk") }.sorted().toList() }
        assertEquals(controlProfiles.size, apks.size)
        for (apk in apks) {
            val code = apk.fileName.toString().substringBeforeLast(".apk").substringAfterLast('-')
            val dex = DexFileFactory.loadDexContainer(apk.toFile(), Opcodes.forApi(35))
            val counts = findUnreadBadge(dex.dexEntryNames.flatMap { dex.getEntry(it)!!.dexFile.classes })
            assertEquals(1, counts.size, code)
            assertEquals(controlProfiles.getValue(code.toInt()).hooks.getValue(UNREAD_BADGE), setOf(counts.single().hookId()), code)
            val method = MutableMethod(counts.single())
            val before = method.badgeInstructions()
            val first = method.validateUnreadBadge()
            method.injectUnreadBadge()
            assertBadgeHooked(before, method.badgeInstructions(), first, code)
        }
    }
}
