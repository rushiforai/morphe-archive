package tf;

/* loaded from: classes3.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public final long f89056a;

    /* renamed from: b, reason: collision with root package name */
    public final long f89057b;

    public a(long j11, long j12) {
        this.f89056a = j11;
        this.f89057b = j12;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f89056a == aVar.f89056a && this.f89057b == aVar.f89057b;
    }

    public final int hashCode() {
        return (((int) this.f89056a) * 31) + ((int) this.f89057b);
    }
}
