package com.facebook.ads.redexgen.X;

import java.util.Comparator;

/* renamed from: com.facebook.ads.redexgen.X.cU, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1567cU {
    public static final Comparator<C1567cU> A02 = new Comparator() { // from class: com.facebook.ads.redexgen.X.cT
        @Override // java.util.Comparator
        public final int compare(Object obj, Object obj2) {
            return Integer.compare(((C1567cU) obj).A01.A00, ((C1567cU) obj2).A01.A00);
        }
    };
    public final int A00;
    public final C1568cV A01;

    public C1567cU(C1568cV c1568cV, int i5) {
        this.A01 = c1568cV;
        this.A00 = i5;
    }
}
