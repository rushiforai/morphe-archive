/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.ads.sponsoredposts.HOLDS_FEED_AD_PILL
import app.morphe.patches.facebook.ads.sponsoredposts.SPONSORED_POSTS_PATCH
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Assert.assertSame
import org.junit.Before
import org.junit.Test

/**
 * The comment pill on each declared build: one static (I)String table names the Reels ad button's
 * plugin, its class has one check of whether a plugin's button shows, and after the hook that check
 * asks the extension first with the table's answer for its own number. The feed ads patch asks in
 * front of that the same way, and each question's no goes on to the next.
 *
 * Read from 581 (2026-10-06): the table is `LX/A38;->A0G`, the check `LX/A38;->A0H`. None of those
 * names is used here.
 */
class AdPillsFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    @Before
    @After
    fun forgetTheLastMatch() = AdPillNamesFingerprint.clearMatch()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    /** The pill's class, its name table and its check, from each declared build's fixture. */
    private fun eachPill(test: (name: String, owner: ImmutableClassDef, table: Method, check: Method) -> Unit) {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                forgetTheLastMatch()
                val name = bundle.name
                val owners = FixtureDex.classesHolding(bundle, REELS_AD_PILL).filter { owner ->
                    owner.methods.any { method ->
                        AccessFlags.STATIC.isSet(method.accessFlags) && method.returnType == "Ljava/lang/String;" &&
                            method.parameterTypes.map(CharSequence::toString) == listOf("I") && holdsString(method, REELS_AD_PILL)
                    }
                }
                assertEquals("$name: one class holds the pill's name table", 1, owners.size)
                val owner = ImmutableClassDef.of(owners.single())
                val table = owner.methods.single { it.returnType == "Ljava/lang/String;" && holdsString(it, REELS_AD_PILL) }
                val check = owner.methods.filter(::isAdPillCheck).also {
                    assertEquals("$name: one pill check beside the table", 1, it.size)
                }.single()
                test(name, owner, table, check)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the comment pill's check asks about an ad's button first, on each declared build`() = eachPill { name, owner, table, check ->
        val before = check.implementation!!.instructions.toList()

        val context = PatchContexts.of(listOf(owner))
        with(context) { holdAdPills() }

        val after = context.mutableClassDefBy(owner.type).methods
            .single { MethodUtil.methodSignaturesMatch(it, check) }.implementation!!.instructions.toList()
        val plugin = check.implementation!!.registerCount - 1
        assertEquals("$name: the table is asked first", "${table.definingClass}->${table.name}(I)Ljava/lang/String;", after[0].called())
        assertEquals("$name: for the check's own number", plugin, (after[0] as RegisterRangeInstruction).startRegister)
        assertEquals("$name: then the extension", HOLDS_AD_PILL, after[2].called())
        assertEquals("$name: which can answer no", Opcode.RETURN, after[6].opcode)
        assertEquals("$name: and the check is otherwise as it was", before.size + 7, after.size)
        assertEquals("$name: starting with its switch", before[0].opcode, after[7].opcode)
    }

    @Test
    fun `the feed ads patch alone asks its own question, and in front of the reels patch the other way round`() = eachPill { name, owner, table, check ->
        val before = check.implementation!!.instructions.toList()

        val alone = PatchContexts.of(listOf(owner))
        with(alone) { holdAdPills(SPONSORED_POSTS_PATCH, HOLDS_FEED_AD_PILL) }
        val one = alone.mutableClassDefBy(owner.type).methods
            .single { MethodUtil.methodSignaturesMatch(it, check) }.implementation!!.instructions.toList()
        assertEquals("$name: one question in front", before.size + 7, one.size)
        assertEquals("$name: the table first", "${table.definingClass}->${table.name}(I)Ljava/lang/String;", one[0].called())
        assertEquals("$name: then the feed ads check", HOLDS_FEED_AD_PILL, one[2].called())
        assertSame("$name: whose no reaches the switch", one[7], (one[4] as BuilderOffsetInstruction).target.location.instruction)

        forgetTheLastMatch()
        val both = PatchContexts.of(listOf(owner))
        with(both) {
            holdAdPills(SPONSORED_POSTS_PATCH, HOLDS_FEED_AD_PILL)
            holdAdPills()
        }
        val two = both.mutableClassDefBy(owner.type).methods
            .single { MethodUtil.methodSignaturesMatch(it, check) }.implementation!!.instructions.toList()
        assertEquals("$name: two questions in front", before.size + 14, two.size)
        assertEquals("$name: the reels check first this way round", HOLDS_AD_PILL, two[2].called())
        assertSame("$name: its no asks the feed ads check", two[7], (two[4] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("$name: the feed ads check next", HOLDS_FEED_AD_PILL, two[9].called())
        assertSame("$name: whose no reaches the switch", two[14], (two[11] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("$name: as it was", before[0].opcode, two[14].opcode)
    }

    @Test
    fun `the feed ads patch asks in front of the reels patch, and a no from either one answers`() = eachPill { name, owner, _, check ->
        val before = check.implementation!!.instructions.toList()

        val context = PatchContexts.of(listOf(owner))
        with(context) {
            holdAdPills()
            holdAdPills(SPONSORED_POSTS_PATCH, HOLDS_FEED_AD_PILL)
        }

        val after = context.mutableClassDefBy(owner.type).methods
            .single { MethodUtil.methodSignaturesMatch(it, check) }.implementation!!.instructions.toList()
        assertEquals("$name: two questions in front", before.size + 14, after.size)
        assertEquals("$name: the feed ads check first", HOLDS_FEED_AD_PILL, after[2].called())
        assertEquals("$name: its yes answers no", Opcode.RETURN, after[6].opcode)
        assertSame("$name: its no asks the reels check", after[7], (after[4] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("$name: the reels check next", HOLDS_AD_PILL, after[9].called())
        assertSame("$name: whose no reaches the switch", after[14], (after[11] as BuilderOffsetInstruction).target.location.instruction)
        assertEquals("$name: as it was", before[0].opcode, after[14].opcode)
    }
}
