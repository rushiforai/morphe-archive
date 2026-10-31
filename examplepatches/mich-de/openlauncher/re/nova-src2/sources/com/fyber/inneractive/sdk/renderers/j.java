package com.fyber.inneractive.sdk.renderers;

import android.view.View;
import android.view.ViewGroup;

/* loaded from: classes3.dex */
public final class j implements View.OnLayoutChangeListener {

    /* renamed from: a, reason: collision with root package name */
    public final /* synthetic */ n f30992a;

    public j(n nVar) {
        this.f30992a = nVar;
    }

    @Override // android.view.View.OnLayoutChangeListener
    public final void onLayoutChange(View view, int i5, int i11, int i12, int i13, int i14, int i15, int i16, int i17) {
        ViewGroup.LayoutParams layoutParams;
        if (this.f30992a.B == null) {
            return;
        }
        int i18 = i17 - i15;
        int i19 = i12 - i5;
        int i21 = i13 - i11;
        if ((i16 - i14 == i19 && i18 == i21) || (layoutParams = view.getLayoutParams()) == null) {
            return;
        }
        layoutParams.width = i19;
        layoutParams.height = i21;
        this.f30992a.B.setLayoutParams(layoutParams);
    }
}
