package ex;

import c0.g2;
import dx.j0;
import gx.f0;
import kotlin.Result;
import kotlin.ResultKt;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class n implements f0 {

    /* renamed from: a, reason: collision with root package name */
    public final ui.d f53093a;

    /* renamed from: b, reason: collision with root package name */
    public final String f53094b;

    /* renamed from: c, reason: collision with root package name */
    public final long f53095c = System.currentTimeMillis();

    /* renamed from: d, reason: collision with root package name */
    public final String f53096d;

    /* JADX WARN: Multi-variable type inference failed */
    public n(ui.d dVar, String str) {
        this.f53093a = dVar;
        this.f53094b = str;
        String adapterClassName = ((g2) dVar).a().getResponseInfo().getAdapterClassName();
        this.f53096d = adapterClassName != null ? r70.k.n1('.', adapterClassName, adapterClassName) : null;
    }

    @Override // gx.f0
    public final String a() {
        return this.f53094b;
    }

    @Override // gx.f0
    public final long b(j0 global) {
        Intrinsics.g(global, "global");
        return global.f49720d;
    }

    @Override // gx.f0
    public final long c() {
        return this.f53095c;
    }

    @Override // gx.f0
    public final boolean d() {
        return true;
    }

    @Override // gx.f0
    public final void destroy() {
        try {
            int i5 = Result.f71687b;
            ((g2) this.f53093a).destroy();
            Unit unit = Unit.f71706a;
        } catch (Throwable th2) {
            int i11 = Result.f71687b;
            ResultKt.a(th2);
        }
    }

    @Override // gx.f0
    public final dx.u e() {
        return dx.u.f49794a;
    }

    @Override // gx.f0
    public final String f() {
        return this.f53096d;
    }
}
