package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class x06 {
    public final int a;

    public final boolean equals(Object obj) {
        if (obj instanceof x06) {
            return this.a == ((x06) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.u("IndirectPointerEventPrimaryDirectionalMotionAxis(value=", this.a, ')');
    }
}
