package sx;

/* loaded from: classes4.dex */
public final class m {

    /* renamed from: a, reason: collision with root package name */
    public final long f87804a;

    /* renamed from: b, reason: collision with root package name */
    public final int f87805b;

    public m(long j11, int i5) {
        this.f87804a = j11;
        this.f87805b = i5;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m)) {
            return false;
        }
        m mVar = (m) obj;
        return this.f87804a == mVar.f87804a && this.f87805b == mVar.f87805b;
    }

    public final int hashCode() {
        return Integer.hashCode(this.f87805b) + (Long.hashCode(this.f87804a) * 31);
    }

    public final String toString() {
        return "DroppedTierState(droppedAt=" + this.f87804a + ", requestsSinceDrop=" + this.f87805b + ")";
    }
}
