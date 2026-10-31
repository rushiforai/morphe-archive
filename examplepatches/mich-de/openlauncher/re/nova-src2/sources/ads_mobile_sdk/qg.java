package ads_mobile_sdk;

import android.content.Context;
import b.x3;
import cl.d1;

/* loaded from: classes2.dex */
public final class qg implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final hb1 f8650a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f8651b;

    /* renamed from: c, reason: collision with root package name */
    public final hb1 f8652c;

    /* renamed from: d, reason: collision with root package name */
    public final b.m5 f8653d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ int f8654e;

    public /* synthetic */ qg(hb1 hb1Var, b.m5 m5Var, hb1 hb1Var2, b.m5 m5Var2, int i5) {
        this.f8654e = i5;
        this.f8650a = hb1Var;
        this.f8651b = m5Var;
        this.f8652c = hb1Var2;
        this.f8653d = m5Var2;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f8654e) {
            case 0:
                return new pg((Context) this.f8650a.f4276a, (vi3) this.f8651b.get(), (j7) this.f8652c.f4276a, (d1) this.f8653d.get());
            case 1:
                return new qj0((x3) this.f8650a.f4276a, (rp1) this.f8651b.get(), (Context) this.f8652c.f4276a, (vi3) this.f8653d.get());
            default:
                return new up1((Context) this.f8650a.f4276a, (vi3) this.f8651b.get(), (a) this.f8653d.get(), (j7) this.f8652c.f4276a);
        }
    }

    public qg(hb1 hb1Var, b.m5 m5Var, b.m5 m5Var2, hb1 hb1Var2) {
        this.f8654e = 2;
        this.f8650a = hb1Var;
        this.f8651b = m5Var;
        this.f8653d = m5Var2;
        this.f8652c = hb1Var2;
    }
}
