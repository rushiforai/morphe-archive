package defpackage;

import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class hnd implements fnd {
    public final String a;
    public final boolean b;
    public final SourceParameter c;

    public hnd(SourceParameter sourceParameter, String str, boolean z) {
        str.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = z;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hnd)) {
            return false;
        }
        hnd hndVar = (hnd) obj;
        return g76.L(this.a, hndVar.a) && this.b == hndVar.b && g76.L(this.c, hndVar.c);
    }

    public final int hashCode() {
        return this.c.hashCode() + (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return y30.r(ev6.D("TogglePinMaxPinnedStoriesReached(postId=", this.a, ", isPinned=", ", sourceParameter=", this.b), this.c, ")");
    }
}
