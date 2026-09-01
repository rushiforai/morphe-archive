package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class u3e {
    public final g8e a;

    public u3e(g8e g8eVar) {
        g8eVar.getClass();
        this.a = g8eVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof u3e) && g76.L(this.a, ((u3e) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ho2.F("UserActionEvent(userAction=", this.a, ")");
    }
}
