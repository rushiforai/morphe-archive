package defpackage;

import java.io.IOException;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zr5 {
    public final yua c;
    public int f;
    public int g;
    public int a = 4096;
    public final ArrayList b = new ArrayList();
    public vi5[] d = new vi5[8];
    public int e = 7;

    public zr5(ss5 ss5Var) {
        this.c = new yua(ss5Var);
    }

    public final int a(int i) {
        int i2;
        int i3 = 0;
        if (i > 0) {
            int length = this.d.length;
            while (true) {
                length--;
                i2 = this.e;
                if (length < i2 || i <= 0) {
                    break;
                }
                vi5 vi5Var = this.d[length];
                vi5Var.getClass();
                int i4 = vi5Var.c;
                i -= i4;
                this.g -= i4;
                this.f--;
                i3++;
            }
            vi5[] vi5VarArr = this.d;
            int i5 = i2 + 1;
            System.arraycopy(vi5VarArr, i5, vi5VarArr, i5 + i3, this.f);
            this.e += i3;
        }
        return i3;
    }

    public final h21 b(int i) throws IOException {
        if (i >= 0) {
            vi5[] vi5VarArr = bs5.a;
            if (i <= vi5VarArr.length - 1) {
                return vi5VarArr[i].a;
            }
        }
        int length = this.e + 1 + (i - bs5.a.length);
        if (length >= 0) {
            vi5[] vi5VarArr2 = this.d;
            if (length < vi5VarArr2.length) {
                vi5 vi5Var = vi5VarArr2[length];
                vi5Var.getClass();
                return vi5Var.a;
            }
        }
        throw new IOException("Header index too large " + (i + 1));
    }

    public final void c(vi5 vi5Var) {
        this.b.add(vi5Var);
        int i = vi5Var.c;
        int i2 = this.a;
        if (i > i2) {
            vi5[] vi5VarArr = this.d;
            k80.o0(0, vi5VarArr.length, null, vi5VarArr);
            this.e = this.d.length - 1;
            this.f = 0;
            this.g = 0;
            return;
        }
        a((this.g + i) - i2);
        int i3 = this.f + 1;
        vi5[] vi5VarArr2 = this.d;
        if (i3 > vi5VarArr2.length) {
            vi5[] vi5VarArr3 = new vi5[vi5VarArr2.length * 2];
            System.arraycopy(vi5VarArr2, 0, vi5VarArr3, vi5VarArr2.length, vi5VarArr2.length);
            this.e = this.d.length - 1;
            this.d = vi5VarArr3;
            vi5VarArr2 = vi5VarArr3;
        }
        int i4 = this.e;
        this.e = i4 - 1;
        vi5VarArr2[i4] = vi5Var;
        this.f++;
        this.g += i;
    }

    public final h21 d() {
        yua yuaVar = this.c;
        byte b = yuaVar.readByte();
        byte[] bArr = egf.a;
        int i = b & 255;
        int i2 = 0;
        boolean z = (b & 128) == 128;
        long jE = e(i, 127);
        if (!z) {
            return yuaVar.r(jE);
        }
        kz0 kz0Var = new kz0();
        u11 u11Var = st5.c;
        u11 u11Var2 = u11Var;
        int i3 = 0;
        for (long j = 0; j < jE; j++) {
            byte b2 = yuaVar.readByte();
            byte[] bArr2 = egf.a;
            i2 = (i2 << 8) | (b2 & 255);
            i3 += 8;
            while (i3 >= 8) {
                u11[] u11VarArr = (u11[]) u11Var2.d;
                u11VarArr.getClass();
                u11Var2 = u11VarArr[(i2 >>> (i3 - 8)) & 255];
                u11Var2.getClass();
                if (((u11[]) u11Var2.d) == null) {
                    kz0Var.K0(u11Var2.b);
                    i3 -= u11Var2.c;
                    u11Var2 = u11Var;
                } else {
                    i3 -= 8;
                }
            }
        }
        while (i3 > 0) {
            u11[] u11VarArr2 = (u11[]) u11Var2.d;
            u11VarArr2.getClass();
            u11 u11Var3 = u11VarArr2[(i2 << (8 - i3)) & 255];
            u11Var3.getClass();
            int i4 = u11Var3.c;
            if (((u11[]) u11Var3.d) != null || i4 > i3) {
                break;
            }
            kz0Var.K0(u11Var3.b);
            i3 -= i4;
            u11Var2 = u11Var;
        }
        return kz0Var.r(kz0Var.b);
    }

    public final int e(int i, int i2) {
        int i3 = i & i2;
        if (i3 < i2) {
            return i3;
        }
        int i4 = 0;
        while (true) {
            byte b = this.c.readByte();
            byte[] bArr = egf.a;
            int i5 = b & 255;
            if ((b & 128) == 0) {
                return i2 + (i5 << i4);
            }
            i2 += (b & 127) << i4;
            i4 += 7;
        }
    }
}
