package com.fyber.inneractive.sdk.ui;

import android.animation.Animator;
import android.animation.AnimatorListenerAdapter;
import android.animation.AnimatorSet;
import android.graphics.Bitmap;
import com.fyber.inneractive.sdk.R;

/* loaded from: classes3.dex */
public final class c extends AnimatorListenerAdapter {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ AnimatorSet f31153a;

    /* renamed from: b, reason: collision with root package name */
    public final /* synthetic */ FyberAdIdentifierLocal f31154b;

    public c(FyberAdIdentifierLocal fyberAdIdentifierLocal, AnimatorSet animatorSet) {
        this.f31154b = fyberAdIdentifierLocal;
        this.f31153a = animatorSet;
    }

    @Override // android.animation.AnimatorListenerAdapter, android.animation.Animator.AnimatorListener
    public final void onAnimationEnd(Animator animator) {
        super.onAnimationEnd(animator);
        FyberAdIdentifierLocal fyberAdIdentifierLocal = this.f31154b;
        if (fyberAdIdentifierLocal.o) {
            fyberAdIdentifierLocal.f31129m.setImageResource(R.drawable.ia_fyber_info_button);
            FyberAdIdentifierLocal fyberAdIdentifierLocal2 = this.f31154b;
            FyberAdIdentifierLocal.a(fyberAdIdentifierLocal2.f31129m, fyberAdIdentifierLocal2.f31145g);
        } else {
            Bitmap bitmap = fyberAdIdentifierLocal.f31132r;
            if (bitmap != null) {
                fyberAdIdentifierLocal.f31129m.setImageBitmap(bitmap);
            } else {
                fyberAdIdentifierLocal.f31129m.setImageResource(R.drawable.ia_digital_turbine_logo);
            }
            FyberAdIdentifierLocal.a(this.f31154b.f31129m, null);
        }
        this.f31153a.start();
        this.f31154b.f31130p = this.f31153a;
    }
}
