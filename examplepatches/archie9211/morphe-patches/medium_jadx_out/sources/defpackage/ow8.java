package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ow8 extends er7 {
    public final zwa d;

    public ow8(zwa zwaVar) {
        this.d = zwaVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj instanceof ow8) {
            return this.d.equals(((ow8) obj).d);
        }
        return false;
    }

    public final int hashCode() {
        return this.d.hashCode();
    }

    @Override // defpackage.er7
    public final zwa x() {
        return this.d;
    }
}
