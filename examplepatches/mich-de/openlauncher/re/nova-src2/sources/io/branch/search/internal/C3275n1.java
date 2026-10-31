package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.n1, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3275n1 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final String f65298a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final C3241l1 f65299b;

    /* renamed from: c, reason: collision with root package name */
    public final int f65300c;

    /* renamed from: d, reason: collision with root package name */
    @NotNull
    public final C3072b1 f65301d;

    public C3275n1(@NotNull String query, @NotNull C3241l1 vr2, int i5) {
        Intrinsics.g(query, "query");
        Intrinsics.g(vr2, "vr");
        this.f65298a = query;
        this.f65299b = vr2;
        this.f65300c = i5;
        this.f65301d = new C3072b1(i5, query);
    }
}
