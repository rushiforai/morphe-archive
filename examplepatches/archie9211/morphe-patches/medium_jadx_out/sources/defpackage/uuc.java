package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class uuc extends pxf {
    public final float R;
    public final float S;
    public final int T;
    public final int U;

    public uuc(float f, float f2, int i, int i2, int i3) {
        f2 = (i3 & 2) != 0 ? 4.0f : f2;
        i = (i3 & 4) != 0 ? 0 : i;
        i2 = (i3 & 8) != 0 ? 0 : i2;
        this.R = f;
        this.S = f2;
        this.T = i;
        this.U = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof uuc)) {
            return false;
        }
        uuc uucVar = (uuc) obj;
        return this.R == uucVar.R && this.S == uucVar.S && this.T == uucVar.T && this.U == uucVar.U;
    }

    public final int hashCode() {
        return (((km4.p(this.S, Float.floatToIntBits(this.R) * 31, 31) + this.T) * 31) + this.U) * 31;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Stroke(width=");
        sb.append(this.R);
        sb.append(", miter=");
        sb.append(this.S);
        sb.append(", cap=");
        String str = "Unknown";
        int i = this.T;
        sb.append((Object) (i == 0 ? "Butt" : i == 1 ? "Round" : i == 2 ? "Square" : "Unknown"));
        sb.append(", join=");
        int i2 = this.U;
        if (i2 == 0) {
            str = "Miter";
        } else if (i2 == 1) {
            str = "Round";
        } else if (i2 == 2) {
            str = "Bevel";
        }
        sb.append((Object) str);
        sb.append(", pathEffect=null)");
        return sb.toString();
    }
}
