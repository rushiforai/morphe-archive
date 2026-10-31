package ads_mobile_sdk;

import android.content.Context;
import b.a0;
import b.l1;
import b.vb;
import b.x3;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* loaded from: classes.dex */
public final class og implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f7917a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f7918b;

    /* renamed from: c, reason: collision with root package name */
    public final b.m5 f7919c;

    /* renamed from: d, reason: collision with root package name */
    public final hb1 f7920d;

    /* renamed from: e, reason: collision with root package name */
    public final b.m5 f7921e;

    /* renamed from: f, reason: collision with root package name */
    public final hb1 f7922f;

    /* renamed from: g, reason: collision with root package name */
    public final b.m5 f7923g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ int f7924h = 0;

    public og(b.m5 m5Var, b.m5 m5Var2, b.m5 m5Var3, hb1 hb1Var, b.m5 m5Var4, hb1 hb1Var2, b.m5 m5Var5) {
        this.f7917a = m5Var;
        this.f7918b = m5Var2;
        this.f7919c = m5Var3;
        this.f7920d = hb1Var;
        this.f7921e = m5Var4;
        this.f7922f = hb1Var2;
        this.f7923g = m5Var5;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f7924h) {
            case 0:
                return new ng((x3) this.f7917a.get(), (rp1) this.f7918b.get(), (Map) this.f7919c.get(), (Context) this.f7920d.f4276a, (sb3) this.f7921e.get(), (j7) this.f7922f.f4276a, (vi3) this.f7923g.get());
            default:
                return new a63((a0) this.f7917a.get(), (l1) this.f7918b.get(), (vb) this.f7919c.get(), (ub3) this.f7921e.get(), (vi3) this.f7923g.get(), (j7) this.f7920d.f4276a, (ExecutorService) this.f7922f.f4276a);
        }
    }

    public og(b.m5 m5Var, b.m5 m5Var2, b.m5 m5Var3, b.m5 m5Var4, b.m5 m5Var5, hb1 hb1Var, hb1 hb1Var2) {
        this.f7917a = m5Var;
        this.f7918b = m5Var2;
        this.f7919c = m5Var3;
        this.f7921e = m5Var4;
        this.f7923g = m5Var5;
        this.f7920d = hb1Var;
        this.f7922f = hb1Var2;
    }
}
