package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zpd implements cqd {
    public final ArrayList a;
    public final boolean b;
    public final boolean c;
    public final wpd d;

    public zpd(ArrayList arrayList, boolean z, boolean z2, wpd wpdVar) {
        this.a = arrayList;
        this.b = z;
        this.c = z2;
        this.d = wpdVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof zpd)) {
            return false;
        }
        zpd zpdVar = (zpd) obj;
        return this.a.equals(zpdVar.a) && this.b == zpdVar.b && this.c == zpdVar.c && g76.L(this.d, zpdVar.d);
    }

    public final int hashCode() {
        int iHashCode = ((((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + 3) * 31;
        wpd wpdVar = this.d;
        return iHashCode + (wpdVar == null ? 0 : wpdVar.hashCode());
    }

    public final String toString() {
        return "Content(categories=" + this.a + ", isRefreshing=" + this.b + ", canContinue=" + this.c + ", minTopicsToFollow=3, progressText=" + this.d + ")";
    }
}
