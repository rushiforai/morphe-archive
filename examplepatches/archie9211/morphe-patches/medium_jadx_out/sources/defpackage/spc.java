package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class spc {
    public static final spc e = new spc(ond.b, 0, 0, 0);
    public final int a;
    public final ond b;
    public final int c;
    public final int d;

    public spc(ond ondVar, int i, int i2, int i3) {
        this.b = ondVar;
        this.a = i;
        this.c = i2;
        this.d = i3;
    }

    public final spc a(int i) {
        ond gecVar = this.b;
        int i2 = this.a;
        int i3 = this.d;
        if (i2 == 4 || i2 == 2) {
            int[] iArr = uj5.b[i2];
            i2 = 0;
            int i4 = iArr[0];
            int i5 = 65535 & i4;
            int i6 = i4 >> 16;
            gecVar.getClass();
            i3 += i6;
            gecVar = new gec(gecVar, i5, i6);
        }
        int i7 = this.c;
        int i8 = (i7 == 0 || i7 == 31) ? 18 : i7 == 62 ? 9 : 8;
        int i9 = i7 + 1;
        spc spcVar = new spc(gecVar, i2, i9, i3 + i8);
        return i9 == 2078 ? spcVar.b(i + 1) : spcVar;
    }

    public final spc b(int i) {
        int i2 = this.c;
        if (i2 == 0) {
            return this;
        }
        ond ondVar = this.b;
        ondVar.getClass();
        return new spc(new lr0(ondVar, i - i2, i2), this.a, 0, this.d);
    }

    public final boolean c(spc spcVar) {
        int i;
        int i2 = this.d + (uj5.b[this.a][spcVar.a] >> 16);
        int i3 = spcVar.c;
        if (i3 > 0 && ((i = this.c) == 0 || i > i3)) {
            i2 += 10;
        }
        return i2 <= spcVar.d;
    }

    public final spc d(int i, int i2) {
        int i3 = this.d;
        ond gecVar = this.b;
        int i4 = this.a;
        if (i != i4) {
            int i5 = uj5.b[i4][i];
            int i6 = 65535 & i5;
            int i7 = i5 >> 16;
            gecVar.getClass();
            i3 += i7;
            gecVar = new gec(gecVar, i6, i7);
        }
        int i8 = i == 2 ? 4 : 5;
        gecVar.getClass();
        return new spc(new gec(gecVar, i2, i8), i, 0, i3 + i8);
    }

    public final spc e(int i, int i2) {
        int i3 = this.a;
        int i4 = i3 == 2 ? 4 : 5;
        int i5 = uj5.d[i3][i];
        ond ondVar = this.b;
        ondVar.getClass();
        return new spc(new gec(new gec(ondVar, i5, i4), i2, 5), i3, 0, this.d + i4 + 5);
    }

    public final String toString() {
        return String.format("%s bits=%d bytes=%d", uj5.a[this.a], Integer.valueOf(this.d), Integer.valueOf(this.c));
    }
}
