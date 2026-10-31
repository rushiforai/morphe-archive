package dx;

import c3.m3;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes4.dex */
public final class i0 implements h6.a0 {

    /* renamed from: a, reason: collision with root package name */
    public final h6.a0 f49710a;

    /* renamed from: b, reason: collision with root package name */
    public final h6.c0 f49711b;

    /* renamed from: c, reason: collision with root package name */
    public final h6.c0 f49712c;

    /* renamed from: d, reason: collision with root package name */
    public h6.t f49713d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f49714e;

    /* renamed from: f, reason: collision with root package name */
    public final m3 f49715f;

    public i0(h6.a0 parent) {
        Intrinsics.g(parent, "parent");
        this.f49710a = parent;
        h6.c0 c0Var = new h6.c0(this);
        this.f49711b = c0Var;
        this.f49712c = c0Var;
        this.f49713d = parent.getLifecycle().b();
        m3 m3Var = new m3(this, 3);
        this.f49715f = m3Var;
        parent.getLifecycle().a(m3Var);
        c();
    }

    public final void a() {
        this.f49710a.getLifecycle().c(this.f49715f);
    }

    public final void b(boolean z11) {
        if (z11 == this.f49714e) {
            return;
        }
        this.f49714e = z11;
        c();
    }

    public final void c() {
        h6.t a11;
        h6.c0 c0Var = this.f49711b;
        h6.t tVar = c0Var.f59342d;
        h6.t tVar2 = h6.t.f59440a;
        if (tVar == tVar2) {
            return;
        }
        if (this.f49714e) {
            a11 = this.f49713d;
        } else {
            a11 = this.f49713d;
            h6.t tVar3 = h6.t.f59442c;
            Intrinsics.g(a11, "a");
            if (a11.compareTo(tVar3) > 0) {
                a11 = tVar3;
            }
        }
        h6.t tVar4 = c0Var.f59342d;
        if (a11 == tVar4) {
            return;
        }
        if (a11 == tVar2 && tVar4 == h6.t.f59441b) {
            c0Var.h(h6.t.f59442c);
        }
        c0Var.h(a11);
    }

    @Override // h6.a0
    public final h6.u getLifecycle() {
        return this.f49712c;
    }
}
