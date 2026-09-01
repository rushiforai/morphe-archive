package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jr6 {
    public final gg5 a;
    public final int b;
    public final int c;
    public final ir6 d;
    public final jl1 e;
    public final /* synthetic */ gg5 f;

    public jr6(gg5 gg5Var, int i, int i2, ir6 ir6Var, jl1 jl1Var) {
        this.f = gg5Var;
        this.a = gg5Var;
        this.b = i;
        this.c = i2;
        this.d = ir6Var;
        this.e = jl1Var;
    }

    public final long a(int i, int i2) {
        int i3;
        gg5 gg5Var = this.a;
        int[] iArr = (int[]) gg5Var.b;
        if (i2 == 1) {
            i3 = iArr[i];
        } else {
            int i4 = (i2 + i) - 1;
            int[] iArr2 = (int[]) gg5Var.c;
            i3 = (iArr2[i4] + iArr[i4]) - iArr2[i];
        }
        if (i3 < 0) {
            i3 = 0;
        }
        if (i3 < 0) {
            d26.a("width must be >= 0");
        }
        return h72.h(i3, i3, 0, Integer.MAX_VALUE);
    }

    public final or6 b(int i) {
        f05 f05VarY = this.e.y(i);
        int i2 = f05VarY.a;
        int size = f05VarY.b.size();
        int i3 = 0;
        int i4 = (size == 0 || i2 + size == this.b) ? 0 : this.c;
        nr6[] nr6VarArr = new nr6[size];
        int i5 = 0;
        while (true) {
            List list = f05VarY.b;
            if (i3 >= size) {
                return new or6(i, nr6VarArr, this.f, list, i4);
            }
            int i6 = (int) ((fg5) list.get(i3)).a;
            int i7 = i4;
            nr6 nr6VarW0 = this.d.w0(i2 + i3, a(i5, i6), i5, i6, i7);
            i5 += i6;
            nr6VarArr[i3] = nr6VarW0;
            i3++;
            i4 = i7;
        }
    }
}
