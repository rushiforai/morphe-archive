package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class yod {
    public final String a;
    public final String b;
    public final String c;
    public final int d;
    public final long e;

    public yod(String str, String str2, String str3, int i, long j) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = str3;
        this.d = i;
        this.e = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yod)) {
            return false;
        }
        yod yodVar = (yod) obj;
        return g76.L(this.a, yodVar.a) && g76.L(this.b, yodVar.b) && this.c.equals(yodVar.c) && this.d == yodVar.d && this.e == yodVar.e;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        int iO = (wgd.o((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c) + this.d) * 31;
        long j = this.e;
        return iO + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        StringBuilder sbU = y30.u("Topic(topicId=", this.a, OphtYB.pPsp, this.b, ", topicName=");
        sbU.append(this.c);
        sbU.append(", followCount=");
        sbU.append(this.d);
        sbU.append(", postCount=");
        return ev6.t(this.e, ")", sbU);
    }
}
