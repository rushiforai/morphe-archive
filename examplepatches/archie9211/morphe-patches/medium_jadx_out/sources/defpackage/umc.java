package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class umc implements wmc {
    public final String a;
    public final List b;
    public final long c;

    public umc(String str, List list, long j) {
        str.getClass();
        list.getClass();
        this.a = str;
        this.b = list;
        this.c = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof umc)) {
            return false;
        }
        umc umcVar = (umc) obj;
        return g76.L(this.a, umcVar.a) && g76.L(this.b, umcVar.b) && this.c == umcVar.c;
    }

    public final int hashCode() {
        int iP = wgd.p(this.a.hashCode() * 31, 31, this.b);
        long j = this.c;
        return iP + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return ev6.t(this.c, ")", b09.E("Enabled(timeToLive=", this.a, ", services=", ", estimatedRequestHeadersSize=", this.b));
    }
}
