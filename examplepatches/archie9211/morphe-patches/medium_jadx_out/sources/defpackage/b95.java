package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class b95 implements c95 {
    public final Long a;
    public final Integer b;
    public final Integer c;
    public final Integer d;
    public final Integer e;
    public final List f;

    public b95(Long l, Integer num, Integer num2, Integer num3, Integer num4, List list) {
        this.a = l;
        this.b = num;
        this.c = num2;
        this.d = num3;
        this.e = num4;
        this.f = list;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof b95)) {
            return false;
        }
        b95 b95Var = (b95) obj;
        return g76.L(this.a, b95Var.a) && g76.L(this.b, b95Var.b) && g76.L(this.c, b95Var.c) && g76.L(this.d, b95Var.d) && g76.L(this.e, b95Var.e) && this.f.equals(b95Var.f);
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
        return this.f.hashCode() + ((iHashCode4 + (num4 != null ? num4.hashCode() : 0)) * 31);
    }

    public final String toString() {
        return "Success(accountCreatedAt=" + this.a + ", followers=" + this.b + ", subscribers=" + this.c + ", followersPreviousMonth=" + this.d + ", subscribersPreviousMonth=" + this.e + ", timeseries=" + this.f + ")";
    }
}
