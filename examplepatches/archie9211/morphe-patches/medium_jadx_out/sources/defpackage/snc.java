package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class snc implements jre {
    public final jre a;
    public final long b;

    public snc(jre jreVar, long j) {
        this.a = jreVar;
        this.b = j;
    }

    @Override // defpackage.jre
    public final boolean b() {
        return this.a.b();
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof snc)) {
            return false;
        }
        snc sncVar = (snc) obj;
        return sncVar.b == this.b && g76.L(sncVar.a, this.a);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return iHashCode + ((int) (j ^ (j >>> 32)));
    }

    @Override // defpackage.jre
    public final dx j(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        long j2 = this.b;
        return j < j2 ? dxVar3 : this.a.j(j - j2, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public final dx r(long j, dx dxVar, dx dxVar2, dx dxVar3) {
        long j2 = this.b;
        return j < j2 ? dxVar : this.a.r(j - j2, dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public final dx s(dx dxVar, dx dxVar2, dx dxVar3) {
        return j(t(dxVar, dxVar2, dxVar3), dxVar, dxVar2, dxVar3);
    }

    @Override // defpackage.jre
    public final long t(dx dxVar, dx dxVar2, dx dxVar3) {
        return this.a.t(dxVar, dxVar2, dxVar3) + this.b;
    }
}
