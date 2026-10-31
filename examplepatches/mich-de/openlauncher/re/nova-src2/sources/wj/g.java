package wj;

import android.animation.ObjectAnimator;
import java.util.ArrayList;

/* loaded from: classes3.dex */
public final class g extends c3.b {
    public static final int[] o = {0, 1350, 2700, 4050};

    /* renamed from: p, reason: collision with root package name */
    public static final int[] f94427p = {667, 2017, 3367, 4717};

    /* renamed from: q, reason: collision with root package name */
    public static final int[] f94428q = {1000, 2350, 3700, 5050};

    /* renamed from: r, reason: collision with root package name */
    public static final jz.b f94429r;

    /* renamed from: s, reason: collision with root package name */
    public static final jz.b f94430s;

    /* renamed from: g, reason: collision with root package name */
    public ObjectAnimator f94431g;

    /* renamed from: h, reason: collision with root package name */
    public ObjectAnimator f94432h;

    /* renamed from: i, reason: collision with root package name */
    public final f6.a f94433i;

    /* renamed from: j, reason: collision with root package name */
    public final h f94434j;

    /* renamed from: k, reason: collision with root package name */
    public int f94435k;

    /* renamed from: l, reason: collision with root package name */
    public float f94436l;

    /* renamed from: m, reason: collision with root package name */
    public float f94437m;
    public b n;

    static {
        Class<Float> cls = Float.class;
        f94429r = new jz.b(3, cls, "animationFraction");
        f94430s = new jz.b(4, cls, "completeEndFraction");
    }

    public g(h hVar) {
        super(1);
        this.f94435k = 0;
        this.n = null;
        this.f94434j = hVar;
        this.f94433i = new f6.a(1);
    }

    @Override // c3.b
    public final void A() {
        ObjectAnimator objectAnimator = this.f94432h;
        if (objectAnimator == null || objectAnimator.isRunning()) {
            return;
        }
        if (((n) this.f19222a).isVisible()) {
            this.f94432h.start();
        } else {
            g();
        }
    }

    @Override // c3.b
    public final void C() {
        int i5 = 0;
        if (this.f94431g == null) {
            ObjectAnimator objectAnimatorOfFloat = ObjectAnimator.ofFloat(this, f94429r, 0.0f, 1.0f);
            this.f94431g = objectAnimatorOfFloat;
            objectAnimatorOfFloat.setDuration(5400L);
            this.f94431g.setInterpolator(null);
            this.f94431g.setRepeatCount(-1);
            this.f94431g.addListener(new f(this, i5));
        }
        if (this.f94432h == null) {
            ObjectAnimator objectAnimatorOfFloat2 = ObjectAnimator.ofFloat(this, f94430s, 0.0f, 1.0f);
            this.f94432h = objectAnimatorOfFloat2;
            objectAnimatorOfFloat2.setDuration(333L);
            this.f94432h.setInterpolator(this.f94433i);
            this.f94432h.addListener(new f(this, 1));
        }
        this.f94435k = 0;
        ((m) ((ArrayList) this.f19223b).get(0)).f94461c = this.f94434j.f94415c[0];
        this.f94437m = 0.0f;
        this.f94431g.start();
    }

    @Override // c3.b
    public final void D() {
        this.n = null;
    }

    @Override // c3.b
    public final void g() {
        ObjectAnimator objectAnimator = this.f94431g;
        if (objectAnimator != null) {
            objectAnimator.cancel();
        }
    }

    @Override // c3.b
    public final void r() {
        this.f94435k = 0;
        ((m) ((ArrayList) this.f19223b).get(0)).f94461c = this.f94434j.f94415c[0];
        this.f94437m = 0.0f;
    }

    @Override // c3.b
    public final void z(b bVar) {
        this.n = bVar;
    }
}
