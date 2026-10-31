package tx;

/* loaded from: classes4.dex */
public final class m4 extends n4 {

    /* renamed from: a, reason: collision with root package name */
    public final int f89885a;

    public m4(int i5) {
        this.f89885a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof m4) && this.f89885a == ((m4) obj).f89885a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f89885a);
    }

    public final String toString() {
        return b.c0.i(this.f89885a, "Syncing(attempt=", ")");
    }
}
