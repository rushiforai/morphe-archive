package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hc7 extends co6 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ ic7 b;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public /* synthetic */ hc7(ic7 ic7Var, int i) {
        super(0);
        this.a = i;
        this.b = ic7Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        ic7 ic7Var = this.b;
        switch (i) {
            case 0:
                return Boolean.valueOf((((bc7) ic7Var.b.getValue()) == null && ((Throwable) ic7Var.c.getValue()) == null) ? false : true);
            case 1:
                return Boolean.valueOf(((Throwable) ic7Var.c.getValue()) != null);
            case 2:
                if (((bc7) ic7Var.b.getValue()) == null && ((Throwable) ic7Var.c.getValue()) == null) {
                    z = true;
                }
                return Boolean.valueOf(z);
            default:
                return Boolean.valueOf(((bc7) ic7Var.b.getValue()) != null);
        }
    }
}
