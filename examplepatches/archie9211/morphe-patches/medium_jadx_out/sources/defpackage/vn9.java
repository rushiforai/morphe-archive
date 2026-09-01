package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class vn9 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lo9 b;
    public final /* synthetic */ tve c;

    public /* synthetic */ vn9(lo9 lo9Var, tve tveVar, int i) {
        this.a = i;
        this.b = lo9Var;
        this.c = tveVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        tve tveVar = this.c;
        lo9 lo9Var = this.b;
        switch (i) {
            case 0:
                String strA = tveVar.a();
                strA.getClass();
                hx4 hx4Var = lo9Var.a.q;
                hx4Var.getClass();
                sw9 sw9Var = (sw9) hx4Var.b;
                vx0.c0(f76.F(sw9Var), null, null, new dv9(sw9Var, strA, n92Var, 2), 3);
                break;
            default:
                String strA2 = tveVar.a();
                strA2.getClass();
                hx4 hx4Var2 = lo9Var.a.q;
                hx4Var2.getClass();
                sw9 sw9Var2 = (sw9) hx4Var2.b;
                vx0.c0(f76.F(sw9Var2), null, null, new qv9(null, sw9Var2, (PostMetaData) hx4Var2.c, strA2), 3);
                break;
        }
        return c1eVar;
    }
}
