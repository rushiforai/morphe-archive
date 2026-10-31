package e4;

import b.c0;
import java.util.Arrays;
import mg.l;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: b, reason: collision with root package name */
    public final b f52120b;

    /* renamed from: c, reason: collision with root package name */
    public final l f52121c;

    /* renamed from: a, reason: collision with root package name */
    public int f52119a = 0;

    /* renamed from: d, reason: collision with root package name */
    public int f52122d = 8;

    /* renamed from: e, reason: collision with root package name */
    public int[] f52123e = new int[8];

    /* renamed from: f, reason: collision with root package name */
    public int[] f52124f = new int[8];

    /* renamed from: g, reason: collision with root package name */
    public float[] f52125g = new float[8];

    /* renamed from: h, reason: collision with root package name */
    public int f52126h = -1;

    /* renamed from: i, reason: collision with root package name */
    public int f52127i = -1;

    /* renamed from: j, reason: collision with root package name */
    public boolean f52128j = false;

    public a(b bVar, l lVar) {
        this.f52120b = bVar;
        this.f52121c = lVar;
    }

    public final void a(f fVar, float f11, boolean z11) {
        if (f11 <= -0.001f || f11 >= 0.001f) {
            int i5 = this.f52126h;
            b bVar = this.f52120b;
            if (i5 == -1) {
                this.f52126h = 0;
                this.f52125g[0] = f11;
                this.f52123e[0] = fVar.f52156b;
                this.f52124f[0] = -1;
                fVar.f52165k++;
                fVar.a(bVar);
                this.f52119a++;
                if (this.f52128j) {
                    return;
                }
                int i11 = this.f52127i + 1;
                this.f52127i = i11;
                int[] iArr = this.f52123e;
                if (i11 >= iArr.length) {
                    this.f52128j = true;
                    this.f52127i = iArr.length - 1;
                    return;
                }
                return;
            }
            int i12 = -1;
            for (int i13 = 0; i5 != -1 && i13 < this.f52119a; i13++) {
                int i14 = this.f52123e[i5];
                int i15 = fVar.f52156b;
                if (i14 == i15) {
                    float[] fArr = this.f52125g;
                    float f12 = fArr[i5] + f11;
                    if (f12 > -0.001f && f12 < 0.001f) {
                        f12 = 0.0f;
                    }
                    fArr[i5] = f12;
                    if (f12 == 0.0f) {
                        if (i5 == this.f52126h) {
                            this.f52126h = this.f52124f[i5];
                        } else {
                            int[] iArr2 = this.f52124f;
                            iArr2[i12] = iArr2[i5];
                        }
                        if (z11) {
                            fVar.b(bVar);
                        }
                        if (this.f52128j) {
                            this.f52127i = i5;
                        }
                        fVar.f52165k--;
                        this.f52119a--;
                        return;
                    }
                    return;
                }
                if (i14 < i15) {
                    i12 = i5;
                }
                i5 = this.f52124f[i5];
            }
            int length = this.f52127i;
            int i16 = length + 1;
            if (this.f52128j) {
                int[] iArr3 = this.f52123e;
                if (iArr3[length] != -1) {
                    length = iArr3.length;
                }
            } else {
                length = i16;
            }
            int[] iArr4 = this.f52123e;
            if (length >= iArr4.length && this.f52119a < iArr4.length) {
                int i17 = 0;
                while (true) {
                    int[] iArr5 = this.f52123e;
                    if (i17 >= iArr5.length) {
                        break;
                    }
                    if (iArr5[i17] == -1) {
                        length = i17;
                        break;
                    }
                    i17++;
                }
            }
            int[] iArr6 = this.f52123e;
            if (length >= iArr6.length) {
                length = iArr6.length;
                int i18 = this.f52122d * 2;
                this.f52122d = i18;
                this.f52128j = false;
                this.f52127i = length - 1;
                this.f52125g = Arrays.copyOf(this.f52125g, i18);
                this.f52123e = Arrays.copyOf(this.f52123e, this.f52122d);
                this.f52124f = Arrays.copyOf(this.f52124f, this.f52122d);
            }
            this.f52123e[length] = fVar.f52156b;
            this.f52125g[length] = f11;
            if (i12 != -1) {
                int[] iArr7 = this.f52124f;
                iArr7[length] = iArr7[i12];
                iArr7[i12] = length;
            } else {
                this.f52124f[length] = this.f52126h;
                this.f52126h = length;
            }
            fVar.f52165k++;
            fVar.a(bVar);
            this.f52119a++;
            if (!this.f52128j) {
                this.f52127i++;
            }
            int i19 = this.f52127i;
            int[] iArr8 = this.f52123e;
            if (i19 >= iArr8.length) {
                this.f52128j = true;
                this.f52127i = iArr8.length - 1;
            }
        }
    }

    public final void b() {
        int i5 = this.f52126h;
        for (int i11 = 0; i5 != -1 && i11 < this.f52119a; i11++) {
            f fVar = ((f[]) this.f52121c.f76311d)[this.f52123e[i5]];
            if (fVar != null) {
                fVar.b(this.f52120b);
            }
            i5 = this.f52124f[i5];
        }
        this.f52126h = -1;
        this.f52127i = -1;
        this.f52128j = false;
        this.f52119a = 0;
    }

    public final float c(f fVar) {
        int i5 = this.f52126h;
        for (int i11 = 0; i5 != -1 && i11 < this.f52119a; i11++) {
            if (this.f52123e[i5] == fVar.f52156b) {
                return this.f52125g[i5];
            }
            i5 = this.f52124f[i5];
        }
        return 0.0f;
    }

    public final int d() {
        return this.f52119a;
    }

    public final f e(int i5) {
        int i11 = this.f52126h;
        for (int i12 = 0; i11 != -1 && i12 < this.f52119a; i12++) {
            if (i12 == i5) {
                return ((f[]) this.f52121c.f76311d)[this.f52123e[i11]];
            }
            i11 = this.f52124f[i11];
        }
        return null;
    }

    public final float f(int i5) {
        int i11 = this.f52126h;
        for (int i12 = 0; i11 != -1 && i12 < this.f52119a; i12++) {
            if (i12 == i5) {
                return this.f52125g[i11];
            }
            i11 = this.f52124f[i11];
        }
        return 0.0f;
    }

    public final void g(f fVar, float f11) {
        if (f11 == 0.0f) {
            h(fVar, true);
            return;
        }
        int i5 = this.f52126h;
        b bVar = this.f52120b;
        if (i5 == -1) {
            this.f52126h = 0;
            this.f52125g[0] = f11;
            this.f52123e[0] = fVar.f52156b;
            this.f52124f[0] = -1;
            fVar.f52165k++;
            fVar.a(bVar);
            this.f52119a++;
            if (this.f52128j) {
                return;
            }
            int i11 = this.f52127i + 1;
            this.f52127i = i11;
            int[] iArr = this.f52123e;
            if (i11 >= iArr.length) {
                this.f52128j = true;
                this.f52127i = iArr.length - 1;
                return;
            }
            return;
        }
        int i12 = -1;
        for (int i13 = 0; i5 != -1 && i13 < this.f52119a; i13++) {
            int i14 = this.f52123e[i5];
            int i15 = fVar.f52156b;
            if (i14 == i15) {
                this.f52125g[i5] = f11;
                return;
            }
            if (i14 < i15) {
                i12 = i5;
            }
            i5 = this.f52124f[i5];
        }
        int length = this.f52127i;
        int i16 = length + 1;
        if (this.f52128j) {
            int[] iArr2 = this.f52123e;
            if (iArr2[length] != -1) {
                length = iArr2.length;
            }
        } else {
            length = i16;
        }
        int[] iArr3 = this.f52123e;
        if (length >= iArr3.length && this.f52119a < iArr3.length) {
            int i17 = 0;
            while (true) {
                int[] iArr4 = this.f52123e;
                if (i17 >= iArr4.length) {
                    break;
                }
                if (iArr4[i17] == -1) {
                    length = i17;
                    break;
                }
                i17++;
            }
        }
        int[] iArr5 = this.f52123e;
        if (length >= iArr5.length) {
            length = iArr5.length;
            int i18 = this.f52122d * 2;
            this.f52122d = i18;
            this.f52128j = false;
            this.f52127i = length - 1;
            this.f52125g = Arrays.copyOf(this.f52125g, i18);
            this.f52123e = Arrays.copyOf(this.f52123e, this.f52122d);
            this.f52124f = Arrays.copyOf(this.f52124f, this.f52122d);
        }
        this.f52123e[length] = fVar.f52156b;
        this.f52125g[length] = f11;
        if (i12 != -1) {
            int[] iArr6 = this.f52124f;
            iArr6[length] = iArr6[i12];
            iArr6[i12] = length;
        } else {
            this.f52124f[length] = this.f52126h;
            this.f52126h = length;
        }
        fVar.f52165k++;
        fVar.a(bVar);
        int i19 = this.f52119a + 1;
        this.f52119a = i19;
        if (!this.f52128j) {
            this.f52127i++;
        }
        int[] iArr7 = this.f52123e;
        if (i19 >= iArr7.length) {
            this.f52128j = true;
        }
        if (this.f52127i >= iArr7.length) {
            this.f52128j = true;
            this.f52127i = iArr7.length - 1;
        }
    }

    public final float h(f fVar, boolean z11) {
        int i5 = this.f52126h;
        if (i5 == -1) {
            return 0.0f;
        }
        int i11 = 0;
        int i12 = -1;
        while (i5 != -1 && i11 < this.f52119a) {
            if (this.f52123e[i5] == fVar.f52156b) {
                if (i5 == this.f52126h) {
                    this.f52126h = this.f52124f[i5];
                } else {
                    int[] iArr = this.f52124f;
                    iArr[i12] = iArr[i5];
                }
                if (z11) {
                    fVar.b(this.f52120b);
                }
                fVar.f52165k--;
                this.f52119a--;
                this.f52123e[i5] = -1;
                if (this.f52128j) {
                    this.f52127i = i5;
                }
                return this.f52125g[i5];
            }
            i11++;
            i12 = i5;
            i5 = this.f52124f[i5];
        }
        return 0.0f;
    }

    public final String toString() {
        int i5 = this.f52126h;
        String string = com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b;
        for (int i11 = 0; i5 != -1 && i11 < this.f52119a; i11++) {
            StringBuilder sbQ = a2.c.q(c0.E(string, " -> "));
            sbQ.append(this.f52125g[i5]);
            sbQ.append(" : ");
            StringBuilder sbQ2 = a2.c.q(sbQ.toString());
            sbQ2.append(((f[]) this.f52121c.f76311d)[this.f52123e[i5]]);
            string = sbQ2.toString();
            i5 = this.f52124f[i5];
        }
        return string;
    }
}
