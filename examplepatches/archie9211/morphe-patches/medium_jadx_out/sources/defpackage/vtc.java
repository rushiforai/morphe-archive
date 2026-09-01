package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class vtc extends flb implements kw2, f22 {
    public final fb6 q;
    public final g9f r;
    public final jl1 s;
    public final fa4 t;
    public int u;

    public vtc(fb6 fb6Var, g9f g9fVar, jl1 jl1Var, xzb xzbVar) {
        g9fVar.getClass();
        xzbVar.getClass();
        this.q = fb6Var;
        this.r = g9fVar;
        this.s = jl1Var;
        this.t = fb6Var.b;
        this.u = -1;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final double B() {
        jl1 jl1Var = this.s;
        String strN = jl1Var.n();
        try {
            double d = Double.parseDouble(strN);
            if (!Double.isInfinite(d) && !Double.isNaN(d)) {
                return d;
            }
            m40.W(jl1Var, Double.valueOf(d));
            throw null;
        } catch (IllegalArgumentException unused) {
            jl1.q(jl1Var, wgd.t('\'', "Failed to parse type 'double' for input '", strN), 0, null, 6);
            throw null;
        }
    }

    public final cc6 C0() {
        return new ad(this.q.a, this.s).p();
    }

    /* JADX WARN: Removed duplicated region for block: B:39:0x010d  */
    /* JADX WARN: Removed duplicated region for block: B:40:0x010e  */
    @Override // defpackage.flb, defpackage.kw2
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object a(defpackage.pj6 r10) {
        /*
            Method dump skipped, instruction units count: 306
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.vtc.a(pj6):java.lang.Object");
    }

    @Override // defpackage.flb, defpackage.kw2
    public final boolean c() {
        boolean z;
        boolean z2;
        jl1 jl1Var = this.s;
        int iO = jl1Var.O();
        String str = (String) jl1Var.f;
        if (iO == str.length()) {
            jl1.q(jl1Var, "EOF", 0, null, 6);
            throw null;
        }
        if (str.charAt(iO) == '\"') {
            iO++;
            z = true;
        } else {
            z = false;
        }
        int iK = jl1Var.K(iO);
        if (iK >= str.length() || iK == -1) {
            jl1.q(jl1Var, "EOF", 0, null, 6);
            throw null;
        }
        int i = iK + 1;
        int iCharAt = str.charAt(iK) | ' ';
        if (iCharAt == 102) {
            jl1Var.g(i, "alse");
            z2 = false;
        } else {
            if (iCharAt != 116) {
                jl1.q(jl1Var, "Expected valid boolean literal prefix, but had '" + jl1Var.n() + '\'', 0, null, 6);
                throw null;
            }
            jl1Var.g(i, "rue");
            z2 = true;
        }
        if (!z) {
            return z2;
        }
        if (jl1Var.c == str.length()) {
            jl1.q(jl1Var, "EOF", 0, null, 6);
            throw null;
        }
        if (str.charAt(jl1Var.c) == '\"') {
            jl1Var.c++;
            return z2;
        }
        jl1.q(jl1Var, "Expected closing quotation mark", 0, null, 6);
        throw null;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final char d() {
        jl1 jl1Var = this.s;
        String strN = jl1Var.n();
        if (strN.length() == 1) {
            return strN.charAt(0);
        }
        jl1.q(jl1Var, wgd.t('\'', "Expected single char, but got '", strN), 0, null, 6);
        throw null;
    }

    @Override // defpackage.f22
    public final int e(xzb xzbVar) {
        xzbVar.getClass();
        int[] iArr = utc.a;
        g9f g9fVar = this.r;
        int i = iArr[g9fVar.ordinal()];
        boolean zQ = false;
        int iZ = -1;
        jl1 jl1Var = this.s;
        if (i == 2) {
            int i2 = this.u;
            boolean z = i2 % 2 != 0;
            if (!z) {
                jl1Var.k(':');
            } else if (i2 != -1) {
                zQ = jl1Var.Q();
            }
            if (jl1Var.f()) {
                if (z) {
                    int i3 = this.u;
                    int i4 = jl1Var.c;
                    if (i3 == -1) {
                        if (zQ) {
                            jl1.q(jl1Var, "Unexpected leading comma", i4, null, 4);
                            throw null;
                        }
                    } else if (!zQ) {
                        jl1.q(jl1Var, "Expected comma after the key-value pair", i4, null, 4);
                        throw null;
                    }
                }
                iZ = this.u + 1;
                this.u = iZ;
            } else if (zQ) {
                m40.P(jl1Var, "object");
                throw null;
            }
        } else if (i != 4) {
            boolean zQ2 = jl1Var.Q();
            if (jl1Var.f()) {
                int i5 = this.u;
                if (i5 != -1 && !zQ2) {
                    jl1.q(jl1Var, "Expected end of the array or comma", 0, null, 6);
                    throw null;
                }
                iZ = i5 + 1;
                this.u = iZ;
            } else if (zQ2) {
                m40.P(jl1Var, "array");
                throw null;
            }
        } else {
            boolean zQ3 = jl1Var.Q();
            if (jl1Var.f()) {
                String strH = jl1Var.h();
                jl1Var.k(':');
                iZ = bgf.z(xzbVar, this.q, strH);
                if (iZ == -3) {
                    jl1Var.p(wgd.t('\'', "Encountered an unknown key '", strH), muc.e0(((String) jl1Var.f).subSequence(0, jl1Var.c).toString(), 0, 6, strH), "Use 'ignoreUnknownKeys = true' in 'Json {}' builder to ignore unknown keys.");
                    throw null;
                }
            } else if (zQ3) {
                m40.P(jl1Var, "object");
                throw null;
            }
        }
        if (g9fVar != g9f.MAP) {
            xp xpVar = (xp) jl1Var.d;
            ((int[]) xpVar.d)[xpVar.b] = iZ;
        }
        return iZ;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final int k() {
        jl1 jl1Var = this.s;
        long jL = jl1Var.l();
        int i = (int) jL;
        if (jL == i) {
            return i;
        }
        jl1.q(jl1Var, "Failed to parse int for input '" + jL + '\'', 0, null, 6);
        throw null;
    }

    @Override // defpackage.flb, defpackage.f22
    public final void m(xzb xzbVar) {
        xzbVar.getClass();
        jl1 jl1Var = this.s;
        if (jl1Var.Q()) {
            m40.P(jl1Var, "");
            throw null;
        }
        jl1Var.k(this.r.end);
        xp xpVar = (xp) jl1Var.d;
        int i = xpVar.b;
        int[] iArr = (int[]) xpVar.d;
        if (iArr[i] == -2) {
            iArr[i] = -1;
            i--;
            xpVar.b = i;
        }
        if (i != -1) {
            xpVar.b = i - 1;
        }
    }

    @Override // defpackage.f22
    public final fa4 n() {
        return this.t;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final kw2 o(xzb xzbVar) {
        xzbVar.getClass();
        return ytc.a(xzbVar) ? new zb6(this.s, this.q) : this;
    }

    @Override // defpackage.flb, defpackage.f22
    public final Object p(xzb xzbVar, int i, pj6 pj6Var, Object obj) {
        xp xpVar = (xp) this.s.d;
        xzbVar.getClass();
        pj6Var.getClass();
        boolean z = this.r == g9f.MAP && (i & 1) == 0;
        if (z) {
            int[] iArr = (int[]) xpVar.d;
            int i2 = xpVar.b;
            if (iArr[i2] == -2) {
                ((Object[]) xpVar.c)[i2] = tz7.i;
            }
        }
        Object objA = a(pj6Var);
        if (z) {
            int[] iArrCopyOf = (int[]) xpVar.d;
            int i3 = xpVar.b;
            if (iArrCopyOf[i3] != -2) {
                int i4 = i3 + 1;
                xpVar.b = i4;
                Object[] objArr = (Object[]) xpVar.c;
                if (i4 == objArr.length) {
                    int i5 = i4 * 2;
                    xpVar.c = Arrays.copyOf(objArr, i5);
                    iArrCopyOf = Arrays.copyOf((int[]) xpVar.d, i5);
                    xpVar.d = iArrCopyOf;
                }
            }
            Object[] objArr2 = (Object[]) xpVar.c;
            int i6 = xpVar.b;
            objArr2[i6] = objA;
            iArrCopyOf[i6] = -2;
        }
        return objA;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final String r() {
        return this.s.m();
    }

    @Override // defpackage.flb, defpackage.kw2
    public final f22 s(xzb xzbVar) {
        xzbVar.getClass();
        fb6 fb6Var = this.q;
        g9f g9fVarE0 = vn7.e0(fb6Var, xzbVar);
        jl1 jl1Var = this.s;
        xp xpVar = (xp) jl1Var.d;
        int i = xpVar.b + 1;
        xpVar.b = i;
        Object[] objArr = (Object[]) xpVar.c;
        if (i == objArr.length) {
            int i2 = i * 2;
            xpVar.c = Arrays.copyOf(objArr, i2);
            xpVar.d = Arrays.copyOf((int[]) xpVar.d, i2);
        }
        ((Object[]) xpVar.c)[i] = xzbVar;
        jl1Var.k(g9fVarE0.begin);
        if (jl1Var.I() != 4) {
            int i3 = utc.a[g9fVarE0.ordinal()];
            return (i3 == 1 || i3 == 2 || i3 == 3) ? new vtc(fb6Var, g9fVarE0, jl1Var, xzbVar) : this.r == g9fVarE0 ? this : new vtc(fb6Var, g9fVarE0, jl1Var, xzbVar);
        }
        jl1.q(jl1Var, "Unexpected leading comma", 0, null, 6);
        throw null;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final long t() {
        return this.s.l();
    }

    @Override // defpackage.flb, defpackage.kw2
    public final boolean u() {
        boolean z;
        jl1 jl1Var = this.s;
        int iK = jl1Var.K(jl1Var.O());
        String str = (String) jl1Var.f;
        int length = str.length() - iK;
        if (length < 4 || iK == -1) {
            z = false;
        } else {
            int i = 0;
            while (true) {
                if (i < 4) {
                    if ("null".charAt(i) != str.charAt(iK + i)) {
                        break;
                    }
                    i++;
                } else if (length <= 4 || guc.w(str.charAt(iK + 4)) != 0) {
                    jl1Var.c = iK + 4;
                    z = true;
                }
            }
            z = false;
        }
        return !z;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final byte x() {
        jl1 jl1Var = this.s;
        long jL = jl1Var.l();
        byte b = (byte) jL;
        if (jL == b) {
            return b;
        }
        jl1.q(jl1Var, "Failed to parse byte for input '" + jL + '\'', 0, null, 6);
        throw null;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final short y() {
        jl1 jl1Var = this.s;
        long jL = jl1Var.l();
        short s = (short) jL;
        if (jL == s) {
            return s;
        }
        jl1.q(jl1Var, "Failed to parse short for input '" + jL + '\'', 0, null, 6);
        throw null;
    }

    @Override // defpackage.flb, defpackage.kw2
    public final float z() {
        jl1 jl1Var = this.s;
        String strN = jl1Var.n();
        try {
            float f = Float.parseFloat(strN);
            if (!Float.isInfinite(f) && !Float.isNaN(f)) {
                return f;
            }
            m40.W(jl1Var, Float.valueOf(f));
            throw null;
        } catch (IllegalArgumentException unused) {
            jl1.q(jl1Var, wgd.t('\'', "Failed to parse type 'float' for input '", strN), 0, null, 6);
            throw null;
        }
    }
}
