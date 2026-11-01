/*
 * Copyright 2026 HushTumblr contributors
 * https://github.com/SysAdminDoc/HushTumblr
 * SPDX-License-Identifier: GPL-3.0-only
 */
package app.morphe.patches.tumblr.timeline

import app.morphe.patcher.extensions.InstructionExtensions.addInstructions
import app.morphe.patcher.patch.BytecodePatchContext
import app.morphe.patcher.patch.PatchException
import app.morphe.patcher.patch.bytecodePatch
import app.morphe.patcher.util.proxy.mutableTypes.MutableMethod
import app.morphe.patches.tumblr.lookup.hasShape
import app.morphe.patches.tumblr.lookup.instructionList
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.mutableOf
import app.morphe.patches.tumblr.lookup.only
import app.morphe.patches.tumblr.lookup.requireExtensionHook
import app.morphe.patches.tumblr.lookup.requireShape
import app.morphe.patches.tumblr.misc.extension.EXTENSION_PACKAGE
import app.morphe.patches.tumblr.misc.extension.parameterRegister
import app.morphe.patches.tumblr.misc.extension.parameterRegisterNumber
import app.morphe.patches.tumblr.misc.extension.tumblrExtensionPatch
import app.morphe.patches.tumblr.misc.settings.settingsPatch
import com.android.tools.smali.dexlib2.Opcode
import com.android.tools.smali.dexlib2.iface.Method
import com.android.tools.smali.dexlib2.iface.instruction.FiveRegisterInstruction
import com.android.tools.smali.dexlib2.iface.instruction.RegisterRangeInstruction

internal const val TIMELINE_FILTER = "$EXTENSION_PACKAGE/timeline/TimelineFilter;"
internal const val TIMELINE_FILTER_HOOK = "$TIMELINE_FILTER->filter(Ljava/util/List;)Ljava/util/List;"
internal const val TIMELINE_KEPT_HOOK = "$TIMELINE_FILTER->filterKept(Ljava/util/List;)Ljava/util/List;"
internal const val DIRECT_POST_HOOK = "$EXTENSION_PACKAGE/timeline/DirectPosts;->opening(Ljava/lang/String;)V"
private const val TUMBLR_SERVICE = "Lcom/tumblr/rumblr/TumblrService;"
internal const val POST_PERMALINK = "$TUMBLR_SERVICE->postPermalink(Ljava/lang/String;Ljava/lang/String;)Lretrofit2/Call;"

// Shared by every timeline patch, so its messages name the hook rather than one of them.
private const val PATCH = "Timeline list hook"

private const val LINK = "Lcom/tumblr/rumblr/model/PaginationLink;"

/**
 * The constructors each page of timeline items is built with, all in classes R8 keeps by name.
 * `Timeline` is the dashboard's page, wrapped by `WrappedTimelineResponse`. `TimelineResponse` is
 * the base of the blog posts, likes and blog search pages, whose constructors all call this one.
 * The items are the first parameter of both.
 */
internal val TIMELINE_LISTS = listOf(
    "Lcom/tumblr/rumblr/model/Timeline;-><init>(Ljava/util/List;$LINK)V",
    "$TIMELINE_RESPONSE-><init>(Ljava/util/List;${LINK}Ljava/util/Map;)V",
)

internal const val TIMELINE_RESPONSE = "Lcom/tumblr/rumblr/response/timeline/TimelineResponse;"

/**
 * Passes the items each timeline page is built with through `TimelineFilter.filter`, first thing in
 * its constructor, so what a switch drops never reaches Tumblr's adapters. It has no switch or name
 * of its own: each timeline patch depends on it and adds its rule to the extension's filter.
 *
 * Both constructors take the items straight from Tumblr's JSON adapters, so every dashboard, blog,
 * likes and search page passes through. Found by reading Tumblr 46.5.0.109 (2026-10-11).
 *
 * A page the filter empties would read to Tumblr as the end of the feed, so [timelinePagingPatch]
 * comes with it and sends the fragment on to the next page.
 *
 * The `TimelineResponse` subclasses keep their own copy of the items, so each is filtered in its
 * own constructor too, see [resolveTimelineCopies].
 *
 * A link or a notification opens one post through one query, and a filtered post left that page
 * empty, so the query tells the extension which post it's asking for, see [resolveDirectPost].
 */
internal val timelineListHookPatch = bytecodePatch {
    dependsOn(settingsPatch, tumblrExtensionPatch, timelinePagingPatch)

    execute {
        // Every target is found before the first edit, so a refusal leaves the APK as it was.
        val constructors = resolveTimelineLists()
        val copies = resolveTimelineCopies()
        val directPost = resolveDirectPost()
        directPost.query.addInstructions(
            directPost.ask,
            "invoke-static/range { v${directPost.id} .. v${directPost.id} }, $DIRECT_POST_HOOK",
        )
        copies.forEach { (constructor, items) ->
            // Its first instruction is the base constructor call, which hands on what comes back.
            constructor.addInstructions(
                0,
                """
                    invoke-static/range { $items .. $items }, $TIMELINE_KEPT_HOOK
                    move-result-object $items
                """,
            )
        }
        constructors.forEach { constructor ->
            val items = constructor.parameterRegister(0)
            // Before the superclass constructor: only the items' own register is touched, and a
            // static call on it is allowed there.
            constructor.addInstructions(
                0,
                """
                    invoke-static/range { $items .. $items }, $TIMELINE_FILTER_HOOK
                    move-result-object $items
                """,
            )
        }
    }
}

