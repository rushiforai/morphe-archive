package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kvc {
    public final nvc a;
    public nq6 b;
    public final jvc c = new jvc(this, 2);
    public final jvc d = new jvc(this, 0);
    public final jvc e = new jvc(this, 1);

    public kvc(nvc nvcVar) {
        this.a = nvcVar;
    }

    public final nq6 a() {
        nq6 nq6Var = this.b;
        if (nq6Var != null) {
            return nq6Var;
        }
        ay0.e("SubcomposeLayoutState is not attached to SubcomposeLayout");
        return null;
    }
}
