package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import kotlin.test.AfterTest
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertTrue

/** The pinned messages loader and a second banner behind a gate of the same shape, as 587 names them. */
private const val PB_LOADER = "LX/4hP;"
private const val PB_OTHER = "LX/AUm;"
private const val PB_HOOK_SIZE = 2

internal const val SYNTHETIC_PINNED_BAR = "$BANNER_FETCH->A02()LX/5aW;"

/** A banner loader whose static initializer names [source]. */
private fun pbLoader(type: String = PB_LOADER, source: String = PINNED_BAR_SOURCE) = fixtureClass(type, listOf(
    fixtureMethod("$type-><clinit>()V", "const-string v0, \"$source\"\nreturn-void", registers = 1,
        flags = AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value),
))

/**
 * The fetch cut down to two gated banners: a thread key check that jumps straight to the banner, and otherwise a second
 * check that falls into it. v1 is the list, v2 the session and v3 the thread key.
 */
private fun pbFetch(first: String = PB_LOADER, second: String = PB_OTHER, check: String = "A1K") = fixtureMethod(SYNTHETIC_PINNED_BAR, """
    new-instance v1, Ljava/util/ArrayList;
    invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
    invoke-virtual {v3}, $THREAD_KEY_TYPE->$check()Z
    move-result v0
    if-nez v0, :first
    invoke-virtual {v3}, $THREAD_KEY_TYPE->A1r()Z
    move-result v0
    if-eqz v0, :second_gate
    :first
    new-instance v0, $first
    invoke-direct {v0, v2, v3}, $first-><init>($FB_USER_SESSION$THREAD_KEY_TYPE)V
    invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    :second_gate
    invoke-virtual {v3}, $THREAD_KEY_TYPE->A1q()Z
    move-result v0
    if-nez v0, :second
    const/4 v0, 0x0
    if-eqz v0, :done
    :second
    new-instance v0, $second
    invoke-direct {v0, v2, v3}, $second-><init>($FB_USER_SESSION$THREAD_KEY_TYPE)V
    invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
    :done
    const/4 v0, 0x0
    return-object v0
""".trimIndent(), registers = 5)

internal fun pinnedBarFixture(): List<MutableClass> =
    listOf(fixtureClass(BANNER_FETCH, listOf(pbFetch())), pbLoader(), pbLoader(PB_OTHER, "TranslationBannerDataSource"))

private fun MutableMethod.pbCode() = implementation!!.instructions.toList()

private fun Instruction.pbReference() = (this as? ReferenceInstruction)?.reference?.toString()

class PinnedBarTest {
    @AfterTest fun forget() {
        pinnedBarLoader = null
    }

    private fun hook(method: MutableMethod) {
        pinnedBarLoader = PB_LOADER
        injectControl(PINNED_BAR, mapOf(PINNED_BAR to listOf(method)))
    }

