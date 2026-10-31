package o9;

import android.animation.ValueAnimator;
import android.view.View;

/* loaded from: classes2.dex */
public final class p0 implements ValueAnimator.AnimatorUpdateListener {

    /* renamed from: a, reason: collision with root package name */
    public long f80057a;

    /* renamed from: b, reason: collision with root package name */
    public long f80058b = -1;

    /* renamed from: c, reason: collision with root package name */
    public boolean f80059c;

    /* renamed from: d, reason: collision with root package name */
    public boolean f80060d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ q0 f80061e;

    public p0(q0 q0Var) {
        this.f80061e = q0Var;
    }

    /* JADX WARN: Removed duplicated region for block: B:36:0x0095  */
    @Override // android.animation.ValueAnimator.AnimatorUpdateListener
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void onAnimationUpdate(ValueAnimator valueAnimator) {
        View view;
        long jCurrentTimeMillis = System.currentTimeMillis();
        long j11 = this.f80058b;
        q0 q0Var = this.f80061e;
        if (j11 == -1) {
            this.f80057a = q0Var.f80075b;
            this.f80058b = jCurrentTimeMillis;
        }
        long currentPlayTime = valueAnimator.getCurrentPlayTime();
        boolean z11 = Float.compare(1.0f, valueAnimator.getAnimatedFraction()) == 0;
        if (this.f80059c || (view = q0Var.f80074a) == null || view.getWindowVisibility() != 0 || currentPlayTime >= valueAnimator.getDuration() || z11) {
            return;
        }
        this.f80059c = true;
        long j12 = q0Var.f80075b - this.f80057a;
        if (j12 != 0 || jCurrentTimeMillis >= this.f80058b + 1000 || currentPlayTime <= 0) {
            int iB = ya.g.b(q0Var.f80074a.getContext());
            if (j12 == 1) {
                long j13 = this.f80058b;
                if (jCurrentTimeMillis < j13 + 1000 && !this.f80060d) {
                    long j14 = iB;
                    if (jCurrentTimeMillis > j13 + j14 && currentPlayTime > j14) {
                        valueAnimator.setCurrentPlayTime(j14);
                        this.f80060d = true;
                    }
                } else if (j12 > 1) {
                    q0Var.f80074a.post(new kz.c(12, this, valueAnimator));
                }
            }
        } else {
            q0Var.f80074a.invalidate();
            valueAnimator.setCurrentPlayTime(0L);
        }
        this.f80059c = false;
    }
}
