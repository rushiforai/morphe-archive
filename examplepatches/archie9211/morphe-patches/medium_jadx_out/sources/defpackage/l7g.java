package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l7g extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public /* synthetic */ Object d;
    public final /* synthetic */ x7g e;
    public final /* synthetic */ long f;
    public final /* synthetic */ awa g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ l7g(x7g x7gVar, long j, awa awaVar, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.e = x7gVar;
        this.f = j;
        this.g = awaVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                l7g l7gVar = new l7g(this.e, this.f, this.g, n92Var, 0);
                l7gVar.d = obj;
                return l7gVar;
            case 1:
                l7g l7gVar2 = new l7g(this.e, this.f, this.g, n92Var, 1);
                l7gVar2.d = obj;
                return l7gVar2;
            default:
                l7g l7gVar3 = new l7g(this.e, this.f, this.g, n92Var, 2);
                l7gVar3.d = obj;
                return l7gVar3;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((l7g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((l7g) create((adg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((l7g) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:31:0x0082  */
    /* JADX WARN: Removed duplicated region for block: B:32:0x0083 A[Catch: Exception -> 0x0018, zzfx -> 0x009b, TryCatch #3 {zzfx -> 0x009b, Exception -> 0x0018, blocks: (B:7:0x0014, B:29:0x0079, B:32:0x0083, B:33:0x008a, B:12:0x0020, B:26:0x0068, B:15:0x002b, B:17:0x0039, B:21:0x004a, B:23:0x0053, B:35:0x008c), top: B:71:0x0010 }] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r14) throws com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 302
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.l7g.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
