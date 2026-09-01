package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class io8 extends qo7 {
    public final String f;

    public io8(String str) {
        str.getClass();
        this.f = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof io8) && g76.L(this.f, ((io8) obj).f);
    }

    public final int hashCode() {
        return this.f.hashCode();
    }

    public final String toString() {
        return ev6.x(HrUBqHumRuLe.FJAJz, this.f, ")");
    }
}
