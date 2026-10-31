package tx;

/* loaded from: classes4.dex */
public final class i4 extends n4 {

    /* renamed from: a, reason: collision with root package name */
    public final int f89811a;

    public i4(int i5) {
        this.f89811a = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof i4) && this.f89811a == ((i4) obj).f89811a;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f89811a) * 31;
    }

    public final String toString() {
        return b.c0.i(this.f89811a, "Error(attemptCount=", ", lastReason=null)");
    }
}
