package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y6e {
    public final int a;
    public final int b;

    public y6e(int i, int i2) {
        this.a = i;
        this.b = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y6e)) {
            return false;
        }
        y6e y6eVar = (y6e) obj;
        return this.a == y6eVar.a && this.b == y6eVar.b;
    }

    public final int hashCode() {
        return (this.a * 31) + this.b;
    }

    public final String toString() {
        return ev6.s(this.a, this.b, "PositionScore(index=", ", score=", ")");
    }
}
