package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class qfc {
    public final long a;
    public final long b;
    public final long c;
    public final long d;
    public final long e;
    public final long f;
    public final long g;
    public final long h;
    public final long i;
    public final long j;

    public qfc(long j, long j2, long j3, long j4, long j5, long j6, long j7, long j8, long j9, long j10) {
        this.a = j;
        this.b = j2;
        this.c = j3;
        this.d = j4;
        this.e = j5;
        this.f = j6;
        this.g = j7;
        this.h = j8;
        this.i = j9;
        this.j = j10;
    }

    public final long a(boolean z, boolean z2) {
        return z ? z2 ? this.b : this.d : z2 ? this.g : this.i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || !(obj instanceof qfc)) {
            return false;
        }
        qfc qfcVar = (qfc) obj;
        long j = qfcVar.a;
        int i = uu1.i;
        return ezd.a(this.a, j) && ezd.a(this.b, qfcVar.b) && ezd.a(this.c, qfcVar.c) && ezd.a(this.d, qfcVar.d) && ezd.a(this.e, qfcVar.e) && ezd.a(this.f, qfcVar.f) && ezd.a(this.g, qfcVar.g) && ezd.a(this.h, qfcVar.h) && ezd.a(this.i, qfcVar.i) && ezd.a(this.j, qfcVar.j);
    }

    public final int hashCode() {
        int i = uu1.i;
        return ev6.n(this.j) + lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(lv8.g(ev6.n(this.a) * 31, 31, this.b), 31, this.c), 31, this.d), 31, this.e), 31, this.f), 31, this.g), 31, this.h), 31, this.i);
    }
}
