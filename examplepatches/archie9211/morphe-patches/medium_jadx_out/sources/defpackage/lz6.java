package defpackage;

import com.drew.imaging.raf.yvq.AXoTRPEGKEve;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class lz6 {
    public static final lz6 d = new lz6(iz6.c, 17, 0);
    public final float a;
    public final int b;
    public final int c;

    public lz6(float f, int i, int i2) {
        this.a = f;
        this.b = i;
        this.c = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof lz6)) {
            return false;
        }
        lz6 lz6Var = (lz6) obj;
        float f = lz6Var.a;
        float f2 = iz6.b;
        return Float.compare(this.a, f) == 0 && this.b == lz6Var.b && this.c == lz6Var.c;
    }

    public final int hashCode() {
        float f = iz6.b;
        return (((Float.floatToIntBits(this.a) * 31) + this.b) * 31) + this.c;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("LineHeightStyle(alignment=");
        sb.append((Object) iz6.b(this.a));
        sb.append(", trim=");
        String str = "Invalid";
        int i = this.b;
        sb.append((Object) (i == 1 ? "LineHeightStyle.Trim.FirstLineTop" : i == 16 ? "LineHeightStyle.Trim.LastLineBottom" : i == 17 ? "LineHeightStyle.Trim.Both" : i == 0 ? "LineHeightStyle.Trim.None" : "Invalid"));
        sb.append(AXoTRPEGKEve.OOZaghtrNeo);
        int i2 = this.c;
        if (i2 == 0) {
            str = "LineHeightStyle.Mode.Fixed";
        } else if (i2 == 1) {
            str = "LineHeightStyle.Mode.Minimum";
        } else if (i2 == 2) {
            str = "LineHeightStyle.Mode.Tight";
        }
        sb.append((Object) str);
        sb.append(')');
        return sb.toString();
    }
}
