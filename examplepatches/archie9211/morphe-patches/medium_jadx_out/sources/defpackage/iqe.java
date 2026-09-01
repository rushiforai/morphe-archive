package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class iqe extends bv7 {
    public final int c;

    /* JADX WARN: Illegal instructions before constructor call */
    public iqe(int i) {
        StringBuilder sbC = ev6.C("must have at least ", i, " value parameter");
        sbC.append(i > 1 ? "s" : "");
        super(sbC.toString(), 1);
        this.c = i;
    }

    @Override // defpackage.zk1
    public final boolean a(g96 g96Var) {
        return g96Var.I().size() >= this.c;
    }
}
