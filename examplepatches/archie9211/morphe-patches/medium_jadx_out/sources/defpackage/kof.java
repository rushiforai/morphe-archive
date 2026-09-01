package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kof implements vof {
    public final emf a;

    public kof(jzb jzbVar, emf emfVar) {
        this.a = emfVar;
    }

    @Override // defpackage.vof
    public final void a(Object obj) {
        epf epfVar = ((fnf) obj).zzc;
        if (epfVar.e) {
            epfVar.e = false;
        }
        throw y30.k(obj);
    }

    @Override // defpackage.vof
    public final boolean b(fnf fnfVar, fnf fnfVar2) {
        return fnfVar.zzc.equals(fnfVar2.zzc);
    }

    @Override // defpackage.vof
    public final void c(Object obj, Object obj2) {
        wof.b(obj, obj2);
    }

    @Override // defpackage.vof
    public final boolean d(Object obj) {
        throw y30.k(obj);
    }

    @Override // defpackage.vof
    public final void e(Object obj, byte[] bArr, int i, int i2, hmf hmfVar) {
        fnf fnfVar = (fnf) obj;
        if (fnfVar.zzc == epf.f) {
            fnfVar.zzc = epf.a();
        }
        throw y30.k(obj);
    }

    @Override // defpackage.vof
    public final int f(fnf fnfVar) {
        return fnfVar.zzc.hashCode();
    }

    @Override // defpackage.vof
    public final void g(Object obj, ym0 ym0Var, anf anfVar) {
        jzb.E(obj);
        obj.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.vof
    public final void h(Object obj, ujf ujfVar) {
        throw y30.k(obj);
    }

    @Override // defpackage.vof
    public final int i(emf emfVar) {
        epf epfVar = ((fnf) emfVar).zzc;
        int i = epfVar.d;
        if (i != -1) {
            return i;
        }
        int iL = 0;
        for (int i2 = 0; i2 < epfVar.a; i2++) {
            int i3 = epfVar.b[i2] >>> 3;
            pmf pmfVar = (pmf) epfVar.c[i2];
            int iC0 = h30.c0(8);
            int iC02 = h30.c0(i3) + h30.c0(16);
            int iC03 = h30.c0(24);
            int iM = pmfVar.m();
            iL += iC0 + iC0 + iC02 + wgd.l(iM, iM, iC03);
        }
        epfVar.d = iL;
        return iL;
    }

    @Override // defpackage.vof
    public final fnf zza() {
        emf emfVar = this.a;
        if (emfVar instanceof fnf) {
            return ((fnf) emfVar).g();
        }
        cnf cnfVar = (cnf) ((fnf) emfVar).t(5);
        boolean zU = cnfVar.b.u();
        fnf fnfVar = cnfVar.b;
        if (!zU) {
            return fnfVar;
        }
        fnfVar.getClass();
        pof.c.a(fnfVar.getClass()).a(fnfVar);
        fnfVar.f();
        return cnfVar.b;
    }
}
