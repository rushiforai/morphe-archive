package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yid {
    public static final yid c = new yid(en7.B(0), en7.B(0));
    public final long a;
    public final long b;

    public yid(long j, long j2) {
        this.a = j;
        this.b = j2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yid)) {
            return false;
        }
        yid yidVar = (yid) obj;
        return qkd.a(this.a, yidVar.a) && qkd.a(this.b, yidVar.b);
    }

    public final int hashCode() {
        rkd[] rkdVarArr = qkd.b;
        return ev6.n(this.b) + (ev6.n(this.a) * 31);
    }

    public final String toString() {
        return "TextIndent(firstLine=" + ((Object) qkd.e(this.a)) + ", restLine=" + ((Object) qkd.e(this.b)) + ')';
    }
}
