package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t35 {
    public final Long a;
    public final s35 b;
    public final long c;
    public final long d;

    public t35(Long l, s35 s35Var, long j, long j2) {
        s35Var.getClass();
        this.a = l;
        this.b = s35Var;
        this.c = j;
        this.d = j2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t35)) {
            return false;
        }
        t35 t35Var = (t35) obj;
        return g76.L(this.a, t35Var.a) && this.b == t35Var.b && this.c == t35Var.c && this.d == t35Var.d;
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = l == null ? 0 : l.hashCode();
        int iHashCode2 = this.b.hashCode();
        long j = this.c;
        int i = (((iHashCode2 + (iHashCode * 31)) * 31) + ((int) (j ^ (j >>> 32)))) * 31;
        long j2 = this.d;
        return i + ((int) (j2 ^ (j2 >>> 32)));
    }

    public final String toString() {
        return "FriendLinksUiModel(publishedAt=" + this.a + ", updateFrequency=" + this.b + ", viewViaAuthorFriendLinkCount=" + this.c + ", viewViaPremiumFriendLinkCount=" + this.d + ")";
    }
}
