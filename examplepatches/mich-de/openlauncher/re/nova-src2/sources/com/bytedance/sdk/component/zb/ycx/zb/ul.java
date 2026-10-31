package com.bytedance.sdk.component.zb.ycx.zb;

import java.util.Arrays;

/* loaded from: classes2.dex */
final class ul extends dj {
    final transient int[] fby;

    /* renamed from: ul, reason: collision with root package name */
    final transient byte[][] f24231ul;

    public ul(ycx ycxVar, int i5) {
        super(null);
        jw.ycx(ycxVar.f24232zb, 0L, i5);
        lud ludVar = ycxVar.ycx;
        int i11 = 0;
        int i12 = 0;
        int i13 = 0;
        while (i12 < i5) {
            int i14 = ludVar.sya;
            int i15 = ludVar.f24230zb;
            if (i14 == i15) {
                throw new AssertionError("s.limit == s.pos");
            }
            i12 += i14 - i15;
            i13++;
            ludVar = ludVar.f24228lt;
        }
        this.f24231ul = new byte[i13][];
        this.fby = new int[i13 * 2];
        lud ludVar2 = ycxVar.ycx;
        int i16 = 0;
        while (i11 < i5) {
            byte[][] bArr = this.f24231ul;
            bArr[i16] = ludVar2.ycx;
            int i17 = ludVar2.sya;
            int i18 = ludVar2.f24230zb;
            int i19 = (i17 - i18) + i11;
            i11 = i19 > i5 ? i5 : i19;
            int[] iArr = this.fby;
            iArr[i16] = i11;
            iArr[bArr.length + i16] = i18;
            ludVar2.f24227dj = true;
            i16++;
            ludVar2 = ludVar2.f24228lt;
        }
    }

    private dj lud() {
        return new dj(dj());
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public byte[] dj() {
        int[] iArr = this.fby;
        byte[][] bArr = this.f24231ul;
        byte[] bArr2 = new byte[iArr[bArr.length - 1]];
        int length = bArr.length;
        int i5 = 0;
        int i11 = 0;
        while (i5 < length) {
            int[] iArr2 = this.fby;
            int i12 = iArr2[length + i5];
            int i13 = iArr2[i5];
            System.arraycopy(this.f24231ul[i5], i12, bArr2, i11, i13 - i11);
            i5++;
            i11 = i13;
        }
        return bArr2;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (obj instanceof dj) {
            dj djVar = (dj) obj;
            if (djVar.sya() == sya() && ycx(0, djVar, 0, sya())) {
                return true;
            }
        }
        return false;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public int hashCode() {
        int i5 = this.lud;
        if (i5 != 0) {
            return i5;
        }
        int length = this.f24231ul.length;
        int i11 = 0;
        int i12 = 1;
        int i13 = 0;
        while (i11 < length) {
            byte[] bArr = this.f24231ul[i11];
            int[] iArr = this.fby;
            int i14 = iArr[length + i11];
            int i15 = iArr[i11];
            int i16 = (i15 - i13) + i14;
            while (i14 < i16) {
                i12 = (i12 * 31) + bArr[i14];
                i14++;
            }
            i11++;
            i13 = i15;
        }
        this.lud = i12;
        return i12;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public int sya() {
        return this.fby[this.f24231ul.length - 1];
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public String toString() {
        return lud().toString();
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public String ycx() {
        return lud().ycx();
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public String zb() {
        return lud().zb();
    }

    private int zb(int i5) {
        int iBinarySearch = Arrays.binarySearch(this.fby, 0, this.f24231ul.length, i5 + 1);
        return iBinarySearch >= 0 ? iBinarySearch : ~iBinarySearch;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public dj ycx(int i5, int i11) {
        return lud().ycx(i5, i11);
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public byte ycx(int i5) {
        jw.ycx(this.fby[this.f24231ul.length - 1], i5, 1L);
        int iZb = zb(i5);
        int i11 = iZb == 0 ? 0 : this.fby[iZb - 1];
        int[] iArr = this.fby;
        byte[][] bArr = this.f24231ul;
        return bArr[iZb][(i5 - i11) + iArr[bArr.length + iZb]];
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public boolean ycx(int i5, dj djVar, int i11, int i12) {
        if (i5 < 0 || i5 > sya() - i12) {
            return false;
        }
        int iZb = zb(i5);
        while (i12 > 0) {
            int i13 = iZb == 0 ? 0 : this.fby[iZb - 1];
            int iMin = Math.min(i12, ((this.fby[iZb] - i13) + i13) - i5);
            int[] iArr = this.fby;
            byte[][] bArr = this.f24231ul;
            if (!djVar.ycx(i11, bArr[iZb], (i5 - i13) + iArr[bArr.length + iZb], iMin)) {
                return false;
            }
            i5 += iMin;
            i11 += iMin;
            i12 -= iMin;
            iZb++;
        }
        return true;
    }

    @Override // com.bytedance.sdk.component.zb.ycx.zb.dj
    public boolean ycx(int i5, byte[] bArr, int i11, int i12) {
        if (i5 < 0 || i5 > sya() - i12 || i11 < 0 || i11 > bArr.length - i12) {
            return false;
        }
        int iZb = zb(i5);
        while (i12 > 0) {
            int i13 = iZb == 0 ? 0 : this.fby[iZb - 1];
            int iMin = Math.min(i12, ((this.fby[iZb] - i13) + i13) - i5);
            int[] iArr = this.fby;
            byte[][] bArr2 = this.f24231ul;
            if (!jw.ycx(bArr2[iZb], (i5 - i13) + iArr[bArr2.length + iZb], bArr, i11, iMin)) {
                return false;
            }
            i5 += iMin;
            i11 += iMin;
            i12 -= iMin;
            iZb++;
        }
        return true;
    }
}
