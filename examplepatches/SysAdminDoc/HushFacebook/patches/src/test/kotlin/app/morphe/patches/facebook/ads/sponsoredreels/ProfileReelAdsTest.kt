/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.ads.sponsoredreels

import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.extensions.InstructionExtensions.addInstructionsWithLabels
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.builder.BuilderOffsetInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableMethod
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodImplementation
import com.android.tools.smali.dexlib2.immutable.ImmutableMethodParameter
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertSame
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * The query a profile's Reels tab sends for its ads, found in each declared build the way the patch
 * finds it, and held first thing with a local of its own to ask in. Reads the fixture bundles from
 * HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class ProfileReelAdsTest {
    private val hold = "Lapp/morphe/extension/facebook/ads/ReelsAdFilter;->holdProfileReelAds()Z"
    private val shape = listOf(
        "Lcom/facebook/auth/usersession/FbUserSession;", "Ljava/lang/Integer;", "Ljava/lang/Integer;", "Z",
    )

    private fun method(returnType: String, registers: Int, static: Boolean = false, smali: String): MutableMethod =
        MutableMethod(
            ImmutableMethod(
                "Lfixture/ProfileReels;", "fetch", listOf(ImmutableMethodParameter("I", null, null)), returnType,
                AccessFlags.PUBLIC.value or (if (static) AccessFlags.STATIC.value else 0), null, null,
                ImmutableMethodImplementation(registers, emptyList(), null, null),
            ),
        ).apply { addInstructionsWithLabels(0, smali) }

    @Test
    fun `the profile Reels ad query is held first in each declared build`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val context = PatchContexts.of(FixtureDex.classesHolding(bundle, PROFILE_REELS_ADS))
                val fetch = with(context) { profileReelAdFetch() }
                assertEquals("${bundle.name}: $fetch", shape, fetch.parameterTypes.map { it.toString() })

                val before = fetch.implementation!!.instructions.toList()
                fetch.holdProfileReelAdsFirst()
                val body = fetch.implementation!!.instructions.toList()
                assertEquals("${bundle.name}: four added", before.size + 4, body.size)
                assertEquals("${bundle.name}: the ask", hold, ((body[0] as ReferenceInstruction).reference as MethodReference).toString())
                assertEquals("${bundle.name}: the answer", listOf(Opcode.MOVE_RESULT, 0),
                    listOf(body[1].opcode, (body[1] as OneRegisterInstruction).registerA))
                assertEquals("${bundle.name}: no hold", Opcode.IF_EQZ, body[2].opcode)
                assertSame("${bundle.name}: no hold goes on with Facebook's first instruction", body[4],
                    (body[2] as BuilderOffsetInstruction).target.location.instruction)
                assertEquals("${bundle.name}: held", Opcode.RETURN_VOID, body[3].opcode)
                // v0 is a local, not a parameter, so asking in it before Facebook's first
                // instruction overwrites nothing Facebook reads.
                val implementation = fetch.implementation!!
                assertTrue("${bundle.name}: no local for the ask",
                    implementation.registerCount - fetch.parameterTypes.size - 1 >= 1)
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `a fetch is an instance method returning nothing that names the query`() {
        val smali = "const-string v0, \"$PROFILE_REELS_ADS\"\nreturn-void"
        assertTrue(isProfileReelAdFetch(method("V", 3, smali = smali)))
        assertFalse("static", isProfileReelAdFetch(method("V", 3, static = true, smali = smali)))
        assertFalse("hands something back", isProfileReelAdFetch(method("Ljava/lang/Object;", 3,
            smali = "const-string v0, \"$PROFILE_REELS_ADS\"\nreturn-object v0")))
        assertFalse("another query", isProfileReelAdFetch(method("V", 3, smali = smali.replace(PROFILE_REELS_ADS, "${PROFILE_REELS_ADS}2"))))
    }

    @Test
    fun `a fetch with no local to ask in is refused`() {
        val fetch = method("V", 2, smali = "const/4 p1, 0x0\nreturn-void")
        assertThrows(PatchException::class.java) { fetch.holdProfileReelAdsFirst() }
    }
}
