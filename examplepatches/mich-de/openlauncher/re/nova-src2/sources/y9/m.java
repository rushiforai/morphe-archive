package y9;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import com.android.launcher3.BubbleTextView;

/* loaded from: classes2.dex */
public final class m extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ BubbleTextView f96915a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ float f96916b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ float f96917c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ float f96918d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ nz.c f96919e;

    /* renamed from: f, reason: collision with root package name */
    public final /* synthetic */ int f96920f;

    /* renamed from: g, reason: collision with root package name */
    public final /* synthetic */ int f96921g;

    /* renamed from: h, reason: collision with root package name */
    public final /* synthetic */ p f96922h;

    public m(p pVar, BubbleTextView bubbleTextView, float f11, float f12, float f13, nz.c cVar, int i5, int i11) {
        this.f96922h = pVar;
        this.f96915a = bubbleTextView;
        this.f96916b = f11;
        this.f96917c = f12;
        this.f96918d = f13;
        this.f96919e = cVar;
        this.f96920f = i5;
        this.f96921g = i11;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        BubbleTextView bubbleTextView = this.f96915a;
        bubbleTextView.setTranslationX(0.0f);
        bubbleTextView.setTranslationY(0.0f);
        bubbleTextView.setScaleX(1.0f);
        bubbleTextView.setScaleY(1.0f);
        bubbleTextView.setTranslationZ(0.0f);
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        boolean z11 = this.f96922h.f96936g;
        BubbleTextView bubbleTextView = this.f96915a;
        if (z11) {
            bubbleTextView.setTranslationX(this.f96916b);
            bubbleTextView.setTranslationY(this.f96917c);
            float f11 = this.f96918d;
            bubbleTextView.setScaleX(f11);
            bubbleTextView.setScaleY(f11);
        }
        bubbleTextView.setTranslationZ(this.f96919e.i(this.f96920f, this.f96921g));
    }
}
