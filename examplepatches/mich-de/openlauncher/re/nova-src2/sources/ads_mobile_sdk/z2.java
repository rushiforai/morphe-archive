package ads_mobile_sdk;

import android.content.Context;
import b.k9;
import java.util.Map;
import java.util.Optional;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;

/* loaded from: classes2.dex */
public final class z2 implements b.bb {

    /* renamed from: a, reason: collision with root package name */
    public final b.m5 f12419a;

    /* renamed from: b, reason: collision with root package name */
    public final b.m5 f12420b;

    /* renamed from: c, reason: collision with root package name */
    public final b.m5 f12421c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f12422d;

    public /* synthetic */ z2(b.m5 m5Var, b.m5 m5Var2, b.m5 m5Var3, int i5) {
        this.f12422d = i5;
        this.f12419a = m5Var;
        this.f12420b = m5Var2;
        this.f12421c = m5Var3;
    }

    @Override // b.m5
    public final Object get() {
        switch (this.f12422d) {
            case 0:
                return new y2((t70.j0) ((rg0) this.f12419a).get(), (Map) ((fn1) this.f12420b).get(), (z1) ((hb1) this.f12421c).f4276a);
            case 1:
                return new j23((t70.j0) ((rg0) this.f12419a).get(), (jr0) this.f12420b.get(), (zj1) ((rg0) this.f12421c).get());
            case 2:
                return new kx2((z1) this.f12419a.get(), (hv) this.f12420b.get(), (jx2) ((da2) this.f12421c).get());
            case 3:
                ((lv) this.f12419a).get();
                jr0 flags = (jr0) this.f12420b.get();
                ni.q baseRequest = (ni.q) ((hb1) this.f12421c).f4276a;
                Intrinsics.g(flags, "flags");
                Intrinsics.g(baseRequest, "baseRequest");
                EmptySet emptySet = EmptySet.f71734a;
                k9.L(emptySet);
                return emptySet;
            case 4:
                return new vq3((Optional) ((p80) this.f12419a).get(), (t70.j0) this.f12420b.get(), (jr0) this.f12421c.get());
            case 5:
                return new wi0((Context) ((hb1) this.f12421c).f4276a, (j7) ((hb1) this.f12419a).f4276a, (ub3) this.f12420b.get());
            default:
                return new yj3((t70.j0) ((rg0) this.f12419a).get(), (Context) ((hb1) this.f12421c).f4276a, (ci3) ((rg0) this.f12420b).get());
        }
    }

    public z2(hb1 hb1Var, hb1 hb1Var2, b.m5 m5Var) {
        this.f12422d = 5;
        this.f12421c = hb1Var;
        this.f12419a = hb1Var2;
        this.f12420b = m5Var;
    }

    public z2(rg0 rg0Var, hb1 hb1Var, rg0 rg0Var2) {
        this.f12422d = 6;
        this.f12419a = rg0Var;
        this.f12421c = hb1Var;
        this.f12420b = rg0Var2;
    }
}
