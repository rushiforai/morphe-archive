package dx;

/* loaded from: classes4.dex */
public final class k implements n {

    /* renamed from: a, reason: collision with root package name */
    public final int f49732a;

    public k(int i5) {
        this.f49732a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof k) && this.f49732a == ((k) obj).f49732a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f49732a);
    }

    public final String toString() {
        return b.c0.i(this.f49732a, "Network(code=", ")");
    }
}
