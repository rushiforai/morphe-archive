package defpackage;

import sprig.g.Hq.fiHTiFJ;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class y0c {
    public static final x0c Companion = new x0c();
    public final String a;
    public final String b;
    public final int c;
    public final long d;

    public /* synthetic */ y0c(int i, String str, String str2, int i2, long j) {
        if (15 != (i & 15)) {
            iq7.S(i, 15, w0c.a.a());
            throw null;
        }
        this.a = str;
        this.b = str2;
        this.c = i2;
        this.d = j;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y0c)) {
            return false;
        }
        y0c y0cVar = (y0c) obj;
        return g76.L(this.a, y0cVar.a) && g76.L(this.b, y0cVar.b) && this.c == y0cVar.c && this.d == y0cVar.d;
    }

    public final int hashCode() {
        int iO = (wgd.o(this.a.hashCode() * 31, 31, this.b) + this.c) * 31;
        long j = this.d;
        return iO + ((int) (j ^ (j >>> 32)));
    }

    public final String toString() {
        return fiHTiFJ.tCHLZjsHS + this.a + ", firstSessionId=" + this.b + ", sessionIndex=" + this.c + ", sessionStartTimestampUs=" + this.d + ')';
    }

    public y0c(String str, String str2, int i, long j) {
        this.a = str;
        this.b = str2;
        this.c = i;
        this.d = j;
    }
}
