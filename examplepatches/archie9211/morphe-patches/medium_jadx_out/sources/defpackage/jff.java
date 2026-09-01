package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jff {
    public final md9 a;

    public jff(s43 s43Var) {
        s43Var.getClass();
        this.a = s43Var;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jff) && this.a.equals(((jff) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return lv8.p("PostActionEvent(postAction=", this.a, ")");
    }
}
