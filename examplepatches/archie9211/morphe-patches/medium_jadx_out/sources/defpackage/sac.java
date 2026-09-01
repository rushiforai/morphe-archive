package defpackage;

import com.medium.android.core.susi.SusiDestination;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sac {
    public final uid a;
    public final rac b;
    public final boolean c;
    public final String d;
    public final SusiDestination e;

    public sac(uid uidVar, rac racVar, boolean z, String str, SusiDestination susiDestination) {
        uidVar.getClass();
        str.getClass();
        this.a = uidVar;
        this.b = racVar;
        this.c = z;
        this.d = str;
        this.e = susiDestination;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sac)) {
            return false;
        }
        sac sacVar = (sac) obj;
        return g76.L(this.a, sacVar.a) && this.b == sacVar.b && this.c == sacVar.c && g76.L(this.d, sacVar.d) && g76.L(this.e, sacVar.e);
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        rac racVar = this.b;
        int iO = wgd.o((((iHashCode + (racVar == null ? 0 : racVar.hashCode())) * 31) + (this.c ? 1231 : 1237)) * 31, 31, this.d);
        SusiDestination susiDestination = this.e;
        return iO + (susiDestination != null ? susiDestination.hashCode() : 0);
    }

    public final String toString() {
        return "Content(email=" + this.a + ", emailErrorState=" + this.b + ", canSubmit=" + this.c + ", source=" + this.d + ", susiDestination=" + this.e + ")";
    }
}
