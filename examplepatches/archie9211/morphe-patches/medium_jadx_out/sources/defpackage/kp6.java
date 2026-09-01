package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kp6 {
    public final int a;
    public final int b;
    public final boolean c;

    public kp6(int i, int i2, boolean z) {
        this.a = i;
        this.b = i2;
        this.c = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kp6)) {
            return false;
        }
        kp6 kp6Var = (kp6) obj;
        return this.a == kp6Var.a && this.b == kp6Var.b && this.c == kp6Var.c;
    }

    public final int hashCode() {
        return (((this.a * 31) + this.b) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BidiRun(start=");
        sb.append(this.a);
        sb.append(", end=");
        sb.append(this.b);
        sb.append(", isRtl=");
        return ev6.A(sb, this.c, ')');
    }
}
