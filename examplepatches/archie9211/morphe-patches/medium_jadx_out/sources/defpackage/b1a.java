package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class b1a extends c80 {
    public gkc[] f;
    public gkc[] g;
    public int h;
    public a1a i;

    @Override // defpackage.c80
    public final gkc d(boolean[] zArr) {
        int i = -1;
        for (int i2 = 0; i2 < this.h; i2++) {
            gkc[] gkcVarArr = this.f;
            gkc gkcVar = gkcVarArr[i2];
            if (!zArr[gkcVar.b]) {
                a1a a1aVar = this.i;
                a1aVar.b = gkcVar;
                int i3 = 8;
                if (i == -1) {
                    while (i3 >= 0) {
                        float f = ((gkc) a1aVar.b).h[i3];
                        if (f <= 0.0f) {
                            if (f < 0.0f) {
                                i = i2;
                                break;
                            }
                            i3--;
                        }
                    }
                } else {
                    gkc gkcVar2 = gkcVarArr[i];
                    while (true) {
                        if (i3 >= 0) {
                            float f2 = gkcVar2.h[i3];
                            float f3 = ((gkc) a1aVar.b).h[i3];
                            if (f3 == f2) {
                                i3--;
                            } else if (f3 < f2) {
                            }
                        }
                    }
                }
            }
        }
        if (i == -1) {
            return null;
        }
        return this.f[i];
    }

    @Override // defpackage.c80
    public final boolean e() {
        return this.h == 0;
    }

    @Override // defpackage.c80
    public final void i(wz6 wz6Var, c80 c80Var, boolean z) {
        gkc gkcVar = c80Var.a;
        if (gkcVar == null) {
            return;
        }
        float[] fArr = gkcVar.h;
        p70 p70Var = c80Var.d;
        int iD = p70Var.d();
        for (int i = 0; i < iD; i++) {
            gkc gkcVarE = p70Var.e(i);
            float f = p70Var.f(i);
            a1a a1aVar = this.i;
            a1aVar.b = gkcVarE;
            if (gkcVarE.a) {
                boolean z2 = true;
                for (int i2 = 0; i2 < 9; i2++) {
                    float[] fArr2 = ((gkc) a1aVar.b).h;
                    float f2 = (fArr[i2] * f) + fArr2[i2];
                    fArr2[i2] = f2;
                    if (Math.abs(f2) < 1.0E-4f) {
                        ((gkc) a1aVar.b).h[i2] = 0.0f;
                    } else {
                        z2 = false;
                    }
                }
                if (z2) {
                    ((b1a) a1aVar.c).k((gkc) a1aVar.b);
                }
            } else {
                for (int i3 = 0; i3 < 9; i3++) {
                    float f3 = fArr[i3];
                    if (f3 != 0.0f) {
                        float f4 = f3 * f;
                        if (Math.abs(f4) < 1.0E-4f) {
                            f4 = 0.0f;
                        }
                        ((gkc) a1aVar.b).h[i3] = f4;
                    } else {
                        ((gkc) a1aVar.b).h[i3] = 0.0f;
                    }
                }
                j(gkcVarE);
            }
            this.b = (c80Var.b * f) + this.b;
        }
        k(gkcVar);
    }

    public final void j(gkc gkcVar) {
        int i;
        gkc[] gkcVarArr;
        int i2 = this.h + 1;
        gkc[] gkcVarArr2 = this.f;
        if (i2 > gkcVarArr2.length) {
            gkc[] gkcVarArr3 = (gkc[]) Arrays.copyOf(gkcVarArr2, gkcVarArr2.length * 2);
            this.f = gkcVarArr3;
            this.g = (gkc[]) Arrays.copyOf(gkcVarArr3, gkcVarArr3.length * 2);
        }
        gkc[] gkcVarArr4 = this.f;
        int i3 = this.h;
        gkcVarArr4[i3] = gkcVar;
        int i4 = i3 + 1;
        this.h = i4;
        if (i4 > 1 && gkcVarArr4[i3].b > gkcVar.b) {
            int i5 = 0;
            while (true) {
                i = this.h;
                gkcVarArr = this.g;
                if (i5 >= i) {
                    break;
                }
                gkcVarArr[i5] = this.f[i5];
                i5++;
            }
            Arrays.sort(gkcVarArr, 0, i, new js4(27));
            for (int i6 = 0; i6 < this.h; i6++) {
                this.f[i6] = this.g[i6];
            }
        }
        gkcVar.a = true;
        gkcVar.a(this);
    }

    public final void k(gkc gkcVar) {
        int i = 0;
        while (i < this.h) {
            if (this.f[i] == gkcVar) {
                while (true) {
                    int i2 = this.h;
                    if (i >= i2 - 1) {
                        this.h = i2 - 1;
                        gkcVar.a = false;
                        return;
                    } else {
                        gkc[] gkcVarArr = this.f;
                        int i3 = i + 1;
                        gkcVarArr[i] = gkcVarArr[i3];
                        i = i3;
                    }
                }
            } else {
                i++;
            }
        }
    }

    @Override // defpackage.c80
    public final String toString() {
        a1a a1aVar = this.i;
        String str = " goal -> (" + this.b + ") : ";
        for (int i = 0; i < this.h; i++) {
            a1aVar.b = this.f[i];
            str = str + a1aVar + " ";
        }
        return str;
    }
}
