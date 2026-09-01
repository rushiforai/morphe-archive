package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d92 extends b2 implements iwa {
    public final /* synthetic */ int c = 1;
    public final n98 d;
    public final Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d92(c41 c41Var, mn6 mn6Var, n98 n98Var) {
        super(mn6Var);
        c41Var.getClass();
        mn6Var.getClass();
        this.e = c41Var;
        this.d = n98Var;
    }

    @Override // defpackage.b2
    public final String toString() {
        int i = this.c;
        Object obj = this.e;
        switch (i) {
            case 0:
                return getType() + ": Ctx { " + ((y28) obj) + " }";
            default:
                return "Cxt { " + ((c41) obj) + " }";
        }
    }

    public final n98 w0() {
        switch (this.c) {
        }
        return this.d;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public d92(y28 y28Var, mn6 mn6Var, n98 n98Var) {
        super(mn6Var);
        mn6Var.getClass();
        this.e = y28Var;
        this.d = n98Var;
    }
}
