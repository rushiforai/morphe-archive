package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class c09 {
    public uq a;
    public boolean b;
    public bs0 c;
    public float d = 1.0f;
    public ip6 e = ip6.Ltr;

    public boolean a(float f) {
        return false;
    }

    public boolean e(bs0 bs0Var) {
        return false;
    }

    public final void g(zl3 zl3Var, long j, float f, bs0 bs0Var) {
        if (this.d != f) {
            if (!a(f)) {
                uq uqVarZ = this.a;
                if (f == 1.0f) {
                    if (uqVarZ != null) {
                        uqVarZ.c(f);
                    }
                    this.b = false;
                } else {
                    if (uqVarZ == null) {
                        uqVarZ = rx0.z();
                        this.a = uqVarZ;
                    }
                    uqVarZ.c(f);
                    this.b = true;
                }
            }
            this.d = f;
        }
        if (!g76.L(this.c, bs0Var)) {
            if (!e(bs0Var)) {
                uq uqVarZ2 = this.a;
                if (bs0Var == null) {
                    if (uqVarZ2 != null) {
                        uqVarZ2.f(null);
                    }
                    this.b = false;
                } else {
                    if (uqVarZ2 == null) {
                        uqVarZ2 = rx0.z();
                        this.a = uqVarZ2;
                    }
                    uqVarZ2.f(bs0Var);
                    this.b = true;
                }
            }
            this.c = bs0Var;
        }
        ip6 layoutDirection = zl3Var.getLayoutDirection();
        if (this.e != layoutDirection) {
            f(layoutDirection);
            this.e = layoutDirection;
        }
        int i = (int) (j >> 32);
        float fIntBitsToFloat = Float.intBitsToFloat((int) (zl3Var.f() >> 32)) - Float.intBitsToFloat(i);
        int i2 = (int) (j & 4294967295L);
        float fIntBitsToFloat2 = Float.intBitsToFloat((int) (zl3Var.f() & 4294967295L)) - Float.intBitsToFloat(i2);
        ((md5) zl3Var.b0().b).j(0.0f, 0.0f, fIntBitsToFloat, fIntBitsToFloat2);
        if (f > 0.0f) {
            try {
                if (Float.intBitsToFloat(i) > 0.0f && Float.intBitsToFloat(i2) > 0.0f) {
                    if (this.b) {
                        float fIntBitsToFloat3 = Float.intBitsToFloat(i);
                        zwa zwaVarL = lk7.l(0L, (((long) Float.floatToRawIntBits(Float.intBitsToFloat(i2))) & 4294967295L) | (Float.floatToRawIntBits(fIntBitsToFloat3) << 32));
                        e61 e61VarX = zl3Var.b0().x();
                        uq uqVarZ3 = this.a;
                        if (uqVarZ3 == null) {
                            uqVarZ3 = rx0.z();
                            this.a = uqVarZ3;
                        }
                        try {
                            e61VarX.s(zwaVarL, uqVarZ3);
                            i(zl3Var);
                            e61VarX.q();
                        } catch (Throwable th) {
                            e61VarX.q();
                            throw th;
                        }
                    } else {
                        i(zl3Var);
                    }
                }
            } catch (Throwable th2) {
                ((md5) zl3Var.b0().b).j(-0.0f, -0.0f, -fIntBitsToFloat, -fIntBitsToFloat2);
                throw th2;
            }
        }
        ((md5) zl3Var.b0().b).j(-0.0f, -0.0f, -fIntBitsToFloat, -fIntBitsToFloat2);
    }

    public abstract long h();

    public abstract void i(zl3 zl3Var);

    public void f(ip6 ip6Var) {
    }
}
