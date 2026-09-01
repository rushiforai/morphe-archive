package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class vc8 {
    public final int a;
    public final long b;
    public final Long c;
    public final String d;
    public final String e;
    public final String f;

    public vc8(int i, long j, Long l, String str, String str2, String str3) {
        this.a = i;
        this.b = j;
        this.c = l;
        this.d = str;
        this.e = str2;
        this.f = str3;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vc8)) {
            return false;
        }
        vc8 vc8Var = (vc8) obj;
        return this.a == vc8Var.a && this.b == vc8Var.b && g76.L(this.c, vc8Var.c) && this.d.equals(vc8Var.d) && this.e.equals(vc8Var.e) && this.f.equals(vc8Var.f);
    }

    public final int hashCode() {
        int i = this.a * 31;
        long j = this.b;
        int i2 = (i + ((int) (j ^ (j >>> 32)))) * 31;
        Long l = this.c;
        return this.f.hashCode() + wgd.o(wgd.o((i2 + (l == null ? 0 : l.hashCode())) * 31, 31, this.d), 31, this.e);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NdkCrashLog(signal=");
        sb.append(this.a);
        sb.append(", timestamp=");
        sb.append(this.b);
        sb.append(", timeSinceAppStartMs=");
        sb.append(this.c);
        sb.append(", signalName=");
        sb.append(this.d);
        ka1.C(sb, ", message=", this.e, ", stacktrace=", this.f);
        sb.append(")");
        return sb.toString();
    }
}
