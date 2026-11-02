// SPDX-FileCopyrightText: 2026 JoanComasFdz
// SPDX-License-Identifier: GPL-3.0-only

package io.github.joancomasfdz.patches.baconreader.fix.loadmore

import app.morphe.patcher.Fingerprint

/** Loads a "load more comments": loadMore(context, owner, threadKey, more, listener). */
internal object LoadMoreFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/data/ThreadManager;",
    name = "loadMore",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/Object;",
        "Lcom/onelouder/baconreader/data/ThreadKey;",
        "Lcom/onelouder/baconreader/reddit/More;",
        "Lcom/onelouder/baconreader/connectivity/Tasks\$OnCompleteListener;",
    ),
)

/** POST api/morechildren: getMoreChildren(context, linkId, sort, children, listener). */
internal object GetMoreChildrenFingerprint : Fingerprint(
    definingClass = "Lcom/onelouder/baconreader/reddit/RedditApi;",
    name = "getMoreChildren",
    returnType = "V",
    parameters = listOf(
        "Landroid/content/Context;",
        "Ljava/lang/String;",
        "Ljava/lang/String;",
        "Ljava/util/List;",
        "Lcom/onelouder/baconreader/connectivity/Tasks\$OnCompleteListener;",
    ),
)
