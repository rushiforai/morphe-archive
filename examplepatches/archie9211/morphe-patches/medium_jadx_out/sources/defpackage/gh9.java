package defpackage;

import com.medium.android.donkey.post.PostFragment;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gh9 implements h4b {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;

    public /* synthetic */ gh9(int i, Object obj) {
        this.a = i;
        this.b = obj;
    }

    @Override // defpackage.h4b
    public final void a() {
        int i = this.a;
        int i2 = 8;
        n92 n92Var = null;
        Object obj = this.b;
        int i3 = 3;
        switch (i) {
            case 0:
                sw9 sw9VarK1 = ((PostFragment) obj).k1();
                vx0.c0(f76.F(sw9VarK1), null, null, new nr9(i2, n92Var, sw9VarK1), 3);
                break;
            case 1:
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new nr9(i2, n92Var, sw9Var), 3);
                break;
            default:
                ime imeVar = (ime) obj;
                vx0.c0(f76.F(imeVar), null, null, new eme(imeVar, n92Var, i3), 3);
                break;
        }
    }

    @Override // defpackage.h4b
    public final void b(String str) {
        int i = this.a;
        int i2 = 7;
        n92 n92Var = null;
        Object obj = this.b;
        str.getClass();
        switch (i) {
            case 0:
                sw9 sw9VarK1 = ((PostFragment) obj).k1();
                vx0.c0(f76.F(sw9VarK1), null, null, new dv9(sw9VarK1, str, n92Var, i2), 3);
                break;
            case 1:
                sw9 sw9Var = (sw9) obj;
                vx0.c0(f76.F(sw9Var), null, null, new dv9(sw9Var, str, n92Var, i2), 3);
                break;
            default:
                ime imeVar = (ime) obj;
                vx0.c0(f76.F(imeVar), null, null, new fme(imeVar, str, n92Var, 2), 3);
                break;
        }
    }
}
