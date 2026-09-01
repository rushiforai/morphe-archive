package defpackage;

import android.content.Context;
import android.os.Build;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class tw2 implements yp {
    public final l01 a;
    public final vq6 b;
    public final vq6 c;
    public final vq6 d;
    public final vq6 e;
    public final vq6 f;
    public final vq6 g;
    public final String h;
    public final String i;
    public final String j;
    public final String k;
    public final vq6 l;
    public final vq6 m;
    public final vq6 n;
    public final w5d o;
    public final w5d p;
    public final w5d q;

    public tw2(Context context) {
        context.getClass();
        String str = Build.BRAND;
        str = str == null ? "" : str;
        String str2 = Build.MODEL;
        str2 = str2 == null ? "" : str2;
        String str3 = Build.ID;
        str3 = str3 == null ? "" : str3;
        String str4 = Build.VERSION.RELEASE;
        String str5 = str4 != null ? str4 : "";
        l01.a.getClass();
        this.a = k01.b;
        yw6 yw6Var = yw6.PUBLICATION;
        this.b = vx0.d0(yw6Var, new ma2(context, str2));
        this.c = vx0.d0(yw6Var, new rw2(this, 0));
        this.d = vx0.d0(yw6Var, new qw2(context, 1, this));
        this.e = vx0.d0(yw6Var, new qw2(context, 0, this));
        this.f = vx0.d0(yw6Var, ot2.u);
        this.g = vx0.d0(yw6Var, new hm0(str, 13));
        this.h = str2;
        this.i = str3;
        this.j = "Android";
        this.k = str5;
        this.l = vx0.d0(yw6Var, new rw2(this, 1));
        this.m = vx0.d0(yw6Var, ot2.s);
        this.n = vx0.d0(yw6Var, new sw2(context, 1));
        this.o = new w5d(ot2.t);
        this.p = new w5d(new sw2(context, 2));
        this.q = new w5d(new sw2(context, 0));
    }

    @Override // defpackage.yp
    public final Integer a() {
        return (Integer) this.n.getValue();
    }

    @Override // defpackage.yp
    public final int b() {
        return ((Number) this.o.getValue()).intValue();
    }

    @Override // defpackage.yp
    public final String d() {
        return (String) this.g.getValue();
    }

    @Override // defpackage.yp
    public final List e() {
        return (List) this.d.getValue();
    }

    @Override // defpackage.yp
    public final String g() {
        return (String) this.l.getValue();
    }

    @Override // defpackage.yp
    public final String i() {
        return (String) this.m.getValue();
    }

    @Override // defpackage.yp
    public final String j() {
        Object value = this.f.getValue();
        value.getClass();
        return (String) value;
    }

    @Override // defpackage.yp
    public final String k() {
        Object value = this.e.getValue();
        value.getClass();
        return (String) value;
    }

    @Override // defpackage.yp
    public final String l() {
        return (String) this.c.getValue();
    }

    @Override // defpackage.yp
    public final String m() {
        return this.i;
    }

    @Override // defpackage.yp
    public final String n() {
        return this.j;
    }

    @Override // defpackage.yp
    public final Boolean o() {
        return (Boolean) this.q.getValue();
    }

    @Override // defpackage.yp
    public final String p() {
        return this.h;
    }

    @Override // defpackage.yp
    public final String s() {
        return this.k;
    }

    @Override // defpackage.yp
    public final Integer t() {
        return (Integer) this.p.getValue();
    }

    @Override // defpackage.yp
    public final ya3 u() {
        return (ya3) this.b.getValue();
    }
}
