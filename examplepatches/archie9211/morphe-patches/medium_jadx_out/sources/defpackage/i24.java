package defpackage;

import java.util.Arrays;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class i24 extends hec {
    public final zvd b;
    public final s14 c;
    public final k24 d;
    public final List e;
    public final boolean f;
    public final String[] g;
    public final String h;

    public i24(zvd zvdVar, s14 s14Var, k24 k24Var, List list, boolean z, String... strArr) {
        k24Var.getClass();
        list.getClass();
        this.b = zvdVar;
        this.c = s14Var;
        this.d = k24Var;
        this.e = list;
        this.f = z;
        this.g = strArr;
        String debugMessage = k24Var.getDebugMessage();
        Object[] objArrCopyOf = Arrays.copyOf(strArr, strArr.length);
        this.h = String.format(debugMessage, Arrays.copyOf(objArrCopyOf, objArrCopyOf.length));
    }

    @Override // defpackage.mn6
    public final ev7 H() {
        return this.c;
    }

    @Override // defpackage.mn6
    public final List h0() {
        return this.e;
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
        return this.f;
    }

    @Override // defpackage.hec, defpackage.o3e
    public final o3e p0(uvd uvdVar) {
        uvdVar.getClass();
        return this;
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: q0 */
    public final hec n0(boolean z) {
        String[] strArr = this.g;
        return new i24(this.b, this.c, this.d, this.e, z, (String[]) Arrays.copyOf(strArr, strArr.length));
    }

    @Override // defpackage.hec
    /* JADX INFO: renamed from: r0 */
    public final hec p0(uvd uvdVar) {
        uvdVar.getClass();
        return this;
    }

    @Override // defpackage.mn6
    /* JADX INFO: renamed from: l0 */
    public final mn6 o0(sn6 sn6Var) {
        return this;
    }

    @Override // defpackage.o3e
    public final o3e o0(sn6 sn6Var) {
        return this;
    }
}
