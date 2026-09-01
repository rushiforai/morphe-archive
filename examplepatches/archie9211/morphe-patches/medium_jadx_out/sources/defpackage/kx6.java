package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kx6 {
    public final k49 A;
    public final k49 B;
    public i00 a;
    public final mwa b;
    public final akc c;
    public final lig d;
    public ejd e;
    public final k49 f;
    public final k49 g;
    public hp6 h;
    public final k49 i;
    public mx j;
    public final k49 k;
    public final k49 l;
    public final k49 m;
    public final k49 n;
    public final k49 o;
    public boolean p;
    public final k49 q;
    public final ok6 r;
    public final k49 s;
    public final k49 t;
    public x45 u;
    public final qa2 v;
    public final qa2 w;
    public final qa2 x;
    public final uq y;
    public long z;

    public kx6(i00 i00Var, mwa mwaVar, akc akcVar) {
        this.a = i00Var;
        this.b = mwaVar;
        this.c = akcVar;
        lig ligVar = new lig(24);
        mx mxVar = ox.a;
        long j = bkd.b;
        uid uidVar = new uid(mxVar, j, (bkd) null);
        ligVar.b = uidVar;
        ligVar.c = new mu3(mxVar, uidVar.b);
        this.d = ligVar;
        Boolean bool = Boolean.FALSE;
        this.f = qo7.u(bool);
        this.g = qo7.u(new vj3(0.0f));
        this.i = qo7.u(null);
        this.k = qo7.u(ci5.None);
        this.l = qo7.u(bool);
        this.m = qo7.u(bool);
        this.n = qo7.u(bool);
        this.o = qo7.u(bool);
        this.p = true;
        this.q = qo7.u(Boolean.TRUE);
        this.r = new ok6(akcVar);
        this.s = qo7.u(bool);
        this.t = qo7.u(bool);
        this.u = new vx5(17);
        this.v = new qa2(this, 1);
        this.w = new qa2(this, 2);
        this.x = new qa2(this, 3);
        this.y = rx0.z();
        this.z = uu1.h;
        this.A = qo7.u(new bkd(j));
        this.B = qo7.u(new bkd(j));
    }

    public final ci5 a() {
        return (ci5) this.k.getValue();
    }

    public final boolean b() {
        return ((Boolean) this.f.getValue()).booleanValue();
    }

    public final hp6 c() {
        hp6 hp6Var = this.h;
        if (hp6Var == null || !hp6Var.m()) {
            return null;
        }
        return hp6Var;
    }

    public final rjd d() {
        return (rjd) this.i.getValue();
    }

    public final void e(long j) {
        this.B.setValue(new bkd(j));
    }

    public final void f(long j) {
        this.A.setValue(new bkd(j));
    }
}
