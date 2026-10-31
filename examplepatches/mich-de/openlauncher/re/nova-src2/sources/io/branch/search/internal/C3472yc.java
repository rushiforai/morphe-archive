package io.branch.search.internal;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.yc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3472yc {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final c80.a f66331a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final w70.l1 f66332b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean f66333c;

    /* renamed from: d, reason: collision with root package name */
    public long f66334d;

    public C3472yc(int i5, long j11, @NotNull t70.j0 scope) {
        Intrinsics.g(scope, "scope");
        this.f66331a = new c80.d();
        w70.t1 t1VarB = w70.u1.b(0, i5, v70.a.f92142b, 1);
        this.f66332b = t1VarB;
        this.f66333c = true;
        this.f66334d = System.currentTimeMillis();
        w70.u1.u(w70.u1.v(new C3438wc(this, j11, null), t1VarB), scope);
    }
}
