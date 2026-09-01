package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class lj9 implements zc8 {
    public final mj9 a;
    public final kv6 b;
    public final Integer c;

    public lj9(mj9 mj9Var, kv6 kv6Var, Integer num) {
        mj9Var.getClass();
        kv6Var.getClass();
        this.a = mj9Var;
        this.b = kv6Var;
        this.c = num;
    }

    @Override // defpackage.zc8
    public final Object A(long j, long j2, n92 n92Var) {
        return ev6.H();
    }

    @Override // defpackage.zc8
    public final long K(int i, long j) {
        float fU;
        dv6 dv6Var;
        mj9 mj9Var = this.a;
        float f = mj9Var.b;
        g49 g49Var = mj9Var.a;
        if (f > 0.0f) {
            boolean z = false;
            Integer num = this.c;
            if (num != null && (dv6Var = (dv6) bu1.I0(this.b.j().k)) != null && dv6Var.a >= num.intValue()) {
                z = true;
            }
            float fIntBitsToFloat = Float.intBitsToFloat((int) (j & 4294967295L));
            if (fIntBitsToFloat != 0.0f) {
                float fU2 = iq7.u(g49Var.g(), -mj9Var.b, 0.0f);
                if (!z || fIntBitsToFloat >= 0.0f) {
                    float f2 = mj9Var.b;
                    fU = fIntBitsToFloat < 0.0f ? iq7.u(fIntBitsToFloat + fU2, -f2, 0.0f) : iq7.u(fIntBitsToFloat + fU2, -f2, 0.0f);
                } else {
                    fU = iq7.u(fU2 - fIntBitsToFloat, -mj9Var.b, 0.0f);
                }
                if (fU != fU2) {
                    g49Var.h(fU);
                    return 0L;
                }
            }
        }
        return 0L;
    }

    @Override // defpackage.zc8
    public final Object j0(long j, n92 n92Var) {
        return ev6.I();
    }

    @Override // defpackage.zc8
    public final /* bridge */ long n0(long j, long j2, int i) {
        return 0L;
    }
}