/** Finds each of [TIMELINE_LISTS], throwing for the first one this build doesn't have. */
internal fun BytecodePatchContext.resolveTimelineLists(): List<MutableMethod> {
    requireExtensionHook(PATCH, TIMELINE_FILTER_HOOK)
    return TIMELINE_LISTS.map { constructor ->
        val type = constructor.substringBefore("->")
        val signature = constructor.substringAfter("->")
        val owner = classDefByOrNull(type) ?: throw PatchException("$PATCH: Tumblr's $type wasn't found")
        if (owner.methods.none { it.matches(signature) && it.implementation != null }) {
            throw PatchException("$PATCH: $constructor wasn't found")
        }
        mutableClassDefBy(type).methods.single { it.matches(signature) }
    }
}

/**
 * Each constructor of a `TimelineResponse` subclass whose first instruction hands one of its own
 * list parameters to the base list constructor, with that parameter's `p` register. Tumblr
 * 46.8.1.100's `PostsResponse` (a blog's posts), `LikesResponse` and `BlogSearchResponse` each also
 * keep that list in a field of their own and answer `getTimelineObjects()` from it, so the list
 * the base constructor filtered never reached a blog page (found 2026-10-22). Throws for a
 * subclass that answers its own items with no such constructor, since the filter couldn't reach it.
 */
internal fun BytecodePatchContext.resolveTimelineCopies(): List<Pair<MutableMethod, String>> {
    requireExtensionHook(PATCH, TIMELINE_KEPT_HOOK)
    val base = TIMELINE_LISTS[1]
    val found = mutableListOf<Pair<String, String>>()
    classDefForEach { owner ->
        if (owner.superclass != TIMELINE_RESPONSE) return@classDefForEach
        val handed = owner.methods.filter { it.name == "<init>" && it.handsItemsTo(base) != null }
        val answers = owner.methods.any { it.matches("getTimelineObjects()Ljava/util/List;") }
        if (answers && handed.isEmpty()) {
            throw PatchException("$PATCH: ${owner.type} keeps its own timeline items and no constructor hands them to $base")
        }
        handed.forEach { found += owner.type to "${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" }
    }
    return found.map { (type, signature) ->
        val constructor = mutableClassDefBy(type).methods.single { it.matches(signature) }
        constructor to constructor.parameterRegister(constructor.handsItemsTo(base)!!)
    }
}

/**
 * The index of the list parameter this constructor's first instruction hands [base] as its items,
 * or null when it starts some other way.
 */
private fun Method.handsItemsTo(base: String): Int? {
    val first = implementation?.instructions?.firstOrNull() ?: return null
    val called = first.methodRef() ?: return null
    if (first.opcode != Opcode.INVOKE_DIRECT && first.opcode != Opcode.INVOKE_DIRECT_RANGE) return null
    if ("${called.definingClass}->${called.name}(${called.parameterTypes.joinToString("")})${called.returnType}" != base) return null
    val items = when (first) {
        is RegisterRangeInstruction -> first.startRegister + 1
        is FiveRegisterInstruction -> first.registerD
        else -> return null
    }
    return parameterTypes.indices.firstOrNull {
        parameterTypes[it].toString() == "Ljava/util/List;" && parameterRegisterNumber(it) == items
    }
}

internal class DirectPostPlan(val query: MutableMethod, val ask: Int, val id: Int)

/**
 * The query that opens one post by itself (`PostPermalinkTimelineFragment`'s in Tumblr 46.9.1.100),
 * which takes Tumblr's service and answers its [POST_PERMALINK] call. The id it asks for is that
 * call's last argument. A blog tab asks the same call for its own reasons, in a method of another
 * shape, and stays as it is.
 */
internal fun BytecodePatchContext.resolveDirectPost(): DirectPostPlan {
    requireExtensionHook(PATCH, DIRECT_POST_HOOK)
    val found = mutableListOf<Method>()
    classDefForEach { owner ->
        owner.methods.filterTo(found) { method ->
            method.hasShape(listOf(TUMBLR_SERVICE), "Lretrofit2/Call;") && method.asks().isNotEmpty()
        }
    }
    val query = found.only(PATCH, "the query that opens one post")
    val ask = query.asks().only(PATCH, "the query's ask for one post")
    val id = when (val call = query.instructionList()[ask]) {
        is RegisterRangeInstruction -> call.startRegister + 2
        is FiveRegisterInstruction -> call.registerE
        else -> null
    }
    requireShape(PATCH, id != null, "the query that opens one post doesn't hand its call the id in a register")
    return DirectPostPlan(mutableOf(query), ask, id!!)
}

private fun Method.asks(): List<Int> = instructionList().let { steps ->
    steps.indices.filter { at ->
        steps[at].methodRef()?.let {
            "${it.definingClass}->${it.name}(${it.parameterTypes.joinToString("")})${it.returnType}" == POST_PERMALINK
        } == true
    }
}

private fun Method.matches(signature: String): Boolean =
    "$name(${parameterTypes.joinToString("")})$returnType" == signature
