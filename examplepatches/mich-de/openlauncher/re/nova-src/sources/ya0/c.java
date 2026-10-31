package ya0;

/* loaded from: classes.dex */
public abstract class c {

    /* renamed from: d, reason: collision with root package name */
    public static long f97222d;

    /* renamed from: a, reason: collision with root package name */
    public final long f97223a;

    /* renamed from: b, reason: collision with root package name */
    public long f97224b = 0;

    /* renamed from: c, reason: collision with root package name */
    public long f97225c = 1;

    public c() {
        long j11 = f97222d;
        f97222d = 1 + j11;
        this.f97223a = j11;
    }

    public abstract String a();

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || getClass() != obj.getClass()) {
            return false;
        }
        c cVar = (c) obj;
        return this.f97224b == cVar.f97224b && this.f97225c == cVar.f97225c;
    }

    public final int hashCode() {
        return Long.hashCode(this.f97223a) + 31;
    }

    public final String toString() {
        return a();
    }
}
