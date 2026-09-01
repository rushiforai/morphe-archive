package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class zld {
    public static final yld Companion = new yld();
    public final long a;
    public final long b;
    public final long c;

    public /* synthetic */ zld(int i, long j, long j2, long j3) {
        if (1 != (i & 1)) {
            iq7.S(i, 1, xld.a.a());
            throw null;
        }
        this.a = j;
        this.b = (i & 2) == 0 ? j * 1000 : j2;
        if ((i & 4) == 0) {
            this.c = j / 1000;
        } else {
            this.c = j3;
        }
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zld) && this.a == ((zld) obj).a;
    }

    public final int hashCode() {
        long j = this.a;
        return (int) (j ^ (j >>> 32));
    }

    public final String toString() {
        return "Time(ms=" + this.a + ')';
    }

    public zld(long j) {
        this.a = j;
        this.b = j * 1000;
        this.c = j / 1000;
    }
}
