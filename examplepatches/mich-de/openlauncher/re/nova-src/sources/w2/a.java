package w2;

import b.c9;

/* loaded from: classes2.dex */
public final class a {

    /* renamed from: a, reason: collision with root package name */
    public long f93641a;

    /* renamed from: b, reason: collision with root package name */
    public float f93642b;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof a)) {
            return false;
        }
        a aVar = (a) obj;
        return this.f93641a == aVar.f93641a && Float.compare(this.f93642b, aVar.f93642b) == 0;
    }

    public final int hashCode() {
        return Float.hashCode(this.f93642b) + (Long.hashCode(this.f93641a) * 31);
    }

    public final String toString() {
        StringBuilder sb2 = new StringBuilder("DataPointAtTime(time=");
        sb2.append(this.f93641a);
        sb2.append(", dataPoint=");
        return c9.k(sb2, this.f93642b, ')');
    }
}
