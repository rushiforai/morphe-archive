package ya;

import android.animation.TimeInterpolator;
import android.view.animation.AnimationUtils;

/* loaded from: classes2.dex */
public final class l implements TimeInterpolator {

    /* renamed from: a, reason: collision with root package name */
    public int f97151a = -1;

    /* renamed from: b, reason: collision with root package name */
    public float f97152b = 0.0f;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ long f97153c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ int f97154d;

    public l(long j11, int i5) {
        this.f97153c = j11;
        this.f97154d = i5;
    }

    @Override // android.animation.TimeInterpolator
    public final float getInterpolation(float f11) {
        int i5 = this.f97151a;
        if (i5 < 0) {
            this.f97151a = i5 + 1;
        } else if (i5 == 0) {
            this.f97152b = Math.min(0.5f, (AnimationUtils.currentAnimationTimeMillis() - this.f97153c) / this.f97154d);
            this.f97151a++;
        }
        return Math.min(1.0f, this.f97152b + f11);
    }
}
