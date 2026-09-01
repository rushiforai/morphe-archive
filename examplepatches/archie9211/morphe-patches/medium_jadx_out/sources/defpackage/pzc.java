package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class pzc implements rzc {
    public final String a;

    public pzc(String str) {
        str.getClass();
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof pzc) && g76.L(this.a, ((pzc) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.x(HrUBqHumRuLe.ncvowlFI, this.a, ")");
    }
}
