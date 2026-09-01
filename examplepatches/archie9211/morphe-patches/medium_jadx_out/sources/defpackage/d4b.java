package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class d4b extends kp7 {
    public final int e;

    public d4b(int i) {
        this.e = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof d4b) && this.e == ((d4b) obj).e;
    }

    public final int hashCode() {
        return this.e;
    }

    public final String toString() {
        return b09.w(this.e, "intake-code-");
    }
}
