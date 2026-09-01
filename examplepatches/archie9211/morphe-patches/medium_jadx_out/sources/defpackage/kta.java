package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class kta {
    public final String a;
    public final String b;
    public final float c;

    public kta(String str, String str2, float f) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = f;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof kta)) {
            return false;
        }
        kta ktaVar = (kta) obj;
        return g76.L(this.a, ktaVar.a) && this.b.equals(ktaVar.b) && Float.compare(this.c, ktaVar.c) == 0;
    }

    public final int hashCode() {
        return Float.floatToIntBits(this.c) + wgd.o(this.a.hashCode() * 31, 31, this.b);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("ReadersInterestTopic(id=", this.a, ", name=", this.b, ", percentage=");
        sbU.append(this.c);
        sbU.append(")");
        return sbU.toString();
    }
}
