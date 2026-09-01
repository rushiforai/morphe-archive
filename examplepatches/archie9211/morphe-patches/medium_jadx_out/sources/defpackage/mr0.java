package defpackage;

import java.util.ArrayList;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class mr0 {
    public final int[] a;
    public final int b;
    public final int c;
    public final int d;
    public final List e;

    public mr0(int... iArr) {
        List listM1;
        this.a = iArr;
        Integer numX0 = k80.x0(0, iArr);
        this.b = numX0 != null ? numX0.intValue() : -1;
        Integer numX02 = k80.x0(1, iArr);
        this.c = numX02 != null ? numX02.intValue() : -1;
        Integer numX03 = k80.x0(2, iArr);
        this.d = numX03 != null ? numX03.intValue() : -1;
        if (iArr.length <= 3) {
            listM1 = ey3.a;
        } else {
            if (iArr.length > 1024) {
                ay0.e(km4.A(new StringBuilder("BinaryVersion with length more than 1024 are not supported. Provided length "), iArr.length, '.'));
                throw null;
            }
            listM1 = bu1.m1(new j1(new h80(iArr), 3, iArr.length));
        }
        this.e = listM1;
    }

    public final boolean a(int i, int i2, int i3) {
        int i4 = this.b;
        if (i4 > i) {
            return true;
        }
        if (i4 < i) {
            return false;
        }
        int i5 = this.c;
        if (i5 > i2) {
            return true;
        }
        return i5 >= i2 && this.d >= i3;
    }

    public final boolean equals(Object obj) {
        if (obj == null || !getClass().equals(obj.getClass())) {
            return false;
        }
        mr0 mr0Var = (mr0) obj;
        return this.b == mr0Var.b && this.c == mr0Var.c && this.d == mr0Var.d && this.e.equals(mr0Var.e);
    }

    public final int hashCode() {
        int i = this.b;
        int i2 = (i * 31) + this.c + i;
        int i3 = (i2 * 31) + this.d + i2;
        return this.e.hashCode() + (i3 * 31) + i3;
    }

    public final String toString() {
        ArrayList arrayList = new ArrayList();
        for (int i : this.a) {
            if (i == -1) {
                break;
            }
            arrayList.add(Integer.valueOf(i));
        }
        return arrayList.isEmpty() ? "unknown" : bu1.F0(arrayList, ".", null, null, null, 62);
    }
}
