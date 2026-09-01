package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public abstract class jv1 {
    public final String a;
    public final long b;
    public final int c;

    public jv1(String str, int i, long j) {
        this.a = str;
        this.b = j;
        this.c = i;
        if (str.length() == 0) {
            ay0.e("The name of a color space cannot be null and must contain at least 1 character");
            throw null;
        }
        if (i < -1 || i > 63) {
            ay0.e("The id must be between -1 and 63");
            throw null;
        }
    }

    public abstract float a(int i);

    public abstract float b(int i);

    public boolean c() {
        return false;
    }

    public abstract long d(float f, float f2, float f3);

    public abstract float e(float f, float f2, float f3);

    public boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        jv1 jv1Var = (jv1) obj;
        if (this.c == jv1Var.c && this.a.equals(jv1Var.a)) {
            return rv8.y(this.b, jv1Var.b);
        }
        return false;
    }

    public abstract long f(float f, float f2, float f3, float f4, jv1 jv1Var);

    public int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        long j = this.b;
        return ((iHashCode + ((int) (j ^ (j >>> 32)))) * 31) + this.c;
    }

    public final String toString() {
        return this.a + " (id=" + this.c + ", model=" + ((Object) rv8.S(this.b)) + ')';
    }
}
