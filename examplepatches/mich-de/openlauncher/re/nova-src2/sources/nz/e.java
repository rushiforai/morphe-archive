package nz;

import android.animation.TimeInterpolator;
import android.content.Context;
import android.view.animation.Interpolator;
import y9.z;

/* loaded from: classes4.dex */
public final class e implements c {

    /* renamed from: a, reason: collision with root package name */
    public final boolean f78697a;

    /* renamed from: b, reason: collision with root package name */
    public final boolean f78698b;

    /* renamed from: c, reason: collision with root package name */
    public float f78699c;

    /* renamed from: d, reason: collision with root package name */
    public float f78700d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f78701e;

    /* renamed from: f, reason: collision with root package name */
    public float f78702f;

    public e(boolean z11, boolean z12) {
        this.f78697a = z11;
        this.f78698b = z12;
    }

    @Override // nz.c
    public final int a(int i5, int i11, int i12) {
        if (this.f78698b && i12 == 2) {
            if (i11 == 0) {
                return 0;
            }
            if (i11 != 1) {
                return i11 != 2 ? -1 : 1;
            }
            return 2;
        }
        if (i12 != 2) {
            if (i11 < 3) {
                return i11;
            }
            return -1;
        }
        if (i11 == 2) {
            return 0;
        }
        if (i11 < 2) {
            return i11 + 1;
        }
        return -1;
    }

    @Override // nz.c
    public final int b() {
        return 3;
    }

    @Override // nz.c
    public final void c(int i5, float f11, boolean z11) {
        float f12 = i5;
        this.f78699c = f12;
        this.f78700d = f11;
        this.f78701e = z11;
        this.f78702f = f12 / (f11 * 1.0f);
    }

    @Override // nz.c
    public final TimeInterpolator d(Context context, boolean z11, int i5, Interpolator interpolator) {
        return interpolator;
    }

    @Override // nz.c
    public final z e(int i5, int i11, z zVar, float f11) {
        float f12 = this.f78700d * f11;
        if (i5 > 2) {
            i5 = 2;
        }
        float f13 = this.f78699c;
        float f14 = (int) (i5 * 0.215f * f13);
        float f15 = ((f13 / 2.0f) - (f12 / 4.0f)) - f14;
        float f16 = this.f78697a ? f14 : (f13 - f12) / 2.0f;
        if (this.f78701e) {
            f16 = (f13 - f12) - f14;
        }
        if (zVar == null) {
            return new z(f16, f15, f11);
        }
        zVar.a(f16, f15, f11);
        return zVar;
    }

    @Override // nz.c
    public final int f(int i5, boolean z11) {
        return z11 ? i5 / 3 : super.f(i5, z11);
    }

    @Override // nz.c
    public final float g() {
        return this.f78700d;
    }

    @Override // nz.c
    public final float h(int i5, int i11) {
        return this.f78702f * (i5 != 0 ? i5 != 1 ? i5 != 2 ? 0.0f : 0.6f : 0.7f : 0.8f);
    }

    @Override // nz.c
    public final float i(int i5, int i11) {
        return i11 - i5;
    }
}
