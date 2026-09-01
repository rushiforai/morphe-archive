package defpackage;

import com.medium.android.graphql.fragment.PostMetaData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class yn9 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ lo9 b;
    public final /* synthetic */ ove c;

    public /* synthetic */ yn9(lo9 lo9Var, ove oveVar, int i) {
        this.a = i;
        this.b = lo9Var;
        this.c = oveVar;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        n92 n92Var = null;
        ove oveVar = this.c;
        lo9 lo9Var = this.b;
        switch (i) {
            case 0:
                String str = oveVar.a;
                hx4 hx4Var = lo9Var.a.q;
                hx4Var.getClass();
                sw9 sw9Var = (sw9) hx4Var.b;
                vx0.c0(f76.F(sw9Var), null, null, new dv9(sw9Var, str, n92Var, 1), 3);
                break;
            default:
                String str2 = oveVar.a;
                hx4 hx4Var2 = lo9Var.a.q;
                hx4Var2.getClass();
                sw9 sw9Var2 = (sw9) hx4Var2.b;
                vx0.c0(f76.F(sw9Var2), null, null, new ov9(null, sw9Var2, (PostMetaData) hx4Var2.c, str2), 3);
                break;
        }
        return c1eVar;
    }
}
