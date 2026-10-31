package be;

/* loaded from: classes.dex */
public final class b {

    /* renamed from: a, reason: collision with root package name */
    public final long f17831a;

    /* renamed from: b, reason: collision with root package name */
    public final td.i f17832b;

    /* renamed from: c, reason: collision with root package name */
    public final td.h f17833c;

    public b(long j11, td.i iVar, td.h hVar) {
        this.f17831a = j11;
        this.f17832b = iVar;
        this.f17833c = hVar;
    }

    public final boolean equals(Object obj) {
        if (obj == this) {
            return true;
        }
        if (!(obj instanceof b)) {
            return false;
        }
        b bVar = (b) obj;
        return this.f17831a == bVar.f17831a && this.f17832b.equals(bVar.f17832b) && this.f17833c.equals(bVar.f17833c);
    }

    public final int hashCode() {
        long j11 = this.f17831a;
        return ((((((int) ((j11 >>> 32) ^ j11)) ^ 1000003) * 1000003) ^ this.f17832b.hashCode()) * 1000003) ^ this.f17833c.hashCode();
    }

    public final String toString() {
        return "PersistedEvent{id=" + this.f17831a + ", transportContext=" + this.f17832b + ", event=" + this.f17833c + "}";
    }
}
