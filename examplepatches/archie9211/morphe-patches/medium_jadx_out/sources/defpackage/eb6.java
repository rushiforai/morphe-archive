package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class eb6 {
    public final Integer a;
    public final Object b;

    public eb6(Integer num, Object obj) {
        this.a = num;
        this.b = obj;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof eb6)) {
            return false;
        }
        eb6 eb6Var = (eb6) obj;
        return this.a.equals(eb6Var.a) && g76.L(this.b, eb6Var.b);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        Object obj = this.b;
        return (obj instanceof Enum ? ((Enum) obj).ordinal() : obj != null ? obj.hashCode() : 0) + iHashCode;
    }

    public final String toString() {
        return "JoinedKey(left=" + this.a + ", right=" + this.b + ')';
    }
}
