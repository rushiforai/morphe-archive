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
import app.morphe.patcher.patch.BytecodePatch
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.fieldRef
import app.morphe.patches.tumblr.lookup.stringRef
import app.morphe.patches.tumblr.ads.hideAdsPatch
import app.morphe.patches.tumblr.misc.extension.SETTINGS_STATUS
import com.android.tools.smali.dexlib2.AccessFlags
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.instruction.NarrowLiteralInstruction
import com.android.tools.smali.dexlib2.iface.instruction.OffsetInstruction
import org.junit.Assert.assertEquals
import org.junit.Assert.assertTrue
import org.junit.Test
import org.junit.experimental.categories.Category

/**
 * The post bridge in each declared build: Tumblr's Post, ReblogTrail and TextBlock each implement
 * their extension interface, and every interface method calls the getter the model's Moshi adapter
 * writes under its key, one the model declares with the same return type. Each post patch then
 * turns its switch and its rule on. What the rules take out is PostRulesTest's.
 */
@Category(FixtureTests::class)
class PostFiltersFixtureTest {
    @Test
    fun `Hide ads reads structured header icons and account ownership with a null-safe bridge`() {
        for (build in Fixtures.declaredBuilds()) {
            val types = setOf(POST, "$POST_HEADER_CONTEXT", POST.removeSuffix(";") + "JsonAdapter;",
                POST_HEADER_CONTEXT.removeSuffix(";") + "JsonAdapter;", "Lcom/tumblr/rumblr/model/post/PostHeaderContext\$ContextIcon;")
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: placement models, adapters and icon enum", types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)
            postJsonPresencePatch.execute(context)
            paidPostBridgePatch.execute(context)
            hideAdsPatch.execute(context)
            val post = context.mutableClassDefBy(POST)
            assertTrue(HUSH_PAID_POST in post.interfaces)
            val icon = post.methods.single { it.name == "hushHeaderIcon" }
            val body = icon.instructionList()
            assertEquals(listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.IF_EQZ,
                Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT, Opcode.CONST_4, Opcode.RETURN_OBJECT),
                body.map { it.opcode })
            assertEquals("$POST->d0()$POST_HEADER_CONTEXT", body[0].methodRef().toString())
            assertEquals("$POST_HEADER_CONTEXT->c()Ljava/lang/String;", body[3].methodRef().toString())
            assertEquals(body.take(6).sumOf { it.codeUnits }, body.take(2).sumOf { it.codeUnits } +
                (body[2] as OffsetInstruction).codeOffset)
            assertEquals(0, (body[6] as NarrowLiteralInstruction).narrowLiteral)
            for ((name, target) in mapOf("hushFollowed" to "x1", "hushCanEdit" to "P")) {
                val direct = post.methods.single { it.name == name }.instructionList()
                assertEquals(listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT, Opcode.RETURN), direct.map { it.opcode })
                assertEquals("$POST->$target()Z", direct[0].methodRef().toString())
            }
            val known = post.methods.single { it.name == "hushPaidContextKnown" }.instructionList()
            assertEquals(listOf(Opcode.IGET_BOOLEAN, Opcode.RETURN), known.map { it.opcode })
            assertEquals(POST_PAID_KNOWN, known[0].fieldRef().toString())
            val parser = context.mutableClassDefBy(POST.removeSuffix(";") + "JsonAdapter;")
                .methods.single { it.name == "fromJson" && it.parameterTypes.size == 1 }.instructionList()
            assertEquals(1, parser.count { it.methodRef().toString() == POST_JSON_SET })
            val enum = classes.getValue("Lcom/tumblr/rumblr/model/post/PostHeaderContext\$ContextIcon;")
                .methods.single { it.name == "<clinit>" }.instructionList()
            assertTrue(enum.any { it.stringRef() == "blaze" })
            assertTrue(enum.any { it.stringRef() == "money-alt" })
            assertTrue(enum.any { it.stringRef() == "SPONSORED" })
            for (flag in listOf("hideAds", "timelineAds", "paidPostHeader")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    @Test
    fun `tags belong to the current post field and are absent from the reblog trail adapter`() {
        for (build in Fixtures.declaredBuilds()) {
            val types = POST_BRIDGES.flatMap { listOf(it.model, it.adapter) }.toSet()
            val classes = FixtureDex.classes(build, types)
            val postWriter = classes.getValue(POST.removeSuffix(";") + "JsonAdapter;")
                .methods.single { it.name == "toJson" && it.parameterTypes.size == 2 }.instructionList()
            val tagKey = postWriter.indexOfFirst { it.stringRef() == "tags" }
            assertTrue("${build.name}: current-post tags key", tagKey >= 0)
            val getter = postWriter.drop(tagKey + 1).first { it.methodRef()?.definingClass == POST }.methodRef()!!
            assertEquals("$POST->j1()Ljava/util/List;", getter.toString())
            val tagField = classes.getValue(POST).methods.single { it.name == getter.name && it.parameterTypes.isEmpty() }
                .instructionList().first().fieldRef()!!
            assertEquals(POST, tagField.definingClass)
            assertEquals("f", tagField.name)
            val trailWriter = classes.getValue(REBLOG_TRAIL.removeSuffix(";") + "JsonAdapter;")
                .methods.single { it.name == "toJson" && it.parameterTypes.size == 2 }.instructionList()
            assertTrue("${build.name}: trail has no inherited tags list", trailWriter.none { it.stringRef() == "tags" })
        }
    }

    @Test
    fun `Hide reblogs bridges the post model and turns its switch on`() =
        check(hideReblogsPatch, "hideReblogs", "reblogPosts")

    @Test
    fun `Hide video posts bridges the post model and turns its switch on`() =
        check(hideVideoPostsPatch, "hideVideoPosts", "videoPosts")

    @Test
    fun `Hide photo posts bridges the post model and turns its switch on`() =
        check(hidePhotoPostsPatch, "hidePhotoPosts", "photoPosts")

    @Test
    fun `Hide text posts bridges the post model and turns its switch on`() =
        check(hideTextPostsPatch, "hideTextPosts", "textPosts")

    @Test
    fun `Hide posts with these words bridges the post model and turns its switch on`() =
        check(hidePostsWithWordsPatch, "hidePostsWithWords", "postWords")

    @Test
    fun `Hide filtered posts bridges the post's filtered note and turns its switch on`() {
        for (build in Fixtures.declaredBuilds()) {
            val types = FILTERED_POST_BRIDGES.flatMap { listOf(it.model, it.adapter) }.toSet()
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: the models and their adapters", types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)

            filteredPostBridgePatch.execute(context)
            hideFilteredPostsPatch.execute(context)

            // The getters each adapter writes under "filtered", "tags" and "content".
            val calls = mapOf(
                "hushFiltered" to "$POST->c0()$FILTERED",
                "hushFilteredTags" to "$FILTERED->b()Ljava/util/List;",
                "hushFilteredContent" to "$FILTERED->a()Ljava/util/List;",
            )
            for (bridge in FILTERED_POST_BRIDGES) {
                val model = context.mutableClassDefBy(bridge.model)
                assertTrue("${build.name}: ${bridge.model} implements ${bridge.bridge}", bridge.bridge in model.interfaces)
                for (getter in bridge.getters) {
                    val added = model.methods.single { it.name == getter.name && it.parameterTypes.isEmpty() }
                    val where = "${build.name}: ${bridge.model}->${getter.name}"
                    assertEquals(where, getter.returnType, added.returnType)
                    assertTrue("$where is public", AccessFlags.PUBLIC.isSet(added.accessFlags))
                    val body = added.instructionList()
                    assertEquals("$where: call, result, return",
                        listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), body.map { it.opcode })
                    assertEquals(where, calls.getValue(getter.name), body[0].methodRef().toString())
                }
            }
            for (flag in listOf("hideFilteredPosts", "filteredPosts")) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }

    private fun check(patch: BytecodePatch, status: String, capability: String) {
        for (build in Fixtures.declaredBuilds()) {
            val types = POST_BRIDGES.flatMap { listOf(it.model, it.adapter) }.toSet()
            val classes = FixtureDex.classes(build, types)
            assertEquals("${build.name}: the models and their adapters", types, classes.keys)
            val context = PatchContexts.of(ExtensionDex.classes() + classes.values)

            postBridgePatch.execute(context)
            patch.execute(context)

            for (bridge in POST_BRIDGES) {
                val model = context.mutableClassDefBy(bridge.model)
                val original = classes.getValue(bridge.model)
                assertTrue("${build.name}: ${bridge.model} implements ${bridge.bridge}", bridge.bridge in model.interfaces)
                for (getter in bridge.getters) {
                    val added = model.methods.single { it.name == getter.name && it.parameterTypes.isEmpty() }
                    val where = "${build.name}: ${bridge.model}->${getter.name}"
                    assertEquals(where, getter.returnType, added.returnType)
                    assertTrue("$where is public", AccessFlags.PUBLIC.isSet(added.accessFlags))
                    val body = added.instructionList()
                    assertEquals("$where: call, result, return",
                        listOf(Opcode.INVOKE_VIRTUAL, Opcode.MOVE_RESULT_OBJECT, Opcode.RETURN_OBJECT), body.map { it.opcode })
                    val call = body[0].methodRef()!!
                    assertEquals(where, bridge.model, call.definingClass)
                    assertTrue("$where calls ${call.name}, a getter of ${getter.returnType} the model declares",
                        original.methods.any {
                            it.name == call.name && it.parameterTypes.isEmpty() && it.returnType == getter.returnType &&
                                call.name !in setOf("hashCode", "toString")
                        })
                }
            }
            for (flag in listOf(status, capability)) {
                val first = context.mutableClassDefBy(SETTINGS_STATUS).methods.single { it.name == flag }
                    .implementation!!.instructions.first()
                assertEquals("${build.name}: $flag", 1, (first as NarrowLiteralInstruction).narrowLiteral)
            }
        }
    }
}
