package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class xi {
    public final ok7 a;

    public xi(ok7 ok7Var) {
        ok7Var.getClass();
        this.a = ok7Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof xi) && g76.L(this.a, ((xi) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "TopicActionEvent(tagAction=" + this.a + ")";
    }
}
