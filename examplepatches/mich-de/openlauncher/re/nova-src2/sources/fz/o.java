package fz;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import android.view.ViewOutlineProvider;

/* loaded from: classes4.dex */
public final class o extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f56314a;

    /* renamed from: b, reason: collision with root package name */
    public ViewOutlineProvider f56315b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ View f56316c;

    public /* synthetic */ o(View view, int i5) {
        this.f56314a = i5;
        this.f56316c = view;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f56314a) {
            case 0:
                View view = this.f56316c;
                view.setTranslationZ(0.0f);
                ((za.m) view).A(null);
                view.setOutlineProvider(this.f56315b);
                break;
            case 1:
                View view2 = this.f56316c;
                view2.setTranslationZ(0.0f);
                ((za.m) view2).A(null);
                view2.setOutlineProvider(this.f56315b);
                break;
            default:
                View view3 = this.f56316c;
                view3.setTranslationZ(0.0f);
                ((za.m) view3).A(null);
                view3.setOutlineProvider(this.f56315b);
                break;
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        switch (this.f56314a) {
            case 0:
                View view = this.f56316c;
                this.f56315b = view.getOutlineProvider();
                view.setOutlineProvider(null);
                view.setTranslationZ(-view.getElevation());
                break;
            case 1:
                View view2 = this.f56316c;
                this.f56315b = view2.getOutlineProvider();
                view2.setOutlineProvider(null);
                view2.setTranslationZ(-view2.getElevation());
                break;
            default:
                View view3 = this.f56316c;
                this.f56315b = view3.getOutlineProvider();
                view3.setOutlineProvider(null);
                view3.setTranslationZ(-view3.getElevation());
                break;
        }
    }
}
