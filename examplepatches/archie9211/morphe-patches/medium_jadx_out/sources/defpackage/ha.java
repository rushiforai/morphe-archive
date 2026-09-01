package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ha implements ja {
    public final md9 a;

    public ha(md9 md9Var) {
        md9Var.getClass();
        this.a = md9Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ha) && g76.L(this.a, ((ha) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return lv8.p("PostActionEvent(postAction=", this.a, ")");
    }
}
