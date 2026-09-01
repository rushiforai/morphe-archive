package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class ng9 implements b55 {
    public final /* synthetic */ int a;
    public final /* synthetic */ tu9 b;
    public final /* synthetic */ PostFragment c;

    public /* synthetic */ ng9(tu9 tu9Var, PostFragment postFragment, int i) {
        this.a = i;
        this.b = tu9Var;
        this.c = postFragment;
    }

    @Override // defpackage.b55
    public final Object invoke(Object obj, Object obj2) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        PostFragment postFragment = this.c;
        tu9 tu9Var = this.b;
        int i2 = 1;
        x12 x12Var = (x12) obj;
        int iIntValue = ((Integer) obj2).intValue();
        switch (i) {
            case 0:
                p65 p65Var = (p65) x12Var;
                if (!p65Var.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var.S();
                } else {
                    jt7.a(false, pxf.E(603065723, new ng9(tu9Var, postFragment, i2), p65Var), p65Var, 48, 1);
                }
                break;
            default:
                p65 p65Var2 = (p65) x12Var;
                if (!p65Var2.P(iIntValue & 1, (iIntValue & 3) != 2)) {
                    p65Var2.S();
                } else {
                    su9 su9Var = tu9Var instanceof su9 ? (su9) tu9Var : null;
                    yo7.f(su9Var != null ? su9Var.f : null, postFragment.K0, null, p65Var2, 0, 4);
                }
                break;
        }
        return c1eVar;
    }
}
