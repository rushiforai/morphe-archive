package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public class c80 {
    public final p70 d;
    public gkc a = null;
    public float b = 0.0f;
    public final ArrayList c = new ArrayList();
    public boolean e = false;

    public c80(m50 m50Var) {
        this.d = new p70(this, m50Var);
    }

    public final void a(wz6 wz6Var, int i) {
        gkc gkcVarJ = wz6Var.j(i);
        p70 p70Var = this.d;
        p70Var.g(gkcVarJ, 1.0f);
        p70Var.g(wz6Var.j(i), -1.0f);
    }

    public final void b(gkc gkcVar, gkc gkcVar2, gkc gkcVar3, int i) {
        boolean z = false;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                z = true;
            }
            this.b = i;
        }
        p70 p70Var = this.d;
        if (z) {
            p70Var.g(gkcVar, 1.0f);
            p70Var.g(gkcVar2, -1.0f);
            p70Var.g(gkcVar3, -1.0f);
        } else {
            p70Var.g(gkcVar, -1.0f);
            p70Var.g(gkcVar2, 1.0f);
            p70Var.g(gkcVar3, 1.0f);
        }
    }

    public final void c(gkc gkcVar, gkc gkcVar2, gkc gkcVar3, int i) {
        boolean z = false;
        if (i != 0) {
            if (i < 0) {
                i *= -1;
                z = true;
            }
            this.b = i;
        }
        p70 p70Var = this.d;
        if (z) {
            p70Var.g(gkcVar, 1.0f);
            p70Var.g(gkcVar2, -1.0f);
            p70Var.g(gkcVar3, 1.0f);
        } else {
            p70Var.g(gkcVar, -1.0f);
            p70Var.g(gkcVar2, 1.0f);
            p70Var.g(gkcVar3, -1.0f);
        }
    }

    public gkc d(boolean[] zArr) {
        return f(zArr, null);
    }

    public boolean e() {
        return this.a == null && this.b == 0.0f && this.d.d() == 0;
    }

    public final gkc f(boolean[] zArr, gkc gkcVar) {
        fkc fkcVar;
        p70 p70Var = this.d;
        int iD = p70Var.d();
        gkc gkcVar2 = null;
        float f = 0.0f;
        for (int i = 0; i < iD; i++) {
            float f2 = p70Var.f(i);
            if (f2 < 0.0f) {
                gkc gkcVarE = p70Var.e(i);
                if ((zArr == null || !zArr[gkcVarE.b]) && gkcVarE != gkcVar && (((fkcVar = gkcVarE.i) == fkc.SLACK || fkcVar == fkc.ERROR) && f2 < f)) {
                    f = f2;
                    gkcVar2 = gkcVarE;
                }
            }
        }
        return gkcVar2;
    }

    public final void g(gkc gkcVar) {
        gkc gkcVar2 = this.a;
        p70 p70Var = this.d;
        if (gkcVar2 != null) {
            p70Var.g(gkcVar2, -1.0f);
            this.a.c = -1;
            this.a = null;
        }
        float fH = p70Var.h(gkcVar, true) * (-1.0f);
        this.a = gkcVar;
        if (fH == 1.0f) {
            return;
        }
        this.b /= fH;
        int i = p70Var.h;
        for (int i2 = 0; i != -1 && i2 < p70Var.a; i2++) {
            float[] fArr = p70Var.g;
            fArr[i] = fArr[i] / fH;
            i = p70Var.f[i];
        }
    }

    public final void h(wz6 wz6Var, gkc gkcVar, boolean z) {
        if (gkcVar.f) {
            p70 p70Var = this.d;
            float fC = p70Var.c(gkcVar);
            this.b = (gkcVar.e * fC) + this.b;
            p70Var.h(gkcVar, z);
            if (z) {
                gkcVar.b(this);
            }
            if (p70Var.d() == 0) {
                this.e = true;
                wz6Var.b = true;
            }
        }
    }

    public void i(wz6 wz6Var, c80 c80Var, boolean z) {
        p70 p70Var = this.d;
        p70Var.getClass();
        float fC = p70Var.c(c80Var.a);
        p70Var.h(c80Var.a, z);
        p70 p70Var2 = c80Var.d;
        int iD = p70Var2.d();
        for (int i = 0; i < iD; i++) {
            gkc gkcVarE = p70Var2.e(i);
            p70Var.a(gkcVarE, p70Var2.c(gkcVarE) * fC, z);
        }
        this.b = (c80Var.b * fC) + this.b;
        if (z) {
            c80Var.a.b(this);
        }
        if (this.a == null || p70Var.d() != 0) {
            return;
        }
        this.e = true;
        wz6Var.b = true;
    }

    /* JADX WARN: Removed duplicated region for block: B:29:0x0079  */
    /* JADX WARN: Removed duplicated region for block: B:30:0x007e  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public java.lang.String toString() {
        /*
            r10 = this;
            gkc r0 = r10.a
            if (r0 != 0) goto L7
            java.lang.String r0 = "0"
            goto L17
        L7:
            java.lang.StringBuilder r0 = new java.lang.StringBuilder
            java.lang.String r1 = ""
            r0.<init>(r1)
            gkc r1 = r10.a
            r0.append(r1)
            java.lang.String r0 = r0.toString()
        L17:
            java.lang.String r1 = " = "
            java.lang.String r0 = r0.concat(r1)
            float r1 = r10.b
            r2 = 0
            int r1 = (r1 > r2 ? 1 : (r1 == r2 ? 0 : -1))
            r3 = 0
            r4 = 1
            if (r1 == 0) goto L36
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>(r0)
            float r0 = r10.b
            r1.append(r0)
            java.lang.String r0 = r1.toString()
            r1 = r4
            goto L37
        L36:
            r1 = r3
        L37:
            p70 r10 = r10.d
            int r5 = r10.d()
        L3d:
            if (r3 >= r5) goto L96
            gkc r6 = r10.e(r3)
            if (r6 != 0) goto L46
            goto L93
        L46:
            float r7 = r10.f(r3)
            int r8 = (r7 > r2 ? 1 : (r7 == r2 ? 0 : -1))
            if (r8 != 0) goto L4f
            goto L93
        L4f:
            java.lang.String r6 = r6.toString()
            r9 = -1082130432(0xffffffffbf800000, float:-1.0)
            if (r1 != 0) goto L63
            int r1 = (r7 > r2 ? 1 : (r7 == r2 ? 0 : -1))
            if (r1 >= 0) goto L73
            java.lang.String r1 = "- "
            java.lang.String r0 = r0.concat(r1)
        L61:
            float r7 = r7 * r9
            goto L73
        L63:
            if (r8 <= 0) goto L6c
            java.lang.String r1 = " + "
            java.lang.String r0 = r0.concat(r1)
            goto L73
        L6c:
            java.lang.String r1 = " - "
            java.lang.String r0 = r0.concat(r1)
            goto L61
        L73:
            r1 = 1065353216(0x3f800000, float:1.0)
            int r1 = (r7 > r1 ? 1 : (r7 == r1 ? 0 : -1))
            if (r1 != 0) goto L7e
            java.lang.String r0 = r0.concat(r6)
            goto L92
        L7e:
            java.lang.StringBuilder r1 = new java.lang.StringBuilder
            r1.<init>(r0)
            r1.append(r7)
            java.lang.String r0 = " "
            r1.append(r0)
            r1.append(r6)
            java.lang.String r0 = r1.toString()
        L92:
            r1 = r4
        L93:
            int r3 = r3 + 1
            goto L3d
        L96:
            if (r1 != 0) goto L9f
            java.lang.String r10 = "0.0"
            java.lang.String r10 = r0.concat(r10)
            return r10
        L9f:
            return r0
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.c80.toString():java.lang.String");
    }
}
