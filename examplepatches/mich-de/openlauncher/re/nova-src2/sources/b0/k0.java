package b0;

import p1.m2;

/* loaded from: classes2.dex */
public final class k0 {

    /* renamed from: a, reason: collision with root package name */
    public final f1 f16161a;

    /* renamed from: b, reason: collision with root package name */
    public final g1 f16162b;

    /* renamed from: c, reason: collision with root package name */
    public final m2 f16163c;

    /* renamed from: d, reason: collision with root package name */
    public final s1 f16164d;

    public k0(f1 f1Var, g1 g1Var, float f11, s1 s1Var) {
        this.f16161a = f1Var;
        this.f16162b = g1Var;
        this.f16163c = androidx.compose.runtime.d.f(f11);
        this.f16164d = s1Var;
    }

    public k0(f1 f1Var, g1 g1Var, s1 s1Var, int i5) {
        if ((i5 & 8) != 0) {
            int i11 = androidx.compose.animation.a.f13870b;
            s1Var = new s1(m.f16178k);
        }
        this(f1Var, g1Var, 0.0f, s1Var);
    }
}
