package com.facebook.ads.redexgen.X;

import android.util.SparseArray;

/* loaded from: assets/audience_network/classes.dex */
public final class VQ<V> {
    public static String[] A03 = {"1ID6HyhCBLNL3z8CrHbV0VbNVc1FqZl", "vF6BhGY3", "D8hYJOY2lSbfNEYJ2qq1iSQYkwnMs6C4", "BXfixXzOl", "UE", "7rPcq", "t9EqYlTteqd23MQLOZxqmglq9yRl7yB", "EBMYDzLlXolVKycf8g8gBkLBPLDrK2km"};
    public int A00;
    public final SparseArray<V> A01;
    public final InterfaceC1072Ly<V> A02;

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public VQ() {
        this(new InterfaceC1072Ly() { // from class: com.facebook.ads.redexgen.X.Ra
            @Override // com.facebook.ads.redexgen.X.InterfaceC1072Ly
            public final void A3V(Object obj) {
            }
        });
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.Ly != com.facebook.ads.androidx.media3.common.util.Consumer<V> */
    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public VQ(InterfaceC1072Ly<V> interfaceC1072Ly) {
        this.A01 = new SparseArray<>();
        this.A02 = interfaceC1072Ly;
        this.A00 = -1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final V A00() {
        return this.A01.valueAt(this.A01.size() - 1);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final V A01(int i5) {
        if (this.A00 == -1) {
            this.A00 = 0;
        }
        while (this.A00 > 0 && i5 < this.A01.keyAt(this.A00)) {
            this.A00--;
        }
        while (this.A00 < this.A01.size() - 1 && i5 >= this.A01.keyAt(this.A00 + 1)) {
            this.A00++;
        }
        return this.A01.valueAt(this.A00);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final void A02() {
        for (int i5 = 0; i5 < this.A01.size(); i5++) {
            this.A02.A3V(this.A01.valueAt(i5));
        }
        this.A00 = -1;
        this.A01.clear();
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final void A03(int i5) {
        for (int size = this.A01.size() - 1; size >= 0 && i5 < this.A01.keyAt(size); size--) {
            this.A02.A3V(this.A01.valueAt(size));
            this.A01.removeAt(size);
        }
        this.A00 = this.A01.size() > 0 ? Math.min(this.A00, this.A01.size() - 1) : -1;
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final void A04(int i5) {
        for (int i11 = 0; i11 < this.A01.size() - 1 && i5 >= this.A01.keyAt(i11 + 1); i11++) {
            InterfaceC1072Ly<V> interfaceC1072Ly = this.A02;
            SparseArray<V> sparseArray = this.A01;
            if (A03[0].length() == 24) {
                throw new RuntimeException();
            }
            A03[4] = "eerHBUV8bXwvTxOkWnqjIlZ";
            interfaceC1072Ly.A3V(sparseArray.valueAt(i11));
            this.A01.removeAt(i11);
            if (this.A00 > 0) {
                this.A00--;
            }
        }
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final void A05(int i5, V v11) {
        if (this.A00 == -1) {
            AbstractC1062Ln.A08(this.A01.size() == 0);
            this.A00 = 0;
        }
        int size = this.A01.size();
        if (A03[1].length() != 8) {
            throw new RuntimeException();
        }
        A03[6] = "StKyv4BomACzuzUvpFcoz14muVDTEo8";
        if (size > 0) {
            int iKeyAt = this.A01.keyAt(this.A01.size() - 1);
            AbstractC1062Ln.A07(i5 >= iKeyAt);
            if (iKeyAt == i5) {
                this.A02.A3V(this.A01.valueAt(this.A01.size() - 1));
            }
        }
        this.A01.append(i5, v11);
    }

    /* JADX WARN: Generic types in debug info not equals: com.facebook.ads.redexgen.X.VQ != com.facebook.ads.androidx.media3.exoplayer.source.SpannedData<V> */
    public final boolean A06() {
        return this.A01.size() == 0;
    }
}
