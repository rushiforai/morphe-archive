package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class u18 {
    public final ovb a = ovb.Inherit;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof u18) {
            return this.a == ((u18) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + 1231) * 29791) + 1231;
    }
}
