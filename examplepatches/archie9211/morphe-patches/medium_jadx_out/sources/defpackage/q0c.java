package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class q0c {
    public static final p0c Companion = new p0c();
    public final Boolean a;
    public final Double b;
    public final Integer c;
    public final Integer d;
    public final Long e;

    public /* synthetic */ q0c(int i, Boolean bool, Double d, Integer num, Integer num2, Long l) {
        if (31 != (i & 31)) {
            iq7.S(i, 31, o0c.a.a());
            throw null;
        }
        this.a = bool;
        this.b = d;
        this.c = num;
        this.d = num2;
        this.e = l;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof q0c)) {
            return false;
        }
        q0c q0cVar = (q0c) obj;
        return g76.L(this.a, q0cVar.a) && g76.L(this.b, q0cVar.b) && g76.L(this.c, q0cVar.c) && g76.L(this.d, q0cVar.d) && g76.L(this.e, q0cVar.e);
    }

    public final int hashCode() {
        Boolean bool = this.a;
        int iHashCode = (bool == null ? 0 : bool.hashCode()) * 31;
        Double d = this.b;
        int iHashCode2 = (iHashCode + (d == null ? 0 : d.hashCode())) * 31;
        Integer num = this.c;
        int iHashCode3 = (iHashCode2 + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.d;
        int iHashCode4 = (iHashCode3 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Long l = this.e;
        return iHashCode4 + (l != null ? l.hashCode() : 0);
    }

    public final String toString() {
        return "SessionConfigs(sessionsEnabled=" + this.a + ", sessionSamplingRate=" + this.b + ", sessionTimeoutSeconds=" + this.c + ", cacheDurationSeconds=" + this.d + ", cacheUpdatedTimeSeconds=" + this.e + ')';
    }

    public q0c(Boolean bool, Double d, Integer num, Integer num2, Long l) {
        this.a = bool;
        this.b = d;
        this.c = num;
        this.d = num2;
        this.e = l;
    }
}
