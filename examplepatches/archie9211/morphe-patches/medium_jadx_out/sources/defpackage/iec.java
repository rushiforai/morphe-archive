package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class iec extends hec {
    public final zvd b;
    public final List c;
    public final boolean d;
    public final ev7 e;
    public final x45 f;

    public iec(zvd zvdVar, List list, boolean z, ev7 ev7Var, x45 x45Var) {
        zvdVar.getClass();
        list.getClass();
        ev7Var.getClass();
        this.b = zvdVar;
        this.c = list;
        this.d = z;
        this.e = ev7Var;
        this.f = x45Var;
        if (!(ev7Var instanceof s14) || (ev7Var instanceof qld)) {
            return;
        }
        throw new IllegalStateException("SimpleTypeImpl should not be created for error type: " + ev7Var + '\n' + zvdVar);
    }

    @Override // defpackage.mn6
    public final ev7 H() {
        return this.e;
    }

    @Override // defpackage.mn6
    public final List h0() {
        return this.c;
    }

    @Override // defpackage.mn6
    public final uvd i0() {
        uvd.b.getClass();
        return uvd.c;
    }

    @Override // defpackage.mn6
    public final zvd j0() {
        return this.b;
    }

    @Override // defpackage.mn6
    public final boolean k0() {
        return this.d;
    }

    @Override // defpackage.mn6
    public final mn6 l0(sn6 sn6Var) {
        hec hecVar = (hec) this.f.invoke(sn6Var);
        return hecVar == null ? this : hecVar;
    }

    @Override // defpackage.o3e
    /* JADX INFO: renamed from: o0 */
    public final o3e l0(sn6 sn6Var) {
        hec hecVar = (hec) this.f.invoke(sn6Var);
        return hecVar == null ? this : hecVar;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        return z == this.d ? this : z ? new gi8(this, 1) : new gi8(this, 0);
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return uvdVar.isEmpty() ? this : new kec(this, uvdVar);
    }
}
