package com.facebook.ads.redexgen.X;

import java.util.Arrays;

/* loaded from: assets/audience_network/classes.dex */
public final class ZN {
    public final int A00;
    public final int A01;
    public final int A02;
    public final byte[] A03;

    public ZN(int i5, byte[] bArr, int i11, int i12) {
        this.A01 = i5;
        this.A03 = bArr;
        this.A02 = i11;
        this.A00 = i12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        ZN zn2 = (ZN) obj;
        if (this.A01 == zn2.A01 && this.A02 == zn2.A02 && this.A00 == zn2.A00 && Arrays.equals(this.A03, zn2.A03)) {
            return true;
        }
        return false;
    }

    public final int hashCode() {
        int result = this.A01;
        int i5 = result * 31;
        int result2 = Arrays.hashCode(this.A03);
        int result3 = (((i5 + result2) * 31) + this.A02) * 31;
        int result4 = this.A00;
        return result3 + result4;
    }
}
