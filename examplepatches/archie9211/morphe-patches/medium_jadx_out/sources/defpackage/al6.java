package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class al6 implements jn3 {
    public final zk6 a;

    public al6(zk6 zk6Var) {
        this.a = zk6Var;
    }

    @Override // defpackage.jn3, defpackage.ww
    /* JADX INFO: renamed from: f, reason: merged with bridge method [inline-methods] */
    public final xq3 a(hud hudVar) {
        int[] iArr;
        Object[] objArr;
        int[] iArr2;
        Object[] objArr2;
        int i;
        zk6 zk6Var = this.a;
        k68 k68Var = zk6Var.b;
        j68 j68Var = new j68(k68Var.e + 2);
        k68 k68Var2 = new k68(k68Var.e);
        int[] iArr3 = k68Var.b;
        Object[] objArr3 = k68Var.c;
        long[] jArr = k68Var.a;
        int length = jArr.length - 2;
        if (length >= 0) {
            int i2 = 0;
            while (true) {
                long j = jArr[i2];
                if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                    int i3 = 8;
                    int i4 = 8 - ((~(i2 - length)) >>> 31);
                    int i5 = 0;
                    while (i5 < i4) {
                        if ((255 & j) < 128) {
                            int i6 = (i2 << 3) + i5;
                            int i7 = iArr3[i6];
                            yk6 yk6Var = (yk6) objArr3[i6];
                            j68Var.a(i7);
                            i = i3;
                            iArr2 = iArr3;
                            objArr2 = objArr3;
                            k68Var2.i(i7, new ore((dx) hudVar.a.invoke(yk6Var.a), yk6Var.b));
                        } else {
                            iArr2 = iArr3;
                            objArr2 = objArr3;
                            i = i3;
                        }
                        j >>= i;
                        i5++;
                        i3 = i;
                        iArr3 = iArr2;
                        objArr3 = objArr2;
                    }
                    iArr = iArr3;
                    objArr = objArr3;
                    if (i4 != i3) {
                        break;
                    }
                } else {
                    iArr = iArr3;
                    objArr = objArr3;
                }
                if (i2 == length) {
                    break;
                }
                i2++;
                iArr3 = iArr;
                objArr3 = objArr;
            }
        }
        if (!k68Var.a(0)) {
            int i8 = j68Var.b;
            if (i8 < 0) {
                z10.i("Index must be between 0 and size");
                return null;
            }
            j68Var.b(i8 + 1);
            int[] iArr4 = j68Var.a;
            int i9 = j68Var.b;
            if (i9 != 0) {
                k80.h0(1, 0, iArr4, iArr4, i9);
            }
            iArr4[0] = 0;
            j68Var.b++;
        }
        if (!k68Var.a(zk6Var.a)) {
            j68Var.a(zk6Var.a);
        }
        int i10 = j68Var.b;
        if (i10 != 0) {
            int[] iArr5 = j68Var.a;
            iArr5.getClass();
            Arrays.sort(iArr5, 0, i10);
        }
        return new xq3(j68Var, k68Var2, zk6Var.a, ao3.d);
    }
}
