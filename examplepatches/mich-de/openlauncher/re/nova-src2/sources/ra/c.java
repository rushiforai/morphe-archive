package ra;

import android.animation.Animator;
import android.animation.AnimatorSet;
import s9.i;

/* loaded from: classes.dex */
public final class c extends sa.d implements Animator.AnimatorListener {

    /* renamed from: h, reason: collision with root package name */
    public static final sa.d f85754h = new sa.d();

    /* renamed from: d, reason: collision with root package name */
    public i f85755d;

    /* renamed from: e, reason: collision with root package name */
    public AnimatorSet f85756e;

    /* renamed from: f, reason: collision with root package name */
    public a f85757f;

    /* renamed from: g, reason: collision with root package name */
    public int f85758g;

    public final void b() {
        AnimatorSet animatorSet = this.f85756e;
        i iVar = this.f85755d;
        sa.d dVar = f85754h;
        this.f87094a = dVar.f87094a;
        this.f87095b = dVar.f87095b;
        for (int i5 = 0; i5 < 15; i5++) {
            this.f87096c[i5] = dVar.f87096c[i5];
        }
        this.f85757f = null;
        this.f85756e = null;
        this.f85755d = null;
        this.f85758g++;
        if (iVar != null) {
            iVar.g().cancel();
            iVar.d();
            iVar.e();
        } else if (animatorSet != null) {
            animatorSet.setDuration(0L);
            if (!animatorSet.isStarted()) {
                i.c(animatorSet, new s9.e(0));
                i.c(animatorSet, new s9.e(1));
            }
            animatorSet.cancel();
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationCancel(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        i iVar = this.f85755d;
        if (iVar != null && iVar.j() == animator) {
            this.f85755d = null;
        }
        if (this.f85756e == animator) {
            this.f85756e = null;
        }
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationRepeat(Animator animator) {
    }

    @Override // android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
    }
}
