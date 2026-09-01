package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class oy {
    public final ly a;

    public oy(ly lyVar) {
        lyVar.getClass();
        this.a = lyVar;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof oy) {
            return g76.L(((oy) obj).a, this.a);
        }
        return false;
    }

    public final int hashCode() {
        return this.a.hashCode();
    }
}
