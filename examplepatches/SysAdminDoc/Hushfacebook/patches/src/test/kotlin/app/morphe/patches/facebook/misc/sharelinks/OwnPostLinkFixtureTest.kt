/*
 * Copyright 2026 Hushfacebook contributors
 * https://github.com/SysAdminDoc/Hushfacebook
 */
package app.morphe.patches.facebook.misc.sharelinks

import app.morphe.ExtensionDex
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patches.facebook.ads.affiliate.writesRegister
import app.morphe.patches.facebook.comments.summaries.descriptor
import app.morphe.patches.facebook.feed.FixtureDex
import app.morphe.patches.shared.compat.AppCompatibilities
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.ClassDef
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.Instruction
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OneRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.ReferenceInstruction
import com.android.tools.smali.dexlib2.iface.reference.MethodReference
import org.junit.Assert.assertEquals
import org.junit.Assert.assertNotNull
import org.junit.Assert.assertTrue
import org.junit.Test

/**
 * Sanitize sharing links' own-link hook on every Facebook build the bundle declares (#98): the one
 * method that builds a shared post's link hands the extension the /share/ link it reads from
 * LinkSharingController's cache, together with the post's own address, right after the cache
 * answers. Reads the fixture bundles from HUSHFACEBOOK_FIXTURE_DIR and skips without it.
 */
class OwnPostLinkFixtureTest {
    private fun Method.code(): List<Instruction> = implementation!!.instructions.toList()

    private fun Instruction.called() = ((this as? ReferenceInstruction)?.reference as? MethodReference)?.descriptor()

    private fun ClassDef.method(like: Method): Method = methods.single { it.descriptor() == like.descriptor() }

    @Test
    fun `each declared build's share link answers through the extension`() {
        val versions = AppCompatibilities.facebook().single().targets.mapNotNull { it.version }.toSet()
        assertTrue("the bundle declares no Facebook build", versions.isNotEmpty())
        val checked = mutableSetOf<String>()
        for (version in versions) {
            for (bundle in Fixtures.files { it.extension == "apkm" && it.name.contains("-$version-") }) {
                val name = bundle.name
                val controllers = FixtureDex.classesHolding(bundle, LINK_SHARING_ANCHOR)
                assertEquals("$name: classes holding \"$LINK_SHARING_ANCHOR\"", 1, controllers.size)
                val controller = controllers.single()
                val read = wrappedLinkRead(controller.methods)
                assertNotNull("$name: LinkSharingController's read of the /share/ links it keeps", read)
                val asked = read!!.descriptor()

                // In the whole app, one static (FbUserSession, props)String method asks it.
                val builders = FixtureDex.methodsWhere(bundle, dexFilter = { dex ->
                    dex.methodSection.any { it.descriptor() == asked }
                }) { isShareLinkShape(it) && asks(it, asked) }
                assertEquals("$name: methods building a post's share link from the cache", 1, builders.size)
                val builder = builders.single()
                val code = builder.code()
                val hook = shareLinkHook(builder, asked)
                assertNotNull("$name: the builder returns the cached link or one other address", hook)
                hook!!
                assertTrue("$name: both links below v16", hook.shareRegister <= 15 && hook.ownRegister <= 15)

                // Positive control: the other address is the post's own. Every write to its register
                // is the answer of a call that reads the story's wwwURL or url, by the hash of the
                // field's GraphQL name.
                val setters = code.indices.filter { it < hook.insertAt && writesRegister(code[it], hook.ownRegister) }
                assertTrue("$name: nothing sets the own address", setters.isNotEmpty())
                assertTrue("$name: the own address isn't only a call's answer",
                    setters.all { it > 0 && code[it].opcode == Opcode.MOVE_RESULT_OBJECT && code[it - 1].called() != null })
                val callees = setters.map { (code[it - 1] as ReferenceInstruction).reference as MethodReference }
                val owners = FixtureDex.classes(bundle, callees.map { it.definingClass }.toSet())
                val keys = callees.flatMap { callee ->
                    val owner = owners[callee.definingClass]
                    assertNotNull("$name: ${callee.definingClass} isn't in the bundle", owner)
                    owner!!.methods.single { it.descriptor() == callee.descriptor() }.code()
                        .mapNotNull { (it as? NarrowLiteralInstruction)?.narrowLiteral }
                }
                assertTrue("$name: the own address isn't read from wwwURL", "wwwURL".hashCode() in keys)
                assertTrue("$name: the own address isn't read from url", "url".hashCode() in keys)

                val builderClass = FixtureDex.classes(bundle, setOf(builder.definingClass)).getValue(builder.definingClass)
                val pool = listOf(controller, builderClass).associateBy { it.type }.values
                val context = PatchContexts.of(pool)
                ownPostLinkPatch.execute(context)

                val patched = context.mutableClassDefBy(builder.definingClass).method(builder).code()
                assertEquals("$name: two instructions in the builder", code.size + 2, patched.size)
                val at = hook.insertAt
                assertEquals("$name: the cache's answer lands right before the hook", Opcode.MOVE_RESULT_OBJECT, code[at - 1].opcode)
                val ask = patched[at]
                assertEquals("$name: the builder asks $SHARE_LINK", SHARE_LINK, ask.called())
                assertEquals("$name: handed the /share/ link, then the own address",
                    listOf(2, hook.shareRegister, hook.ownRegister),
                    listOf((ask as FiveRegisterInstruction).registerCount, ask.registerC, ask.registerD))
                assertEquals("$name: its answer back where the /share/ link was",
                    listOf(Opcode.MOVE_RESULT_OBJECT, hook.shareRegister),
                    listOf(patched[at + 1].opcode, (patched[at + 1] as OneRegisterInstruction).registerA))
                assertEquals("$name: Facebook's own instruction follows", code[at].opcode, patched[at + 2].opcode)
                assertEquals("$name: the builder still returns both",
                    code.filter { it.opcode == Opcode.RETURN_OBJECT }.map { (it as OneRegisterInstruction).registerA },
                    patched.filter { it.opcode == Opcode.RETURN_OBJECT }.map { (it as OneRegisterInstruction).registerA })
                checked += version
            }
        }
        assertEquals("a declared build has no fixture", versions, checked)
    }

    @Test
    fun `the extension has the hook`() {
        val hook = ExtensionDex.classDef(OWN_POST_LINK).methods.singleOrNull { it.name == "shareLink" }
        assertTrue("the extension has no OwnPostLink.shareLink", hook != null)
        assertEquals("shareLink's shape", SHARE_LINK, hook!!.descriptor())
    }
}
