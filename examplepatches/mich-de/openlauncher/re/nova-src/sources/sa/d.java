package sa;

import android.view.animation.Interpolator;
import e10.b0;
import e10.y2;
import s9.k;

/* loaded from: classes.dex */
public class d {

    /* renamed from: a, reason: collision with root package name */
    public long f87094a;

    /* renamed from: b, reason: collision with root package name */
    public boolean f87095b;

    /* renamed from: c, reason: collision with root package name */
    public final Interpolator[] f87096c = new Interpolator[15];

    public final Interpolator a(int i5, Interpolator interpolator) {
        if (i5 == 0) {
            b0 b0Var = (b0) y2.f51877a.I().l();
            if (this.f87095b) {
                return k.f86788a;
            }
            if (!b0Var.d()) {
                return k.f86799l;
            }
        }
        Interpolator interpolator2 = this.f87096c[i5];
        return interpolator2 == null ? interpolator : interpolator2;
    }
}
