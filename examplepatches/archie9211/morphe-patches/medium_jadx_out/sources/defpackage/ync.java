package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class ync implements m7c {
    public final long a;
    public final long b;

    public ync(long j, long j2) {
        this.a = j;
        this.b = j2;
        if (j < 0) {
            ywb.g(b09.x("stopTimeout(", " ms) cannot be negative", j));
            throw null;
        }
        if (j2 >= 0) {
            return;
        }
        ywb.g(b09.x("replayExpiration(", " ms) cannot be negative", j2));
        throw null;
    }

    @Override // defpackage.m7c
    public final bo4 a(uxc uxcVar) {
        n92 n92Var = null;
        return m40.J(new to4(ip4.b(uxcVar, new xnc(this, n92Var, 0)), new au2(2, 4, n92Var), 1));
    }

    public final boolean equals(Object obj) {
        if (!(obj instanceof ync)) {
            return false;
        }
        ync yncVar = (ync) obj;
        return this.a == yncVar.a && this.b == yncVar.b;
    }

    public final int hashCode() {
        long j = this.a;
        int i = ((int) (j ^ (j >>> 32))) * 31;
        long j2 = this.b;
        return i + ((int) ((j2 >>> 32) ^ j2));
    }

    public final String toString() {
        f17 f17Var = new f17(2);
        long j = this.a;
        if (j > 0) {
            f17Var.add("stopTimeout=" + j + "ms");
        }
        long j2 = this.b;
        if (j2 < Long.MAX_VALUE) {
            f17Var.add("replayExpiration=" + j2 + "ms");
        }
        return ev6.z(new StringBuilder("SharingStarted.WhileSubscribed("), bu1.F0(d46.w(f17Var), null, null, null, null, 63), ')');
    }
}
