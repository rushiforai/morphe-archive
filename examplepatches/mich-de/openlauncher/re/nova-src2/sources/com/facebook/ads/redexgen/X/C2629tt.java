package com.facebook.ads.redexgen.X;

import android.animation.LayoutTransition;
import android.view.View;
import android.view.ViewGroup;

/* renamed from: com.facebook.ads.redexgen.X.tt, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C2629tt implements LayoutTransition.TransitionListener {
    public final /* synthetic */ C2630tu A00;

    public C2629tt(C2630tu c2630tu) {
        this.A00 = c2630tu;
    }

    @Override // android.animation.LayoutTransition.TransitionListener
    public final void endTransition(LayoutTransition layoutTransition, ViewGroup viewGroup, View view, int i5) {
        ((AbstractC2624to) this.A00.A00.A00).A09.setAlpha(1.0f);
        this.A00.A00.A00.A0R.setAlpha(1.0f);
        this.A00.A00.A00.A0Q.setAlpha(1.0f);
    }

    @Override // android.animation.LayoutTransition.TransitionListener
    public final void startTransition(LayoutTransition layoutTransition, ViewGroup viewGroup, View view, int i5) {
    }
}
