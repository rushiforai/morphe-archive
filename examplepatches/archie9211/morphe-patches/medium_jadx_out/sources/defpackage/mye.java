package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class mye implements bo4 {
    public final /* synthetic */ xz a;
    public final /* synthetic */ boolean b;
    public final /* synthetic */ String c;

    public mye(xz xzVar, boolean z, String str) {
        this.a = xzVar;
        this.b = z;
        this.c = str;
    }

    @Override // defpackage.bo4
    public final Object b(do4 do4Var, n92 n92Var) throws Throwable {
        Object objB = this.a.b(new lye(do4Var, this.b, this.c), n92Var);
        return objB == tb2.COROUTINE_SUSPENDED ? objB : c1e.a;
    }
}
