package defpackage;

import java.util.Arrays;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class c7g extends o7g {
    public final long a;

    public c7g(long j) {
        this.a = j;
    }

    @Override // defpackage.o7g
    public final int a() {
        return o7g.d(this.a >= 0 ? (byte) 0 : (byte) 32);
    }

    @Override // java.lang.Comparable
    public final /* bridge */ /* synthetic */ int compareTo(Object obj) {
        o7g o7gVar = (o7g) obj;
        if (a() != o7gVar.a()) {
            return a() - o7gVar.a();
        }
        long jAbs = Math.abs(this.a);
        long jAbs2 = Math.abs(((c7g) o7gVar).a);
        if (jAbs < jAbs2) {
            return -1;
        }
        return jAbs > jAbs2 ? 1 : 0;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return obj != null && c7g.class == obj.getClass() && this.a == ((c7g) obj).a;
    }

    public final int hashCode() {
        return Arrays.hashCode(new Object[]{Integer.valueOf(a()), Long.valueOf(this.a)});
    }

    public final String toString() {
        return Long.toString(this.a);
    }
}
