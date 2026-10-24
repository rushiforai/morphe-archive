package app.morphe.patches.facebook.layout.theme

import app.morphe.ExtensionDex
import app.morphe.PatchContexts
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21c
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction31i
import com.android.tools.smali.dexlib2.immutable.reference.ImmutableFieldReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The AMOLED sweep over colour literals written in code.
 *
 * <p>A `const-wide/32` carries its value as a narrow literal as well, so a dark grey kept in a
 * long matched, and the sweep put a narrow `const` in its place. ART then rejected the class it
 * sat in: on 580 with every patch on, a static initializer failed with "register v0 has type
 * IntegerConstant but expected Long (Low Half)". The width has to survive the rewrite.
 *
 * <p>Issue #214: each grey reads the page's colour from AmoledTheme, so the Background color row
 * reaches it, where it used to get the patch's colour as a literal.
 */
class AmoledColorLiteralTest {
    /** 0xFF1D1B20: opaque, every channel at most 0x2A, and five apart at most. */
    private val darkGrey = -14869728

    /** 0xFF0A2A0A: every channel dark enough, but green, so a banner that keeps its colour. */
    private val darkGreen = 0xFF0A2A0A.toInt()

    private val black = -0x1000000

    private fun palette(vararg instructions: Instruction): MutableMethod = MutableMethod(
        ImmutableMethod(
            "Lcom/example/Palette;",
            "<clinit>",
            emptyList(),
            "V",
            AccessFlags.STATIC.value or AccessFlags.CONSTRUCTOR.value,
            null,
            null,
            ImmutableMethodImplementation(2, instructions.toList(), null, null),
        ),
    )

    private fun store(opcode: Opcode, type: String) =
        ImmutableInstruction21c(opcode, 0, ImmutableFieldReference("Lcom/example/Palette;", "surface", type))

    private fun Instruction.referenceText() = (this as? ReferenceInstruction)?.reference?.toString()

    @Test
    fun aLongColourStaysALong() {
        val method = palette(
            ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, darkGrey),
            store(Opcode.SPUT_WIDE, "J"),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )

        assertEquals(1, method.blackenDarkColors())
        val written = method.implementation!!.instructions.first()
        assertEquals(Opcode.SGET_WIDE, written.opcode)
        assertEquals(0, (written as OneRegisterInstruction).registerA)
        assertEquals(PAGE_WIDE_FIELD, written.referenceText())
    }

    @Test
    fun anIntColourStaysAnInt() {
        val method = palette(
            ImmutableInstruction31i(Opcode.CONST, 1, darkGrey),
            store(Opcode.SPUT, "I"),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )

        assertEquals(1, method.blackenDarkColors())
        val written = method.implementation!!.instructions.first()
        assertEquals(Opcode.SGET, written.opcode)
        assertEquals(1, (written as OneRegisterInstruction).registerA)
        assertEquals(PAGE_FIELD, written.referenceText())
    }

    /** Facebook's own black isn't a grey the sweep reads over, as route two leaves it. */
    @Test
    fun facebooksBlackStaysBlack() {
        val method = palette(
            ImmutableInstruction31i(Opcode.CONST, 0, darkGrey),
            ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, darkGrey),
            ImmutableInstruction31i(Opcode.CONST, 1, black),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )

        assertEquals(2, method.blackenDarkColors())
        val (int, long, kept) = method.implementation!!.instructions.take(3)
        assertEquals(PAGE_FIELD, int.referenceText())
        assertEquals(PAGE_WIDE_FIELD, long.referenceText())
        assertEquals(Opcode.CONST, kept.opcode)
        assertEquals(black.toLong(), (kept as WideLiteralInstruction).wideLiteral)
    }

    @Test
    fun aDarkColourWithAHueIsLeftAlone() {
        val method = palette(
            ImmutableInstruction31i(Opcode.CONST_WIDE_32, 0, darkGreen),
            store(Opcode.SPUT_WIDE, "J"),
            ImmutableInstruction10x(Opcode.RETURN_VOID),
        )

        assertEquals(0, method.blackenDarkColors())
        val kept = method.implementation!!.instructions.first()
        assertEquals(Opcode.CONST_WIDE_32, kept.opcode)
        assertEquals(darkGreen.toLong(), (kept as WideLiteralInstruction).wideLiteral)
    }

    /** Issue #214: the Background color row's table, in AmoledResources.writtenColours's form. */
    @Test
    fun theRowsTableListsWhatRouteTwoWrote() {
        val ids = mapOf("bg" to 0x7f060010L, "card" to 0x7f060002L, "night" to 0x7f060005L,
            "points" to 0x7f060008L, "pointsAway" to 0x7f060009L, "noId" to null, "nightRef" to 0x7f06000aL)
        val table = writtenColoursTable(
            wrote = setOf("bg", "card", "noId"),
            wroteAtNight = setOf("card", "night", "nightRef", "points"),
            literals = mapOf("bg" to 0xFF242526.toInt(), "card" to 0xFF3A3B3C.toInt(), "night" to 0xFFFFFFFF.toInt(),
                "other" to 0xFFF0F2F5.toInt()),
            references = mapOf("points" to "bg", "pointsAway" to "other", "nightRef" to "other", "lost" to "nowhere"),
            id = { ids[it] },
        )

        assertEquals("7f060002=p/p;7f060005=ffffffff/p;7f060008=p/p;7f06000a=fff0f2f5/p;7f060010=p", table)
    }

    /** The extension the build merges in has the fields the sweep reads and the stubs the patch fills. */
    @Test
    fun theExtensionHasWhatTheRowNeeds() {
        val amoled = PAGE_FIELD.substringBefore("->")
        val resources = "Lapp/morphe/extension/facebook/theme/AmoledResources;"
        val app = PatchContexts.of(listOf(ExtensionDex.classDef(amoled), ExtensionDex.classDef(resources)))
        with(app) {
            checkPageFields()
            fillWrittenColours("7f060010=p")
        }
        assertTrue("AmoledTheme.load()", ExtensionDex.classDef(amoled).methods.any {
            it.name == "load" && it.parameterTypes.isEmpty() && it.returnType == "V" && AccessFlags.STATIC.isSet(it.accessFlags)
        })
    }
}
