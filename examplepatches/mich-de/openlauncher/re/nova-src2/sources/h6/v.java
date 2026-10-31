package h6;

import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class v {

    /* renamed from: a, reason: collision with root package name */
    public final u f59456a;

    /* renamed from: b, reason: collision with root package name */
    public final t f59457b;

    /* renamed from: c, reason: collision with root package name */
    public final l f59458c;

    /* renamed from: d, reason: collision with root package name */
    public final a5.r f59459d;

    public v(u uVar, t tVar, l dispatchQueue, t70.r1 r1Var) {
        Intrinsics.g(dispatchQueue, "dispatchQueue");
        this.f59456a = uVar;
        this.f59457b = tVar;
        this.f59458c = dispatchQueue;
        a5.r rVar = new a5.r(2, this, r1Var);
        this.f59459d = rVar;
        if (uVar.b() != t.f59440a) {
            uVar.a(rVar);
        } else {
            r1Var.c(null);
            a();
        }
    }

    public final void a() {
        this.f59456a.c(this.f59459d);
        l lVar = this.f59458c;
        lVar.f59404b = true;
        lVar.b();
    }
}
