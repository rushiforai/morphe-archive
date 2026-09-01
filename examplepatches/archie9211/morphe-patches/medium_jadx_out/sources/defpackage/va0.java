package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class va0 {
    public final Long a;
    public final Integer b;
    public final Integer c;
    public final Integer d;
    public final Integer e;

    public va0(Long l, Integer num, Integer num2, Integer num3, Integer num4) {
        this.a = l;
        this.b = num;
        this.c = num2;
        this.d = num3;
        this.e = num4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof va0)) {
            return false;
        }
        va0 va0Var = (va0) obj;
        return g76.L(this.a, va0Var.a) && g76.L(this.b, va0Var.b) && g76.L(this.c, va0Var.c) && g76.L(this.d, va0Var.d) && g76.L(this.e, va0Var.e);
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = (l == null ? 0 : l.hashCode()) * 31;
        Integer num = this.b;
        int iHashCode2 = (iHashCode + (num == null ? 0 : num.hashCode())) * 31;
        Integer num2 = this.c;
        int iHashCode3 = (iHashCode2 + (num2 == null ? 0 : num2.hashCode())) * 31;
        Integer num3 = this.d;
        int iHashCode4 = (iHashCode3 + (num3 == null ? 0 : num3.hashCode())) * 31;
        Integer num4 = this.e;
        return iHashCode4 + (num4 != null ? num4.hashCode() : 0);
    }

    public final String toString() {
        return "AudienceAllTimeUiModel(from=" + this.a + ", followers=" + this.b + ", subscribers=" + this.c + ", followersPreviousMonth=" + this.d + ", subscribersPreviousMonth=" + this.e + ")";
    }
}
