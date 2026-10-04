/*
 * Copyright 2026 HushGram contributors
 * https://github.com/SysAdminDoc/HushGram
 */
package app.morphe.patches.instagram.stories.ring

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.instagram.FixtureDex
import app.morphe.patches.instagram.NeutralNativePath
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.WideLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction10t
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction11x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction12x
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21ih
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21lh
import com.android.tools.smali.dexlib2.immutable.instruction.ImmutableInstruction21t
import org.junit.Assert.assertEquals
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

class StoryRingSizeHookTest {
    @Test
    fun theHookIsInTheExtension() {
        val declared = ExtensionDex.classDef(RING_SIZE.substringBefore("->")).methods
            .filter { AccessFlags.PUBLIC.isSet(it.accessFlags) && AccessFlags.STATIC.isSet(it.accessFlags) }
            .map { "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
        assertTrue("$RING_SIZE is not in the extension: $declared", RING_SIZE.substringAfter("->") in declared)
    }

    /**
     * Each of the three paths that settle the size is scaled right after its double-to-float, and
     * the two that branch to where the paths meet still land on the method's own code, so each is
     * scaled once.
     */
    @Test
    fun eachSettledSizeIsScaledOnce() {
        val context = PatchContexts.of(listOf(sizingClass()))

        val sizings = context.findRingSizes()
        assertEquals(1, sizings.size)
        assertEquals(listOf(4, 8, 10), sizings.single().settled)
        assertEquals(4, sizings.single().register)
        context.scaleRingSizes(sizings)

        assertScaled("stand-in", context.mutableClassDefBy(TYPE).methods.single { it.name == "size" })
    }

    @Test
    fun aMethodSettlingTheSizeTwiceFailsThePatch() {
        val context = PatchContexts.of(listOf(sizingClass(settles = 2)))
        assertThrows(PatchException::class.java) { context.findRingSizes() }
    }

    @Test
    fun aMethodSettlingIntoTwoRegistersFailsThePatch() {
        val context = PatchContexts.of(listOf(sizingClass(splitRegisters = true)))
        assertThrows(PatchException::class.java) { context.findRingSizes() }
    }

    /** Without 3.75 items a screen, the two sizes alone are some other part of the app. */
    @Test
    fun noMethodHoldingAllThreeFailsThePatch() {
        val context = PatchContexts.of(listOf(sizingClass(itemsLiteral = false)))
        assertThrows(PatchException::class.java) { context.findRingSizes() }
    }

    /**
     * In each declared build every method working the size out is found and scaled where it
     * settles the size. On 449 there are three: the row's dimensions and two static helpers.
     */
    @Test
    fun eachDeclaredBuildScalesTheRow() {
        val versions = AppCompatibilities.instagram().single().targets.mapNotNull { it.version }.toSet()
        var checked = 0
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apks" && it.name.contains("-$version-") }) {
                val holders = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    for (classDef in dex.classes) {
                        if (classDef.methods.any { it.holdsTheSizes() }) holders += ImmutableClassDef.of(classDef)
                    }
                }
                val context = PatchContexts.of(holders.distinctBy { it.type })

                val sizings = context.findRingSizes()
                val originals = sizings.map { sizing ->
                    context.mutableClassDefBy(sizing.type).methods.single {
                        it.name == sizing.name && it.parameterTypes.map(CharSequence::toString) == sizing.parameters
                    }
                }.associateWith(::NeutralNativePath)
                assertEquals("${bundle.name}: sizing methods", 3, sizings.size)
                context.scaleRingSizes(sizings)
                for (sizing in sizings) {
                    val method = context.mutableClassDefBy(sizing.type).methods.single {
                        it.name == sizing.name && it.parameterTypes.map(CharSequence::toString) == sizing.parameters
                    }
                    assertScaled("${bundle.name} ${sizing.type}->${sizing.name}", method)
                    val added = method.implementation!!.instructions.toList().withIndex().flatMap { (at, instruction) ->
                        if ((instruction as? ReferenceInstruction)?.reference?.toString() == RING_SIZE) listOf(at, at + 1)
                        else emptyList()
                    }.toSet()
                    originals.getValue(method).assertPreserved(bundle.name, method, added)
                }
                checked++
            }
        }
        assertTrue("no fixture of a declared build", checked > 0)
    }

    /**
     * Three hooks in all, each right after a double-to-float into the register it passes and gets
     * back, and no branch in the method lands on one.
     */
    private fun assertScaled(what: String, method: Method) {
        val code = method.implementation!!.instructions.toList()
        val hooks = code.withIndex().filter { (it.value as? ReferenceInstruction)?.reference?.toString() == RING_SIZE }
        assertEquals("$what: hooks", SETTLED_PER_METHOD, hooks.size)
        for ((at, hook) in hooks) {
            val settled = code[at - 1]
            assertEquals("$what: settled before the hook at $at", Opcode.DOUBLE_TO_FLOAT, settled.opcode)
            val register = (settled as TwoRegisterInstruction).registerA
            assertEquals("$what: the hook's register at $at", register, (hook as FiveRegisterInstruction).registerC)
            assertEquals("$what: the answer at $at", Opcode.MOVE_RESULT, code[at + 1].opcode)
            assertEquals("$what: back into the register at $at", register, (code[at + 1] as OneRegisterInstruction).registerA)
        }

        val addresses = code.runningFold(0) { address, instruction -> address + instruction.codeUnits }
        val hookAddresses = hooks.map { addresses[it.index] }.toSet()
        for ((at, instruction) in code.withIndex()) {
            if (instruction !is OffsetInstruction) continue
            val target = addresses[at] + instruction.codeOffset
            assertTrue("$what: the branch at $at lands on a hook", target !in hookAddresses)
        }
    }

    private fun Method.holdsTheSizes(): Boolean {
        val code = implementation?.instructions ?: return false
        return code.any { it is NarrowLiteralInstruction && it.narrowLiteral == SMALLEST_ITEM && it.opcode != Opcode.CONST_4 } &&
            code.any { it is NarrowLiteralInstruction && it.narrowLiteral == LARGEST_ITEM && it.opcode != Opcode.CONST_4 } &&
            code.any { it is WideLiteralInstruction && it.wideLiteral == ITEMS_A_SCREEN }
    }

    private companion object {
        const val TYPE = "Lfixture/RowDimensions;"

        /**
         * A static (Context)F shaped like the row's dimensions on 449: the two sizes and the items a
         * screen, then three paths that settle the size into v4 and meet at :join.
         *
         *     a0  const/high16 v0, 66f
         *     a2  const/high16 v1, 100f
         *     a4  const-wide/high16 v2, 3.75
         *     a6  if-gez v0, :b
         *     a8  double-to-float v4, v2
         *     a9  :join neg-float v5, v4
         *     a10 return v5
         *     a11 :b if-gez v1, :c
         *     a13 double-to-float v4, v2
         *     a14 goto :join
         *     a15 :c double-to-float v4, v2
         *     a16 goto :join
         */
        fun sizingClass(settles: Int = 3, splitRegisters: Boolean = false, itemsLiteral: Boolean = true): ClassDef {
            val code = mutableListOf<Instruction>(
                ImmutableInstruction21ih(Opcode.CONST_HIGH16, 0, SMALLEST_ITEM),
                ImmutableInstruction21ih(Opcode.CONST_HIGH16, 1, LARGEST_ITEM),
                ImmutableInstruction21lh(Opcode.CONST_WIDE_HIGH16, 2, if (itemsLiteral) ITEMS_A_SCREEN else 4.0.toRawBits()),
                ImmutableInstruction21t(Opcode.IF_GEZ, 0, 5),
                ImmutableInstruction12x(Opcode.DOUBLE_TO_FLOAT, 4, 2),
                ImmutableInstruction12x(Opcode.NEG_FLOAT, 5, 4),
                ImmutableInstruction11x(Opcode.RETURN, 5),
                ImmutableInstruction21t(Opcode.IF_GEZ, 1, 4),
                ImmutableInstruction12x(Opcode.DOUBLE_TO_FLOAT, if (splitRegisters) 5 else 4, 2),
                ImmutableInstruction10t(Opcode.GOTO, -5),
                if (settles == 3) ImmutableInstruction12x(Opcode.DOUBLE_TO_FLOAT, 4, 2) else ImmutableInstruction12x(Opcode.NEG_FLOAT, 4, 5),
                ImmutableInstruction10t(Opcode.GOTO, -7),
            )
            val method = ImmutableMethod(
                TYPE, "size", listOf(ImmutableMethodParameter("Landroid/content/Context;", null, null)), "F",
                AccessFlags.PUBLIC.value or AccessFlags.STATIC.value or AccessFlags.FINAL.value, null, null,
                ImmutableMethodImplementation(7, code, null, null),
            )
            return ImmutableClassDef(
                TYPE, AccessFlags.PUBLIC.value or AccessFlags.FINAL.value, "Ljava/lang/Object;",
                null, null, null, null, listOf(method),
            )
        }
    }
}
