package a5;

import android.os.Build;
import android.view.animation.Interpolator;

/* loaded from: classes.dex */
public final class t1 {

    /* renamed from: a, reason: collision with root package name */
    public s1 f369a;

    public t1(int i5, Interpolator interpolator, long j11) {
        if (Build.VERSION.SDK_INT >= 30) {
            this.f369a = new r1(f0.j(i5, interpolator, j11));
        } else {
            this.f369a = new p1(i5, interpolator, j11);
        }
    }
}
