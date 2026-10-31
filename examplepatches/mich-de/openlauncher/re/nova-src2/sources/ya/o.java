package ya;

import java.lang.reflect.Array;

/* loaded from: classes.dex */
public final class o {

    /* renamed from: a, reason: collision with root package name */
    public final int f97181a;

    /* renamed from: b, reason: collision with root package name */
    public final int f97182b;

    /* renamed from: c, reason: collision with root package name */
    public final boolean[][] f97183c;

    public o(int i5, int i11) {
        this.f97181a = i5;
        this.f97182b = i11;
        this.f97183c = (boolean[][]) Array.newInstance((Class<?>) Boolean.TYPE, i5, i11);
    }

    public final void a(o oVar) {
        for (int i5 = 0; i5 < this.f97181a; i5++) {
            for (int i11 = 0; i11 < this.f97182b; i11++) {
                oVar.f97183c[i5][i11] = this.f97183c[i5][i11];
            }
        }
    }

    public final boolean b(int i5, int i11, int[] iArr) {
        int i12 = 0;
        while (true) {
            int i13 = i12 + i11;
            if (i13 > this.f97182b) {
                return false;
            }
            int i14 = 0;
            while (true) {
                int i15 = i14 + i5;
                if (i15 <= this.f97181a) {
                    boolean[][] zArr = this.f97183c;
                    boolean z11 = !zArr[i14][i12];
                    for (int i16 = i14; i16 < i15; i16++) {
                        for (int i17 = i12; i17 < i13; i17++) {
                            z11 = z11 && !zArr[i16][i17];
                            if (!z11) {
                                break;
                            }
                        }
                    }
                    if (z11) {
                        iArr[0] = i14;
                        iArr[1] = i12;
                        return true;
                    }
                    i14++;
                }
            }
            i12++;
        }
    }

    public final boolean c(int i5, int i11, int i12, int i13) {
        int i14 = (i12 + i5) - 1;
        int i15 = (i13 + i11) - 1;
        if (i5 < 0 || i11 < 0 || i14 >= this.f97181a || i15 >= this.f97182b) {
            return false;
        }
        while (i5 <= i14) {
            for (int i16 = i11; i16 <= i15; i16++) {
                if (this.f97183c[i5][i16]) {
                    return false;
                }
            }
            i5++;
        }
        return true;
    }

    public final void d(int i5, int i11, int i12, int i13, boolean z11) {
        if (i5 < 0 || i11 < 0) {
            return;
        }
        for (int i14 = i5; i14 < i5 + i12 && i14 < this.f97181a; i14++) {
            for (int i15 = i11; i15 < i11 + i13 && i15 < this.f97182b; i15++) {
                this.f97183c[i14][i15] = z11;
            }
        }
    }

    public final void e(a aVar, boolean z11) {
        d(aVar.f97095a, aVar.f97096b, aVar.f97097c, aVar.f97098d, z11);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("GridOccupancy(");
        int i5 = this.f97181a;
        sb2.append(i5);
        sb2.append("×");
        int i11 = this.f97182b;
        sb2.append(i11);
        sb2.append(")\n\t");
        for (int i12 = 0; i12 < i5; i12++) {
            for (int i13 = 0; i13 < i11; i13++) {
                if (this.f97183c[i12][i13]) {
                    sb2.append('x');
                } else {
                    sb2.append(' ');
                }
            }
            sb2.append("\n\t");
        }
        return sb2.toString();
    }
}
