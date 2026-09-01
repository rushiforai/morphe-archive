package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class i37 extends j37 {
    public final dt2 a;

    public i37(dt2 dt2Var) {
        this.a = dt2Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || i37.class != obj.getClass()) {
            return false;
        }
        return this.a.equals(((i37) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode() + (i37.class.getName().hashCode() * 31);
    }

    public final String toString() {
        return "Success {mOutputData=" + this.a + '}';
    }
}
