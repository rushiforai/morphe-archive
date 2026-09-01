package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class jj {
    public final g8e a;

    public jj(g8e g8eVar) {
        g8eVar.getClass();
        this.a = g8eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof jj) && g76.L(this.a, ((jj) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ho2.F("UserActionEvent(userAction=", this.a, ")");
    }
}
