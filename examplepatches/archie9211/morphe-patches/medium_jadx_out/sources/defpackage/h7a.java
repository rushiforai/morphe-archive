package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class h7a extends j7a {
    public final k5a d;
    public final h7a e;
    public final mn1 f;
    public final j5a g;
    public final boolean h;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public h7a(k5a k5aVar, p98 p98Var, wjc wjcVar, jkc jkcVar, h7a h7aVar) {
        super(p98Var, wjcVar, jkcVar);
        k5aVar.getClass();
        p98Var.getClass();
        this.d = k5aVar;
        this.e = h7aVar;
        this.f = vn7.z(p98Var, k5aVar.e);
        j5a j5aVar = (j5a) cm4.f.d(k5aVar.d);
        this.g = j5aVar == null ? j5a.CLASS : j5aVar;
        this.h = cm4.g.d(k5aVar.d).booleanValue();
        cm4.h.getClass();
    }

    @Override // defpackage.j7a
    public final y05 a() {
        return this.f.a();
    }
}
