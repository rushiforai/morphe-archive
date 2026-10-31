package n2;

import aa.m0;
import i2.t;
import k2.f;
import kotlin.jvm.internal.Intrinsics;
import y3.n;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: a, reason: collision with root package name */
    public m0 f77709a;

    /* renamed from: b, reason: collision with root package name */
    public t f77710b;

    /* renamed from: c, reason: collision with root package name */
    public float f77711c = 1.0f;

    /* renamed from: d, reason: collision with root package name */
    public n f77712d = n.f96612a;

    public abstract void b(float f11);

    public abstract void c(t tVar);

    public void d(n nVar) {
    }

    public final void e(f fVar, long j11, float f11, t tVar) {
        if (this.f77711c != f11) {
            b(f11);
            this.f77711c = f11;
        }
        if (!Intrinsics.b(this.f77710b, tVar)) {
            c(tVar);
            this.f77710b = tVar;
        }
        n layoutDirection = fVar.getLayoutDirection();
        if (this.f77712d != layoutDirection) {
            d(layoutDirection);
            this.f77712d = layoutDirection;
        }
        int i5 = (int) (j11 >> 32);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() >> 32)) - Float.intBitsToFloat(i5);
        int i11 = (int) (j11 & 4294967295L);
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (fVar.mo94getSizeNHjbRc() & 4294967295L)) - Float.intBitsToFloat(i11);
        fVar.getDrawContext().getTransform().inset(0.0f, 0.0f, fIntBitsToFloat, fIntBitsToFloat2);
        if (f11 > 0.0f) {
            try {
                if (Float.intBitsToFloat(i5) > 0.0f && Float.intBitsToFloat(i11) > 0.0f) {
                    h(fVar);
                }
            } finally {
                fVar.getDrawContext().getTransform().inset(-0.0f, -0.0f, -fIntBitsToFloat, -fIntBitsToFloat2);
            }
        }
    }

    public abstract long f();

    public abstract void h(f fVar);
}
