package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zfc extends p4d implements c55 {
    public /* synthetic */ long b;
    public final /* synthetic */ bgc c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public zfc(bgc bgcVar, n92 n92Var) {
        super(3, n92Var);
        this.c = bgcVar;
    }

    @Override // defpackage.c55
    public final Object f(Object obj, Object obj2, Object obj3) {
        long j = ((ip8) obj2).a;
        zfc zfcVar = new zfc(this.c, (n92) obj3);
        zfcVar.b = j;
        c1e c1eVar = c1e.a;
        zfcVar.invokeSuspend(c1eVar);
        return c1eVar;
    }

    @Override // defpackage.kn0
    public final Object invokeSuspend(Object obj) {
        br7.v(obj);
        long j = this.b;
        bgc bgcVar = this.c;
        bgcVar.p.h((bgcVar.l == hw8.Vertical ? Float.intBitsToFloat((int) (j & 4294967295L)) : bgcVar.i ? bgcVar.g.g() - Float.intBitsToFloat((int) (j >> 32)) : Float.intBitsToFloat((int) (j >> 32))) - bgcVar.o.g());
        return c1e.a;
    }
}
