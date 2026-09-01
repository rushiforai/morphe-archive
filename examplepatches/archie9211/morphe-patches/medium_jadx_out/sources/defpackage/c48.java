package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c48 {
    public final long a;

    public final boolean equals(Object obj) {
        if (obj instanceof c48) {
            return this.a == ((c48) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        long j = this.a;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        return "IndirectPointerEventData(packedValue=" + this.a + ')';
    }
}
