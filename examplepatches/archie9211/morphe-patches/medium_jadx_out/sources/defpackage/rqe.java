package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class rqe extends zpe {
    public final wg5 b;
    public String c;
    public boolean d;
    public final vl3 e;
    public m45 f;
    public final k49 g;
    public bs0 h;
    public final k49 i;
    public long j;
    public float k;
    public float l;
    public final qqe m;

    public rqe(wg5 wg5Var) {
        this.b = wg5Var;
        wg5Var.i = new qqe(this, 0);
        this.c = "";
        this.d = true;
        this.e = new vl3();
        this.f = b18.q;
        this.g = qo7.u(null);
        this.i = qo7.u(new dfc(0L));
        this.j = 9205357640488583168L;
        this.k = 1.0f;
        this.l = 1.0f;
        this.m = new qqe(this, 1);
    }

    @Override // defpackage.zpe
    public final void a(zl3 zl3Var) {
        e(zl3Var, 1.0f, null);
    }

    /* JADX WARN: Removed duplicated region for block: B:23:0x003d  */
    /* JADX WARN: Removed duplicated region for block: B:34:0x0067  */
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final void e(defpackage.zl3 r33, float r34, defpackage.bs0 r35) {
        /*
            Method dump skipped, instruction units count: 449
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.rqe.e(zl3, float, bs0):void");
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Params: \tname: ");
        sb.append(this.c);
        sb.append("\n\tviewportWidth: ");
        k49 k49Var = this.i;
        sb.append(Float.intBitsToFloat((int) (((dfc) k49Var.getValue()).a >> 32)));
        sb.append("\n\tviewportHeight: ");
        sb.append(Float.intBitsToFloat((int) (((dfc) k49Var.getValue()).a & 4294967295L)));
        sb.append("\n");
        return sb.toString();
    }
}
