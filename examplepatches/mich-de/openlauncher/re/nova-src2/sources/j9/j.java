package j9;

/* loaded from: classes2.dex */
public final class j {

    /* renamed from: a, reason: collision with root package name */
    public final long f69269a;

    /* renamed from: b, reason: collision with root package name */
    public final long f69270b;

    public j(long j11, long j12) {
        this.f69269a = j11;
        this.f69270b = j12;
    }

    public final boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (this == obj) {
            return true;
        }
        if (obj instanceof j) {
            j jVar = (j) obj;
            if (this.f69269a == jVar.f69269a && this.f69270b == jVar.f69270b) {
                return true;
            }
        }
        return false;
    }

    public final String toString() {
        return this.f69269a + "/" + this.f69270b;
    }
}
