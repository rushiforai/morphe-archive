package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ild {
    public final int a;
    public final ml0 b;
    public final i0 c;
    public ild d;
    public long e;
    public long f;
    public long g = Long.MIN_VALUE;
    public final /* synthetic */ jld h;

    public ild(jld jldVar, int i, ml0 ml0Var, i0 i0Var) {
        this.h = jldVar;
        this.a = i;
        this.b = ml0Var;
        this.c = i0Var;
    }

    public final void a(long j, long j2, long j3, long j4, float[] fArr) {
        e3b e3bVar;
        e3b e3bVar2;
        long j5 = this.h.f;
        ml0 ml0Var = this.b;
        eh8 eh8VarT0 = flb.t0(ml0Var, 2);
        aq6 aq6VarV0 = flb.v0(ml0Var);
        boolean zI = aq6VarV0.I();
        hj0 hj0Var = aq6VarV0.F;
        if (zI) {
            if (((eh8) hj0Var.e) != eh8VarT0) {
                long jFloatToRawIntBits = (((long) Float.floatToRawIntBits((int) (j & 4294967295L))) & 4294967295L) | (Float.floatToRawIntBits((int) (j >> 32)) << 32);
                long j6 = eh8VarT0.c;
                eh8 eh8Var = (eh8) hj0Var.e;
                eh8Var.getClass();
                long jC0 = d46.c0(eh8Var.G(eh8VarT0, jFloatToRawIntBits));
                e3bVar = new e3b(jC0, (4294967295L & ((long) (((int) (jC0 & 4294967295L)) + ((int) (j6 & 4294967295L))))) | (((long) (((int) (jC0 >> 32)) + ((int) (j6 >> 32)))) << 32), j3, j4, j5, fArr, ml0Var);
            } else {
                e3bVar = new e3b(j, j2, j3, j4, j5, fArr, ml0Var);
            }
            e3bVar2 = e3bVar;
        } else {
            e3bVar2 = null;
        }
        if (e3bVar2 == null) {
            return;
        }
        this.c.invoke(e3bVar2);
    }

    public final void b() {
        jld jldVar = this.h;
        k68 k68Var = jldVar.a;
        int i = this.a;
        ild ildVar = (ild) k68Var.g(i);
        if (ildVar != null) {
            if (ildVar == this) {
                ild ildVar2 = this.d;
                this.d = null;
                if (ildVar2 == null) {
                    aq6 aq6VarV0 = flb.v0(this.b.a);
                    if (aq6VarV0.g) {
                        ((mn) dq6.a(aq6VarV0)).getRectManager().b.D(aq6VarV0.b, false);
                        return;
                    }
                    return;
                }
                int iD = k68Var.d(i);
                Object[] objArr = k68Var.c;
                Object obj = objArr[iD];
                k68Var.b[iD] = i;
                objArr[iD] = ildVar2;
                return;
            }
            int iD2 = k68Var.d(i);
            Object[] objArr2 = k68Var.c;
            Object obj2 = objArr2[iD2];
            k68Var.b[iD2] = i;
            objArr2[iD2] = ildVar;
            while (true) {
                ild ildVar3 = ildVar.d;
                if (ildVar3 == null) {
                    break;
                }
                if (ildVar3 == this) {
                    ildVar.d = this.d;
                    this.d = null;
                    return;
                }
                ildVar = ildVar3;
            }
        }
        ild ildVar4 = jldVar.b;
        if (ildVar4 == this) {
            jldVar.b = ildVar4.d;
            this.d = null;
            return;
        }
        ild ildVar5 = ildVar4 != null ? ildVar4.d : null;
        while (true) {
            ild ildVar6 = ildVar4;
            ildVar4 = ildVar5;
            if (ildVar4 == null) {
                return;
            }
            if (ildVar4 == this) {
                if (ildVar6 != null) {
                    ildVar6.d = ildVar4.d;
                }
                this.d = null;
                return;
            }
            ildVar5 = ildVar4.d;
        }
    }
}
