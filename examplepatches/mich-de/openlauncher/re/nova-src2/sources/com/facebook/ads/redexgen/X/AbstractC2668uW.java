package com.facebook.ads.redexgen.X;

import android.view.View;
import android.view.ViewGroup;

/* renamed from: com.facebook.ads.redexgen.X.uW, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public abstract class AbstractC2668uW {
    public static final int A00 = AbstractC2426qc.A00();

    public static void A00(C0958Hi c0958Hi, ViewGroup viewGroup, String str) {
        new AsyncTaskC0892Et(viewGroup, c0958Hi).A07(str);
        View view = new View(c0958Hi);
        view.setId(A00);
        view.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        AbstractC2426qc.A0V(view, c0958Hi);
        viewGroup.addView(view, 0);
    }

    public static void A01(C0958Hi c0958Hi, ViewGroup viewGroup, String str, int i5) {
        new AsyncTaskC0892Et(viewGroup, c0958Hi).A07(str);
        View view = new View(c0958Hi);
        view.setId(A00);
        view.setLayoutParams(new ViewGroup.LayoutParams(-1, -1));
        view.setBackgroundColor(i5);
        viewGroup.addView(view, 0);
    }
}
