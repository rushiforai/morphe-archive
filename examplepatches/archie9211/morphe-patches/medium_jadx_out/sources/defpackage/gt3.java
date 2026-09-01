package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gt3 extends p4d implements b55 {
    public rya b;
    public rya c;
    public rya d;
    public rya e;
    public Object f;
    public int g;
    public int h;
    public /* synthetic */ Object i;
    public final /* synthetic */ ht3 j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public gt3(ht3 ht3Var, n92 n92Var) {
        super(2, n92Var);
        this.j = ht3Var;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        gt3 gt3Var = new gt3(this.j, n92Var);
        gt3Var.i = obj;
        return gt3Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((gt3) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /*  JADX ERROR: NullPointerException in pass: InitCodeVariables
        java.lang.NullPointerException
        */
    @Override // defpackage.kn0
    public final java.lang.Object invokeSuspend(java.lang.Object r76) {
        /*
            Method dump skipped, instruction units count: 970
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.gt3.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
