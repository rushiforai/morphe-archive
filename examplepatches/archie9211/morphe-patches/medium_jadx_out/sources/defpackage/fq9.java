package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class fq9 implements b55 {
    public final /* synthetic */ int a = 0;
    public final /* synthetic */ mq9 b;
    public final /* synthetic */ iq9 c;

    public /* synthetic */ fq9(mq9 mq9Var, iq9 iq9Var) {
        this.b = mq9Var;
        this.c = iq9Var;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        iq9 iq9Var = this.c;
        mq9 mq9Var = this.b;
        x12 x12Var = (x12) obj;
        Integer num = (Integer) obj2;
        switch (i) {
            case 0:
                int iIntValue = num.intValue();
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    lq9 lq9Var = mq9Var != null ? mq9Var.q : null;
                    if (lq9Var instanceof kq9) {
                        p65Var.Y(-912066909);
                        yo7.k((kq9) lq9Var, mq9Var.s, iq9Var, p65Var, 0);
                    } else {
                        p65Var.Y(-914153147);
                    }
                    p65Var.p(false);
                }
                break;
            default:
                num.getClass();
                yo7.a(mq9Var, iq9Var, x12Var, tr7.y(1));
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ fq9(mq9 mq9Var, iq9 iq9Var, int i) {
        this.b = mq9Var;
        this.c = iq9Var;
    }
}
