package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class r3e {
    public final Long a;
    public final Long b;

    public r3e(Long l, Long l2) {
        this.a = l;
        this.b = l2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof r3e)) {
            return false;
        }
        r3e r3eVar = (r3e) obj;
        return g76.L(this.a, r3eVar.a) && g76.L(this.b, r3eVar.b);
    }

    public final int hashCode() {
        Long l = this.a;
        int iHashCode = (l == null ? 0 : l.hashCode()) * 31;
        Long l2 = this.b;
        return iHashCode + (l2 != null ? l2.hashCode() : 0);
    }

    public final String toString() {
        return "UpVotersGlobalData(clapCount=" + this.a + ", votersCount=" + this.b + ")";
    }
}
