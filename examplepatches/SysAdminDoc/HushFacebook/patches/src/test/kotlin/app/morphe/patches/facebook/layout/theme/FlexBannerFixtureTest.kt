/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.layout.theme

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.facebook.feed.holdsString
import app.morphe.patches.facebook.feed.refresh.enumConstant
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction
import com.android.tools.smali.dexlib2.iface.reference.FieldReference
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.After
import org.junit.Assert.assertEquals
import org.junit.Test

/**
 * Issue #86: on a Flex carrier, AMOLED left Data mode's banner a grey band across the black page.
 * The banner (the method that logs "start_redesigned_freemium_banner" and "banner_wrapper_is_null")
 * paints its wrapper with FDS's CARD_BACKGROUND token through a (Context, token) resolver, so route
 * one gave it a card's near black. On each declared build the resolver's answer has to reach
 * AmoledTheme.flexBanner before the banner paints with it.
 *
 * Read from 581 (2026-10-06): the banner is `LX/4c5;->A0a`, the enum `LX/1z5`, its CARD_BACKGROUND
 * `A0O`, the resolver `LX/208;->A01`. None of those names is used here.
 */
class FlexBannerFixtureTest {
    private val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()

    private fun bundles(version: String) = Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }

    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Method.descriptor() = "$definingClass->$name(${parameterTypes.joinToString("")})$returnType"

    @After
    fun forgetTheLastMatch() = FlexBannerFingerprint.clearMatch()

    @Test
    fun `the Data mode banner's card colour goes through AMOLED, on each declared build`() {
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in bundles(version)) {
                val name = bundle.name
                val banners = FixtureDex.classesHolding(bundle, START).filter { classDef ->
                    classDef.methods.any { holdsString(it, START) && holdsString(it, NO_WRAPPER) }
                }
                assertEquals("$name: one class paints the Data mode banner", 1, banners.size)
                val banner = banners.single()
                val method = banner.methods.single { holdsString(it, START) && holdsString(it, NO_WRAPPER) }
                val tokens = FixtureDex.classesHolding(bundle, CARD)

                // The card token the banner reads, found here without the patch's own search.
                val reads = method.body().withIndex().filter { (_, instruction) ->
                    val field = (instruction as? ReferenceInstruction)?.reference as? FieldReference ?: return@filter false
                    instruction.opcode == Opcode.SGET_OBJECT &&
                        tokens.any { it.type == field.definingClass && enumConstant(it, CARD) == field.toString() }
                }
                assertEquals("$name: the banner reads CARD_BACKGROUND once", 1, reads.size)
                val token = (reads.single().value as OneRegisterInstruction).registerA
                val call = (reads.single().index + 1 until method.body().size).first { index ->
                    val instruction = method.body()[index]
                    instruction.opcode == Opcode.INVOKE_STATIC &&
                        (instruction as FiveRegisterInstruction).registerD == token
                }
                val colour = (method.body()[call + 1] as OneRegisterInstruction).registerA
                val resolver = (method.body()[call] as ReferenceInstruction).reference as MethodReference
                assertEquals("$name: the resolver answers a colour", "I", resolver.returnType)

                FlexBannerFingerprint.clearMatch()
                val context = PatchContexts.of(listOf(banner) + tokens)
                with(context) { hookFlexBanner() }
                val after = context.mutableClassDefBy(banner.type).methods.single { it.descriptor() == method.descriptor() }.body()

                assertEquals("$name: the resolver call stays", resolver.toString(),
                    ((after[call] as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("$name: and its move-result", Opcode.MOVE_RESULT, after[call + 1].opcode)
                val hook = after[call + 2]
                assertEquals("$name: then the colour goes to flexBanner", FLEX_BANNER,
                    ((hook as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("$name: on its own register", colour, (hook as RegisterRangeInstruction).startRegister)
                assertEquals("$name: one register", 1, hook.registerCount)
                assertEquals("$name: and comes back there", Opcode.MOVE_RESULT, after[call + 3].opcode)
                assertEquals("$name: into the same register", colour, (after[call + 3] as OneRegisterInstruction).registerA)
                assertEquals("$name: the rest of the method is as it was", method.body().size + 2, after.size)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    private companion object {
        const val START = "start_redesigned_freemium_banner"
        const val NO_WRAPPER = "banner_wrapper_is_null"
        const val CARD = "CARD_BACKGROUND"
    }
}
