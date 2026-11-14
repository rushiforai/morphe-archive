/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.ExtensionDex
import app.morphe.FixtureDex
import app.morphe.FixtureTests
import app.morphe.Fixtures
import app.morphe.PatchContexts
import app.morphe.patcher.patch.PatchException
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import app.morphe.util.namedRegisters
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertFalse
import org.junit.Assert.assertThrows
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * Hide reblogs of your posts in each declared build: Post answers the blogs it was reblogged from
 * and first made on, a blog answers its name, each through the getter its Moshi adapter writes
 * under the key, and UserInfo answers the account's blogs from the private final list its
 * user/info constructor fills. What the rule takes out is DashboardPostsTest's.
 */
@Category(FixtureTests::class)
class HideReblogsOfYoursFixtureTest {
    private val types = REBLOG_SOURCE_BRIDGES.flatMap { listOf(it.model, it.adapter) }.toSet() + ACCOUNT_USER_INFO_MODEL

    @Test
    fun `Hide reblogs of your posts bridges the reblog source and the account's blogs and turns its switch on`() {
        for (build in Fixtures.declaredBuilds()) {
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: the models, their adapters and UserInfo", types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)

            reblogSourceBridgePatch.execute(context)
            hideReblogsOfYoursPatch.execute(context)

            val post = context.mutableClassDefBy(POST)
            assertTrue("${build.name}: Post is a HushReblogSource", HUSH_REBLOG_SOURCE in post.interfaces)
            for ((name, getter) in mapOf("hushRebloggedFromName" to "H0", "hushRebloggedRootName" to "L0")) {
                val body = post.methods.single { it.name == name }.instructionList()
                assertEquals("${build.name}: $name", listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT),
                    body.map { it.opcode })
                assertEquals("${build.name}: $name", "$POST->$getter()Ljava/lang/String;", body[0].methodRef().toString())
            }

            val blog = context.mutableClassDefBy(SHORT_BLOG_INFO)
            assertTrue("${build.name}: ShortBlogInfo is a HushAccountBlog", HUSH_ACCOUNT_BLOG in blog.interfaces)
            val name = blog.methods.single { it.name == "hushAccountBlogName" }.instructionList()
            assertEquals("$SHORT_BLOG_INFO->k()Ljava/lang/String;", name[0].methodRef().toString())

            val user = context.mutableClassDefBy(ACCOUNT_USER_INFO_MODEL)
            assertTrue("${build.name}: UserInfo is a HushAccountBlogs", HUSH_ACCOUNT_BLOGS in user.interfaces)
            val blogs = user.methods.single { it.name == "hushAccountBlogs" }
            assertTrue(AccessFlags.PUBLIC.isSet(blogs.accessFlags))
            val body = blogs.instructionList()
            assertEquals(listOf(Opcode.IGET_OBJECT, Opcode.RETURN_OBJECT), body.map { it.opcode })
            assertEquals("$ACCOUNT_USER_INFO_MODEL->k:Ljava/util/List;", body[0].fieldRef().toString())
            assertEquals("${build.name}: reads its own field", listOf(0, blogs.implementation!!.registerCount - 1), body[0].namedRegisters())

            for ((flag, on) in mapOf("hideReblogsOfYours" to 1, "reblogsOfYours" to 1, "hideOwnReblogs" to 0, "ownReblogPosts" to 0)) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", on, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    /** A second run finds the bridges already there and refuses before it changes a class. */
    @Test
    fun `an account that's already bridged is refused before anything changes`() {
        for (build in Fixtures.declaredBuilds()) {
            val context = PatchContexts.of(ExtensionDex.classes() + FixtureDex.classes(build, types).values)
            reblogSourceBridgePatch.execute(context)
            val before = context.mutableClassDefBy(SHORT_BLOG_INFO).methods.count()
            val failure = assertThrows(PatchException::class.java) { reblogSourceBridgePatch.execute(context) }
            assertTrue(failure.message, failure.message!!.contains("already has"))
            assertEquals("${build.name}: nothing added twice", before, context.mutableClassDefBy(SHORT_BLOG_INFO).methods.count())
            assertFalse(context.mutableClassDefBy(ACCOUNT_USER_INFO_MODEL).methods.count { it.name == "hushAccountBlogs" } > 1)
        }
    }
}
