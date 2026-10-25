/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.reels

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.instruction.TwoRegisterInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import com.android.tools.smali.dexlib2.immutable.ImmutableClassDef
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Clean up Reels' whole reel hook for the feed's Reels row (#228) on every Facebook build the bundle
 * declares (arm64 and armv7): one tile render reads the preview clip and builds a player, every
 * other method reading the same three fields is turned down, and after the hook the render hands
 * its last clip check and its end to the extension right where they're used. Reads the fixture
 * bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class FeedReelPreviewsFixtureTest {
    private fun Method.body(): List<Instruction> = implementation?.instructions?.toList().orEmpty()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.toString()

    /** Whether [method] loads the hash of every [PREVIEW_FIELDS] name as a const. */
    private fun readsPreviewFields(method: Method): Boolean {
        val literals = method.body().filter { it.opcode == Opcode.CONST }
            .mapTo(mutableSetOf()) { (it as NarrowLiteralInstruction).narrowLiteral }
        return PREVIEW_FIELDS.all { it.hashCode() in literals }
    }

    /** Every class in [bundle] with a method reading all three preview fields. */
    private fun readers(bundle: java.io.File): List<ClassDef> {
        val found = mutableListOf<ClassDef>()
        FixtureDex.forEach(bundle) { dex ->
            dex.classes.filterTo(found) { classDef -> classDef.methods.any(::readsPreviewFields) }
        }
        return found.map(ImmutableClassDef::of)
    }

    @Test
    fun `each declared build's Reels row tile hands its clip check and end to the extension`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        val abis = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val classes = readers(bundle)
                val readingMethods = classes.flatMap { owner -> owner.methods.filter(::readsPreviewFields).map { owner to it } }
                val taken = readingMethods.filter { (_, method) -> previewClipPoints(method) != null }
                assertEquals("$name: methods the patch takes", 1, taken.size)
                // Negative control: the debug overlay, the prefetcher and the clip helpers read the
                // same three fields and build no player, so each is turned down.
                assertTrue("$name: only one method reads the preview fields, so nothing was turned down", readingMethods.size > 1)
                val (tile, render) = taken.single()
                val points = previewClipPoints(render)!!
                val original = render.body()
                assertEquals("$name: the store is an int field of the builder", Opcode.IPUT, original[points.store].opcode)
                assertEquals("$name: the end is stored twice", (original[points.store + 1] as TwoRegisterInstruction).registerA, points.end)

                val context = PatchContexts.of(listOf(tile))
                with(context) { playFeedReelsWhole() }
                val hooked = context.mutableClassDefBy(tile.type).methods.single {
                    it.name == render.name && it.parameterTypes.map(CharSequence::toString) == render.parameterTypes.map(CharSequence::toString)
                }.body()
                assertEquals("$name: asks about the clip", PREVIEW_CLIP_ALLOWED, hooked[points.gate].called())
                assertEquals("$name: takes the answer back", points.gateAnswer, (hooked[points.gate + 1] as OneRegisterInstruction).registerA)
                assertEquals("$name: and Facebook branches on it", Opcode.IF_EQZ, hooked[points.gate + 2].opcode)
                val store = points.store + 2
                assertEquals("$name: asks about the end", PREVIEW_CLIP_END, hooked[store].called())
                assertEquals("$name: takes the end back", points.end, (hooked[store + 1] as OneRegisterInstruction).registerA)
                assertEquals("$name: and stores it", Opcode.IPUT, hooked[store + 2].opcode)
                assertEquals("$name: then stores it again", Opcode.IPUT, hooked[store + 3].opcode)
                val rest = hooked.filterIndexed { at, _ -> at != points.gate && at != points.gate + 1 && at != store && at != store + 1 }
                assertEquals("$name: the rest is Facebook's", original.map { it.opcode }, rest.map { it.opcode })
                checked += version
                abis += name.substringAfter("-$version-").substringBefore(".apkm")
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
        assertEquals("an ABI went unchecked", Fixtures.declaredAbis(), abis)
    }

    @Test
    fun `the extension has the hooks`() {
        for (hook in listOf(PREVIEW_CLIP_ALLOWED, PREVIEW_CLIP_END)) {
            val type = hook.substringBefore("->")
            val name = hook.substringAfter("->").substringBefore("(")
            val method = ExtensionDex.classDef(type).methods.singleOrNull { it.name == name }
            assertNotNull("the extension has no ReelDeclutter.$name", method)
            assertEquals("$name's shape", hook,
                "${method!!.definingClass}->${method.name}(${method.parameterTypes.joinToString("")})${method.returnType}")
            assertTrue("$name isn't static", AccessFlags.STATIC.isSet(method.accessFlags))
        }
    }
}
