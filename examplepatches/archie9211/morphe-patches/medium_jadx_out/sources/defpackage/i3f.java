package defpackage;

import java.util.HashMap;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i3f {
    public final b72 a;
    public int b;
    public int c;
    public int d;
    public int e;
    public float f;
    public float g;
    public float h;
    public float i;
    public float j;
    public float k;
    public float l;
    public float m;
    public float n;
    public float o;
    public float p;
    public int q;
    public final HashMap r;

    public i3f(i3f i3fVar) {
        this.a = null;
        this.b = 0;
        this.c = 0;
        this.d = 0;
        this.e = 0;
        this.f = Float.NaN;
        this.g = Float.NaN;
        this.h = Float.NaN;
        this.i = Float.NaN;
        this.j = Float.NaN;
        this.k = Float.NaN;
        this.l = Float.NaN;
        this.m = Float.NaN;
        this.n = Float.NaN;
        this.o = Float.NaN;
        this.p = Float.NaN;
        this.q = 0;
        this.r = new HashMap();
        this.a = i3fVar.a;
        this.b = i3fVar.b;
        this.c = i3fVar.c;
        this.d = i3fVar.d;
        this.e = i3fVar.e;
        c(i3fVar);
    }

    public static void a(StringBuilder sb, int i, String str) {
        sb.append(str);
        sb.append(": ");
        sb.append(i);
        sb.append(",\n");
    }

    public static void b(StringBuilder sb, String str, float f) {
        if (Float.isNaN(f)) {
            return;
        }
        sb.append(str);
        sb.append(": ");
        sb.append(f);
        sb.append(",\n");
    }

    public final void c(i3f i3fVar) {
        if (i3fVar == null) {
            return;
        }
        this.f = i3fVar.f;
        this.g = i3fVar.g;
        this.h = i3fVar.h;
        this.i = i3fVar.i;
        this.j = i3fVar.j;
        this.k = i3fVar.k;
        this.l = i3fVar.l;
        this.m = i3fVar.m;
        this.n = i3fVar.n;
        this.o = i3fVar.o;
        this.p = i3fVar.p;
        this.q = i3fVar.q;
        HashMap map = this.r;
        map.clear();
        for (jm2 jm2Var : i3fVar.r.values()) {
            String str = jm2Var.a;
            jm2 jm2Var2 = new jm2();
            jm2Var2.c = Integer.MIN_VALUE;
            jm2Var2.d = Float.NaN;
            jm2Var2.a = str;
            jm2Var2.b = jm2Var.b;
            jm2Var2.c = jm2Var.c;
            jm2Var2.d = jm2Var.d;
            map.put(str, jm2Var2);
        }
    }

    public i3f(b72 b72Var) {
        this.a = null;
        this.b = 0;
        this.c = 0;
        this.d = 0;
        this.e = 0;
        this.f = Float.NaN;
        this.g = Float.NaN;
        this.h = Float.NaN;
        this.i = Float.NaN;
        this.j = Float.NaN;
        this.k = Float.NaN;
        this.l = Float.NaN;
        this.m = Float.NaN;
        this.n = Float.NaN;
        this.o = Float.NaN;
        this.p = Float.NaN;
        this.q = 0;
        this.r = new HashMap();
        this.a = b72Var;
    }
}
