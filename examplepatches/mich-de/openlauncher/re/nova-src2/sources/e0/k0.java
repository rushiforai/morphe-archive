package e0;

import android.content.Context;
import android.widget.EdgeEffect;

/* loaded from: classes.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public final Context f50044a;

    /* renamed from: b, reason: collision with root package name */
    public final int f50045b;

    /* renamed from: c, reason: collision with root package name */
    public long f50046c = 0;

    /* renamed from: d, reason: collision with root package name */
    public EdgeEffect f50047d;

    /* renamed from: e, reason: collision with root package name */
    public EdgeEffect f50048e;

    /* renamed from: f, reason: collision with root package name */
    public EdgeEffect f50049f;

    /* renamed from: g, reason: collision with root package name */
    public EdgeEffect f50050g;

    /* renamed from: h, reason: collision with root package name */
    public EdgeEffect f50051h;

    /* renamed from: i, reason: collision with root package name */
    public EdgeEffect f50052i;

    /* renamed from: j, reason: collision with root package name */
    public EdgeEffect f50053j;

    /* renamed from: k, reason: collision with root package name */
    public EdgeEffect f50054k;

    public k0(Context context, int i5) {
        this.f50044a = context;
        this.f50045b = i5;
    }

    public static boolean f(EdgeEffect edgeEffect) {
        if (edgeEffect == null) {
            return false;
        }
        return !edgeEffect.isFinished();
    }

    public static boolean g(EdgeEffect edgeEffect) {
        if (edgeEffect == null) {
            return false;
        }
        return !(jk.b.C(edgeEffect) == 0.0f);
    }

    public final EdgeEffect a(g0.d1 d1Var) {
        EdgeEffect edgeEffectV = jk.b.v(this.f50044a);
        edgeEffectV.setColor(this.f50045b);
        if (!y3.m.a(this.f50046c, 0L)) {
            if (d1Var == g0.d1.f56493a) {
                long j11 = this.f50046c;
                edgeEffectV.setSize((int) (j11 >> 32), (int) (j11 & 4294967295L));
                return edgeEffectV;
            }
            long j12 = this.f50046c;
            edgeEffectV.setSize((int) (j12 & 4294967295L), (int) (j12 >> 32));
        }
        return edgeEffectV;
    }

    public final EdgeEffect b() {
        EdgeEffect edgeEffect = this.f50048e;
        if (edgeEffect != null) {
            return edgeEffect;
        }
        EdgeEffect edgeEffectA = a(g0.d1.f56493a);
        this.f50048e = edgeEffectA;
        return edgeEffectA;
    }

    public final EdgeEffect c() {
        EdgeEffect edgeEffect = this.f50049f;
        if (edgeEffect != null) {
            return edgeEffect;
        }
        EdgeEffect edgeEffectA = a(g0.d1.f56494b);
        this.f50049f = edgeEffectA;
        return edgeEffectA;
    }

    public final EdgeEffect d() {
        EdgeEffect edgeEffect = this.f50050g;
        if (edgeEffect != null) {
            return edgeEffect;
        }
        EdgeEffect edgeEffectA = a(g0.d1.f56494b);
        this.f50050g = edgeEffectA;
        return edgeEffectA;
    }

    public final EdgeEffect e() {
        EdgeEffect edgeEffect = this.f50047d;
        if (edgeEffect != null) {
            return edgeEffect;
        }
        EdgeEffect edgeEffectA = a(g0.d1.f56493a);
        this.f50047d = edgeEffectA;
        return edgeEffectA;
    }
}
