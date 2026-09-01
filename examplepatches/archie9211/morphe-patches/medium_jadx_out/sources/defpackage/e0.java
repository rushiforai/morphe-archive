package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class e0 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ f0 b;

    public /* synthetic */ e0(f0 f0Var, int i) {
        this.a = i;
        this.b = f0Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        f0 f0Var = this.b;
        switch (i) {
            case 0:
                ev7 ev7VarM0 = f0Var.m0();
                z zVar = new z(1, this);
                i24 i24Var = nxd.a;
                if (l24.f(f0Var)) {
                    return l24.c(k24.UNABLE_TO_SUBSTITUTE_TYPE, f0Var.toString());
                }
                zvd zvdVarN = f0Var.n();
                if (zvdVarN == null) {
                    nxd.a(12);
                    throw null;
                }
                if (ev7VarM0 == null) {
                    nxd.a(13);
                    throw null;
                }
                List listD = nxd.d(zvdVarN.getParameters());
                uvd.b.getClass();
                return pwd.a0(uvd.c, zvdVarN, listD, false, ev7VarM0, zVar);
            case 1:
                return new j26(f0Var.m0());
            default:
                return new yq6(f0Var);
        }
    }
}
