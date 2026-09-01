package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ul0 extends dq8 {
    public final /* synthetic */ int d;
    public final /* synthetic */ Object e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ul0(x45 x45Var) {
        super(true);
        this.d = 3;
        this.e = x45Var;
    }

    @Override // defpackage.dq8
    public void a() {
        switch (this.d) {
            case 0:
                ((n4) this.e).m();
                break;
        }
    }

    @Override // defpackage.dq8
    public final void b() {
        int i = this.d;
        Object obj = this.e;
        switch (i) {
            case 0:
                ((n4) obj).n();
                break;
            case 1:
                f25 f25Var = (f25) obj;
                f25Var.y(true);
                if (!f25Var.h.b) {
                    f25Var.g.d();
                } else {
                    f25Var.Q();
                }
                break;
            case 2:
                ((db8) obj).f();
                break;
            default:
                ((x45) obj).invoke(this);
                break;
        }
    }

    @Override // defpackage.dq8
    public void c(sl0 sl0Var) {
        switch (this.d) {
            case 0:
                ((n4) this.e).o(sl0Var);
                break;
        }
    }

    @Override // defpackage.dq8
    public void d(sl0 sl0Var) {
        switch (this.d) {
            case 0:
                ((n4) this.e).p();
                break;
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ ul0(int i, Object obj) {
        super(false);
        this.d = i;
        this.e = obj;
    }
}
