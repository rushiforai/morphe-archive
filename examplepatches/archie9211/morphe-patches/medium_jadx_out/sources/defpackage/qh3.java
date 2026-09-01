package defpackage;

import com.medium.android.data.notification.YMl.DtuT;
import j$.util.Objects;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class qh3 {
    public final String a;
    public final int b;
    public final int c;

    public qh3(String str, int i, int i2) {
        this.a = str;
        this.b = i;
        this.c = i2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof qh3)) {
            return false;
        }
        qh3 qh3Var = (qh3) obj;
        return this.a.equals(qh3Var.a) && this.b == qh3Var.b && this.c == qh3Var.c;
    }

    public final int hashCode() {
        Integer numValueOf = Integer.valueOf(this.b);
        Integer numValueOf2 = Integer.valueOf(this.c);
        Float fValueOf = Float.valueOf(1.0f);
        return Objects.hash(this.a, numValueOf, numValueOf2, fValueOf, 0, 0, 0, fValueOf);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("DisplayShapeCompat{ spec=");
        sb.append(Integer.valueOf(this.a.hashCode()));
        sb.append(DtuT.rRkdqVxbU);
        sb.append(this.b);
        sb.append(" displayHeight=");
        return ho2.H(sb, this.c, " physicalPixelDisplaySizeRatio=1.0 rotation=0 offsetX=0 offsetY=0 scale=1.0}");
    }
}
