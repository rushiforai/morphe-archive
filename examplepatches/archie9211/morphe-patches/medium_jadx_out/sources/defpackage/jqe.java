package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class jqe extends bv7 {
    public static final jqe d = new jqe("must have no value parameters", 0);
    public static final jqe e = new jqe("must have a single value parameter", 1);
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ jqe(String str, int i) {
        super(str, 1);
        this.c = i;
    }

    @Override // defpackage.zk1
    public final boolean a(g96 g96Var) {
        switch (this.c) {
            case 0:
                break;
            case 1:
                if (g96Var.I().size() == 1) {
                }
                break;
            default:
                if (g96Var.I().size() == 2) {
                }
                break;
        }
        return true;
    }
}
