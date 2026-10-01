/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.affiliate

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.aidetected.EXTENSION_CLASSES
import app.morphe.patches.facebook.feed.refresh.enumConstant
import app.morphe.patches.facebook.misc.extension.SETTINGS_STATUS
import app.morphe.patches.facebook.reels.prompts.INTEREST_PROMPT
import app.morphe.patches.facebook.reels.prompts.isOverlayEnum
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.iface.reference.TypeReference
import com.android.tools.smali.dexlib2.util.MethodUtil
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test
import java.io.File

/**
 * Hide affiliate product links' three anchors on every Facebook build the bundle declares: the reel
 * overlay's one Z predicate in front of adding AFFILIATE_EYEBROW, the one string lookup the feed
 * video plugin's isFooterHidden… makes, and the floating card plugin's one static card reader.
 * Then the patch: every answer each of them gives goes through the extension on its own register,
 * cast back where the hook answers a wider type, and no branch skips the hook. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class HideAffiliateLinksFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun declaredBundles(): Map<String, List<File>> {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        return versions.associateWith { version -> Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") } }
    }

    /** The index each branch of [code] jumps to, by the branch's index. */
    private fun branchTargets(code: List<Instruction>): Map<Int, Int> {
        var address = 0
        val addresses = code.map { instruction -> address.also { address += instruction.codeUnits } }
        return code.withIndex().filter { it.value is OffsetInstruction && it.value.opcode != Opcode.FILL_ARRAY_DATA }
            .associate { (index, branch) -> index to addresses.indexOf(addresses[index] + (branch as OffsetInstruction).codeOffset) }
    }

    /**
     * Checks that each of [original]'s returns in [patched] reads what [hook] answered for the
     * register it was about to return, with a check-cast to [castTo] in between when given.
     */
    private fun assertFiltered(name: String, original: List<Instruction>, patched: List<Instruction>, hook: String, castTo: String?) {
        val returnOpcodes = setOf(Opcode.RETURN, Opcode.RETURN_OBJECT)
        val returns = original.filter { it.opcode in returnOpcodes }.map { (it as OneRegisterInstruction).registerA }
        assertTrue("$name: never returns", returns.isNotEmpty())
        val added = if (castTo == null) 2 else 3
        assertEquals("$name: $added instructions in front of each return", original.size + added * returns.size, patched.size)
        val patchedReturns = patched.withIndex().filter { it.value.opcode in returnOpcodes }.map { it.index }
        assertEquals("$name: returns", returns.size, patchedReturns.size)
        val injected = mutableSetOf<Int>()
        for ((at, answer) in patchedReturns.zip(returns)) {
            val call = patched[at - added]
            assertEquals("$name: the call before return v$answer", Opcode.INVOKE_STATIC_RANGE, call.opcode)
            assertEquals("$name: the call before return v$answer", hook, ((call as ReferenceInstruction).reference as MethodReference).toString())
            assertEquals("$name: the register handed over", answer, (call as RegisterRangeInstruction).startRegister)
            assertEquals("$name: one register handed over", 1, call.registerCount)
            val result = patched[at - added + 1]
            assertTrue("$name: the extension's answer", result.opcode == Opcode.MOVE_RESULT || result.opcode == Opcode.MOVE_RESULT_OBJECT)
            assertEquals("$name: the extension's answer lands where the return reads it", answer, (result as OneRegisterInstruction).registerA)
            if (castTo != null) {
                val cast = patched[at - 1]
                assertEquals("$name: the cast back", Opcode.CHECK_CAST, cast.opcode)
                assertEquals("$name: the cast back", answer, (cast as OneRegisterInstruction).registerA)
                assertEquals("$name: the cast back", castTo, ((cast as ReferenceInstruction).reference as TypeReference).type)
            }
            assertEquals("$name: the return", answer, (patched[at] as OneRegisterInstruction).registerA)
            for (step in 1 until added) injected += at - added + step
            injected += at
        }
        for ((branch, target) in branchTargets(patched)) {
            assertTrue("$name: the branch at $branch skips the extension", target !in injected)
        }
    }

    @Test
    fun `each declared build has the three anchors once, and every answer goes through the extension`() {
        val checked = mutableSetOf<String>()
        for ((version, bundles) in declaredBundles()) {
            for (bundle in bundles) {
                val name = bundle.name
                val enums = FixtureDex.classesHolding(bundle, INTEREST_PROMPT)
                    .filterNot { it.type.startsWith(EXTENSION_CLASSES) }.filter(::isOverlayEnum)
                assertEquals("$name: reel overlay enums", 1, enums.size)
                val overlay = enums.single()
                val eyebrow = enumConstant(overlay, AFFILIATE_EYEBROW)
                assertNotNull("$name: ${overlay.type} stores no $AFFILIATE_EYEBROW", eyebrow)

                val builders = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.fieldSection.any { it.toString() == eyebrow }
                }) { reelCardChecks(it, eyebrow!!).isNotEmpty() }
                val reelChecks = builders.flatMap { reelCardChecks(it, eyebrow!!) }.map { it.toString() }.toSet()
                assertEquals("$name: Z predicates in front of adding $eyebrow", 1, reelChecks.size)

                val footerChecks = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.methodSection.any { it.name.startsWith(FOOTER_HIDDEN) }
                }) { isFooterHidden(it) }
                val footerIds = footerChecks.flatMap { footerIdCalls(it) }.map { it.toString() }.toSet()
                assertEquals("$name: string lookups in $FOOTER_HIDDEN…", 1, footerIds.size)

                val reelCheck = builders.flatMap { reelCardChecks(it, eyebrow!!) }.first()
                val footerId = footerChecks.flatMap { footerIdCalls(it) }.first()
                val types = (builders + footerChecks).map { it.definingClass }.toSet() +
                    setOf(reelCheck.definingClass, footerId.definingClass, FLOATING_CARD_PLUGIN)
                val classes = FixtureDex.classes(bundle, types)
                assertEquals("$name: classes read", types, classes.keys)
                val plugin = classes.getValue(FLOATING_CARD_PLUGIN)
                val readers = plugin.methods.filter(::isCommentCardReader)
                assertEquals("$name: static card readers on the floating card plugin", 1, readers.size)

                fun original(reference: MethodReference) = classes.getValue(reference.definingClass).methods
                    .single { MethodUtil.methodSignaturesMatch(it, reference) }.code()
                val originals = listOf(original(reelCheck), original(footerId), readers.single().code())

                val context = PatchContexts.of(listOf(overlay) + classes.values + ExtensionDex.classDef(SETTINGS_STATUS))
                hideAffiliateLinksPatch.execute(context)

                fun patched(reference: MethodReference) = context.mutableClassDefBy(reference.definingClass).methods
                    .single { MethodUtil.methodSignaturesMatch(it, reference) }.code()
                assertFiltered("$name reel card check", originals[0], patched(reelCheck), KEEP_REEL_CARD, null)
                assertFiltered("$name footer id", originals[1], patched(footerId), KEEP_FOOTER, null)
                assertFiltered("$name comment card", originals[2], patched(readers.single()), KEEP_COMMENT_CARD, readers.single().returnType)

                val status = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == "affiliateLinks" }
                assertEquals("$name: SettingsStatus.affiliateLinks() isn't switched on", 1,
                    (status.code()[0] as NarrowLiteralInstruction).narrowLiteral)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", declaredBundles().keys, checked)
    }
}
