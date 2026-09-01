package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class g8g extends p4d implements b55 {
    public final /* synthetic */ int b = 1;
    public fdg c;
    public int d;
    public /* synthetic */ Object e;
    public final /* synthetic */ o2b f;
    public final /* synthetic */ long g;
    public final /* synthetic */ String h;
    public final /* synthetic */ fa4 i;
    public final /* synthetic */ adg j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g8g(o2b o2bVar, fdg fdgVar, String str, long j, fa4 fa4Var, adg adgVar, n92 n92Var) {
        super(2, n92Var);
        this.f = o2bVar;
        this.c = fdgVar;
        this.h = str;
        this.g = j;
        this.i = fa4Var;
        this.j = adgVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        switch (this.b) {
            case 0:
                g8g g8gVar = new g8g(this.f, this.c, this.h, this.g, this.i, this.j, n92Var);
                g8gVar.e = obj;
                return g8gVar;
            default:
                g8g g8gVar2 = new g8g(this.g, n92Var, this.i, this.f, this.h, this.j);
                g8gVar2.e = obj;
                return g8gVar2;
        }
    }

    @Override // defpackage.b55
    public final /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        int i = this.b;
        c1e c1eVar = c1e.a;
        switch (i) {
            case 0:
                return ((g8g) create((xbg) obj, (n92) obj2)).invokeSuspend(c1eVar);
            default:
                return ((g8g) create((fdg) obj, (n92) obj2)).invokeSuspend(c1eVar);
        }
    }

    /* JADX WARN: Removed duplicated region for block: B:32:0x00a1  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x00a2  */
    /* JADX WARN: Removed duplicated region for block: B:68:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:71:? A[RETURN, SYNTHETIC] */
    /* JADX WARN: Removed duplicated region for block: B:74:? A[RETURN, SYNTHETIC] */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r18) throws com.google.android.recaptcha.internal.zzfx {
        /*
            Method dump skipped, instruction units count: 350
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.g8g.invokeSuspend(java.lang.Object):java.lang.Object");
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public g8g(long j, n92 n92Var, fa4 fa4Var, o2b o2bVar, String str, adg adgVar) {
        super(2, n92Var);
        this.f = o2bVar;
        this.g = j;
        this.h = str;
        this.i = fa4Var;
        this.j = adgVar;
    }
}
