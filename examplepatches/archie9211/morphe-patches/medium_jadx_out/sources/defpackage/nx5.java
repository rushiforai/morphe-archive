package defpackage;

import android.content.Context;
import java.util.Map;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class nx5 {
    public final Context a;
    public ox5 b;
    public Object c;
    public rfd d;
    public qx5 e;
    public boolean f;
    public Map g;
    public ib2 h;
    public ib2 i;
    public ib2 j;
    public j31 k;
    public j31 l;
    public cx7 m;
    public x45 n;
    public x45 o;
    public x45 p;
    public lfc q;
    public dqb r;
    public ux9 s;
    public Object t;

    public nx5(rx5 rx5Var, Context context) {
        this.a = context;
        this.b = rx5Var.v;
        this.c = rx5Var.b;
        this.d = rx5Var.c;
        this.e = rx5Var.d;
        this.g = rx5Var.e;
        px5 px5Var = rx5Var.u;
        this.h = px5Var.a;
        this.i = px5Var.b;
        this.j = px5Var.c;
        this.k = px5Var.d;
        this.l = px5Var.e;
        this.m = rx5Var.m;
        this.n = px5Var.f;
        this.o = px5Var.g;
        this.p = px5Var.h;
        this.q = px5Var.i;
        this.r = px5Var.j;
        this.s = px5Var.k;
        this.t = rx5Var.t;
    }

    public final rx5 a() {
        Map mapA0;
        r84 r84Var;
        Object obj = this.c;
        if (obj == null) {
            obj = ql8.a;
        }
        Object obj2 = obj;
        rfd rfdVar = this.d;
        qx5 qx5Var = this.e;
        Map map = this.g;
        if (g76.L(map, Boolean.valueOf(this.f))) {
            map.getClass();
            mapA0 = nk7.A0(pwd.y(map));
        } else {
            if (!(map instanceof Map)) {
                ywb.d();
                return null;
            }
            mapA0 = map;
        }
        Map map2 = mapA0;
        map2.getClass();
        ox5 ox5Var = this.b;
        ch4 ch4Var = ox5Var.a;
        j31 j31Var = this.k;
        if (j31Var == null) {
            j31Var = ox5Var.e;
        }
        j31 j31Var2 = j31Var;
        j31 j31Var3 = this.l;
        if (j31Var3 == null) {
            j31Var3 = ox5Var.f;
        }
        j31 j31Var4 = j31Var3;
        j31 j31Var5 = ox5Var.g;
        ib2 ib2Var = this.h;
        if (ib2Var == null) {
            ib2Var = ox5Var.b;
        }
        ib2 ib2Var2 = ib2Var;
        ib2 ib2Var3 = this.i;
        if (ib2Var3 == null) {
            ib2Var3 = ox5Var.c;
        }
        ib2 ib2Var4 = ib2Var3;
        ib2 ib2Var5 = this.j;
        if (ib2Var5 == null) {
            ib2Var5 = ox5Var.d;
        }
        ib2 ib2Var6 = ib2Var5;
        cx7 cx7Var = this.m;
        x45 x45Var = this.n;
        x45 x45Var2 = this.o;
        x45 x45Var3 = this.p;
        lfc lfcVar = this.q;
        if (lfcVar == null) {
            lfcVar = ox5Var.k;
        }
        lfc lfcVar2 = lfcVar;
        dqb dqbVar = this.r;
        if (dqbVar == null) {
            dqbVar = ox5Var.l;
        }
        dqb dqbVar2 = dqbVar;
        ux9 ux9Var = this.s;
        if (ux9Var == null) {
            ux9Var = ox5Var.m;
        }
        ux9 ux9Var2 = ux9Var;
        Object obj3 = this.t;
        if (obj3 instanceof p84) {
            r84Var = new r84(nk7.A0(((p84) obj3).a));
        } else {
            if (!(obj3 instanceof r84)) {
                ywb.d();
                return null;
            }
            r84Var = (r84) obj3;
        }
        return new rx5(this.a, obj2, rfdVar, qx5Var, map2, ch4Var, ib2Var2, ib2Var4, ib2Var6, j31Var2, j31Var4, j31Var5, cx7Var, x45Var, x45Var2, x45Var3, lfcVar2, dqbVar2, ux9Var2, r84Var, new px5(this.h, this.i, this.j, this.k, this.l, this.n, this.o, this.p, this.q, this.r, this.s), this.b);
    }

    public final p84 b() {
        Object obj = this.t;
        if (obj instanceof p84) {
            return (p84) obj;
        }
        if (!(obj instanceof r84)) {
            ywb.d();
            return null;
        }
        p84 p84Var = new p84((r84) obj);
        this.t = p84Var;
        return p84Var;
    }

    public final void c(cfc cfcVar) {
        this.q = new sva(cfcVar);
    }

    public nx5(Context context) {
        this.a = context;
        this.b = ox5.o;
        this.c = null;
        this.d = null;
        this.e = null;
        this.g = fy3.a;
        this.h = null;
        this.i = null;
        this.j = null;
        this.k = null;
        this.l = null;
        this.m = null;
        zkc zkcVar = zkc.s;
        this.n = zkcVar;
        this.o = zkcVar;
        this.p = zkcVar;
        this.q = null;
        this.r = null;
        this.s = null;
        this.t = r84.b;
    }
}
