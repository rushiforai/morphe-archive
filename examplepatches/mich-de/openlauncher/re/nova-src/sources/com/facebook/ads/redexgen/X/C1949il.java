package com.facebook.ads.redexgen.X;

import android.database.Observable;

/* renamed from: com.facebook.ads.redexgen.X.il, reason: case insensitive filesystem */
/* loaded from: assets/audience_network/classes.dex */
public class C1949il extends Observable<AbstractC1950im> {
    public final void A00() {
        for (int size = this.mObservers.size() - 1; size >= 0; size--) {
            ((AbstractC1950im) this.mObservers.get(size)).A01();
        }
    }

    public final void A01(int i5, int i11) {
        A02(i5, i11, null);
    }

    public final void A02(int i5, int i11, Object obj) {
        for (int size = this.mObservers.size() - 1; size >= 0; size--) {
            ((AbstractC1950im) this.mObservers.get(size)).A02(i5, i11, obj);
        }
    }
}
