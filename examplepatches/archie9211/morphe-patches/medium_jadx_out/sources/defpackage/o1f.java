package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class o1f {
    public final boolean a;
    public final Integer b;
    public final boolean c;
    public final Integer d;
    public final boolean e;
    public final boolean f;

    public o1f(boolean z, Integer num, boolean z2, Integer num2, boolean z3, boolean z4) {
        this.a = z;
        this.b = num;
        this.c = z2;
        this.d = num2;
        this.e = z3;
        this.f = z4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof o1f)) {
            return false;
        }
        o1f o1fVar = (o1f) obj;
        return this.a == o1fVar.a && g76.L(this.b, o1fVar.b) && this.c == o1fVar.c && g76.L(this.d, o1fVar.d) && this.e == o1fVar.e && this.f == o1fVar.f;
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        Integer num = this.b;
        int iHashCode = (((i + (num == null ? 0 : num.hashCode())) * 31) + (this.c ? 1231 : 1237)) * 31;
        Integer num2 = this.d;
        return ((((iHashCode + (num2 != null ? num2.hashCode() : 0)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("WebSocketExtensions(perMessageDeflate=");
        sb.append(this.a);
        sb.append(", clientMaxWindowBits=");
        sb.append(this.b);
        sb.append(", clientNoContextTakeover=");
        sb.append(this.c);
        sb.append(", serverMaxWindowBits=");
        sb.append(this.d);
        sb.append(", serverNoContextTakeover=");
        sb.append(this.e);
        sb.append(", unknownValues=");
        return ev6.A(sb, this.f, ')');
    }
}
