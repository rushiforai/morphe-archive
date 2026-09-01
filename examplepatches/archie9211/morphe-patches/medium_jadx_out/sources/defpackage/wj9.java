package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class wj9 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ m45 b;
    public final /* synthetic */ sh9 c;
    public final /* synthetic */ dr9 d;
    public final /* synthetic */ g08 e;

    public /* synthetic */ wj9(m45 m45Var, dr9 dr9Var, sh9 sh9Var, g08 g08Var) {
        this.a = 17;
        this.b = m45Var;
        this.d = dr9Var;
        this.c = sh9Var;
        this.e = g08Var;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        g08 g08Var = this.e;
        dr9 dr9Var = this.d;
        sh9 sh9Var = this.c;
        m45 m45Var = this.b;
        switch (i) {
            case 0:
                m45Var.invoke();
                sh9Var.x(g08Var.b, dr9Var.i.a, dr9Var.a);
                break;
            case 1:
                m45Var.invoke();
                sh9Var.L(g08Var.b, dr9Var.i.a, dr9Var.a);
                break;
            case 2:
                m45Var.invoke();
                rq9 rq9Var = dr9Var.j;
                String str = rq9Var != null ? rq9Var.a : null;
                if (str == null) {
                    ay0.e("Don't show the Collection mute state without providing a collection id");
                } else {
                    sh9Var.I(g08Var.b, str, dr9Var.a);
                }
                break;
            case 3:
                m45Var.invoke();
                rq9 rq9Var2 = dr9Var.j;
                String str2 = rq9Var2 != null ? rq9Var2.a : null;
                if (str2 == null) {
                    ay0.e("Don't show the Collection mute state without providing a collection id");
                } else {
                    sh9Var.H(g08Var.b, str2, dr9Var.a);
                }
                break;
            case 4:
                m45Var.invoke();
                sh9Var.F(dr9Var.a, g08Var.b);
                break;
            case 5:
                m45Var.invoke();
                sh9Var.o(dr9Var.a, g08Var.b);
                break;
            case 6:
                m45Var.invoke();
                sh9Var.J(g08Var.b, dr9Var.a, dr9Var.i.a);
                break;
            case 7:
                m45Var.invoke();
                sh9Var.r(dr9Var.a, g08Var.b);
                break;
            case 8:
                m45Var.invoke();
                sh9Var.t(dr9Var.a, g08Var.b);
                break;
            case 9:
                m45Var.invoke();
                sh9Var.P(dr9Var.a, g08Var.b);
                break;
            case 10:
                m45Var.invoke();
                sh9Var.z(dr9Var.a, g08Var.b);
                break;
            case 11:
                m45Var.invoke();
                sh9Var.p(dr9Var.a, g08Var.b);
                break;
            case 12:
                m45Var.invoke();
                sh9Var.e(dr9Var.a, g08Var.b);
                break;
            case 13:
                m45Var.invoke();
                sh9Var.n(dr9Var.a, g08Var.b);
                break;
            case 14:
                m45Var.invoke();
                sh9Var.s(dr9Var.a, g08Var.b);
                break;
            case 15:
                m45Var.invoke();
                String str3 = dr9Var.a;
                rq9 rq9Var3 = dr9Var.j;
                String str4 = rq9Var3 != null ? rq9Var3.a : null;
                if (str4 == null) {
                    ay0.e("Don't show the PostFeaturingState without providing a collection id");
                } else {
                    sh9Var.b(g08Var.b, str3, str4);
                }
                break;
            case 16:
                m45Var.invoke();
                String str5 = dr9Var.a;
                rq9 rq9Var4 = dr9Var.j;
                String str6 = rq9Var4 != null ? rq9Var4.a : null;
                if (str6 == null) {
                    ay0.e("Don't show the PostFeaturingState without providing a collection id");
                } else {
                    sh9Var.c(g08Var.b, str5, str6);
                }
                break;
            case 17:
                m45Var.invoke();
                pq9 pq9Var = dr9Var.i;
                String str7 = pq9Var.g;
                String str8 = pq9Var.a;
                if (str7 == null) {
                    sh9Var.C(str8, g08Var.b);
                } else {
                    sh9Var.N(g08Var.b, str8, str7);
                }
                break;
            case 18:
                m45Var.invoke();
                pq9 pq9Var2 = dr9Var.i;
                sh9Var.w(g08Var.b, pq9Var2.a, pq9Var2.g);
                break;
            case 19:
                m45Var.invoke();
                rq9 rq9Var5 = dr9Var.j;
                String str9 = rq9Var5 != null ? rq9Var5.a : null;
                if (str9 == null) {
                    ay0.e("Don't show the Collection follow state without providing a collection id");
                } else {
                    sh9Var.y(str9, g08Var.b);
                }
                break;
            default:
                m45Var.invoke();
                rq9 rq9Var6 = dr9Var.j;
                String str10 = rq9Var6 != null ? rq9Var6.a : null;
                if (str10 == null) {
                    ay0.e("Don't show the Collection follow state without providing a collection id");
                } else {
                    sh9Var.O(str10, g08Var.b);
                }
                break;
        }
        return null;
    }

    public /* synthetic */ wj9(m45 m45Var, sh9 sh9Var, dr9 dr9Var, g08 g08Var, int i) {
        this.a = i;
        this.b = m45Var;
        this.c = sh9Var;
        this.d = dr9Var;
        this.e = g08Var;
    }
}
