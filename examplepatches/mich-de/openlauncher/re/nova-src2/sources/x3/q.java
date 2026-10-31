package x3;

/* loaded from: classes.dex */
public final class q {

    /* renamed from: c, reason: collision with root package name */
    public static final q f95029c = new q(w20.h.j(0), w20.h.j(0));

    /* renamed from: a, reason: collision with root package name */
    public final long f95030a;

    /* renamed from: b, reason: collision with root package name */
    public final long f95031b;

    public q(long j11, long j12) {
        this.f95030a = j11;
        this.f95031b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q)) {
            return false;
        }
        q qVar = (q) obj;
        return y3.p.a(this.f95030a, qVar.f95030a) && y3.p.a(this.f95031b, qVar.f95031b);
    }

    public final int hashCode() {
        y3.q[] qVarArr = y3.p.f96616b;
        return Long.hashCode(this.f95031b) + (Long.hashCode(this.f95030a) * 31);
    }

    public final String toString() {
        return "TextIndent(firstLine=" + ((Object) y3.p.d(this.f95030a)) + ", restLine=" + ((Object) y3.p.d(this.f95031b)) + ')';
    }
}
