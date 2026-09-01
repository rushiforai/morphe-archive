package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zs3 extends p4d implements b55 {
    public Object b;
    public ht3 c;
    public Throwable d;
    public int e;
    public int f;
    public final /* synthetic */ ht3 g;
    public final /* synthetic */ int h;
    public final /* synthetic */ String i;
    public final /* synthetic */ String j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zs3(int i, n92 n92Var, ht3 ht3Var, String str, String str2) {
        super(2, n92Var);
        this.g = ht3Var;
        this.h = i;
        this.i = str;
        this.j = str2;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        return new zs3(this.h, n92Var, this.g, this.i, this.j);
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((zs3) create((sb2) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:33:0x00e9, code lost:
    
        if (r1.a(r2, r16) != r3) goto L35;
     */
    /* JADX WARN: Removed duplicated region for block: B:24:0x0084  */
    /* JADX WARN: Removed duplicated region for block: B:29:0x00ab  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r17) {
        /*
            Method dump skipped, instruction units count: 239
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.zs3.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
