package y9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import com.android.launcher3.BubbleTextView;

/* loaded from: classes2.dex */
public final class o extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BubbleTextView f96927a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f96928b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ p f96929c;

    public o(p pVar, BubbleTextView bubbleTextView, float f11) {
        this.f96929c = pVar;
        this.f96927a = bubbleTextView;
        this.f96928b = f11;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        this.f96927a.setTranslationY(0.0f);
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        if (this.f96929c.f96936g) {
            this.f96927a.setTranslationY(this.f96928b);
        }
    }
}
