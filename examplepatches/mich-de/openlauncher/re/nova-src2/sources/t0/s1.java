package t0;

import kotlin.coroutines.jvm.internal.ContinuationImpl;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.functions.Function2;

/* loaded from: classes.dex */
public final class s1 implements g0.b2 {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ g0.b2 f88188a;

    /* renamed from: b, reason: collision with root package name */
    public final p1.i0 f88189b;

    /* renamed from: c, reason: collision with root package name */
    public final p1.i0 f88190c;

    public s1(g0.b2 b2Var, final u1 u1Var) {
        this.f88188a = b2Var;
        final int i5 = 0;
        this.f88189b = androidx.compose.runtime.d.d(new Function0() { // from class: t0.r1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i5) {
                    case 0:
                        u1 u1Var2 = u1Var;
                        return Boolean.valueOf(u1Var2.a() < u1Var2.f88227b.m());
                    default:
                        return Boolean.valueOf(u1Var.a() > 0.0f);
                }
            }
        });
        final int i11 = 1;
        this.f88190c = androidx.compose.runtime.d.d(new Function0() { // from class: t0.r1
            @Override // kotlin.jvm.functions.Function0
            public final Object invoke() {
                switch (i11) {
                    case 0:
                        u1 u1Var2 = u1Var;
                        return Boolean.valueOf(u1Var2.a() < u1Var2.f88227b.m());
                    default:
                        return Boolean.valueOf(u1Var.a() > 0.0f);
                }
            }
        });
    }

    @Override // g0.b2
    public final float a(float f11) {
        return this.f88188a.a(f11);
    }

    @Override // g0.b2
    public final boolean b() {
        return this.f88188a.b();
    }

    @Override // g0.b2
    public final boolean c() {
        return ((Boolean) this.f88190c.getValue()).booleanValue();
    }

    @Override // g0.b2
    public final Object d(e0.f1 f1Var, Function2 function2, ContinuationImpl continuationImpl) {
        return this.f88188a.d(f1Var, function2, continuationImpl);
    }

    @Override // g0.b2
    public final boolean e() {
        return ((Boolean) this.f88189b.getValue()).booleanValue();
    }
}
