package io.branch.search.internal;

import java.util.ArrayList;
import java.util.Collection;
import java.util.HashMap;
import java.util.Map;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class I9 implements H9 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Map<String, G9> f62673a;

    public /* synthetic */ I9() {
        this(new HashMap());
    }

    @Override // io.branch.search.internal.H9
    @NotNull
    public final G9 a(@NotNull ArrayList sessionIds, long j11) {
        Intrinsics.g(sessionIds, "sessionIds");
        String strJ = b.c0.j("randomUUID().toString()");
        G9 g92 = new G9(strJ, sessionIds, j11, sessionIds.size());
        this.f62673a.put(strJ, g92);
        return g92;
    }

    @Override // io.branch.search.internal.H9
    @NotNull
    public final Collection<String> b(@NotNull String id2) {
        G9 g92;
        Collection<String> collection;
        Intrinsics.g(id2, "id");
        return (!this.f62673a.keySet().contains(id2) || (g92 = this.f62673a.get(id2)) == null || (collection = g92.f62520b) == null) ? EmptySet.f71734a : collection;
    }

    @Override // io.branch.search.internal.H9
    public final boolean c(@NotNull String id2) {
        Intrinsics.g(id2, "id");
        return this.f62673a.keySet().contains(id2);
    }

    public I9(@NotNull Map<String, G9> associations) {
        Intrinsics.g(associations, "associations");
        this.f62673a = associations;
    }

    @Override // io.branch.search.internal.H9
    @Nullable
    public final G9 a(@NotNull String id2) {
        Intrinsics.g(id2, "id");
        return this.f62673a.remove(id2);
    }
}
