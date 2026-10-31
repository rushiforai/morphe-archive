package wj;

import android.animation.ObjectAnimator;
import android.content.Context;
import android.view.animation.AnimationUtils;
import android.view.animation.Interpolator;
import java.util.ArrayList;
import java.util.Iterator;

/* loaded from: classes3.dex */
public final class r extends c3.b {
    public static final int[] o = {533, 567, 850, 750};

    /* renamed from: p, reason: collision with root package name */
    public static final int[] f94479p = {1267, 1000, 333, 0};

    /* renamed from: q, reason: collision with root package name */
    public static final jz.b f94480q = new jz.b(7, Float.class, "animationFraction");

    /* renamed from: g, reason: collision with root package name */
    public ObjectAnimator f94481g;

    /* renamed from: h, reason: collision with root package name */
    public ObjectAnimator f94482h;

    /* renamed from: i, reason: collision with root package name */
    public final Interpolator[] f94483i;

    /* renamed from: j, reason: collision with root package name */
    public final s f94484j;

    /* renamed from: k, reason: collision with root package name */
    public int f94485k;

    /* renamed from: l, reason: collision with root package name */
    public boolean f94486l;

    /* renamed from: m, reason: collision with root package name */
    public float f94487m;
    public b n;

    public r(Context context, s sVar) {
        super(2);
        this.f94485k = 0;
        this.n = null;
        this.f94484j = sVar;
        this.f94483i = new Interpolator[]{AnimationUtils.loadInterpolator(context, 2130772015), AnimationUtils.loadInterpolator(context, 2130772016), AnimationUtils.loadInterpolator(context, 2130772017), AnimationUtils.loadInterpolator(context, 2130772018)};
    }

    @Override // c3.b
    public final void A() {
        ObjectAnimator objectAnimator = this.f94482h;
        if (objectAnimator == null || objectAnimator.isRunning()) {
            return;
        }
        g();
        if (((n) this.f19222a).isVisible()) {
            this.f94482h.setFloatValues(this.f94487m, 1.0f);
            this.f94482h.setDuration((long) ((1.0f - this.f94487m) * 1800.0f));
            this.f94482h.start();
        }
    }

    @Override // c3.b
    public final void C() {
        ObjectAnimator objectAnimator = this.f94481g;
        jz.b bVar = f94480q;
        if (objectAnimator == null) {
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, bVar, 0.0f, 1.0f);
            this.f94481g = objectAnimatorOfFloat;
            objectAnimatorOfFloat.setDuration(1800L);
            this.f94481g.setInterpolator(null);
            this.f94481g.setRepeatCount(-1);
            this.f94481g.addListener(new q(this, 0));
        }
        if (this.f94482h == null) {
            ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this, bVar, 1.0f);
            this.f94482h = objectAnimatorOfFloat2;
            objectAnimatorOfFloat2.setDuration(1800L);
            this.f94482h.setInterpolator(null);
            this.f94482h.addListener(new q(this, 1));
        }
        E();
        this.f94481g.start();
    }

    @Override // c3.b
    public final void D() {
        this.n = null;
    }

    public final void E() {
        this.f94485k = 0;
        Iterator it = ((ArrayList) this.f19223b).iterator();
        while (it.hasNext()) {
            ((m) it.next()).f94461c = this.f94484j.f94415c[0];
        }
    }

    @Override // c3.b
    public final void g() {
        ObjectAnimator objectAnimator = this.f94481g;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
    }

    @Override // c3.b
    public final void r() {
        E();
    }

    @Override // c3.b
    public final void z(b bVar) {
        this.n = bVar;
    }
}
