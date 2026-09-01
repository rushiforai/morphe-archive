package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jt1 extends vv2 {
    public final bo4 u;

    public jt1(bo4 bo4Var) {
        this.u = bo4Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jt1) && this.u.equals(((jt1) obj).u);
    }

    public final int hashCode() {
        return this.u.hashCode();
    }

    public final String toString() {
        return "Follow(state=" + this.u + ")";
    }
}
