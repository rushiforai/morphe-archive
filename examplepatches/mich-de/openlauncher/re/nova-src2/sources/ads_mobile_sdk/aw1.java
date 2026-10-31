package ads_mobile_sdk;

import android.content.Context;

/* loaded from: classes2.dex */
public final class aw1 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final hb1 f1167a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f1168b;

    /* renamed from: c, reason: collision with root package name */
    public final rg0 f1169c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f1170d = 1;

    public aw1(hb1 hb1Var, rg0 rg0Var, b.m5 m5Var) {
        this.f1167a = hb1Var;
        this.f1169c = rg0Var;
        this.f1168b = m5Var;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f1170d) {
            case 0:
                return new zv1((Context) this.f1167a.f4276a, (jr0) this.f1168b.get(), (ci3) this.f1169c.get());
            default:
                return new i80((Context) this.f1167a.f4276a, (t70.j0) this.f1169c.get(), (kz2) this.f1168b.get());
        }
    }

    public aw1(hb1 hb1Var, b.m5 m5Var, rg0 rg0Var) {
        this.f1167a = hb1Var;
        this.f1168b = m5Var;
        this.f1169c = rg0Var;
    }
}