    @Test fun theFinderAndItsMirrorTakeTheStockFetch() {
        assertEquals(PB_LOADER, resolvePinnedBarLoader(pinnedBarFixture()))
        assertEquals(setOf(SYNTHETIC_PINNED_BAR), findPinnedBar(pinnedBarFixture()).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_PINNED_BAR), mirroredControls(pinnedBarFixture()).getValue(PINNED_BAR).map { it.hookId() }.toSet())
    }

    /** The pinned banner's own check goes through the extension; the other banner's check, of the same shape, doesn't. */
    @Test fun onlyThePinnedBannersCheckGoesThroughTheExtension() {
        val method = pbFetch()
        val before = method.pbCode()
        hook(method)
        val code = method.pbCode()
        assertEquals(before.size + PB_HOOK_SIZE, code.size)
        assertEquals("$THREAD_KEY_TYPE->A1K()Z", code[2].pbReference())
        assertEquals(Opcode.MOVE_RESULT, code[3].opcode)
        assertEquals(PINNED_BAR_CALL, code[4].pbReference())
        assertEquals(listOf(0), (code[4] as RegisterRangeInstruction).let { it.startRegister until it.startRegister + it.registerCount }.toList())
        assertEquals(Opcode.MOVE_RESULT, code[5].opcode)
        assertEquals(0, (code[5] as OneRegisterInstruction).registerA)
        assertEquals(Opcode.IF_NEZ, code[6].opcode)
        assertEquals(1, code.count { it.pbReference() == PINNED_BAR_CALL })
        // The branch still lands on the pinned loader.
        assertEquals(PB_LOADER, code[code.branchTarget(6)].pbReference())
        assertEquals(before.map { it.opcode }, code.filterIndexed { i, _ -> i != 4 && i != 5 }.map { it.opcode })
    }

    /** 588's fetch, cut down: one thread key check whose no skips the pinned loader with the if-eqz right above it. */
    private fun pb588Fetch(extraJump: Boolean = false) = fixtureMethod(SYNTHETIC_PINNED_BAR, """
        new-instance v1, Ljava/util/ArrayList;
        invoke-direct {v1}, Ljava/util/ArrayList;-><init>()V
        ${if (extraJump) "if-nez v2, :made" else "nop"}
        invoke-virtual {v3}, $THREAD_KEY_TYPE->A1J()Z
        move-result v0
        if-eqz v0, :skip
        :made
        new-instance v0, $PB_LOADER
        invoke-direct {v0, v2, v3}, $PB_LOADER-><init>($FB_USER_SESSION$THREAD_KEY_TYPE)V
        invoke-virtual {v1, v0}, Ljava/util/AbstractCollection;->add(Ljava/lang/Object;)Z
        :skip
        const/4 v0, 0x0
        return-object v0
    """.trimIndent(), registers = 5)

    @Test fun a588FetchThatSkipsTheLoaderOnANoGoesThroughTheExtension() {
        val classes = listOf(fixtureClass(BANNER_FETCH, listOf(pb588Fetch())), pbLoader())
        assertEquals(setOf(SYNTHETIC_PINNED_BAR), findPinnedBar(classes).map { it.hookId() }.toSet())
        assertEquals(setOf(SYNTHETIC_PINNED_BAR), mirroredControls(classes).getValue(PINNED_BAR).map { it.hookId() }.toSet())
        val method = pb588Fetch()
        val before = method.pbCode()
        hook(method)
        val code = method.pbCode()
        assertEquals(before.size + PB_HOOK_SIZE, code.size)
        assertEquals("$THREAD_KEY_TYPE->A1J()Z", code[3].pbReference())
        assertEquals(PINNED_BAR_CALL, code[5].pbReference())
        assertEquals(Opcode.MOVE_RESULT, code[6].opcode)
        assertEquals(Opcode.IF_EQZ, code[7].opcode)
        // A yes falls into the loader; a no still skips it.
        assertEquals(PB_LOADER, code[8].pbReference())
        assertEquals(Opcode.CONST_4, code[code.branchTarget(7)].opcode)
        // Anything else landing on the loader leaves the gate unproven.
        assertEquals(null, pb588Fetch(extraJump = true).pinnedBarGate(PB_LOADER))
    }

    @Test fun aSecondPassLeavesTheHookAsItIs() {
        val method = pbFetch()
        hook(method)
        val size = method.pbCode().size
        method.validatePinnedBar()
        hook(method)
        assertEquals(size, method.pbCode().size)
    }

    @Test fun onlyTheStockShapeIsTaken() {
        // No loader names the pinned source, or two do.
        assertTrue(findPinnedBar(listOf(fixtureClass(BANNER_FETCH, listOf(pbFetch())), pbLoader(source = "Other"))).isEmpty())
        assertTrue(findPinnedBar(pinnedBarFixture() + pbLoader("LX/4hQ;")).isEmpty())
        // The pinned banner isn't made in the fetch, or isn't behind a thread key check.
        assertTrue(findPinnedBar(listOf(fixtureClass(BANNER_FETCH, listOf(pbFetch(first = "LX/Other;"))), pbLoader())).isEmpty())
        val flagGate = fixtureMethod(SYNTHETIC_PINNED_BAR, """
            invoke-static {v3}, LX/1jx;->A00(Ljava/lang/Object;)Z
            move-result v0
            if-nez v0, :made
            const/4 v0, 0x0
            return-object v0
            :made
            new-instance v0, $PB_LOADER
            return-object v0
        """.trimIndent(), registers = 4)
        assertEquals(null, flagGate.pinnedBarGate(PB_LOADER))
        // A fetch in another class.
        assertTrue(findPinnedBar(listOf(fixtureClass("LX/Other;", listOf(pbFetch())), pbLoader())).isEmpty())
        // Without the loader found with the hooks there's nothing to go on.
        assertFailsWith<PatchException> { pbFetch().validatePinnedBar() }
    }
}
