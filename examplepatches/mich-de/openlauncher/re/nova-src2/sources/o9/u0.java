package o9;

import android.animation.ObjectAnimator;

/* loaded from: classes.dex */
public final class u0 {

    /* renamed from: f, reason: collision with root package name */
    public static final aa.l f80146f = new aa.l(8, Float.TYPE, "value");

    /* renamed from: a, reason: collision with root package name */
    public final long f80147a;

    /* renamed from: b, reason: collision with root package name */
    public final float f80148b;

    /* renamed from: c, reason: collision with root package name */
    public final ObjectAnimator f80149c;

    /* renamed from: d, reason: collision with root package name */
    public float f80150d;

    /* renamed from: e, reason: collision with root package name */
    public boolean f80151e = true;

    public u0(float f11, long j11) {
        ObjectAnimator duration = ObjectAnimator.ofFloat(this, f80146f, 0.0f, f11).setDuration(j11);
        this.f80149c = duration;
        this.f80147a = j11;
        this.f80148b = f11;
        duration.addListener(new t0(this, 0));
    }

    public final void a(int i5) {
        ObjectAnimator objectAnimator = this.f80149c;
        long currentPlayTime = objectAnimator.getCurrentPlayTime();
        float f11 = i5 == 1 ? this.f80148b : 0.0f;
        float f12 = this.f80151e ? 0.0f : this.f80150d;
        objectAnimator.cancel();
        long j11 = this.f80147a;
        objectAnimator.setDuration(Math.max(0L, Math.min(j11 - currentPlayTime, j11)));
        objectAnimator.setFloatValues(f12, f11);
        objectAnimator.start();
        this.f80151e = false;
    }
}
