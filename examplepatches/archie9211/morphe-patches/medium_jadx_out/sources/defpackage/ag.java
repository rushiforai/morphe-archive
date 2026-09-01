package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ag extends bg {
    public final int a;

    public ag(int i) {
        this.a = i;
    }

    @Override // defpackage.bg
    public final int a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof ag) && this.a == ((ag) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("Loading(total=", this.a, ")");
    }
}
