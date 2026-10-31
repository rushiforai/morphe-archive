package com.facebook.ads.redexgen.X;

import java.util.Comparator;

/* renamed from: com.facebook.ads.redexgen.X.iV, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1935iV implements Comparator<C1936iW> {
    /* JADX INFO: Access modifiers changed from: private */
    @Override // java.util.Comparator
    /* renamed from: A00, reason: merged with bridge method [inline-methods] */
    public final int compare(C1936iW c1936iW, C1936iW c1936iW2) {
        if ((c1936iW.A03 == null) != (c1936iW2.A03 == null)) {
            return c1936iW.A03 == null ? 1 : -1;
        }
        if (c1936iW.A04 != c1936iW2.A04) {
            return c1936iW.A04 ? -1 : 1;
        }
        int i5 = c1936iW2.A02 - c1936iW.A02;
        if (i5 != 0) {
            return i5;
        }
        int i11 = c1936iW.A00;
        int deltaViewVelocity = c1936iW2.A00;
        int i12 = i11 - deltaViewVelocity;
        if (i12 != 0) {
            return i12;
        }
        return 0;
    }
}
