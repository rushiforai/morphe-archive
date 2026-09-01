package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class a4b implements g2c {
    public static final int g;
    public static final x2b h;
    public final bmd a;
    public final hk4 b;
    public final w60 c;
    public final b4b d;
    public final b2c e;
    public final a98 f;

    static {
        int i = in3.d;
        g = (int) in3.j(hlg.T(24, mn3.HOURS), mn3.SECONDS);
        h = new x2b("com/google/firebase/sessions//");
    }

    public a4b(bmd bmdVar, hk4 hk4Var, w60 w60Var, b4b b4bVar, b2c b2cVar) {
        bmdVar.getClass();
        hk4Var.getClass();
        w60Var.getClass();
        b4bVar.getClass();
        b2cVar.getClass();
        this.a = bmdVar;
        this.b = hk4Var;
        this.c = w60Var;
        this.d = b4bVar;
        this.e = b2cVar;
        this.f = new a98();
    }

    @Override // defpackage.g2c
    public final Boolean a() {
        return this.e.a().a;
    }

    /* JADX WARN: Can't wrap try/catch for region: R(8:0|2|(2:4|(1:6)(1:7))(0)|8|(1:(3:(1:(5:13|63|14|57|58)(2:18|19))(5:20|62|21|45|(3:47|48|49)(4:50|(1:53)|(3:56|57|58)|55))|59|60)(1:25))(2:26|(3:31|(0)|55)(1:30))|61|34|(3:36|37|38)(3:41|(3:44|45|(0)(0))|55)) */
    /* JADX WARN: Code restructure failed: missing block: B:39:0x0086, code lost:
    
        r0 = th;
     */
    /* JADX WARN: Code restructure failed: missing block: B:40:0x0087, code lost:
    
        r2 = r1;
     */
    /* JADX WARN: Removed duplicated region for block: B:47:0x00a9 A[Catch: all -> 0x004e, TRY_LEAVE, TryCatch #1 {all -> 0x004e, blocks: (B:21:0x004a, B:45:0x009f, B:47:0x00a9, B:50:0x00b2), top: B:62:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:50:0x00b2 A[Catch: all -> 0x004e, TRY_ENTER, TRY_LEAVE, TryCatch #1 {all -> 0x004e, blocks: (B:21:0x004a, B:45:0x009f, B:47:0x00a9, B:50:0x00b2), top: B:62:0x004a }] */
    /* JADX WARN: Removed duplicated region for block: B:7:0x0019  */
    @Override // defpackage.g2c
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object b(defpackage.n92 r24) throws java.lang.Throwable {
        /*
            Method dump skipped, instruction units count: 344
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.a4b.b(n92):java.lang.Object");
    }

    @Override // defpackage.g2c
    public final in3 c() {
        Integer num = this.e.a().c;
        if (num == null) {
            return null;
        }
        int i = in3.d;
        return new in3(hlg.T(num.intValue(), mn3.SECONDS));
    }

    @Override // defpackage.g2c
    public final Double d() {
        return this.e.a().b;
    }
}
