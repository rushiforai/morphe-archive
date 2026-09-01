package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class w1d implements y1d {
    public final ok7 a;

    public w1d(ok7 ok7Var) {
        ok7Var.getClass();
        this.a = ok7Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof w1d) && g76.L(this.a, ((w1d) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "TagActionEvent(tagAction=" + this.a + ")";
    }
}
