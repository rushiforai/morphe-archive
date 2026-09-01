package defpackage;

import android.content.res.Resources;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hbd implements do4 {
    public final /* synthetic */ nhc a;
    public final /* synthetic */ sb2 b;
    public final /* synthetic */ Resources c;
    public final /* synthetic */ jbd d;
    public final /* synthetic */ u8d e;
    public final /* synthetic */ odd f;
    public final /* synthetic */ kbd g;
    public final /* synthetic */ mbd h;
    public final /* synthetic */ nbd i;

    public hbd(nhc nhcVar, sb2 sb2Var, Resources resources, jbd jbdVar, u8d u8dVar, odd oddVar, kbd kbdVar, mbd mbdVar, nbd nbdVar) {
        this.a = nhcVar;
        this.b = sb2Var;
        this.c = resources;
        this.d = jbdVar;
        this.e = u8dVar;
        this.f = oddVar;
        this.g = kbdVar;
        this.h = mbdVar;
        this.i = nbdVar;
    }

    @Override // defpackage.do4
    public final Object a(Object obj, n92 n92Var) {
        jcd jcdVar = (jcd) obj;
        nhc nhcVar = this.a;
        ihc ihcVarA = nhcVar.a();
        if (ihcVarA != null) {
            ihcVarA.a();
        }
        boolean zL = g76.L(jcdVar, fcd.a);
        sb2 sb2Var = this.b;
        Resources resources = this.c;
        if (zL) {
            vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, null, 10), 3);
        } else if (g76.L(jcdVar, hcd.a)) {
            vx0.c0(sb2Var, null, null, new q91(nhcVar, resources, null, 11), 3);
        } else if (jcdVar instanceof dcd) {
            vx0.c0(sb2Var, null, null, new yu(jcdVar, nhcVar, this.c, this.d, this.e, this.f, null, 21), 3);
        } else if (jcdVar instanceof ecd) {
            vx0.c0(sb2Var, null, null, new rna(jcdVar, nhcVar, this.c, this.g, null, 28), 3);
        } else if (jcdVar instanceof gcd) {
            vx0.c0(sb2Var, null, null, new rna(jcdVar, nhcVar, this.c, this.h, null, 29), 3);
        } else {
            if (!(jcdVar instanceof icd)) {
                ygf.a();
                return null;
            }
            vx0.c0(sb2Var, null, null, new gbd(jcdVar, nhcVar, this.c, this.i, null, 0), 3);
        }
        return c1e.a;
    }
}
