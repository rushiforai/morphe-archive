package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class o48 extends p4d implements b55 {
    public nya b;
    public nya c;
    public int d;
    public int e;
    public /* synthetic */ Object f;
    public final /* synthetic */ oya g;
    public final /* synthetic */ rya h;
    public final /* synthetic */ rya i;
    public final /* synthetic */ float j;
    public final /* synthetic */ q48 k;
    public final /* synthetic */ float l;
    public final /* synthetic */ vsb m;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public o48(oya oyaVar, rya ryaVar, rya ryaVar2, float f, q48 q48Var, float f2, vsb vsbVar, n92 n92Var) {
        super(2, n92Var);
        this.g = oyaVar;
        this.h = ryaVar;
        this.i = ryaVar2;
        this.j = f;
        this.k = q48Var;
        this.l = f2;
        this.m = vsbVar;
    }

    @Override // defpackage.kn0
    public final n92 create(Object obj, n92 n92Var) {
        o48 o48Var = new o48(this.g, this.h, this.i, this.j, this.k, this.l, this.m, n92Var);
        o48Var.f = obj;
        return o48Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        return ((o48) create((tsb) obj, (n92) obj2)).invokeSuspend(c1e.a);
    }

    /* JADX WARN: Removed duplicated region for block: B:16:0x007a  */
    /* JADX WARN: Removed duplicated region for block: B:20:0x00a4  */
    /* JADX WARN: Removed duplicated region for block: B:33:0x016b  */
    /* JADX WARN: Removed duplicated region for block: B:39:0x019e  */
    /* JADX WARN: Removed duplicated region for block: B:45:0x01ce A[RETURN] */
    /* JADX WARN: Unsupported multi-entry loop pattern (BACK_EDGE: B:36:0x018b -> B:37:0x018c). Please report as a decompilation issue!!! */
    @Override // defpackage.kn0
    /*
        Code decompiled incorrectly, please refer to instructions dump.
        To view partially-correct add '--show-bad-code' argument
    */
    public final java.lang.Object invokeSuspend(java.lang.Object r24) {
        /*
            Method dump skipped, instruction units count: 463
            To view this dump add '--comments-level debug' option
        */
        throw new UnsupportedOperationException("Method not decompiled: defpackage.o48.invokeSuspend(java.lang.Object):java.lang.Object");
    }
}
