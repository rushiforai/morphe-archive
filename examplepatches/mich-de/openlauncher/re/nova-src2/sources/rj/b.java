package rj;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import com.android.launcher3.CellLayout;
import com.google.android.material.floatingactionbutton.FloatingActionButton;

/* loaded from: classes3.dex */
public final class b extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f85965a = 0;

    /* renamed from: b, reason: collision with root package name */
    public boolean f85966b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ boolean f85967c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ Object f85968d;

    public b(j jVar, boolean z11) {
        this.f85968d = jVar;
        this.f85967c = z11;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public void onAnimationCancel(Animator animator) {
        switch (this.f85965a) {
            case 0:
                this.f85966b = true;
                break;
            default:
                super.onAnimationCancel(animator);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f85965a) {
            case 0:
                j jVar = (j) this.f85968d;
                jVar.f86005p = 0;
                jVar.f86002k = null;
                if (!this.f85966b) {
                    FloatingActionButton floatingActionButton = jVar.f86006q;
                    boolean z11 = this.f85967c;
                    floatingActionButton.b(z11 ? 8 : 4, z11);
                    break;
                }
                break;
            default:
                if (this.f85966b) {
                    ((CellLayout) this.f85968d).s(this.f85967c);
                    break;
                }
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        switch (this.f85965a) {
            case 0:
                j jVar = (j) this.f85968d;
                jVar.f86006q.b(0, this.f85967c);
                jVar.f86005p = 1;
                jVar.f86002k = animator;
                this.f85966b = false;
                break;
            default:
                if (this.f85966b) {
                    ((CellLayout) this.f85968d).s(true);
                    break;
                }
                break;
        }
    }

    public b(boolean z11, CellLayout cellLayout, boolean z12) {
        this.f85966b = z11;
        this.f85968d = cellLayout;
        this.f85967c = z12;
    }
}
