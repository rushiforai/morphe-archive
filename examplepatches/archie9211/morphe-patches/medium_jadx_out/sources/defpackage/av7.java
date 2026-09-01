package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class av7 extends bv7 {
    public static final av7 d = new av7("must be a member function", 0);
    public static final av7 e = new av7("must be a member or an extension function", 1);
    public final /* synthetic */ int c;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ av7(String str, int i) {
        super(str, 0);
        this.c = i;
    }

    @Override // defpackage.zk1
    public final boolean a(g96 g96Var) {
        switch (this.c) {
            case 0:
                if (g96Var.k == null) {
                    break;
                }
                break;
            default:
                if (g96Var.k == null && g96Var.j == null) {
                    break;
                }
                break;
        }
        return false;
    }
}
