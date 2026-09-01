package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qv8 extends jq7 {
    public int e;
    public int g;
    public int i;
    public zl4[] d = new zl4[16];
    public int[] f = new int[16];
    public Object[] h = new Object[16];

    public final void F() {
        this.e = 0;
        this.g = 0;
        Arrays.fill(this.h, 0, this.i, (Object) null);
        this.i = 0;
    }

    public final void G(x60 x60Var, igc igcVar, l3b l3bVar, kv8 kv8Var) {
        if (this.e != 0) {
            ym0 ym0Var = new ym0(this);
            qv8 qv8Var = (qv8) ym0Var.e;
            while (true) {
                zl4 zl4Var = qv8Var.d[ym0Var.b];
                k65 k65VarE = zl4Var.e(ym0Var);
                x60 x60Var2 = x60Var;
                igc igcVar2 = igcVar;
                l3b l3bVar2 = l3bVar;
                kv8 kv8Var2 = kv8Var;
                try {
                    zl4Var.c(ym0Var, x60Var2, igcVar2, l3bVar2, kv8Var2);
                    int i = ym0Var.b;
                    int i2 = qv8Var.e;
                    if (i < i2) {
                        zl4 zl4Var2 = qv8Var.d[i];
                        ym0Var.c += zl4Var2.b;
                        ym0Var.d += zl4Var2.c;
                        int i3 = i + 1;
                        ym0Var.b = i3;
                        if (i3 >= i2) {
                            break;
                        }
                        x60Var = x60Var2;
                        igcVar = igcVar2;
                        l3bVar = l3bVar2;
                        kv8Var = kv8Var2;
                    } else {
                        break;
                    }
                } finally {
                }
            }
        }
        F();
    }

    public final boolean H() {
        return this.e == 0;
    }

    public final void I(zl4 zl4Var) {
        int i = this.e;
        zl4[] zl4VarArr = this.d;
        if (i == zl4VarArr.length) {
            zl4[] zl4VarArr2 = new zl4[(i > 1024 ? 1024 : i) + i];
            System.arraycopy(zl4VarArr, 0, zl4VarArr2, 0, i);
            this.d = zl4VarArr2;
        }
        int i2 = this.g;
        int i3 = zl4Var.b;
        int i4 = zl4Var.c;
        int i5 = i2 + i3;
        int[] iArr = this.f;
        int length = iArr.length;
        if (i5 > length) {
            int i6 = (length > 1024 ? 1024 : length) + length;
            if (i6 >= i5) {
                i5 = i6;
            }
            int[] iArr2 = new int[i5];
            k80.h0(0, 0, iArr, iArr2, length);
            this.f = iArr2;
        }
        int i7 = this.i + i4;
        Object[] objArr = this.h;
        int length2 = objArr.length;
        if (i7 > length2) {
            int i8 = (length2 <= 1024 ? length2 : 1024) + length2;
            if (i8 >= i7) {
                i7 = i8;
            }
            Object[] objArr2 = new Object[i7];
            System.arraycopy(objArr, 0, objArr2, 0, length2);
            this.h = objArr2;
        }
        zl4[] zl4VarArr3 = this.d;
        int i9 = this.e;
        this.e = i9 + 1;
        zl4VarArr3[i9] = zl4Var;
        this.g += zl4Var.b;
        this.i += i4;
    }
}
