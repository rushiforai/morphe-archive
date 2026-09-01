package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class we extends xe {
    public final int a;

    public we(int i) {
        this.a = i;
    }

    @Override // defpackage.xe
    public final int a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof we) && this.a == ((we) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("Loading(total=", this.a, ")");
    }
}
