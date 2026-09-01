package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class muf implements suf {
    public final xrf a;

    public muf(xrf xrfVar) {
        this.a = xrfVar;
    }

    @Override // defpackage.suf
    public final boolean a(ytf ytfVar, ytf ytfVar2) {
        return ytfVar.zzb.equals(ytfVar2.zzb);
    }

    @Override // defpackage.suf
    public final boolean b(Object obj) {
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.suf
    public final int c(ytf ytfVar) {
        return ytfVar.zzb.hashCode();
    }

    @Override // defpackage.suf
    public final void d(Object obj) {
        yuf yufVar = ((ytf) obj).zzb;
        if (yufVar.e) {
            yufVar.e = false;
        }
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.suf
    public final void e(Object obj, byte[] bArr, int i, int i2, hmf hmfVar) {
        ytf ytfVar = (ytf) obj;
        if (ytfVar.zzb == yuf.f) {
            ytfVar.zzb = yuf.e();
        }
        throw y30.k(obj);
    }

    @Override // defpackage.suf
    public final void f(Object obj, ujf ujfVar) {
        lv8.z(obj);
        throw null;
    }

    @Override // defpackage.suf
    public final int g(ytf ytfVar) {
        yuf yufVar = ytfVar.zzb;
        int i = yufVar.d;
        if (i != -1) {
            return i;
        }
        int iO = 0;
        for (int i2 = 0; i2 < yufVar.a; i2++) {
            int i3 = yufVar.b[i2] >>> 3;
            iO += htf.o(3, (hsf) yufVar.c[i2]) + wgd.z(i3, htf.v(16), htf.v(8) << 1);
        }
        yufVar.d = iO;
        return iO;
    }

    @Override // defpackage.suf
    public final void h(Object obj, ym0 ym0Var, ptf ptfVar) {
        hpe.C(obj);
        obj.getClass();
        throw new ClassCastException();
    }

    @Override // defpackage.suf
    public final void i(Object obj, Object obj2) {
        bo.j0(obj, obj2);
    }

    @Override // defpackage.suf
    public final ytf zza() {
        xrf xrfVar = this.a;
        if (xrfVar instanceof ytf) {
            return ((ytf) xrfVar).p();
        }
        xtf xtfVar = (xtf) ((ytf) xrfVar).d(5);
        boolean zS = xtfVar.b.s();
        ytf ytfVar = xtfVar.b;
        if (!zS) {
            return ytfVar;
        }
        ytfVar.q();
        return xtfVar.b;
    }
}
