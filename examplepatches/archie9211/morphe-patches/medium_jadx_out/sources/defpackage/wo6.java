package defpackage;

import java.util.List;
import java.util.Locale;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wo6 {
    public final List a;
    public final bc7 b;
    public final String c;
    public final long d;
    public final uo6 e;
    public final long f;
    public final String g;
    public final List h;
    public final vu i;
    public final int j;
    public final int k;
    public final int l;
    public final float m;
    public final float n;
    public final float o;
    public final float p;
    public final pu q;
    public final s26 r;
    public final qu s;
    public final List t;
    public final vo6 u;
    public final boolean v;
    public final pkf w;
    public final iq1 x;
    public final zn6 y;

    public wo6(List list, bc7 bc7Var, String str, long j, uo6 uo6Var, long j2, String str2, List list2, vu vuVar, int i, int i2, int i3, float f, float f2, float f3, float f4, pu puVar, s26 s26Var, List list3, vo6 vo6Var, qu quVar, boolean z, pkf pkfVar, iq1 iq1Var, zn6 zn6Var) {
        this.a = list;
        this.b = bc7Var;
        this.c = str;
        this.d = j;
        this.e = uo6Var;
        this.f = j2;
        this.g = str2;
        this.h = list2;
        this.i = vuVar;
        this.j = i;
        this.k = i2;
        this.l = i3;
        this.m = f;
        this.n = f2;
        this.o = f3;
        this.p = f4;
        this.q = puVar;
        this.r = s26Var;
        this.t = list3;
        this.u = vo6Var;
        this.s = quVar;
        this.v = z;
        this.w = pkfVar;
        this.x = iq1Var;
        this.y = zn6Var;
    }

    public final String a(String str) {
        int i;
        StringBuilder sb = new StringBuilder(str);
        sb.append(this.c);
        sb.append("\n");
        long j = this.f;
        bc7 bc7Var = this.b;
        wo6 wo6Var = (wo6) bc7Var.i.d(j);
        if (wo6Var != null) {
            sb.append("\t\tParents: ");
            sb.append(wo6Var.c);
            for (wo6 wo6Var2 = (wo6) bc7Var.i.d(wo6Var.f); wo6Var2 != null; wo6Var2 = (wo6) bc7Var.i.d(wo6Var2.f)) {
                sb.append("->");
                sb.append(wo6Var2.c);
            }
            sb.append(str);
            sb.append("\n");
        }
        List list = this.h;
        if (!list.isEmpty()) {
            sb.append(str);
            sb.append("\tMasks: ");
            sb.append(list.size());
            sb.append("\n");
        }
        int i2 = this.j;
        if (i2 != 0 && (i = this.k) != 0) {
            sb.append(str);
            sb.append("\tBackground: ");
            sb.append(String.format(Locale.US, "%dx%d %X\n", Integer.valueOf(i2), Integer.valueOf(i), Integer.valueOf(this.l)));
        }
        List list2 = this.a;
        if (!list2.isEmpty()) {
            sb.append(str);
            sb.append("\tShapes:\n");
            for (Object obj : list2) {
                sb.append(str);
                sb.append("\t\t");
                sb.append(obj);
                sb.append("\n");
            }
        }
        return sb.toString();
    }

    public final String toString() {
        return a("");
    }
}
