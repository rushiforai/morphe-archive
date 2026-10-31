package io.branch.search.internal;

import java.util.LinkedHashMap;
import java.util.Map;
import kotlin.Pair;
import kotlin.collections.MapsKt;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.d1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3106d1 {
    @NotNull
    public static final Map<String, String> a(@NotNull C3123e1 c3123e1) {
        Intrinsics.g(c3123e1, "<this>");
        LinkedHashMap linkedHashMapK0 = MapsKt.k0(new Pair("client", c3123e1.f64357a), new Pair("q", c3123e1.f64358b));
        String str = c3123e1.f64359c;
        if (str != null) {
        }
        String str2 = c3123e1.f64360d;
        if (str2 != null) {
            linkedHashMapK0.put("gl", str2);
        }
        return linkedHashMapK0;
    }
}
