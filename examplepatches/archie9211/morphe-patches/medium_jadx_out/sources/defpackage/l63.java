package defpackage;

import com.medium.proto.obv.post.DeltaType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class l63 implements z63 {
    public final int a;
    public final DeltaType b = DeltaType.REMOVE_SECTION_AT;

    public l63(int i) {
        this.a = i;
    }

    @Override // defpackage.z63
    public final DeltaType a() {
        return this.b;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l63) && this.a == ((l63) obj).a;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return ev6.w("RemoveSectionAt(index=", this.a, ")");
    }
}
