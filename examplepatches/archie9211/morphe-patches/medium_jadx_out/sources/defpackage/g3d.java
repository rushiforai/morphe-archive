package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class g3d {
    public static final sn3 a = new sn3(0, new tkc(2));

    public static final void a(r28 r28Var, m3c m3cVar, long j, long j2, float f, float f2, cu0 cu0Var, mz1 mz1Var, x12 x12Var, int i, int i2) {
        if ((i2 & 1) != 0) {
            r28Var = o28.b;
        }
        if ((i2 & 2) != 0) {
            m3cVar = rv8.r;
        }
        if ((i2 & 4) != 0) {
            j = ((fv1) ((p65) x12Var).j(iv1.a)).p;
        }
        if ((i2 & 8) != 0) {
            j2 = iv1.b(j, x12Var);
        }
        if ((i2 & 16) != 0) {
            f = 0.0f;
        }
        if ((i2 & 32) != 0) {
            f2 = 0.0f;
        }
        if ((i2 & 64) != 0) {
            cu0Var = null;
        }
        p65 p65Var = (p65) x12Var;
        sn3 sn3Var = a;
        float f3 = f + ((vj3) p65Var.j(sn3Var)).a;
        k40.d(new o10[]{b09.q(j2, c82.a), sn3Var.a(new vj3(f3))}, pxf.E(421772006, new e3d(r28Var, m3cVar, j, f3, cu0Var, f2, mz1Var), p65Var), p65Var, 56);
    }

    public static final void b(m45 m45Var, r28 r28Var, boolean z, m3c m3cVar, long j, long j2, float f, float f2, cu0 cu0Var, m68 m68Var, mz1 mz1Var, x12 x12Var, int i, int i2) {
        m68 m68Var2;
        boolean z2 = (i2 & 4) != 0 ? true : z;
        m3c m3cVar2 = (i2 & 8) != 0 ? rv8.r : m3cVar;
        long jB = (i2 & 32) != 0 ? iv1.b(j, x12Var) : j2;
        float f3 = (i2 & 64) != 0 ? 0.0f : f;
        cu0 cu0Var2 = (i2 & 256) != 0 ? null : cu0Var;
        m68 m68Var3 = (i2 & 512) == 0 ? m68Var : null;
        if (m68Var3 == null) {
            p65 p65Var = (p65) x12Var;
            p65Var.Y(-1701037204);
            Object objM = p65Var.M();
            if (objM == w12.a) {
                objM = ka1.k(p65Var);
            }
            p65Var.p(false);
            m68Var2 = (m68) objM;
        } else {
            p65 p65Var2 = (p65) x12Var;
            p65Var2.Y(2023337163);
            p65Var2.p(false);
            m68Var2 = m68Var3;
        }
        p65 p65Var3 = (p65) x12Var;
        sn3 sn3Var = a;
        float f4 = ((vj3) p65Var3.j(sn3Var)).a + f3;
        k40.d(new o10[]{b09.q(jB, c82.a), sn3Var.a(new vj3(f4))}, pxf.E(849208527, new f3d(f4, f2, j, cu0Var2, mz1Var, m45Var, r28Var, m68Var2, m3cVar2, z2), p65Var3), p65Var3, 56);
    }

    public static final r28 c(r28 r28Var, m3c m3cVar, long j, cu0 cu0Var, float f) {
        m3c m3cVar2;
        r28 r28VarX;
        r28 r28VarC = o28.b;
        if (f > 0.0f) {
            m3cVar2 = m3cVar;
            r28VarX = xz5.X(r28VarC, 0.0f, 0.0f, 0.0f, f, m3cVar2, 124895);
        } else {
            m3cVar2 = m3cVar;
            r28VarX = r28VarC;
        }
        r28 r28VarB = r28Var.b(r28VarX);
        if (cu0Var != null) {
            r28VarC = bo.C(r28VarC, cu0Var.a, cu0Var.b, m3cVar2);
        }
        return r40.y(flb.a0(r28VarB.b(r28VarC), j, m3cVar2), m3cVar2);
    }

    public static final long d(long j, float f, p65 p65Var) {
        fv1 fv1Var = (fv1) p65Var.j(iv1.a);
        boolean zBooleanValue = ((Boolean) p65Var.j(iv1.b)).booleanValue();
        long j2 = fv1Var.p;
        int i = uu1.i;
        return (ezd.a(j, j2) && zBooleanValue) ? vj3.b(f, 0.0f) ? j2 : op8.M(uu1.b(((((float) Math.log(f + 1.0f)) * 4.5f) + 2.0f) / 100.0f, fv1Var.t), j2) : j;
    }
}
