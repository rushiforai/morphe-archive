package com.facebook.ads.redexgen.X;

import com.facebook.video.heroplayer.exocustom.MetaExoPlayerCustomization;
import java.util.Arrays;
import java.util.Comparator;

/* renamed from: com.facebook.ads.redexgen.X.8j, reason: invalid class name */
/* loaded from: assets/audience_network/classes.dex */
public abstract class C8j implements RA {
    public int A00;

    @MetaExoPlayerCustomization
    public boolean A01;
    public final int A02;
    public final long[] A03;
    public final VC[] A04;
    public final int A05;
    public final U8 A06;
    public final int[] A07;

    /* JADX WARN: Incorrect condition in loop: B:12:0x0044 */
    /* JADX WARN: Incorrect condition in loop: B:7:0x0020 */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public C8j(U8 u82, int[] iArr, int i5) {
        AbstractC1062Ln.A08(iArr.length > 0);
        this.A02 = i5;
        this.A06 = (U8) AbstractC1062Ln.A01(u82);
        this.A05 = iArr.length;
        this.A04 = new VC[this.A05];
        for (int i11 = 0; i11 < i; i11++) {
            VC[] vcArr = this.A04;
            int i12 = iArr[i11];
            vcArr[i11] = u82.A08(i12);
        }
        Arrays.sort(this.A04, new Comparator() { // from class: com.facebook.ads.redexgen.X.WH
            @Override // java.util.Comparator
            public final int compare(Object obj, Object obj2) {
                return C8j.A07((VC) obj, (VC) obj2);
            }
        });
        this.A07 = new int[this.A05];
        for (int i13 = 0; i13 < i; i13++) {
            int[] iArr2 = this.A07;
            int i14 = u82.A07(this.A04[i13]);
            iArr2[i13] = i14;
        }
        int i15 = this.A05;
        this.A03 = new long[i15];
        this.A01 = false;
    }

    public static /* synthetic */ int A07(VC vc, VC vc2) {
        return vc2.A05 - vc.A05;
    }

    @Override // com.facebook.ads.redexgen.X.RA
    public void A6W() {
    }

    @Override // com.facebook.ads.redexgen.X.RA
    public void A6t() {
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1318Wc
    public final VC A8m(int i5) {
        return this.A04[i5];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1318Wc
    public final int A8t(int i5) {
        return this.A07[i5];
    }

    @Override // com.facebook.ads.redexgen.X.RA
    public final VC A9f() {
        return this.A04[A9g()];
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1318Wc
    public final U8 A9y() {
        return this.A06;
    }

    /* JADX WARN: Incorrect condition in loop: B:4:0x0003 */
    @Override // com.facebook.ads.redexgen.X.InterfaceC1318Wc
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final int AAk(int i5) {
        for (int i11 = 0; i11 < i; i11++) {
            int i12 = this.A07[i11];
            if (i12 == i5) {
                return i11;
            }
        }
        return -1;
    }

    @Override // com.facebook.ads.redexgen.X.RA
    public void AGO(float f11) {
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        C8j c8j = (C8j) obj;
        return this.A06 == c8j.A06 && Arrays.equals(this.A07, c8j.A07);
    }

    public final int hashCode() {
        if (this.A00 == 0) {
            this.A00 = (System.identityHashCode(this.A06) * 31) + Arrays.hashCode(this.A07);
        }
        return this.A00;
    }

    @Override // com.facebook.ads.redexgen.X.InterfaceC1318Wc
    public final int length() {
        return this.A07.length;
    }
}
