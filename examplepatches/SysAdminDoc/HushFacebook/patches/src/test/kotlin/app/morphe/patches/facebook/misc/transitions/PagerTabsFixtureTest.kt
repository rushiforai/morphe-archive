/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.transitions

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.shared.redexOriginalName
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Assert.assertTrue
import org.junit.Before
import org.junit.Test

/**
 * The two tab strips inside a screen on each declared build: Facebook's TabbedViewPagerIndicator,
 * found from its onPageSelected runnable, whose tab listener asks the pager for a page with a
 * literal true, and the composer's Feelings and Activities picker, whose setTab asks with no flag.
 * Then the patch: the listener's flag goes through the extension first, and setTab calls the
 * two-argument setCurrentItem with false when the extension says no slide.
 *
 * Read from 581 (2026-10-06): the runnable is `LX/kjx;`, the strip `LX/iB0;`, its listener
 * `LX/kCA;->onClick`, and the pager's calls `A0L(I)V` and `A0Q(IZ)V`. None of those names is used here.
 */
class PagerTabsFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    @Before
    @After
    fun forgetTheLastMatches() {
        PagerTabsSelectedFingerprint.clearMatch()
        PickerSetTabFingerprint.clearMatch()
    }

    private val Instruction.call: MethodReference?
        get() = (this as? ReferenceInstruction)?.reference as? MethodReference

    private fun MethodReference.key() = definingClass + "->" + name + parameterTypes.joinToString("", "(", ")") + returnType

    private fun Method.code() = implementation!!.instructions.toList()

    private fun ClassDef.made() = methods.flatMap { method ->
        method.implementation?.instructions?.toList().orEmpty().filter { it.opcode == Opcode.NEW_INSTANCE }
            .map { ((it as ReferenceInstruction).reference as TypeReference).type }
    }.toSet()

    @Test
    fun `a tap on a tab strip inside a screen asks the extension before the pager slides, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                forgetTheLastMatches()
                val name = bundle.name
                val runnables = mutableListOf<ClassDef>()
                FixtureDex.forEach(bundle) { dex ->
                    dex.classes.filter { redexOriginalName(it) == PAGER_TABS_SELECTED }.forEach { runnables += ImmutableClassDef.of(it) }
                }
                assertEquals("$name: classes Redex names $PAGER_TABS_SELECTED", 1, runnables.size)
                val runnable = runnables.single()
                val stripType = runnable.instanceFields.map { it.type }.single { it.startsWith("L") }
                val strip = FixtureDex.classes(bundle, setOf(stripType, MINUTIAE_PICKER))
                assertEquals("$name: the strip and the picker", 2, strip.size)
                val made = FixtureDex.classes(bundle, strip.getValue(stripType).made()).values.toList()

                val context = PatchContexts.of(listOf(runnable) + strip.values + made)
                val click = with(context) { pagerTabClick(pagerTabStrip()) }
                val tapCode = click.code()
                val tap = tapCode.indices.single { tapCode[it].call?.let { c -> c.definingClass == VIEW_PAGER && c.parameterTypes.map(CharSequence::toString) == listOf("I", "Z") } == true }
                val flag = (tapCode[tap] as FiveRegisterInstruction).registerE
                val set = tapCode[tap - 1]
                assertTrue("$name: the strip asks for a slide", set.opcode == Opcode.CONST_4 &&
                    (set as OneRegisterInstruction).registerA == flag && (set as NarrowLiteralInstruction).narrowLiteral == 1)

                val setPage = click.quietPagerTabTap()
                assertEquals("$name: the pager's call", tapCode[tap].call!!.key(), setPage.key())
                val tapped = click.code()
                assertEquals("$name: two instructions into the listener", tapCode.size + 2, tapped.size)
                assertEquals("$name: the flag goes to the extension", PAGE_SLIDES, tapped[tap].call!!.key())
                assertEquals("$name: its own register", flag, (tapped[tap] as FiveRegisterInstruction).registerC)
                assertEquals("$name: and comes back there", flag, (tapped[tap + 1] as OneRegisterInstruction).registerA)
                assertEquals("$name: before the pager hears it", setPage.key(), tapped[tap + 2].call!!.key())

                val picker = context.mutableClassDefBy(MINUTIAE_PICKER).methods.single { it.name == "setTab" }
                val pickerCode = picker.code()
                val asks = pickerCode.indices.filter { pickerCode[it].call?.let { c -> c.definingClass == VIEW_PAGER && c.parameterTypes.map(CharSequence::toString) == listOf("I") } == true }
                assertEquals("$name: setTab asks its pager once, with no flag", 1, asks.size)
                val ask = asks.single()
                val asked = pickerCode[ask] as FiveRegisterInstruction

                with(context) { PickerSetTabFingerprint.method.quietPickerTab(setPage) }
                val shown = picker.code()
                assertEquals("$name: six instructions into setTab", pickerCode.size + 6, shown.size)
                val answer = (shown[ask] as OneRegisterInstruction).registerA
                assertEquals("$name: it asks the extension", PAGE_SLIDES, shown[ask + 1].call!!.key())
                assertEquals("$name: a slide keeps Facebook's call", Opcode.IF_NEZ, shown[ask + 3].opcode)
                assertSame("$name: which is Facebook's own", shown[ask + 6], (shown[ask + 3] as BuilderOffsetInstruction).target.location.instruction)
                assertEquals("$name: else Facebook's call", pickerCode[ask].call!!.key(), shown[ask + 6].call!!.key())
                val instead = shown[ask + 4] as FiveRegisterInstruction
                assertEquals("$name: else the call with a flag", setPage.key(), shown[ask + 4].call!!.key())
                assertEquals("$name: on the same pager and page, and no slide",
                    listOf(asked.registerC, asked.registerD, answer), listOf(instead.registerC, instead.registerD, instead.registerE))
                assertSame("$name: then past Facebook's call", shown[ask + 7], (shown[ask + 5] as BuilderOffsetInstruction).target.location.instruction)
                assertTrue("$name: the answer borrows a register setTab no longer needs",
                    answer != asked.registerC && answer != asked.registerD)
                println("$name: strip $stripType, listener ${click.definingClass}->onClick, pager ${setPage.name}(IZ)V; picker setTab borrows v$answer")
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }
}
