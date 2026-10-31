package e4;

import ai.r2;
import io.sentry.e3;
import java.util.Arrays;

/* loaded from: classes2.dex */
public final class e extends b {

    /* renamed from: f, reason: collision with root package name */
    public f[] f52151f;

    /* renamed from: g, reason: collision with root package name */
    public f[] f52152g;

    /* renamed from: h, reason: collision with root package name */
    public int f52153h;

    /* renamed from: i, reason: collision with root package name */
    public e3 f52154i;

    @Override // e4.b
    public final f d(boolean[] zArr) {
        int i5 = -1;
        for (int i11 = 0; i11 < this.f52153h; i11++) {
            f[] fVarArr = this.f52151f;
            f fVar = fVarArr[i11];
            if (!zArr[fVar.f52156b]) {
                e3 e3Var = this.f52154i;
                e3Var.f67208b = fVar;
                int i12 = 8;
                if (i5 == -1) {
                    while (i12 >= 0) {
                        float f11 = ((f) e3Var.f67208b).f52162h[i12];
                        if (f11 <= 0.0f) {
                            if (f11 < 0.0f) {
                                i5 = i11;
                                break;
                            }
                            i12--;
                        }
                    }
                } else {
                    f fVar2 = fVarArr[i5];
                    while (true) {
                        if (i12 >= 0) {
                            float f12 = fVar2.f52162h[i12];
                            float f13 = ((f) e3Var.f67208b).f52162h[i12];
                            if (f13 == f12) {
                                i12--;
                            } else if (f13 < f12) {
                            }
                        }
                    }
                }
            }
        }
        if (i5 == -1) {
            return null;
        }
        return this.f52151f[i5];
    }

    @Override // e4.b
    public final boolean e() {
        return this.f52153h == 0;
    }

    @Override // e4.b
    public final void i(c cVar, b bVar, boolean z11) {
        f fVar = bVar.f52129a;
        if (fVar == null) {
            return;
        }
        float[] fArr = fVar.f52162h;
        a aVar = bVar.f52132d;
        int iD = aVar.d();
        for (int i5 = 0; i5 < iD; i5++) {
            f fVarE = aVar.e(i5);
            float f11 = aVar.f(i5);
            e3 e3Var = this.f52154i;
            e3Var.f67208b = fVarE;
            if (fVarE.f52155a) {
                boolean z12 = true;
                for (int i11 = 0; i11 < 9; i11++) {
                    float[] fArr2 = ((f) e3Var.f67208b).f52162h;
                    float f12 = (fArr[i11] * f11) + fArr2[i11];
                    fArr2[i11] = f12;
                    if (Math.abs(f12) < 1.0E-4f) {
                        ((f) e3Var.f67208b).f52162h[i11] = 0.0f;
                    } else {
                        z12 = false;
                    }
                }
                if (z12) {
                    ((e) e3Var.f67209c).k((f) e3Var.f67208b);
                }
            } else {
                for (int i12 = 0; i12 < 9; i12++) {
                    float f13 = fArr[i12];
                    if (f13 != 0.0f) {
                        float f14 = f13 * f11;
                        if (Math.abs(f14) < 1.0E-4f) {
                            f14 = 0.0f;
                        }
                        ((f) e3Var.f67208b).f52162h[i12] = f14;
                    } else {
                        ((f) e3Var.f67208b).f52162h[i12] = 0.0f;
                    }
                }
                j(fVarE);
            }
            this.f52130b = (bVar.f52130b * f11) + this.f52130b;
        }
        k(fVar);
    }

    public final void j(f fVar) {
        int i5;
        int i11 = this.f52153h + 1;
        f[] fVarArr = this.f52151f;
        if (i11 > fVarArr.length) {
            f[] fVarArr2 = (f[]) Arrays.copyOf(fVarArr, fVarArr.length * 2);
            this.f52151f = fVarArr2;
            this.f52152g = (f[]) Arrays.copyOf(fVarArr2, fVarArr2.length * 2);
        }
        f[] fVarArr3 = this.f52151f;
        int i12 = this.f52153h;
        fVarArr3[i12] = fVar;
        int i13 = i12 + 1;
        this.f52153h = i13;
        if (i13 > 1 && fVarArr3[i12].f52156b > fVar.f52156b) {
            int i14 = 0;
            while (true) {
                i5 = this.f52153h;
                if (i14 >= i5) {
                    break;
                }
                this.f52152g[i14] = this.f52151f[i14];
                i14++;
            }
            Arrays.sort(this.f52152g, 0, i5, new r2(11));
            for (int i15 = 0; i15 < this.f52153h; i15++) {
                this.f52151f[i15] = this.f52152g[i15];
            }
        }
        fVar.f52155a = true;
        fVar.a(this);
    }

    public final void k(f fVar) {
        int i5 = 0;
        while (i5 < this.f52153h) {
            if (this.f52151f[i5] == fVar) {
                while (true) {
                    int i11 = this.f52153h;
                    if (i5 >= i11 - 1) {
                        this.f52153h = i11 - 1;
                        fVar.f52155a = false;
                        return;
                    } else {
                        f[] fVarArr = this.f52151f;
                        int i12 = i5 + 1;
                        fVarArr[i5] = fVarArr[i12];
                        i5 = i12;
                    }
                }
            } else {
                i5++;
            }
        }
    }

    @Override // e4.b
    public final String toString() {
        e3 e3Var = this.f52154i;
        String str = " goal -> (" + this.f52130b + ") : ";
        for (int i5 = 0; i5 < this.f52153h; i5++) {
            e3Var.f67208b = this.f52151f[i5];
            str = str + e3Var + " ";
        }
        return str;
    }
}
