package androidx.recyclerview.widget;

import android.animation.Animator;
import android.animation.ValueAnimator;
import android.view.View;

/* loaded from: classes2.dex */
public final class k0 implements Animator.AnimatorListener {

    /* renamed from: a, reason: collision with root package name */
    public final float f15016a;

    /* renamed from: b, reason: collision with root package name */
    public final float f15017b;

    /* renamed from: c, reason: collision with root package name */
    public final float f15018c;

    /* renamed from: d, reason: collision with root package name */
    public final float f15019d;

    /* renamed from: e, reason: collision with root package name */
    public final s2 f15020e;

    /* renamed from: f, reason: collision with root package name */
    public final int f15021f;

    /* renamed from: g, reason: collision with root package name */
    public final ValueAnimator f15022g;

    /* renamed from: h, reason: collision with root package name */
    public boolean f15023h;

    /* renamed from: i, reason: collision with root package name */
    public float f15024i;

    /* renamed from: j, reason: collision with root package name */
    public float f15025j;

    /* renamed from: k, reason: collision with root package name */
    public boolean f15026k = false;

    /* renamed from: l, reason: collision with root package name */
    public boolean f15027l = false;

    /* renamed from: m, reason: collision with root package name */
    public float f15028m;
    public final /* synthetic */ int n;
    public final /* synthetic */ s2 o;

    /* renamed from: p, reason: collision with root package name */
    public final /* synthetic */ r0 f15029p;

    public k0(r0 r0Var, s2 s2Var, int i5, float f11, float f12, float f13, float f14, int i11, s2 s2Var2) {
        this.f15029p = r0Var;
        this.n = i11;
        this.o = s2Var2;
        this.f15021f = i5;
        this.f15020e = s2Var;
        this.f15016a = f11;
        this.f15017b = f12;
        this.f15018c = f13;
        this.f15019d = f14;
        ValueAnimator valueAnimatorOfFloat = ValueAnimator.ofFloat(0.0f, 1.0f);
        this.f15022g = valueAnimatorOfFloat;
        valueAnimatorOfFloat.addUpdateListener(new a0(this, 1));
        valueAnimatorOfFloat.setTarget(s2Var.itemView);
        valueAnimatorOfFloat.addListener(this);
        this.f15028m = 0.0f;
    }

    public final void a(Animator animator) {
        if (!this.f15027l) {
            this.f15020e.setIsRecyclable(true);
        }
        this.f15027l = true;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
        this.f15028m = 1.0f;
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        a(animator);
        if (this.f15026k) {
            return;
        }
        int i5 = this.n;
        s2 s2Var = this.o;
        r0 r0Var = this.f15029p;
        if (i5 <= 0) {
            r0Var.f15097m.clearView(r0Var.f15100r, s2Var);
        } else {
            r0Var.f15085a.add(s2Var.itemView);
            this.f15023h = true;
            if (i5 > 0) {
                r0Var.f15100r.post(new l0(r0Var, this, i5, 0));
            }
        }
        View view = r0Var.f15105w;
        View view2 = s2Var.itemView;
        if (view == view2) {
            r0Var.l(view2);
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
