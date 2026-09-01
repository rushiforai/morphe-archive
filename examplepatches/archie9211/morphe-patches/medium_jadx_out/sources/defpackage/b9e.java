package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class b9e extends p4d implements b55 {
    public List b;
    public rya c;
    public rya d;
    public nya e;
    public nya f;
    public nya g;
    public rya h;
    public Object i;
    public int j;
    public /* synthetic */ Object k;
    public final /* synthetic */ w9e l;
    public final /* synthetic */ c9e m;
    public final /* synthetic */ String n;
    public final /* synthetic */ xnc o;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public b9e(w9e w9eVar, c9e c9eVar, String str, xnc xncVar, n92 n92Var) {
        super(2, n92Var);
        this.l = w9eVar;
        this.m = c9eVar;
        this.n = str;
        this.o = xncVar;
    }

    public static final Object i(do4 do4Var, rya ryaVar, t8e t8eVar, p92 p92Var) {
        ryaVar.a = t8eVar;
        Object objA = do4Var.a(t8eVar, p92Var);
        return objA == tb2.COROUTINE_SUSPENDED ? objA : c1e.a;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        b9e b9eVar = new b9e(this.l, this.m, this.n, this.o, n92Var);
        b9eVar.k = obj;
        return b9eVar;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((b9e) create((do4) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Code restructure failed: missing block: B:64:0x022c, code lost:
    
        if (defpackage.r6c.m(r14, r1, r0) == r13) goto L65;
     */
    /* JADX WARN: Removed duplicated region for block: B:56:0x01ce  */
    /* JADX WARN: Removed duplicated region for block: B:62:0x01fe  */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r23) {
        /*
            Method dump skipped, instruction units count: 563
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.b9e.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
