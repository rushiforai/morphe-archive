package m3;

/* loaded from: classes2.dex */
public final class w {

    /* renamed from: a, reason: collision with root package name */
    public final long f75984a;

    /* renamed from: b, reason: collision with root package name */
    public final long f75985b;

    /* renamed from: c, reason: collision with root package name */
    public final int f75986c;

    public w(int i5, long j11, long j12) {
        this.f75984a = j11;
        this.f75985b = j12;
        this.f75986c = i5;
        y3.q[] qVarArr = y3.p.f96616b;
        if ((j11 & 1095216660480L) == 0) {
            s3.a.a("width cannot be TextUnit.Unspecified");
        }
        if ((j12 & 1095216660480L) == 0) {
            s3.a.a("height cannot be TextUnit.Unspecified");
        }
    }

    public final long a() {
        return this.f75985b;
    }

    public final int b() {
        return this.f75986c;
    }

    public final long c() {
        return this.f75984a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof w)) {
            return false;
        }
        w wVar = (w) obj;
        return y3.p.a(this.f75984a, wVar.f75984a) && y3.p.a(this.f75985b, wVar.f75985b) && this.f75986c == wVar.f75986c;
    }

    public final int hashCode() {
        y3.q[] qVarArr = y3.p.f96616b;
        return Integer.hashCode(this.f75986c) + b.c0.d(Long.hashCode(this.f75984a) * 31, 31, this.f75985b);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Placeholder(width=");
        sb2.append((Object) y3.p.d(this.f75984a));
        sb2.append(", height=");
        sb2.append((Object) y3.p.d(this.f75985b));
        sb2.append(", placeholderVerticalAlign=");
        int i5 = this.f75986c;
        sb2.append((Object) (i5 == 1 ? "AboveBaseline" : i5 == 2 ? "Top" : i5 == 3 ? "Bottom" : i5 == 4 ? "Center" : i5 == 5 ? "TextTop" : i5 == 6 ? "TextBottom" : i5 == 7 ? "TextCenter" : "Invalid"));
        sb2.append(')');
        return sb2.toString();
    }
}
