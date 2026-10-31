package jz;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.view.View;
import com.android.launcher3.BubbleTextView;

/* loaded from: classes4.dex */
public final class k extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f70533a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ View f70534b;

    public /* synthetic */ k(View view, int i5) {
        this.f70533a = i5;
        this.f70534b = view;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        switch (this.f70533a) {
            case 0:
                View view = this.f70534b;
                if (view instanceof BubbleTextView) {
                    ((BubbleTextView) view).refreshDrawableState();
                    break;
                }
                break;
            default:
                this.f70534b.sendAccessibilityEvent(8);
                break;
        }
    }
}
