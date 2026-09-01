package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class lgg extends gr7 {
    public final nig h;

    public lgg(nig nigVar) {
        int i = pgg.b[((zrg) nigVar.d).ordinal()];
        this.h = nigVar;
    }

    @Override // defpackage.gr7
    public final bzf H() {
        nig nigVar = this.h;
        return new jgg((String) nigVar.a, (ntg) nigVar.e);
    }

    @Override // defpackage.gr7
    public final Integer J() {
        return (Integer) this.h.f;
    }

    public final qvg K() {
        nig nigVar = this.h;
        ntg ntgVar = (ntg) nigVar.e;
        Integer num = (Integer) nigVar.f;
        if (ntgVar.equals(ntg.RAW)) {
            return qvg.a(new byte[0]);
        }
        if (ntgVar.equals(ntg.TINK)) {
            return mhg.b(num.intValue());
        }
        if (ntgVar.equals(ntg.zzc) || ntgVar.equals(ntg.CRUNCHY)) {
            return mhg.a(num.intValue());
        }
        ygf.l("Unknown output prefix type");
        return null;
    }
}
