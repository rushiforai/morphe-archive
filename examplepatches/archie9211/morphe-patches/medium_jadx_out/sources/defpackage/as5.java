package defpackage;

import java.io.EOFException;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class as5 {
    public final kz0 a;
    public boolean c;
    public int g;
    public int h;
    public int b = Integer.MAX_VALUE;
    public int d = 4096;
    public vi5[] e = new vi5[8];
    public int f = 7;

    public as5(kz0 kz0Var) {
        this.a = kz0Var;
    }

    public final void a(int i) {
        int i2;
        if (i > 0) {
            int length = this.e.length - 1;
            int i3 = 0;
            while (true) {
                i2 = this.f;
                if (length < i2 || i <= 0) {
                    break;
                }
                vi5 vi5Var = this.e[length];
                vi5Var.getClass();
                i -= vi5Var.c;
                int i4 = this.h;
                vi5 vi5Var2 = this.e[length];
                vi5Var2.getClass();
                this.h = i4 - vi5Var2.c;
                this.g--;
                i3++;
                length--;
            }
            vi5[] vi5VarArr = this.e;
            int i5 = i2 + 1;
            System.arraycopy(vi5VarArr, i5, vi5VarArr, i5 + i3, this.g);
            vi5[] vi5VarArr2 = this.e;
            int i6 = this.f + 1;
            Arrays.fill(vi5VarArr2, i6, i6 + i3, (Object) null);
            this.f += i3;
        }
    }

    public final void b(vi5 vi5Var) {
        int i = vi5Var.c;
        int i2 = this.d;
        if (i > i2) {
            vi5[] vi5VarArr = this.e;
            k80.o0(0, vi5VarArr.length, null, vi5VarArr);
            this.f = this.e.length - 1;
            this.g = 0;
            this.h = 0;
            return;
        }
        a((this.h + i) - i2);
        int i3 = this.g + 1;
        vi5[] vi5VarArr2 = this.e;
        if (i3 > vi5VarArr2.length) {
            vi5[] vi5VarArr3 = new vi5[vi5VarArr2.length * 2];
            System.arraycopy(vi5VarArr2, 0, vi5VarArr3, vi5VarArr2.length, vi5VarArr2.length);
            this.f = this.e.length - 1;
            this.e = vi5VarArr3;
            vi5VarArr2 = vi5VarArr3;
        }
        int i4 = this.f;
        this.f = i4 - 1;
        vi5VarArr2[i4] = vi5Var;
        this.g++;
        this.h += i;
    }

    public final void c(h21 h21Var) throws EOFException {
        h21Var.getClass();
        int[] iArr = st5.a;
        int iE = h21Var.e();
        long j = 0;
        long j2 = 0;
        for (int i = 0; i < iE; i++) {
            byte bJ = h21Var.j(i);
            byte[] bArr = egf.a;
            j2 += (long) st5.b[bJ & 255];
        }
        int i2 = (int) ((j2 + 7) >> 3);
        int iE2 = h21Var.e();
        kz0 kz0Var = this.a;
        if (i2 >= iE2) {
            e(h21Var.e(), 127, 0);
            kz0Var.J0(h21Var);
            return;
        }
        kz0 kz0Var2 = new kz0();
        int[] iArr2 = st5.a;
        int iE3 = h21Var.e();
        int i3 = 0;
        for (int i4 = 0; i4 < iE3; i4++) {
            byte bJ2 = h21Var.j(i4);
            byte[] bArr2 = egf.a;
            int i5 = bJ2 & 255;
            int i6 = st5.a[i5];
            byte b = st5.b[i5];
            j = (j << b) | ((long) i6);
            i3 += b;
            while (i3 >= 8) {
                i3 -= 8;
                kz0Var2.K0((int) (j >> i3));
            }
        }
        if (i3 > 0) {
            kz0Var2.K0((int) ((j << (8 - i3)) | (255 >>> i3)));
        }
        h21 h21VarR = kz0Var2.r(kz0Var2.b);
        e(h21VarR.e(), 127, 128);
        kz0Var.J0(h21VarR);
    }

    /* JADX WARN: Removed duplicated region for block: B:22:0x0069  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void d(java.util.ArrayList r14) throws java.io.EOFException {
        /*
            Method dump skipped, instruction units count: 252
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.as5.d(java.util.ArrayList):void");
    }

    public final void e(int i, int i2, int i3) {
        kz0 kz0Var = this.a;
        if (i < i2) {
            kz0Var.K0(i | i3);
            return;
        }
        kz0Var.K0(i3 | i2);
        int i4 = i - i2;
        while (i4 >= 128) {
            kz0Var.K0(128 | (i4 & 127));
            i4 >>>= 7;
        }
        kz0Var.K0(i4);
    }
}
