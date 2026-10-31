package ex;

import c0.g2;
import dx.j0;
import gx.f0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class j implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final oi.b f53082a;

    /* renamed from: b, reason: collision with root package name */
    public final String f53083b;

    /* renamed from: c, reason: collision with root package name */
    public final long f53084c = System.currentTimeMillis();

    public j(oi.b bVar, String str) {
        this.f53082a = bVar;
        this.f53083b = str;
    }

    @Override // gx.f0
    public final String a() {
        return this.f53083b;
    }

    @Override // gx.f0
    public final long b(j0 global) {
        Intrinsics.g(global, "global");
        return global.f49720d;
    }

    @Override // gx.f0
    public final long c() {
        return this.f53084c;
    }

    @Override // gx.f0
    public final boolean d() {
        return true;
    }

    @Override // gx.f0
    public final void destroy() {
        try {
            int i5 = Result.f71687b;
            ((g2) this.f53082a).destroy();
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
    }

    @Override // gx.f0
    public final dx.u e() {
        return dx.u.f49796c;
    }

    @Override // gx.f0
    public final String f() {
        return null;
    }
}
