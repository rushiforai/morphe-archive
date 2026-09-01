package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public abstract class uib extends tib implements l55 {
    public final int b;

    public uib(int i, n92 n92Var) {
        super(n92Var);
        this.b = i;
    }

    @Override // defpackage.l55
    public final int getArity() {
        return this.b;
    }

    @Override // defpackage.kn0
    public final String toString() {
        return getCompletion() == null ? n1b.a.i(this) : super.toString();
    }
}
