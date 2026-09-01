package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class gkc implements Comparable {
    public boolean a;
    public float e;
    public fkc i;
    public int b = -1;
    public int c = -1;
    public int d = 0;
    public boolean f = false;
    public final float[] g = new float[9];
    public final float[] h = new float[9];
    public c80[] j = new c80[16];
    public int k = 0;
    public int l = 0;

    public gkc(fkc fkcVar) {
        this.i = fkcVar;
    }

    public final void a(c80 c80Var) {
        int i = 0;
        while (true) {
            int i2 = this.k;
            c80[] c80VarArr = this.j;
            if (i >= i2) {
                if (i2 >= c80VarArr.length) {
                    c80VarArr = (c80[]) Arrays.copyOf(c80VarArr, c80VarArr.length * 2);
                    this.j = c80VarArr;
                }
                int i3 = this.k;
                c80VarArr[i3] = c80Var;
                this.k = i3 + 1;
                return;
            }
            if (c80VarArr[i] == c80Var) {
                return;
            } else {
                i++;
            }
        }
    }

    public final void b(c80 c80Var) {
        int i = this.k;
        int i2 = 0;
        while (i2 < i) {
            if (this.j[i2] == c80Var) {
                while (i2 < i - 1) {
                    c80[] c80VarArr = this.j;
                    int i3 = i2 + 1;
                    c80VarArr[i2] = c80VarArr[i3];
                    i2 = i3;
                }
                this.k--;
                return;
            }
            i2++;
        }
    }

    public final void c() {
        this.i = fkc.UNKNOWN;
        this.d = 0;
        this.b = -1;
        this.c = -1;
        this.e = 0.0f;
        this.f = false;
        int i = this.k;
        for (int i2 = 0; i2 < i; i2++) {
            this.j[i2] = null;
        }
        this.k = 0;
        this.l = 0;
        this.a = false;
        Arrays.fill(this.h, 0.0f);
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        return this.b - ((gkc) obj).b;
    }

    public final void d(wz6 wz6Var, float f) {
        this.e = f;
        this.f = true;
        int i = this.k;
        this.c = -1;
        for (int i2 = 0; i2 < i; i2++) {
            this.j[i2].h(wz6Var, this, false);
        }
        this.k = 0;
    }

    public final void e(wz6 wz6Var, c80 c80Var) {
        int i = this.k;
        for (int i2 = 0; i2 < i; i2++) {
            this.j[i2].i(wz6Var, c80Var, false);
        }
        this.k = 0;
    }

    public final String toString() {
        return "" + this.b;
    }
}
