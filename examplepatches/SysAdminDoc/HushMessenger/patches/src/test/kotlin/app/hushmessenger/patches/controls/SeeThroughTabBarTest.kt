package app.hushmessenger.patches.controls

import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableClass
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import kotlin.test.Test
import kotlin.test.assertEquals
import kotlin.test.assertFailsWith
import kotlin.test.assertNull
import kotlin.test.assertTrue

private const val PILL_OWNER = "LX/1zg;"
internal const val SYNTHETIC_FLOATING_PILL = "$PILL_OWNER->A04(LX/W2F;Lcom/facebook/mig/scheme/interfaces/MigColorScheme;I)V"

/**
 * The pill paint as 588 writes it, cut down: the colors go into a holder, the holder is compared with the last one, and
 * on a change the fill, the hairline, the shadow and then the selected tab's highlight are each read back and set. The
 * out of range tab logs and comes back to the paint.
 */
private fun pillBody(stroke: String = "iget v0, v8, LX/3NB;->A06:I", beforeStroke: String = "") = """
    iget-object v10, p1, LX/W2F;->A0A:LX/W2A;
    if-ltz p3, :out
    :paint
    invoke-interface {p2}, Lcom/facebook/mig/scheme/interfaces/MigColorScheme;->BZv()I
    move-result v5
    invoke-interface {p2}, Lcom/facebook/mig/scheme/interfaces/MigColorScheme;->Ch1()I
    move-result v4
    new-instance v8, LX/3NB;
    invoke-direct {v8}, Ljava/lang/Object;-><init>()V
    iput v5, v8, LX/3NB;->A04:I
    iput v5, v8, LX/3NB;->A06:I
    iput v4, v8, LX/3NB;->A03:I
    iput v5, v8, LX/3NB;->A08:I
    iget-object v0, v10, LX/W2A;->A0L:LX/3NB;
    invoke-virtual {v8, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :same
    iput-object v8, v10, LX/W2A;->A0L:LX/3NB;
    iget-object v2, v10, LX/W2A;->A0i:Landroid/graphics/drawable/GradientDrawable;
    iget v0, v8, LX/3NB;->A04:I
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    iget v1, v10, LX/W2A;->A0a:I
    $stroke
    $beforeStroke
    invoke-virtual {v2, v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    iget v0, v8, LX/3NB;->A08:I
    invoke-virtual {v10, v0}, Landroid/view/View;->setOutlineAmbientShadowColor(I)V
    invoke-virtual {v10, v0}, Landroid/view/View;->setOutlineSpotShadowColor(I)V
    iget-object v1, v10, LX/W2A;->A0g:Landroid/graphics/drawable/GradientDrawable;
    iget v0, v8, LX/3NB;->A03:I
    invoke-virtual {v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    :same
    return-void
    :out
    const-string v1, "FloatingTabBarView"
    const-string v0, "$FLOATING_PILL_LOG"
    invoke-static {v1, v0}, LX/0sS;->A0K(Ljava/lang/String;Ljava/lang/String;)V
    goto :paint
""".trimIndent().lines().filter { it.isNotBlank() }.joinToString("\n")

private fun pillPaint(body: String = pillBody(), id: String = SYNTHETIC_FLOATING_PILL): MutableMethod =
    fixtureMethod(id, body, registers = 16)

private const val PILL_VIEW = "LX/Wp4;"
private const val SPLIT_PAINT = "$PILL_VIEW->A0Q(Lcom/facebook/mig/scheme/interfaces/MigColorScheme;Ljava/util/List;I)V"
private const val SPLIT_LOGGER = "LX/1jx;->A0b(LX/1jx;Z)V"

/**
 * The other way 588's builds come (347617497, 513, 566 and 583): the paint stays on the bar's view, with the shadow behind
 * an Android version check, and the method that logs the out of range tab calls it.
 */
