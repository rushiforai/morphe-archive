package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tn6 implements Comparable {
    public static final tn6 e = new tn6(2, 2, 21);
    public final int a;
    public final int b;
    public final int c;
    public final int d;

    public tn6(int i, int i2, int i3) {
        this.a = i;
        this.b = i2;
        this.c = i3;
        if (i >= 0 && i < 256 && i2 >= 0 && i2 < 256 && i3 >= 0 && i3 < 256) {
            this.d = (i << 16) + (i2 << 8) + i3;
            return;
        }
        throw new IllegalArgumentException(("Version components are out of range: " + i + '.' + i2 + '.' + i3).toString());
    }

    @Override // java.lang.Comparable
    public final int compareTo(Object obj) {
        tn6 tn6Var = (tn6) obj;
        tn6Var.getClass();
        return this.d - tn6Var.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        tn6 tn6Var = obj instanceof tn6 ? (tn6) obj : null;
        return tn6Var != null && this.d == tn6Var.d;
    }

    public final int hashCode() {
        return this.d;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder();
        sb.append(this.a);
        sb.append('.');
        sb.append(this.b);
        sb.append('.');
        sb.append(this.c);
        return sb.toString();
    }
}
