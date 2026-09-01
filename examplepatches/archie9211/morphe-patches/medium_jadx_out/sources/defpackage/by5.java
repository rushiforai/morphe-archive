package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class by5 {
    public static int k;
    public static final rz5 l = new rz5(18);
    public final String a;
    public final float b;
    public final float c;
    public final float d;
    public final float e;
    public final ere f;
    public final long g;
    public final int h;
    public final boolean i;
    public final int j;

    public by5(String str, float f, float f2, float f3, float f4, ere ereVar, long j, int i, boolean z) {
        int i2;
        synchronized (l) {
            i2 = k;
            k = i2 + 1;
        }
        this.a = str;
        this.b = f;
        this.c = f2;
        this.d = f3;
        this.e = f4;
        this.f = ereVar;
        this.g = j;
        this.h = i;
        this.i = z;
        this.j = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof by5)) {
            return false;
        }
        by5 by5Var = (by5) obj;
        if (!g76.L(this.a, by5Var.a) || !vj3.b(this.b, by5Var.b) || !vj3.b(this.c, by5Var.c) || this.d != by5Var.d || this.e != by5Var.e || !this.f.equals(by5Var.f)) {
            return false;
        }
        long j = by5Var.g;
        int i = uu1.i;
        return ezd.a(this.g, j) && this.h == by5Var.h && this.i == by5Var.i;
    }

    public final int hashCode() {
        int iHashCode = (this.f.hashCode() + km4.p(this.e, km4.p(this.d, km4.p(this.c, km4.p(this.b, this.a.hashCode() * 31, 31), 31), 31), 31)) * 31;
        int i = uu1.i;
        return ((lv8.g(iHashCode, 31, this.g) + this.h) * 31) + (this.i ? 1231 : 1237);
    }
}
