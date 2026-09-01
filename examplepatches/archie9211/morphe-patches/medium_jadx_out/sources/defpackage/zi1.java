package defpackage;

import android.content.DialogInterface;
import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class zi1 implements DialogInterface.OnClickListener {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;

    public /* synthetic */ zi1(Object obj, int i, Object obj2) {
        this.a = i;
        this.b = obj;
        this.c = obj2;
    }

    @Override // android.content.DialogInterface.OnClickListener
    public final void onClick(DialogInterface dialogInterface, int i) {
        int i2 = this.a;
        n92 n92Var = null;
        Object obj = this.c;
        Object obj2 = this.b;
        switch (i2) {
            case 0:
                mj1 mj1Var = (mj1) obj2;
                vx0.c0(f76.F(mj1Var), null, null, new jj1(mj1Var, (rg1) obj, n92Var, 0), 3);
                break;
            default:
                sw9 sw9VarK1 = ((PostFragment) obj2).k1();
                rg1 rg1Var = ((b81) ((m40) obj)).t;
                rg1Var.getClass();
                vx0.c0(f76.F(sw9VarK1), null, null, new bv9(sw9VarK1, rg1Var, n92Var, 1), 3);
                break;
        }
    }
}
