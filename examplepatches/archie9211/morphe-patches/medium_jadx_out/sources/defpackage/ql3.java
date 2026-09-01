package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ql3 extends p4d implements b55 {
    public final /* synthetic */ int b;
    public int c;
    public final /* synthetic */ long d;
    public /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ql3(ffc ffcVar, long j, hfc hfcVar, n92 n92Var) {
        super(2, n92Var);
        this.b = 1;
        this.e = ffcVar;
        this.d = j;
        this.f = hfcVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        int i = this.b;
        Object obj2 = this.f;
        switch (i) {
            case 0:
                ql3 ql3Var = new ql3((rl3) obj2, this.d, n92Var, 0);
                ql3Var.e = obj;
                return ql3Var;
            case 1:
                return new ql3((ffc) this.e, this.d, (hfc) obj2, n92Var);
            default:
                ql3 ql3Var2 = new ql3((h9g) obj2, this.d, n92Var, 2);
                ql3Var2.e = obj;
                return ql3Var2;
        }
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((ql3) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            case 1:
                return ((ql3) create((sb2) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((ql3) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    /* JADX WARN: Removed duplicated region for block: B:22:0x0069  */
    /* JADX WARN: Removed duplicated region for block: B:26:0x0077  */
    /* JADX WARN: Removed duplicated region for block: B:27:0x007d A[Catch: Exception -> 0x0025, TRY_ENTER, TryCatch #0 {Exception -> 0x0025, blocks: (B:8:0x0020, B:23:0x006a, B:27:0x007d, B:28:0x0084, B:20:0x005b), top: B:64:0x001a }] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r13) throws com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 288
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.ql3.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ql3(Object obj, long j, n92 n92Var, int i) {
        super(2, n92Var);
        this.b = i;
        this.f = obj;
        this.d = j;
    }
}
