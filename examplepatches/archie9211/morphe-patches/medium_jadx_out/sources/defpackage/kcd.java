package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class kcd implements ncd {
    public final List a;
    public final boolean b;

    public kcd(List list, boolean z) {
        this.a = list;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kcd)) {
            return false;
        }
        kcd kcdVar = (kcd) obj;
        return this.a.equals(kcdVar.a) && this.b == kcdVar.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Content(tagPillUiModels=" + this.a + ", isLoadingMore=" + this.b + ")";
    }
}
