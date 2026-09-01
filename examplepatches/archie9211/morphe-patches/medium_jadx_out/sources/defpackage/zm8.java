package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class zm8 extends v1 {
    public final /* synthetic */ int d;
    public final Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ zm8(vn7 vn7Var, Object obj, int i) {
        super(vn7Var);
        this.d = i;
        this.e = obj;
    }

    @Override // defpackage.vn7
    public final void c0(jn8 jn8Var) {
        int i = this.d;
        vn7 vn7Var = this.c;
        Object obj = this.e;
        switch (i) {
            case 0:
                vn7Var.b0(new ym8(new h0c(jn8Var), ((oqb) obj).a()));
                break;
            case 1:
                do6 do6Var = new do6(jn8Var);
                jn8Var.a(do6Var);
                zh3.setOnce(do6Var, ((oqb) obj).b(new p0g(this, do6Var, false, 12)));
                break;
            case 2:
                vn7Var.b0(new fn8(jn8Var, ((oqb) obj).a()));
                break;
            default:
                vn7Var.b0(new cn8(jn8Var, (o19) obj));
                break;
        }
    }
}
