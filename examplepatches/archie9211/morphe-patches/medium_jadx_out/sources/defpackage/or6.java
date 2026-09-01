package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class or6 {
    public final int a;
    public final nr6[] b;
    public final gg5 c;
    public final List d;
    public final int e;
    public final int f;
    public final int g;

    public or6(int i, nr6[] nr6VarArr, gg5 gg5Var, List list, int i2) {
        this.a = i;
        this.b = nr6VarArr;
        this.c = gg5Var;
        this.d = list;
        this.e = i2;
        int iMax = 0;
        for (nr6 nr6Var : nr6VarArr) {
            iMax = Math.max(iMax, nr6Var.n);
        }
        this.f = iMax;
        int i3 = iMax + this.e;
        this.g = i3 >= 0 ? i3 : 0;
    }

    public final nr6[] a(int i, int i2, int i3) {
        nr6[] nr6VarArr = this.b;
        int length = nr6VarArr.length;
        int i4 = 0;
        int i5 = 0;
        int i6 = 0;
        while (i4 < length) {
            nr6 nr6Var = nr6VarArr[i4];
            int i7 = i5 + 1;
            int i8 = (int) ((fg5) this.d.get(i5)).a;
            nr6Var.l(i, ((int[]) this.c.c)[i6], i2, i3, this.a, i6);
            i6 += i8;
            i4++;
            i5 = i7;
        }
        return nr6VarArr;
    }
}
