package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class mmb {
    public float a = 0.0f;
    public boolean b = true;
    public bo c = null;

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mmb)) {
            return false;
        }
        mmb mmbVar = (mmb) obj;
        return Float.compare(this.a, mmbVar.a) == 0 && this.b == mmbVar.b && g76.L(this.c, mmbVar.c);
    }

    public final int hashCode() {
        int iFloatToIntBits = ((Float.floatToIntBits(this.a) * 31) + (this.b ? 1231 : 1237)) * 31;
        bo boVar = this.c;
        return (iFloatToIntBits + (boVar == null ? 0 : boVar.hashCode())) * 31;
    }

    public final String toString() {
        return "RowColumnParentData(weight=" + this.a + ", fill=" + this.b + ", crossAxisAlignment=" + this.c + ", flowLayoutData=null)";
    }
}
