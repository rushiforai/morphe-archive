package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ab6 extends xa6 {
    public final db6 e;
    public final bb6 f;
    public final hl1 g;
    public final Object h;

    public ab6(db6 db6Var, bb6 bb6Var, hl1 hl1Var, Object obj) {
        this.e = db6Var;
        this.f = bb6Var;
        this.g = hl1Var;
        this.h = obj;
    }

    @Override // defpackage.xa6
    public final boolean l() {
        return false;
    }

    @Override // defpackage.xa6
    public final void m(Throwable th) {
        hl1 hl1Var = this.g;
        hl1 hl1VarY = db6.Y(hl1Var);
        db6 db6Var = this.e;
        bb6 bb6Var = this.f;
        Object obj = this.h;
        if (hl1VarY == null || !db6Var.h0(bb6Var, hl1VarY, obj)) {
            bb6Var.a.b(new k17(2), 2);
            hl1 hl1VarY2 = db6.Y(hl1Var);
            if (hl1VarY2 == null || !db6Var.h0(bb6Var, hl1VarY2, obj)) {
                db6Var.g(db6Var.z(bb6Var, obj));
            }
        }
    }
}
