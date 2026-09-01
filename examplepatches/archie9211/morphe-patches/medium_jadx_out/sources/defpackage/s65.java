package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class s65 {
    public final ArrayList a;
    public final int b;
    public int c;
    public final ArrayList d;
    public final k68 e;
    public final w5d f;

    public s65(int i, ArrayList arrayList) {
        this.a = arrayList;
        this.b = i;
        if (i < 0) {
            xx9.a("Invalid start index");
        }
        this.d = new ArrayList();
        k68 k68Var = new k68();
        int size = arrayList.size();
        int i2 = 0;
        for (int i3 = 0; i3 < size; i3++) {
            jk6 jk6Var = (jk6) this.a.get(i3);
            int i4 = jk6Var.c;
            int i5 = jk6Var.d;
            k68Var.i(i4, new xg5(i3, i2, i5));
            i2 += i5;
        }
        this.e = k68Var;
        this.f = new w5d(new v2(14, this));
    }

    public final boolean a(int i, int i2) {
        xg5 xg5Var;
        int i3;
        int i4;
        k68 k68Var = this.e;
        xg5 xg5Var2 = (xg5) k68Var.b(i);
        if (xg5Var2 == null) {
            return false;
        }
        int i5 = xg5Var2.b;
        int i6 = i2 - xg5Var2.c;
        xg5Var2.c = i2;
        if (i6 == 0) {
            return true;
        }
        Object[] objArr = k68Var.c;
        long[] jArr = k68Var.a;
        int length = jArr.length - 2;
        if (length < 0) {
            return true;
        }
        int i7 = 0;
        while (true) {
            long j = jArr[i7];
            if ((((~j) << 7) & j & (-9187201950435737472L)) != -9187201950435737472L) {
                int i8 = 8 - ((~(i7 - length)) >>> 31);
                for (int i9 = 0; i9 < i8; i9++) {
                    if ((255 & j) < 128 && (i3 = (xg5Var = (xg5) objArr[(i7 << 3) + i9]).b) >= i5 && xg5Var != xg5Var2 && (i4 = i3 + i6) >= 0) {
                        xg5Var.b = i4;
                    }
                    j >>= 8;
                }
                if (i8 != 8) {
                    return true;
                }
            }
            if (i7 == length) {
                return true;
            }
            i7++;
        }
    }
}
