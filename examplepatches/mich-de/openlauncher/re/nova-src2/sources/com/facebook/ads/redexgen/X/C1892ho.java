package com.facebook.ads.redexgen.X;

import android.view.View;
import java.util.Comparator;

/* renamed from: com.facebook.ads.redexgen.X.ho, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1892ho implements Comparator<View> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.Comparator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compare(View view, View view2) {
        C1886hi c1886hi = (C1886hi) view.getLayoutParams();
        C1886hi c1886hi2 = (C1886hi) view2.getLayoutParams();
        if (c1886hi.A05 != c1886hi2.A05) {
            return c1886hi.A05 ? 1 : -1;
        }
        return c1886hi.A02 - c1886hi2.A02;
    }
}
