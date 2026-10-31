package com.bytedance.sdk.openadsdk.tn;

import java.lang.reflect.Array;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class sya {
    private final int sya;
    private final byte[][] ycx;

    /* renamed from: zb, reason: collision with root package name */
    private final int f27071zb;

    public sya(int i5, int i11) {
        this.ycx = (byte[][]) Array.newInstance((Class<?>) Byte.TYPE, i11, i5);
        this.f27071zb = i5;
        this.sya = i11;
    }

    public byte[][] sya() {
        return this.ycx;
    }

    public String toString() {
        StringBuilder sb2 = new StringBuilder((this.f27071zb * 2 * this.sya) + 2);
        for (int i5 = 0; i5 < this.sya; i5++) {
            byte[] bArr = this.ycx[i5];
            for (int i11 = 0; i11 < this.f27071zb; i11++) {
                byte b11 = bArr[i11];
                if (b11 == 0) {
                    sb2.append(" 0");
                } else if (b11 != 1) {
                    sb2.append("  ");
                } else {
                    sb2.append(" 1");
                }
            }
            sb2.append('\n');
        }
        return sb2.toString();
    }

    public int ycx() {
        return this.sya;
    }

    public int zb() {
        return this.f27071zb;
    }

    public byte ycx(int i5, int i11) {
        return this.ycx[i11][i5];
    }

    public void ycx(int i5, int i11, int i12) {
        this.ycx[i11][i5] = (byte) i12;
    }

    public void ycx(int i5, int i11, boolean z11) {
        this.ycx[i11][i5] = z11 ? (byte) 1 : (byte) 0;
    }

    public void ycx(byte b11) {
        for (byte[] bArr : this.ycx) {
            Arrays.fill(bArr, b11);
        }
    }
}
