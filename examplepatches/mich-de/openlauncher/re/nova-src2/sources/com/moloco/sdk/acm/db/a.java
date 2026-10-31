package com.moloco.sdk.acm.db;

import b70.g;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import r70.k;

/* loaded from: classes.dex */
public final class a {
    @NotNull
    public final String a(@NotNull c eventType) {
        Intrinsics.g(eventType, "eventType");
        return eventType.name();
    }

    @NotNull
    public final List<String> b(@NotNull String tagsString) {
        Intrinsics.g(tagsString, "tagsString");
        return tagsString.length() == 0 ? EmptyList.f71733a : k.i1(tagsString, new String[]{","}, 6);
    }

    @NotNull
    public final c a(@NotNull String eventType) {
        Intrinsics.g(eventType, "eventType");
        return c.valueOf(eventType);
    }

    @NotNull
    public final String a(@NotNull List<String> tags) {
        Intrinsics.g(tags, "tags");
        return g.f1(tags, ",", null, null, 0, null, 62);
    }
}
