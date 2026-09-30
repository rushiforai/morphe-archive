/*
 * Copyright 2026 HushThreads contributors
 * https://github.com/SysAdminDoc/HushThreads
 *
 * Built on SysAdminDoc/Hushfacebook (GPL-3.0). The feed cache's merge as the place to take ads out
 * is the one zeldrisho/morphe-patches found: https://github.com/zeldrisho/morphe-patches
 */
package app.morphe.patches.threads.ads

import app.morphe.patcher.Fingerprint
import app.morphe.patcher.literal
import app.morphe.patcher.methodCall
import com.android.tools.smali.dexlib2.AccessFlags

/** The feed's cache. Its name, and the names of its Kotlin lambdas, survive Redex. */
internal const val FEED_CACHE = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache;"

/** A post. A kept class, whose methods Redex renames. */
internal const val MEDIA = "Lcom/instagram/feed/media/Media;"

/** Java's `String.hashCode()` of "injected", the field a sponsored post carries. Pando asks by it. */
internal val INJECTED_FIELD = "injected".hashCode()

/**
 * The feed cache's merge of one fetched page, For You and Following alike: a suspend function
 * taking the page's items as its fifth parameter. The lambda it builds to save them keeps its
 * Kotlin name, and nothing else in the class builds it.
 */
internal object FeedPageMergeFingerprint : Fingerprint(
    definingClass = FEED_CACHE,
    returnType = "Ljava/lang/Object;",
    parameters = listOf(
        "L", "Ljava/lang/Integer;", "Ljava/lang/String;", "Ljava/lang/String;", "Ljava/util/List;",
        "L", "Lkotlin/jvm/functions/Function3;", "Z",
    ),
    filters = listOf(
        methodCall(
            definingClass = "Lcom/instagram/barcelona/feed/data/cache/BarcelonaFeedCache\$addAndSaveItemsFromFeedFetchSuccess\$2\$1;",
            name = "<init>",
        ),
    ),
)

/**
 * Threads' check of whether a post carries the "injected" block the server puts on an ad. A static
 * boolean method taking the post's fragment. It reads a field by a hash whose name the app doesn't
 * keep, then the "injected" field of that, and answers whether there is one. The first hash is
 * found nowhere else in the app.
 */
internal object InjectedAdCheckFingerprint : Fingerprint(
    accessFlags = listOf(AccessFlags.PUBLIC, AccessFlags.STATIC, AccessFlags.FINAL),
    returnType = "Z",
    parameters = listOf("L"),
    filters = listOf(
        literal(0x8669a9b0.toInt()),
        literal(INJECTED_FIELD),
    ),
)
