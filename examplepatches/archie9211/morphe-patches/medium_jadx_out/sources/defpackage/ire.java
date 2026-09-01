package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ire extends gre {
    public final String a;
    public final List b;
    public final int c;
    public final ez0 d;
    public final float e;
    public final ez0 f;
    public final float g;
    public final float h;
    public final int i;
    public final int j;
    public final float k;
    public final float l;
    public final float m;
    public final float n;

    public ire(String str, List list, int i, ez0 ez0Var, float f, ez0 ez0Var2, float f2, float f3, int i2, int i3, float f4, float f5, float f6, float f7) {
        this.a = str;
        this.b = list;
        this.c = i;
        this.d = ez0Var;
        this.e = f;
        this.f = ez0Var2;
        this.g = f2;
        this.h = f3;
        this.i = i2;
        this.j = i3;
        this.k = f4;
        this.l = f5;
        this.m = f6;
        this.n = f7;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || ire.class != obj.getClass()) {
            return false;
        }
        ire ireVar = (ire) obj;
        return this.a.equals(ireVar.a) && g76.L(this.d, ireVar.d) && this.e == ireVar.e && g76.L(this.f, ireVar.f) && this.g == ireVar.g && this.h == ireVar.h && this.i == ireVar.i && this.j == ireVar.j && this.k == ireVar.k && this.l == ireVar.l && this.m == ireVar.m && this.n == ireVar.n && this.c == ireVar.c && g76.L(this.b, ireVar.b);
    }

    public final int hashCode() {
        int iP = wgd.p(this.a.hashCode() * 31, 31, this.b);
        ez0 ez0Var = this.d;
        int iP2 = km4.p(this.e, (iP + (ez0Var != null ? ez0Var.hashCode() : 0)) * 31, 31);
        ez0 ez0Var2 = this.f;
        return km4.p(this.n, km4.p(this.m, km4.p(this.l, km4.p(this.k, (((km4.p(this.h, km4.p(this.g, (iP2 + (ez0Var2 != null ? ez0Var2.hashCode() : 0)) * 31, 31), 31) + this.i) * 31) + this.j) * 31, 31), 31), 31), 31) + this.c;
    }
}
