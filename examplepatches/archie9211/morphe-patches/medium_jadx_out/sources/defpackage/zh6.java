package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zh6 extends wi6 implements xh6 {
    public final vq6 p;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zh6(ph6 ph6Var, String str, String str2, Object obj) {
        super(ph6Var, str, str2, obj);
        str.getClass();
        str2.getClass();
        this.p = vx0.d0(yw6.PUBLICATION, new v2(23, this));
    }

    @Override // defpackage.xh6, defpackage.fi6
    public final yh6 c() {
        return (yh6) this.p.getValue();
    }

    @Override // defpackage.fi6
    public final lj6 c() {
        return (yh6) this.p.getValue();
    }

    public zh6(ph6 ph6Var, r4a r4aVar) {
        super(ph6Var, r4aVar);
        this.p = vx0.d0(yw6.PUBLICATION, new v2(23, this));
    }
}
