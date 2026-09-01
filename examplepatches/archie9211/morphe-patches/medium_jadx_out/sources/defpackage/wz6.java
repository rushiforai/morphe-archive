package defpackage;

import com.drew.metadata.photoshop.PhotoshopDirectory;
import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wz6 {
    public static boolean q = false;
    public final b1a d;
    public final m50 m;
    public c80 p;
    public int a = PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE;
    public boolean b = false;
    public int c = 0;
    public int e = 32;
    public int f = 32;
    public boolean h = false;
    public boolean[] i = new boolean[32];
    public int j = 1;
    public int k = 0;
    public int l = 32;
    public gkc[] n = new gkc[PhotoshopDirectory.TAG_CHANNELS_ROWS_COLUMNS_DEPTH_MODE];
    public int o = 0;
    public c80[] g = new c80[32];

    public wz6() {
        s();
        m50 m50Var = new m50(13, false);
        m50Var.b = new wc9();
        m50Var.c = new wc9();
        m50Var.d = new gkc[32];
        this.m = m50Var;
        b1a b1aVar = new b1a(m50Var);
        b1aVar.f = new gkc[128];
        b1aVar.g = new gkc[128];
        b1aVar.h = 0;
        b1aVar.i = new a1a(b1aVar);
        this.d = b1aVar;
        this.p = new c80(m50Var);
    }

    public static int n(Object obj) {
        gkc gkcVar = ((l52) obj).i;
        if (gkcVar != null) {
            return (int) (gkcVar.e + 0.5f);
        }
        return 0;
    }

    public final gkc a(fkc fkcVar) {
        wc9 wc9Var = (wc9) this.m.c;
        int i = wc9Var.b;
        Object obj = null;
        if (i > 0) {
            int i2 = i - 1;
            Object[] objArr = wc9Var.a;
            Object obj2 = objArr[i2];
            objArr[i2] = null;
            wc9Var.b = i2;
            obj = obj2;
        }
        gkc gkcVar = (gkc) obj;
        if (gkcVar == null) {
            gkcVar = new gkc(fkcVar);
            gkcVar.i = fkcVar;
        } else {
            gkcVar.c();
            gkcVar.i = fkcVar;
        }
        int i3 = this.o;
        int i4 = this.a;
        if (i3 >= i4) {
            int i5 = i4 * 2;
            this.a = i5;
            this.n = (gkc[]) Arrays.copyOf(this.n, i5);
        }
        gkc[] gkcVarArr = this.n;
        int i6 = this.o;
        this.o = i6 + 1;
        gkcVarArr[i6] = gkcVar;
        return gkcVar;
    }

    public final void b(gkc gkcVar, gkc gkcVar2, int i, float f, gkc gkcVar3, gkc gkcVar4, int i2, int i3) {
        c80 c80VarL = l();
        if (gkcVar2 == gkcVar3) {
            c80VarL.d.g(gkcVar, 1.0f);
            c80VarL.d.g(gkcVar4, 1.0f);
            c80VarL.d.g(gkcVar2, -2.0f);
        } else {
            p70 p70Var = c80VarL.d;
            if (f == 0.5f) {
                p70Var.g(gkcVar, 1.0f);
                c80VarL.d.g(gkcVar2, -1.0f);
                c80VarL.d.g(gkcVar3, -1.0f);
                c80VarL.d.g(gkcVar4, 1.0f);
                if (i > 0 || i2 > 0) {
                    c80VarL.b = (-i) + i2;
                }
            } else if (f <= 0.0f) {
                p70Var.g(gkcVar, -1.0f);
                c80VarL.d.g(gkcVar2, 1.0f);
                c80VarL.b = i;
            } else if (f >= 1.0f) {
                p70Var.g(gkcVar4, -1.0f);
                c80VarL.d.g(gkcVar3, 1.0f);
                c80VarL.b = -i2;
            } else {
                float f2 = 1.0f - f;
                p70Var.g(gkcVar, f2 * 1.0f);
                c80VarL.d.g(gkcVar2, f2 * (-1.0f));
                c80VarL.d.g(gkcVar3, (-1.0f) * f);
                c80VarL.d.g(gkcVar4, 1.0f * f);
                if (i > 0 || i2 > 0) {
                    c80VarL.b = (i2 * f) + ((-i) * f2);
                }
            }
        }
        if (i3 != 8) {
            c80VarL.a(this, i3);
        }
        c(c80VarL);
    }

    /* JADX WARN: Removed duplicated region for block: B:118:0x01af  */
    /* JADX WARN: Removed duplicated region for block: B:121:0x01b4  */
    /* JADX WARN: Removed duplicated region for block: B:154:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:57:0x00d5  */
    /* JADX WARN: Removed duplicated region for block: B:75:0x00f7  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void c(defpackage.c80 r18) {
        /*
            Method dump skipped, instruction units count: 457
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz6.c(c80):void");
    }

    public final void d(gkc gkcVar, int i) {
        int i2 = gkcVar.c;
        if (i2 == -1) {
            gkcVar.d(this, i);
            for (int i3 = 0; i3 < this.c + 1; i3++) {
                gkc gkcVar2 = ((gkc[]) this.m.d)[i3];
            }
            return;
        }
        if (i2 == -1) {
            c80 c80VarL = l();
            c80VarL.a = gkcVar;
            float f = i;
            gkcVar.e = f;
            c80VarL.b = f;
            c80VarL.e = true;
            c(c80VarL);
            return;
        }
        c80 c80Var = this.g[i2];
        if (c80Var.e) {
            c80Var.b = i;
            return;
        }
        if (c80Var.d.d() == 0) {
            c80Var.e = true;
            c80Var.b = i;
            return;
        }
        c80 c80VarL2 = l();
        if (i < 0) {
            c80VarL2.b = i * (-1);
            c80VarL2.d.g(gkcVar, 1.0f);
        } else {
            c80VarL2.b = i;
            c80VarL2.d.g(gkcVar, -1.0f);
        }
        c(c80VarL2);
    }

    public final void e(gkc gkcVar, gkc gkcVar2, int i, int i2) {
        if (i2 == 8 && gkcVar2.f && gkcVar.c == -1) {
            gkcVar.d(this, gkcVar2.e + i);
            return;
        }
        c80 c80VarL = l();
        boolean z = false;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                z = true;
            }
            c80VarL.b = i;
        }
        p70 p70Var = c80VarL.d;
        if (z) {
            p70Var.g(gkcVar, 1.0f);
            c80VarL.d.g(gkcVar2, -1.0f);
        } else {
            p70Var.g(gkcVar, -1.0f);
            c80VarL.d.g(gkcVar2, 1.0f);
        }
        if (i2 != 8) {
            c80VarL.a(this, i2);
        }
        c(c80VarL);
    }

    public final void f(gkc gkcVar, gkc gkcVar2, int i, int i2) {
        c80 c80VarL = l();
        gkc gkcVarM = m();
        gkcVarM.d = 0;
        c80VarL.b(gkcVar, gkcVar2, gkcVarM, i);
        if (i2 != 8) {
            c80VarL.d.g(j(i2), (int) (c80VarL.d.c(gkcVarM) * (-1.0f)));
        }
        c(c80VarL);
    }

    public final void g(gkc gkcVar, gkc gkcVar2, int i, int i2) {
        c80 c80VarL = l();
        gkc gkcVarM = m();
        gkcVarM.d = 0;
        c80VarL.c(gkcVar, gkcVar2, gkcVarM, i);
        if (i2 != 8) {
            c80VarL.d.g(j(i2), (int) (c80VarL.d.c(gkcVarM) * (-1.0f)));
        }
        c(c80VarL);
    }

    public final void h(c80 c80Var) {
        int i;
        if (c80Var.e) {
            c80Var.a.d(this, c80Var.b);
        } else {
            c80[] c80VarArr = this.g;
            int i2 = this.k;
            c80VarArr[i2] = c80Var;
            gkc gkcVar = c80Var.a;
            gkcVar.c = i2;
            this.k = i2 + 1;
            gkcVar.e(this, c80Var);
        }
        if (this.b) {
            int i3 = 0;
            while (i3 < this.k) {
                if (this.g[i3] == null) {
                    System.out.println("WTF");
                }
                c80 c80Var2 = this.g[i3];
                if (c80Var2 != null && c80Var2.e) {
                    c80Var2.a.d(this, c80Var2.b);
                    ((wc9) this.m.b).b(c80Var2);
                    this.g[i3] = null;
                    int i4 = i3 + 1;
                    int i5 = i4;
                    while (true) {
                        i = this.k;
                        if (i4 >= i) {
                            break;
                        }
                        c80[] c80VarArr2 = this.g;
                        int i6 = i4 - 1;
                        c80 c80Var3 = c80VarArr2[i4];
                        c80VarArr2[i6] = c80Var3;
                        gkc gkcVar2 = c80Var3.a;
                        if (gkcVar2.c == i4) {
                            gkcVar2.c = i6;
                        }
                        i5 = i4;
                        i4++;
                    }
                    if (i5 < i) {
                        this.g[i5] = null;
                    }
                    this.k = i - 1;
                    i3--;
                }
                i3++;
            }
            this.b = false;
        }
    }

    public final void i() {
        for (int i = 0; i < this.k; i++) {
            c80 c80Var = this.g[i];
            c80Var.a.e = c80Var.b;
        }
    }

    public final gkc j(int i) {
        if (this.j + 1 >= this.f) {
            o();
        }
        gkc gkcVarA = a(fkc.ERROR);
        float[] fArr = gkcVarA.h;
        int i2 = this.c + 1;
        this.c = i2;
        this.j++;
        gkcVarA.b = i2;
        gkcVarA.d = i;
        ((gkc[]) this.m.d)[i2] = gkcVarA;
        b1a b1aVar = this.d;
        b1aVar.i.b = gkcVarA;
        Arrays.fill(fArr, 0.0f);
        fArr[gkcVarA.d] = 1.0f;
        b1aVar.j(gkcVarA);
        return gkcVarA;
    }

    public final gkc k(Object obj) {
        if (obj == null) {
            return null;
        }
        if (this.j + 1 >= this.f) {
            o();
        }
        if (!(obj instanceof l52)) {
            return null;
        }
        l52 l52Var = (l52) obj;
        gkc gkcVar = l52Var.i;
        if (gkcVar == null) {
            l52Var.k();
            gkcVar = l52Var.i;
        }
        int i = gkcVar.b;
        m50 m50Var = this.m;
        if (i != -1 && i <= this.c && ((gkc[]) m50Var.d)[i] != null) {
            return gkcVar;
        }
        if (i != -1) {
            gkcVar.c();
        }
        int i2 = this.c + 1;
        this.c = i2;
        this.j++;
        gkcVar.b = i2;
        gkcVar.i = fkc.UNRESTRICTED;
        ((gkc[]) m50Var.d)[i2] = gkcVar;
        return gkcVar;
    }

    public final c80 l() {
        Object obj;
        m50 m50Var = this.m;
        wc9 wc9Var = (wc9) m50Var.b;
        int i = wc9Var.b;
        if (i > 0) {
            int i2 = i - 1;
            Object[] objArr = wc9Var.a;
            obj = objArr[i2];
            objArr[i2] = null;
            wc9Var.b = i2;
        } else {
            obj = null;
        }
        c80 c80Var = (c80) obj;
        if (c80Var == null) {
            return new c80(m50Var);
        }
        c80Var.a = null;
        c80Var.d.b();
        c80Var.b = 0.0f;
        c80Var.e = false;
        return c80Var;
    }

    public final gkc m() {
        if (this.j + 1 >= this.f) {
            o();
        }
        gkc gkcVarA = a(fkc.SLACK);
        int i = this.c + 1;
        this.c = i;
        this.j++;
        gkcVarA.b = i;
        ((gkc[]) this.m.d)[i] = gkcVarA;
        return gkcVarA;
    }

    public final void o() {
        int i = this.e * 2;
        this.e = i;
        this.g = (c80[]) Arrays.copyOf(this.g, i);
        m50 m50Var = this.m;
        m50Var.d = (gkc[]) Arrays.copyOf((gkc[]) m50Var.d, this.e);
        int i2 = this.e;
        this.i = new boolean[i2];
        this.f = i2;
        this.l = i2;
    }

    public final void p() {
        b1a b1aVar = this.d;
        if (b1aVar.e()) {
            i();
            return;
        }
        if (!this.h) {
            q(b1aVar);
            return;
        }
        for (int i = 0; i < this.k; i++) {
            if (!this.g[i].e) {
                q(b1aVar);
                return;
            }
        }
        i();
    }

    public final void q(b1a b1aVar) {
        int i = 0;
        while (true) {
            if (i >= this.k) {
                break;
            }
            c80 c80Var = this.g[i];
            if (c80Var.a.i != fkc.UNRESTRICTED) {
                float f = 0.0f;
                if (c80Var.b < 0.0f) {
                    boolean z = false;
                    int i2 = 0;
                    while (!z) {
                        i2++;
                        float f2 = Float.MAX_VALUE;
                        int i3 = -1;
                        int i4 = -1;
                        int i5 = 0;
                        int i6 = 0;
                        while (i5 < this.k) {
                            c80 c80Var2 = this.g[i5];
                            if (c80Var2.a.i != fkc.UNRESTRICTED && !c80Var2.e && c80Var2.b < f) {
                                int iD = c80Var2.d.d();
                                int i7 = 0;
                                while (i7 < iD) {
                                    gkc gkcVarE = c80Var2.d.e(i7);
                                    float fC = c80Var2.d.c(gkcVarE);
                                    if (fC > f) {
                                        for (int i8 = 0; i8 < 9; i8++) {
                                            float f3 = gkcVarE.g[i8] / fC;
                                            if ((f3 < f2 && i8 == i6) || i8 > i6) {
                                                i6 = i8;
                                                i4 = gkcVarE.b;
                                                i3 = i5;
                                                f2 = f3;
                                            }
                                        }
                                    }
                                    i7++;
                                    f = 0.0f;
                                }
                            }
                            i5++;
                            f = 0.0f;
                        }
                        if (i3 != -1) {
                            c80 c80Var3 = this.g[i3];
                            c80Var3.a.c = -1;
                            c80Var3.g(((gkc[]) this.m.d)[i4]);
                            gkc gkcVar = c80Var3.a;
                            gkcVar.c = i3;
                            gkcVar.e(this, c80Var3);
                        } else {
                            z = true;
                        }
                        if (i2 > this.j / 2) {
                            z = true;
                        }
                        f = 0.0f;
                    }
                }
            }
            i++;
        }
        r(b1aVar);
        i();
    }

    /* JADX WARN: Removed duplicated region for block: B:43:0x007e  */
    /* JADX WARN: Removed duplicated region for block: B:63:0x0093 A[SYNTHETIC] */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void r(defpackage.c80 r17) {
        /*
            r16 = this;
            r0 = r16
            r1 = r17
            r2 = 0
            r3 = r2
        L6:
            int r4 = r0.j
            if (r3 >= r4) goto L11
            boolean[] r4 = r0.i
            r4[r3] = r2
            int r3 = r3 + 1
            goto L6
        L11:
            r3 = r2
            r4 = r3
        L13:
            if (r3 != 0) goto Lb0
            r5 = 1
            int r4 = r4 + r5
            int r6 = r0.j
            int r6 = r6 * 2
            if (r4 < r6) goto L1f
            goto Lb0
        L1f:
            gkc r6 = r1.a
            if (r6 == 0) goto L29
            boolean[] r7 = r0.i
            int r6 = r6.b
            r7[r6] = r5
        L29:
            boolean[] r6 = r0.i
            gkc r6 = r1.d(r6)
            if (r6 == 0) goto L3d
            boolean[] r7 = r0.i
            int r8 = r6.b
            boolean r9 = r7[r8]
            if (r9 == 0) goto L3b
            goto Lb0
        L3b:
            r7[r8] = r5
        L3d:
            if (r6 == 0) goto Lac
            r7 = -1
            r8 = 2139095039(0x7f7fffff, float:3.4028235E38)
            r9 = r2
            r10 = r7
        L45:
            int r11 = r0.k
            if (r9 >= r11) goto L97
            c80[] r11 = r0.g
            r11 = r11[r9]
            gkc r12 = r11.a
            fkc r12 = r12.i
            fkc r13 = defpackage.fkc.UNRESTRICTED
            if (r12 != r13) goto L56
            goto L93
        L56:
            boolean r12 = r11.e
            if (r12 == 0) goto L5b
            goto L93
        L5b:
            p70 r12 = r11.d
            int r13 = r12.h
            if (r13 != r7) goto L62
            goto L7b
        L62:
            r14 = r2
        L63:
            if (r13 == r7) goto L7b
            int r15 = r12.a
            if (r14 >= r15) goto L7b
            int[] r15 = r12.e
            r15 = r15[r13]
            int r2 = r6.b
            if (r15 != r2) goto L73
            r2 = r5
            goto L7c
        L73:
            int[] r2 = r12.f
            r13 = r2[r13]
            int r14 = r14 + 1
            r2 = 0
            goto L63
        L7b:
            r2 = 0
        L7c:
            if (r2 == 0) goto L93
            p70 r2 = r11.d
            float r2 = r2.c(r6)
            r12 = 0
            int r12 = (r2 > r12 ? 1 : (r2 == r12 ? 0 : -1))
            if (r12 >= 0) goto L93
            float r11 = r11.b
            float r11 = -r11
            float r11 = r11 / r2
            int r2 = (r11 > r8 ? 1 : (r11 == r8 ? 0 : -1))
            if (r2 >= 0) goto L93
            r10 = r9
            r8 = r11
        L93:
            int r9 = r9 + 1
            r2 = 0
            goto L45
        L97:
            if (r10 <= r7) goto Lad
            c80[] r2 = r0.g
            r2 = r2[r10]
            gkc r5 = r2.a
            r5.c = r7
            r2.g(r6)
            gkc r5 = r2.a
            r5.c = r10
            r5.e(r0, r2)
            goto Lad
        Lac:
            r3 = r5
        Lad:
            r2 = 0
            goto L13
        Lb0:
            return
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.wz6.r(c80):void");
    }

    public final void s() {
        for (int i = 0; i < this.k; i++) {
            c80 c80Var = this.g[i];
            if (c80Var != null) {
                ((wc9) this.m.b).b(c80Var);
            }
            this.g[i] = null;
        }
    }

    public final void t() {
        m50 m50Var;
        int i = 0;
        while (true) {
            m50Var = this.m;
            gkc[] gkcVarArr = (gkc[]) m50Var.d;
            if (i >= gkcVarArr.length) {
                break;
            }
            gkc gkcVar = gkcVarArr[i];
            if (gkcVar != null) {
                gkcVar.c();
            }
            i++;
        }
        wc9 wc9Var = (wc9) m50Var.c;
        gkc[] gkcVarArr2 = this.n;
        int length = this.o;
        wc9Var.getClass();
        if (length > gkcVarArr2.length) {
            length = gkcVarArr2.length;
        }
        for (int i2 = 0; i2 < length; i2++) {
            gkc gkcVar2 = gkcVarArr2[i2];
            int i3 = wc9Var.b;
            Object[] objArr = wc9Var.a;
            if (i3 < objArr.length) {
                objArr[i3] = gkcVar2;
                wc9Var.b = i3 + 1;
            }
        }
        this.o = 0;
        Arrays.fill((gkc[]) m50Var.d, (Object) null);
        this.c = 0;
        b1a b1aVar = this.d;
        b1aVar.h = 0;
        b1aVar.b = 0.0f;
        this.j = 1;
        for (int i4 = 0; i4 < this.k; i4++) {
            c80 c80Var = this.g[i4];
        }
        s();
        this.k = 0;
        this.p = new c80(m50Var);
    }
}
