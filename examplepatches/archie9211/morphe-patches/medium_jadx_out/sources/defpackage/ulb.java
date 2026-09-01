package defpackage;

import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ulb {
    public final String a;
    public final ArrayList b;
    public final long c;

    public ulb(String str, ArrayList arrayList, long j) {
        str.getClass();
        this.a = str;
        this.b = arrayList;
        this.c = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ulb)) {
            return false;
        }
        ulb ulbVar = (ulb) obj;
        return g76.L(this.a, ulbVar.a) && this.b.equals(ulbVar.b) && this.c == ulbVar.c;
    }

    public final int hashCode() {
        int iP = b09.p(this.b, this.a.hashCode() * 31, 31);
        long j = this.c;
        return iP + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ResolvedHost(hostname=");
        sb.append(this.a);
        sb.append(", addresses=");
        sb.append(this.b);
        sb.append(", resolutionTimestamp=");
        return ev6.t(this.c, ")", sb);
    }
}
