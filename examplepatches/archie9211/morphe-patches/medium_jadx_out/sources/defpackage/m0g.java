package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class m0g implements m1g {
    public final /* synthetic */ int a;

    public /* synthetic */ m0g(int i) {
        this.a = i;
    }

    public static final /* synthetic */ itf g(String str) {
        gtf gtfVarV = itf.v();
        gtfVarV.h(str);
        return (itf) gtfVarV.e();
    }

    @Override // defpackage.m1g
    public final ycg a(arf arfVar) {
        switch (this.a) {
            case 0:
                return new ycg(new zzf(this, null, 1));
            default:
                return new ycg(new zzf(this, null, 2));
        }
    }

    @Override // defpackage.m1g
    public final /* synthetic */ ycg b(String str, arf arfVar, yu yuVar) {
        int i = this.a;
        return wgd.g(this, str, arfVar);
    }

    @Override // defpackage.m1g
    public final /* synthetic */ ycg c(orf orfVar, j5d j5dVar) {
        switch (this.a) {
        }
        return wgd.h();
    }

    @Override // defpackage.m1g
    public final /* synthetic */ wcg d(orf orfVar, yu yuVar) {
        int i = this.a;
        return wgd.f(this, orfVar);
    }

    @Override // defpackage.m1g
    public final boolean e() {
        switch (this.a) {
        }
        return true;
    }

    @Override // defpackage.m1g
    public final /* synthetic */ b1g f(Exception exc, i1g i1gVar) {
        int i = this.a;
        return wgd.e(this, exc);
    }

    @Override // defpackage.m1g
    public final int zza() {
        switch (this.a) {
            case 0:
                return 11;
            default:
                return 10;
        }
    }
}
