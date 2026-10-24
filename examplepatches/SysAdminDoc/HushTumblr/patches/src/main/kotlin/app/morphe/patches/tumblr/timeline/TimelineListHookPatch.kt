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
import app.morphe.patches.tumblr.lookup.methodRef
import app.morphe.patches.tumblr.lookup.requireExtensionHook
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
 */
internal val timelineListHookPatch = bytecodePatch {
    dependsOn(settingsPatch, tumblrExtensionPatch, timelinePagingPatch)

    execute {
        // Every target is found before the first edit, so a refusal leaves the APK as it was.
        val constructors = resolveTimelineLists()
        val copies = resolveTimelineCopies()
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

private fun Method.matches(signature: String): Boolean =
    "$name(${parameterTypes.joinToString("")})$returnType" == signature
