package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class opb implements kpb {
    public final /* synthetic */ b55 a;
    public final /* synthetic */ x45 b;

    public opb(b55 b55Var, x45 x45Var) {
        this.a = b55Var;
        this.b = x45Var;
    }

    @Override // defpackage.kpb
    public final Object a(Object obj) {
        return this.b.invoke(obj);
    }

    @Override // defpackage.kpb
    public final Object b(lpb lpbVar, Object obj) {
        return this.a.invoke(lpbVar, obj);
    }
}
