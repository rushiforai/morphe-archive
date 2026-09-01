package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ule implements xle {
    public final t7b a;

    public ule(t7b t7bVar) {
        t7bVar.getClass();
        this.a = t7bVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ule) && g76.L(this.a, ((ule) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "RepostActionEvent(repostAction=" + this.a + ")";
    }
}
