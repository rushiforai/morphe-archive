package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final /* synthetic */ class vv1 implements x45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ int b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ vv1(int i, int i2, Object obj, Object obj2, Object obj3, Object obj4) {
        this.a = i2;
        this.c = obj;
        this.d = obj2;
        this.b = i;
        this.e = obj3;
        this.f = obj4;
    }

    @Override // defpackage.x45
    public final Object invoke(Object obj) {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj2 = this.f;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                t99[] t99VarArr = (t99[]) obj5;
                wv1 wv1Var = (wv1) obj4;
                bl7 bl7Var = (bl7) obj3;
                int[] iArr = (int[]) obj2;
                s99 s99Var = (s99) obj;
                int length = t99VarArr.length;
                int i2 = 0;
                int i3 = 0;
                while (i2 < length) {
                    t99 t99Var = t99VarArr[i2];
                    int i4 = i3 + 1;
                    t99Var.getClass();
                    Object objW = t99Var.w();
                    mmb mmbVar = objW instanceof mmb ? (mmb) objW : null;
                    ip6 layoutDirection = bl7Var.getLayoutDirection();
                    bo boVar = mmbVar != null ? mmbVar.c : null;
                    int i5 = this.b;
                    s99Var.g(t99Var, boVar != null ? boVar.y(i5, t99Var.a, layoutDirection) : wv1Var.b.a(t99Var.a, i5, layoutDirection), iArr[i3], 0.0f);
                    i2++;
                    i3 = i4;
                }
                return c1eVar;
            default:
                ohe oheVar = (ohe) obj5;
                khe kheVar = (khe) obj4;
                stc stcVar = (stc) obj3;
                sh9 sh9Var = (sh9) obj2;
                xu6 xu6Var = (xu6) obj;
                xu6Var.getClass();
                uhe uheVar = oheVar.c;
                int i6 = 2;
                if (uheVar instanceof rhe) {
                    ev6.j(xu6Var, "user_profile_posts_book_section", new mz1(new dyc(oheVar, 9, kheVar), true, 1467502184), 2);
                    ev6.j(xu6Var, "user_profile_posts_posts_header", kng.k, 2);
                } else if (uheVar instanceof the) {
                    ev6.j(xu6Var, "user_profile_posts_book_section", kng.l, 2);
                } else if (!(uheVar instanceof she)) {
                    ygf.a();
                    return null;
                }
                List list = oheVar.a;
                xu6Var.l0(list.size(), new j8e(new n2c(17), i6, list), new lba(list, 21), new mz1(new jhe(list, this.b, oheVar, stcVar, sh9Var, 0), true, 2039820996));
                if (oheVar.b) {
                    ev6.l(xu6Var, 10, new tjd(22), kng.m, 4);
                }
                return c1eVar;
        }
    }
}