private fun splitPaint(): MutableMethod = fixtureMethod(SPLIT_PAINT, """
    invoke-interface {p1}, Lcom/facebook/mig/scheme/interfaces/MigColorScheme;->Ba5()I
    move-result v5
    new-instance v9, LX/XDJ;
    invoke-direct {v9}, Ljava/lang/Object;-><init>()V
    iput v5, v9, LX/XDJ;->A04:I
    iput v5, v9, LX/XDJ;->A06:I
    iput v5, v9, LX/XDJ;->A08:I
    iget-object v0, p0, $PILL_VIEW->A0S:LX/XDJ;
    invoke-virtual {v9, v0}, Ljava/lang/Object;->equals(Ljava/lang/Object;)Z
    move-result v6
    if-nez v6, :same
    iput-object v9, p0, $PILL_VIEW->A0S:LX/XDJ;
    iget-object v2, p0, $PILL_VIEW->A0i:Landroid/graphics/drawable/GradientDrawable;
    iget v0, v9, LX/XDJ;->A04:I
    invoke-virtual {v2, v0}, Landroid/graphics/drawable/GradientDrawable;->setColor(I)V
    iget v1, p0, $PILL_VIEW->A0a:I
    iget v0, v9, LX/XDJ;->A06:I
    invoke-virtual {v2, v1, v0}, Landroid/graphics/drawable/GradientDrawable;->setStroke(II)V
    sget v1, Landroid/os/Build${'$'}VERSION;->SDK_INT:I
    const/16 v0, 0x1c
    if-lt v1, v0, :old
    iget v0, v9, LX/XDJ;->A08:I
    invoke-virtual {p0, v0}, $PILL_VIEW->setOutlineAmbientShadowColor(I)V
    invoke-virtual {p0, v0}, $PILL_VIEW->setOutlineSpotShadowColor(I)V
    :old
    :same
    return-void
""".trimIndent(), registers = 14)

private fun splitFixture(): List<MutableClass> = listOf(
    fixtureClass("LX/1jx;", listOf(fixtureMethod(SPLIT_LOGGER, """
        if-eqz p1, :out
        invoke-virtual {v3, v4, v5, v6}, $SPLIT_PAINT
        return-void
        :out
        const-string v1, "FloatingTabBarView"
        const-string v0, "$FLOATING_PILL_LOG"
        invoke-static {v1, v0}, LX/0sS;->A0K(Ljava/lang/String;Ljava/lang/String;)V
        return-void
    """.trimIndent(), registers = 8, flags = AccessFlags.PUBLIC.value or AccessFlags.STATIC.value))),
    fixtureClass(PILL_VIEW, listOf(splitPaint()), superclass = "Landroid/view/View;"),
)

/** The paint beside a method of the same class that logs the same tag but paints nothing. */
internal fun floatingPillFixture(): List<MutableClass> = listOf(
    fixtureClass(PILL_OWNER, listOf(
        pillPaint(),
        fixtureMethod("$PILL_OWNER->A03()Z", """
            const-string v0, "FloatingTabBarView"
            const/4 v0, 0x0
            return v0
        """.trimIndent(), 2),
    )),
)

private fun MutableMethod.code() = implementation!!.instructions.toList()

private fun MutableMethod.field(at: Int) = ((code()[at] as ReferenceInstruction).reference as FieldReference).name

/** #194: the floating pill's fill, hairline and shadow go through SeeThroughTabBar.color as they're read back. */
class SeeThroughTabBarTest {
    @Test fun theFinderAndItsMirrorTakeTheStockPaint() {
        assertEquals(setOf(SYNTHETIC_FLOATING_PILL), mirroredControls(floatingPillFixture()).getValue(FLOATING_PILL).map { it.hookId() }.toSet())
        assertEquals(listOf(SYNTHETIC_FLOATING_PILL), findFloatingPill(floatingPillFixture()).map { it.hookId() })
    }

