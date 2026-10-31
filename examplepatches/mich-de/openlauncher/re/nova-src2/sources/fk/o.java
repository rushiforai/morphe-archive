package fk;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.widget.TextView;
import androidx.appcompat.widget.AppCompatTextView;

/* loaded from: classes3.dex */
public final class o extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ int f55224a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ TextView f55225b;

    /* renamed from: c, reason: collision with root package name */
    public final /* synthetic */ int f55226c;

    /* renamed from: d, reason: collision with root package name */
    public final /* synthetic */ TextView f55227d;

    /* renamed from: e, reason: collision with root package name */
    public final /* synthetic */ p f55228e;

    public o(p pVar, int i5, TextView textView, int i11, TextView textView2) {
        this.f55228e = pVar;
        this.f55224a = i5;
        this.f55225b = textView;
        this.f55226c = i11;
        this.f55227d = textView2;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        AppCompatTextView appCompatTextView;
        int i5 = this.f55224a;
        p pVar = this.f55228e;
        pVar.n = i5;
        pVar.f55240l = null;
        TextView textView = this.f55225b;
        if (textView != null) {
            textView.setVisibility(4);
            if (this.f55226c == 1 && (appCompatTextView = pVar.f55244r) != null) {
                appCompatTextView.setText((CharSequence) null);
            }
        }
        TextView textView2 = this.f55227d;
        if (textView2 != null) {
            textView2.setTranslationY(0.0f);
            textView2.setAlpha(1.0f);
        }
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationStart(Animator animator) {
        TextView textView = this.f55227d;
        if (textView != null) {
            textView.setVisibility(0);
            textView.setAlpha(0.0f);
        }
    }
}
