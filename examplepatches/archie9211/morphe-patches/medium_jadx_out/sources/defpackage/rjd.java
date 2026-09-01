package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rjd {
    public final qjd a;
    public hp6 b = null;
    public hp6 c;

    public rjd(qjd qjdVar, hp6 hp6Var) {
        this.a = qjdVar;
        this.c = hp6Var;
    }

    public final long a(long j) {
        zwa zwaVarH;
        hp6 hp6Var = this.b;
        zwa zwaVar = zwa.e;
        if (hp6Var != null) {
            if (hp6Var.m()) {
                hp6 hp6Var2 = this.c;
                zwaVarH = hp6Var2 != null ? hp6Var2.H(hp6Var, true) : null;
            } else {
                zwaVarH = zwaVar;
            }
            if (zwaVarH != null) {
                zwaVar = zwaVarH;
            }
        }
        int i = (int) (j >> 32);
        float fIntBitsToFloat = Float.intBitsToFloat(i);
        float fIntBitsToFloat2 = zwaVar.a;
        if (fIntBitsToFloat >= fIntBitsToFloat2) {
            float fIntBitsToFloat3 = Float.intBitsToFloat(i);
            fIntBitsToFloat2 = zwaVar.c;
            if (fIntBitsToFloat3 <= fIntBitsToFloat2) {
                fIntBitsToFloat2 = Float.intBitsToFloat(i);
            }
        }
        int i2 = (int) (j & 4294967295L);
        float fIntBitsToFloat4 = Float.intBitsToFloat(i2);
        float fIntBitsToFloat5 = zwaVar.b;
        if (fIntBitsToFloat4 >= fIntBitsToFloat5) {
            float fIntBitsToFloat6 = Float.intBitsToFloat(i2);
            fIntBitsToFloat5 = zwaVar.d;
            if (fIntBitsToFloat6 <= fIntBitsToFloat5) {
                fIntBitsToFloat5 = Float.intBitsToFloat(i2);
            }
        }
        return (((long) Float.floatToRawIntBits(fIntBitsToFloat2)) << 32) | (((long) Float.floatToRawIntBits(fIntBitsToFloat5)) & 4294967295L);
    }

    public final int b(long j, boolean z) {
        if (z) {
            j = a(j);
        }
        return this.a.b.g(d(j));
    }

    public final boolean c(long j) {
        long jD = d(a(j));
        float fIntBitsToFloat = Float.intBitsToFloat((int) (4294967295L & jD));
        qjd qjdVar = this.a;
        int iE = qjdVar.b.e(fIntBitsToFloat);
        int i = (int) (jD >> 32);
        return Float.intBitsToFloat(i) >= qjdVar.e(iE) && Float.intBitsToFloat(i) <= qjdVar.f(iE);
    }

    public final long d(long j) {
        hp6 hp6Var;
        hp6 hp6Var2 = this.b;
        if (hp6Var2 != null) {
            if (!hp6Var2.m()) {
                hp6Var2 = null;
            }
            if (hp6Var2 != null && (hp6Var = this.c) != null) {
                hp6 hp6Var3 = hp6Var.m() ? hp6Var : null;
                if (hp6Var3 != null) {
                    return hp6Var2.D(hp6Var3, j);
                }
            }
        }
        return j;
    }

    public final long e(long j) {
        hp6 hp6Var;
        hp6 hp6Var2 = this.b;
        if (hp6Var2 != null) {
            if (!hp6Var2.m()) {
                hp6Var2 = null;
            }
            if (hp6Var2 != null && (hp6Var = this.c) != null) {
                hp6 hp6Var3 = hp6Var.m() ? hp6Var : null;
                if (hp6Var3 != null) {
                    return hp6Var3.D(hp6Var2, j);
                }
            }
        }
        return j;
    }
}
