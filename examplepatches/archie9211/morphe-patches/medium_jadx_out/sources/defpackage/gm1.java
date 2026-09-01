package defpackage;

import android.net.Uri;
import com.medium.android.core.susi.SusiOperation;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final /* synthetic */ class gm1 implements m45 {
    public final /* synthetic */ int a;
    public final /* synthetic */ Object b;
    public final /* synthetic */ Object c;
    public final /* synthetic */ Object d;
    public final /* synthetic */ Object e;
    public final /* synthetic */ Object f;

    public /* synthetic */ gm1(h49 h49Var, l78 l78Var, h49 h49Var2, i49 i49Var, h49 h49Var3) {
        this.a = 0;
        this.c = h49Var;
        this.b = l78Var;
        this.d = h49Var2;
        this.f = i49Var;
        this.e = h49Var3;
    }

    @Override // defpackage.m45
    public final Object invoke() {
        int i = this.a;
        c1e c1eVar = c1e.a;
        Object obj = this.f;
        Object obj2 = this.b;
        Object obj3 = this.e;
        Object obj4 = this.d;
        Object obj5 = this.c;
        switch (i) {
            case 0:
                h49 h49Var = (h49) obj5;
                h49 h49Var2 = (h49) obj4;
                i49 i49Var = (i49) obj;
                h49 h49Var3 = (h49) obj3;
                h49Var.h(h49Var.g() + 1);
                ((l78) obj2).setValue(Boolean.TRUE);
                if (h49Var2.g() < 50) {
                    i49Var.h(i49Var.g() + 1);
                    h49Var2.h(h49Var2.g() + 1);
                    h49Var3.h(h49Var3.g() + 1);
                }
                break;
            case 1:
                jt4 jt4Var = (jt4) obj4;
                wu4 wu4Var = (wu4) obj3;
                l78 l78Var = (l78) obj;
                Boolean bool = Boolean.TRUE;
                ((l78) obj2).setValue(bool);
                if (!((Boolean) obj5).booleanValue()) {
                    l78Var.setValue(bool);
                    String strA = wu4Var.e.a();
                    String str = wu4Var.a;
                    if (str == null) {
                        ay0.e("Entity ID cannot be null");
                    } else {
                        jt4Var.S(wu4Var.f, strA, str);
                    }
                }
                break;
            case 2:
                to6 to6Var = (to6) obj5;
                vx0.c0(f76.F(to6Var), null, null, new so6(to6Var, (String) obj4, (String) obj3, (Uri) obj2, (SusiOperation) obj, null), 3);
                break;
            case 3:
                sh9 sh9Var = (sh9) obj4;
                dr9 dr9Var = (dr9) obj3;
                g08 g08Var = (g08) obj;
                ((m45) obj5).invoke();
                String str2 = dr9Var.a;
                String str3 = ((bk9) obj2).b;
                if (str3 == null) {
                    ay0.e("Required value was null.");
                } else {
                    Long l = dr9Var.f;
                    sh9Var.K(g08Var.b, str2, str3, l != null && l.longValue() > 0);
                }
                break;
            case 4:
                ((m45) obj5).invoke();
                ((sh9) obj4).A(((g08) obj).b, ((dr9) obj3).a, (String) obj2, false);
                break;
            default:
                ((k8b) obj5).l(((g08) obj2).b, ((j8b) obj4).b, ((i8b) obj3).g);
                ((m45) obj).invoke();
                break;
        }
        return c1eVar;
    }

    public /* synthetic */ gm1(Object obj, Object obj2, Object obj3, Object obj4, Object obj5, int i) {
        this.a = i;
        this.c = obj;
        this.d = obj2;
        this.e = obj3;
        this.b = obj4;
        this.f = obj5;
    }
}
