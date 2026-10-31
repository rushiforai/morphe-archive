package io.branch.search.internal;

import java.util.Collection;
import java.util.Iterator;
import java.util.Set;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class De implements x80.y {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final Set<String> f62366a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final Set<String> f62367b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Set<String> f62368c;

    public De(@NotNull Set<String> hosts, @NotNull Set<String> requestBlackout, @NotNull Set<String> responseBlackout) {
        Intrinsics.g(hosts, "hosts");
        Intrinsics.g(requestBlackout, "requestBlackout");
        Intrinsics.g(responseBlackout, "responseBlackout");
        this.f62366a = hosts;
        this.f62367b = requestBlackout;
        this.f62368c = responseBlackout;
    }

    @Override // x80.y
    @NotNull
    public final x80.m0 intercept(@NotNull x80.x chain) {
        Intrinsics.g(chain, "chain");
        c90.f fVar = (c90.f) chain;
        x80.h0 h0VarB = fVar.f19892e;
        String str = h0VarB.f95509a.f95628d;
        Intrinsics.f(str, "request.url().host()");
        Set<String> set = this.f62366a;
        boolean z11 = false;
        if (!(set instanceof Collection) || !set.isEmpty()) {
            Iterator<T> it = set.iterator();
            while (true) {
                if (!it.hasNext()) {
                    break;
                }
                if (r70.j.A0(str, "." + ((String) it.next()), false)) {
                    z11 = true;
                    break;
                }
            }
        }
        if (!z11 && !this.f62367b.isEmpty()) {
            x80.g0 g0VarB = h0VarB.b();
            Iterator<T> it2 = this.f62367b.iterator();
            while (it2.hasNext()) {
                g0VarB.i((String) it2.next());
            }
            h0VarB = g0VarB.b();
        }
        x80.m0 m0VarB = fVar.b(h0VarB);
        if (z11 || this.f62368c.isEmpty()) {
            return m0VarB;
        }
        x80.l0 l0VarD = m0VarB.d();
        for (String name : this.f62368c) {
            Intrinsics.g(name, "name");
            l0VarD.f95527f.s(name);
        }
        return l0VarD.a();
    }
}
