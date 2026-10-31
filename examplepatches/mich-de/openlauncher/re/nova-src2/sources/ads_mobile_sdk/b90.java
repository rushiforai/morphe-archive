package ads_mobile_sdk;

import android.app.Activity;
import android.content.Context;
import android.view.View;
import b.d0;
import b.k9;
import b.x3;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import tm.o;

/* loaded from: classes2.dex */
public final class b90 implements b.z {

    /* renamed from: a, reason: collision with root package name */
    public final r80 f1325a;

    /* renamed from: b, reason: collision with root package name */
    public final o f1326b;

    /* renamed from: c, reason: collision with root package name */
    public Context f1327c;

    /* renamed from: d, reason: collision with root package name */
    public View f1328d;

    /* renamed from: e, reason: collision with root package name */
    public Activity f1329e;

    /* renamed from: f, reason: collision with root package name */
    public String f1330f;

    /* renamed from: g, reason: collision with root package name */
    public HashMap f1331g;

    /* renamed from: h, reason: collision with root package name */
    public x3 f1332h;

    /* renamed from: i, reason: collision with root package name */
    public sb3 f1333i;

    public b90(r80 r80Var, o oVar) {
        this.f1325a = r80Var;
        this.f1326b = oVar;
    }

    public final c90 a() {
        k9.A(Context.class, this.f1327c);
        k9.A(Map.class, this.f1331g);
        k9.A(x3.class, this.f1332h);
        k9.A(sb3.class, this.f1333i);
        Context context = this.f1327c;
        View view = this.f1328d;
        Activity activity = this.f1329e;
        String str = this.f1330f;
        HashMap map = this.f1331g;
        x3 x3Var = this.f1332h;
        sb3 sb3Var = this.f1333i;
        c90 c90Var = new c90();
        c90Var.f1724c = hb1.a(sb3Var);
        hb1 hb1Var = hb1.f4275b;
        c90Var.f1725d = str == null ? hb1Var : new hb1(str);
        hb1 hb1VarA = hb1.a(x3Var);
        c90Var.f1726e = hb1VarA;
        o oVar = this.f1326b;
        b.m5 m5Var = (b.m5) oVar.f89495d;
        r80 r80Var = this.f1325a;
        hb1 hb1Var2 = r80Var.f8953b;
        b.m5 m5Var2 = r80Var.f8965s;
        c90Var.f1727f = new qg(hb1VarA, m5Var, hb1Var2, m5Var2, 1);
        c90Var.f1728g = new az1(hb1VarA, m5Var, m5Var2, 8);
        hb1 hb1VarA2 = hb1.a(map);
        c90Var.f1729h = hb1VarA2;
        hb1 hb1Var3 = c90Var.f1726e;
        b.m5 m5Var3 = (b.m5) oVar.f89495d;
        b.m5 m5Var4 = r80Var.f8965s;
        c90Var.f1730i = new z0(hb1Var3, m5Var3, hb1VarA2, m5Var4, 1);
        c90Var.f1731j = new en2((b.m5) hb1Var3, m5Var3, r80Var.f8961j, m5Var4);
        c90Var.f1732k = new mh3(hb1Var3, m5Var3, c90Var.f1724c, hb1VarA2, m5Var4, 0);
        c90Var.f1733l = new aj1(hb1Var3, m5Var3, m5Var4, 0);
        hb1 hb1VarA3 = hb1.a(context);
        c90Var.f1734m = hb1VarA3;
        hb1 hb1Var4 = c90Var.f1726e;
        b.m5 m5Var5 = (b.m5) oVar.f89495d;
        hb1 hb1Var5 = c90Var.f1724c;
        hb1 hb1Var6 = c90Var.f1729h;
        b.m5 m5Var6 = r80Var.f8965s;
        c90Var.n = new g8((b.m5) hb1Var4, m5Var5, (b.m5) hb1Var5, hb1VarA3, (b.m5) hb1Var6, m5Var6, 3);
        hb1 hb1Var7 = r80Var.f8953b;
        hb1 hb1Var8 = r80Var.f8961j;
        c90Var.o = new og(hb1Var4, m5Var5, hb1Var6, hb1Var7, hb1Var5, hb1Var8, m5Var6);
        c90Var.f1735p = new z0(hb1Var4, m5Var5, hb1Var7, m5Var6, 5);
        c90Var.f1736q = new er0((b.m5) hb1Var4, m5Var5, (b.m5) hb1Var6, hb1Var7, m5Var6);
        c90Var.f1737r = new z0(hb1Var4, hb1Var6, hb1Var8, m5Var6, 0);
        int i5 = r33.f8918c;
        int i11 = 11;
        List listQ = d0.q(11);
        List listQ2 = d0.q(0);
        listQ.add(c90Var.f1727f);
        listQ.add(c90Var.f1728g);
        listQ.add(c90Var.f1730i);
        listQ.add(c90Var.f1731j);
        listQ.add(c90Var.f1732k);
        listQ.add(c90Var.f1733l);
        listQ.add(c90Var.n);
        listQ.add(c90Var.o);
        listQ.add(c90Var.f1735p);
        listQ.add(c90Var.f1736q);
        listQ.add(c90Var.f1737r);
        c90Var.f1738s = new r33(listQ, listQ2);
        hb1 hb1Var9 = view == null ? hb1Var : new hb1(view);
        if (activity != null) {
            hb1Var = new hb1(activity);
        }
        hb1 hb1Var10 = hb1Var;
        hb1 hb1Var11 = c90Var.f1726e;
        b.m5 m5Var7 = (b.m5) oVar.f89495d;
        b.m5 m5Var8 = r80Var.f8965s;
        c90Var.f1739u = new r(hb1Var11, m5Var7, hb1Var9, hb1Var10, m5Var8);
        gj0 gj0Var = new gj0(new b(c90Var.f1734m, i11));
        c90Var.f1740v = gj0Var;
        c90Var.f1741w = new mh3(hb1Var11, m5Var7, gj0Var, hb1Var9, m5Var8, 1);
        c90Var.f1742x = new i9(hb1Var11, m5Var7, c90Var.f1729h, m5Var8, 1);
        List listQ3 = d0.q(12);
        List listQ4 = d0.q(0);
        listQ3.add(c90Var.f1727f);
        listQ3.add(c90Var.f1728g);
        listQ3.add(c90Var.f1731j);
        listQ3.add(c90Var.f1739u);
        listQ3.add(c90Var.f1741w);
        listQ3.add(c90Var.f1732k);
        listQ3.add(c90Var.f1733l);
        listQ3.add(c90Var.n);
        listQ3.add(c90Var.o);
        listQ3.add(c90Var.f1735p);
        listQ3.add(c90Var.f1736q);
        listQ3.add(c90Var.f1742x);
        c90Var.f1743y = new r33(listQ3, listQ4);
        hb1 hb1Var12 = c90Var.f1726e;
        b.m5 m5Var9 = (b.m5) oVar.f89495d;
        hb1 hb1Var13 = c90Var.f1729h;
        b.m5 m5Var10 = c90Var.f1740v;
        b.m5 m5Var11 = r80Var.f8965s;
        c90Var.f1744z = new cg3(hb1Var12, m5Var9, hb1Var13, m5Var10, m5Var11);
        c90Var.A = new is(hb1Var12, m5Var9, hb1Var13, c90Var.f1734m, m5Var11);
        List listQ5 = d0.q(13);
        List listQ6 = d0.q(0);
        listQ5.add(c90Var.f1727f);
        listQ5.add(c90Var.f1728g);
        listQ5.add(c90Var.f1731j);
        listQ5.add(c90Var.f1739u);
        listQ5.add(c90Var.f1741w);
        listQ5.add(c90Var.f1732k);
        listQ5.add(c90Var.f1733l);
        listQ5.add(c90Var.n);
        listQ5.add(c90Var.o);
        listQ5.add(c90Var.f1735p);
        listQ5.add(c90Var.f1736q);
        listQ5.add(c90Var.f1744z);
        listQ5.add(c90Var.A);
        c90Var.B = new gj0(new a83(r80Var.f8967u, r80Var.B, (b.m5) oVar.f89495d, c90Var.f1724c, c90Var.f1725d, c90Var.f1726e, c90Var.f1738s, c90Var.f1743y, new r33(listQ5, listQ6), r80Var.f8965s));
        return c90Var;
    }
}
