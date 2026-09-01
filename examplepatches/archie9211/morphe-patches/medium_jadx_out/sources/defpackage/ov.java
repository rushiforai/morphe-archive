package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ov implements zrd {
    public final dsd a;
    public xd b;
    public final k49 c = qo7.u(new s46(0));
    public final f78 d;

    public ov(dsd dsdVar, xd xdVar) {
        this.a = dsdVar;
        this.b = xdVar;
        long[] jArr = hqb.a;
        this.d = new f78();
    }

    @Override // defpackage.zrd
    public final Object a() {
        return this.a.f().a();
    }

    @Override // defpackage.zrd
    public final boolean b(Object obj, Object obj2) {
        return g76.L(obj, a()) && g76.L(obj2, c());
    }

    @Override // defpackage.zrd
    public final Object c() {
        return this.a.f().c();
    }
}
