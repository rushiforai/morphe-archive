package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class f2a {
    public final int a;

    public f2a(int i) {
        this.a = i;
    }

    public final boolean equals(Object obj) {
        if (obj instanceof f2a) {
            return this.a == ((f2a) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }
}
