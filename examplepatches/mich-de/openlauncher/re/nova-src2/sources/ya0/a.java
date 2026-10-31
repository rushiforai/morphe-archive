package ya0;

import b.c0;
import java.util.Objects;

/* loaded from: classes5.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public long f97219a;

    /* renamed from: b, reason: collision with root package name */
    public long f97220b;

    /* renamed from: c, reason: collision with root package name */
    public c f97221c;

    public final long a() {
        return this.f97219a;
    }

    public final long b() {
        long jAbs = Math.abs(this.f97219a);
        long j11 = this.f97220b;
        return (j11 == 0 || Math.abs((((double) j11) / ((double) this.f97221c.f97225c)) * 100.0d) <= ((double) 50)) ? jAbs : jAbs + 1;
    }

    public final c c() {
        return this.f97221c;
    }

    public final boolean d() {
        return !e();
    }

    public final boolean e() {
        return this.f97219a < 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || a.class != obj.getClass()) {
            return false;
        }
        a aVar = (a) obj;
        if (this.f97220b == aVar.f97220b && this.f97219a == aVar.f97219a) {
            return Objects.equals(this.f97221c, aVar.f97221c);
        }
        return false;
    }

    public final void f(long j11) {
        this.f97220b = j11;
    }

    public final void g(long j11) {
        this.f97219a = j11;
    }

    public final void h(c cVar) {
        this.f97221c = cVar;
    }

    public final int hashCode() {
        return Objects.hashCode(this.f97221c) + c0.d(c0.d(31, 31, this.f97220b), 31, this.f97219a);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DurationImpl [");
        sb2.append(this.f97219a);
        sb2.append(" ");
        sb2.append(this.f97221c);
        sb2.append(", delta=");
        return a2.c.i(this.f97220b, "]", sb2);
    }
}