    @Test fun aPaintLeftOnTheBarsViewIsFoundThroughTheMethodThatLogs() {
        assertEquals(setOf(SPLIT_PAINT), mirroredControls(splitFixture()).getValue(FLOATING_PILL).map { it.hookId() }.toSet())
        assertEquals(listOf(SPLIT_PAINT), findFloatingPill(splitFixture()).map { it.hookId() })
        val method = splitPaint()
        injectControl(FLOATING_PILL, mapOf(FLOATING_PILL to listOf(method)))
        val code = method.code()
        val calls = code.indices.filter { (code[it] as? ReferenceInstruction)?.reference?.toString() == FLOATING_PILL_CALL }
        assertEquals(listOf("A04", "A06", "A08"), calls.map { method.field(it - 1) })
        // The same paint with nothing logging the out of range tab around it is some other view's.
        val alone = listOf(fixtureClass(PILL_VIEW, listOf(splitPaint()), superclass = "Landroid/view/View;"))
        assertEquals(emptyList(), findFloatingPill(alone))
        assertEquals(emptyList(), mirroredControls(alone).getValue(FLOATING_PILL))
    }

    @Test fun everyBuildHooksOnePaint() {
        for ((code, profile) in controlProfiles) {
            assertEquals(1, profile.hooks.getValue(FLOATING_PILL).size, message = code.toString())
        }
    }

    @Test fun theFillTheHairlineAndTheShadowGoThroughTheExtensionAndTheHighlightDoesnt() {
        val method = pillPaint()
        val reads = method.pillReads()!!
        assertEquals(listOf("A04", "A06", "A08"), reads.map { method.field(it) })
        injectControl(FLOATING_PILL, mapOf(FLOATING_PILL to listOf(method)))
        val code = method.code()
        val calls = code.indices.filter { (code[it] as? ReferenceInstruction)?.reference?.toString() == FLOATING_PILL_CALL }
        assertEquals(3, calls.size, "one call per color, the two shadow calls sharing theirs")
        for (call in calls) {
            val read = code[call - 1]
            assertEquals(Opcode.IGET, read.opcode)
            val register = (read as OneRegisterInstruction).registerA
            assertEquals(Opcode.INVOKE_STATIC_RANGE, code[call].opcode)
            assertEquals(listOf(register, 1), (code[call] as RegisterRangeInstruction).let { listOf(it.startRegister, it.registerCount) })
            assertEquals(Opcode.MOVE_RESULT, code[call + 1].opcode)
            assertEquals(register, (code[call + 1] as OneRegisterInstruction).registerA)
        }
        assertEquals(listOf("A04", "A06", "A08"), calls.map { method.field(it - 1) })
        // The highlight's read still goes straight to its setColor.
        val highlight = code.indexOfLast { it.opcode == Opcode.IGET && ((it as ReferenceInstruction).reference as FieldReference).name == "A03" }
        assertTrue(code[highlight + 1].opcode == Opcode.INVOKE_VIRTUAL)
    }

    @Test fun aPaintItDoesntKnowRefusesTheSwitchBeforeAnyEdit() {
        val shapes = listOf(
            // The hairline's color made up on the spot rather than read back.
            pillPaint(pillBody(stroke = "const v0, 0x1f000000")),
            // A branch that lands between the hairline's read and its call.
            pillPaint(pillBody(beforeStroke = "if-eqz v1, :stroke\n:stroke")),
            // No shadow at all.
            pillPaint(pillBody().lines().filterNot { "ShadowColor" in it }.joinToString("\n")),
        )
        for (bad in shapes) {
            assertNull(bad.pillReads())
            val before = bad.code()
            assertFailsWith<PatchException> { injectControl(FLOATING_PILL, mapOf(FLOATING_PILL to listOf(bad))) }
            assertEquals(before, bad.code())
        }
        // Two paints of that shape aren't one clear hook.
        val twice = floatingPillFixture() + fixtureClass("LX/2zg;", listOf(pillPaint(id = "LX/2zg;->A04(LX/W2F;Lcom/facebook/mig/scheme/interfaces/MigColorScheme;I)V")))
        assertEquals(emptyList(), findFloatingPill(twice))
    }
}
