package ads_mobile_sdk;

import android.util.DisplayMetrics;
import android.view.View;
import b.x3;
import java.util.Map;
import java.util.concurrent.ExecutorService;

/* loaded from: classes2.dex */
public final class mh3 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f7215a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f7216b;

    /* renamed from: c, reason: collision with root package name */
    public final b.m5 f7217c;

    /* renamed from: d, reason: collision with root package name */
    public final hb1 f7218d;

    /* renamed from: e, reason: collision with root package name */
    public final b.m5 f7219e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f7220f;

    public /* synthetic */ mh3(b.m5 m5Var, b.m5 m5Var2, b.m5 m5Var3, hb1 hb1Var, b.m5 m5Var4, int i5) {
        this.f7220f = i5;
        this.f7215a = m5Var;
        this.f7216b = m5Var2;
        this.f7217c = m5Var3;
        this.f7218d = hb1Var;
        this.f7219e = m5Var4;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f7220f) {
            case 0:
                return new lh3((x3) this.f7215a.get(), (rp1) this.f7216b.get(), (sb3) this.f7217c.get(), (Map) this.f7218d.f4276a, (vi3) this.f7219e.get());
            case 1:
                return new lh3((x3) this.f7215a.get(), (rp1) this.f7216b.get(), (DisplayMetrics) this.f7217c.get(), (View) this.f7218d.f4276a, (vi3) this.f7219e.get());
            default:
                return new qc3((fm0) this.f7215a.get(), (fm0) this.f7216b.get(), gj0.a(this.f7217c), (ExecutorService) this.f7218d.f4276a, (vi3) this.f7219e.get());
        }
    }
}
