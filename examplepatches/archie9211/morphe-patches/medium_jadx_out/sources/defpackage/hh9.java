package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hh9 implements t53 {
    public final /* synthetic */ int a;
    public final /* synthetic */ or9 b;
    public final /* synthetic */ Object c;

    public /* synthetic */ hh9(Object obj, or9 or9Var, int i) {
        this.a = i;
        this.c = obj;
        this.b = or9Var;
    }

    @Override // defpackage.t53
    public final void a() {
        int i = this.a;
        int i2 = 4;
        n92 n92Var = null;
        Object obj = this.c;
        switch (i) {
            case 0:
                sw9 sw9VarK1 = ((PostFragment) obj).k1();
                vx0.c0(f76.F(sw9VarK1), null, null, new nr9(i2, n92Var, sw9VarK1), 3);
                break;
            default:
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new nr9(i2, n92Var, sw9Var), 3);
                break;
        }
    }

    @Override // defpackage.t53
    public final void b(String str) {
        int i = this.a;
        or9 or9Var = this.b;
        Object obj = this.c;
        str.getClass();
        switch (i) {
            case 0:
                ((PostFragment) obj).k1().C(str, or9Var.b, true);
                break;
            default:
                ((sw9) obj).C(str, or9Var.b, true);
                break;
        }
    }
}
