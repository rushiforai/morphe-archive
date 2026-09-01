package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class f0f implements g0f {
    public final Long a;
    public final int b;
    public final Integer c;
    public final boolean d;

    public f0f(Long l, int i, Integer num, boolean z) {
        this.a = l;
        this.b = i;
        this.c = num;
        this.d = z;
    }

    public static f0f a(f0f f0fVar, boolean z) {
        Long l = f0fVar.a;
        int i = f0fVar.b;
        Integer num = f0fVar.c;
        f0fVar.getClass();
        return new f0f(l, i, num, z);
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof f0f)) {
            return false;
        }
        f0f f0fVar = (f0f) obj;
        return g76.L(this.a, f0fVar.a) && this.b == f0fVar.b && g76.L(this.c, f0fVar.c) && this.d == f0fVar.d;
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = (((l == null ? 0 : l.hashCode()) * 31) + this.b) * 31;
        Integer num = this.c;
        return ((iHashCode + (num != null ? num.hashCode() : 0)) * 31) + (this.d ? 1231 : 1237);
    }

    public final String toString() {
        return "Success(accountCreatedAt=" + this.a + ", subscriberCount=" + this.b + ", subscribersPreviousMonth=" + this.c + ", isRefreshing=" + this.d + ")";
    }
}
