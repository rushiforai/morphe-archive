package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class p4d extends p92 implements l55 {
    private final int arity;

    public p4d(int i, n92 n92Var) {
        super(n92Var);
        this.arity = i;
    }

    @Override // defpackage.l55
    public int getArity() {
        return this.arity;
    }

    @Override // defpackage.kn0
    public String toString() {
        return getCompletion() == null ? n1b.a.i(this) : super.toString();
    }
}
