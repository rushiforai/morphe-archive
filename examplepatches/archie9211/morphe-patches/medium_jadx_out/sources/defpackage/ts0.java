package defpackage;

import android.graphics.RenderEffect;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class ts0 {
    public RenderEffect a;
    public final float b;
    public final float c;
    public final int d;

    public ts0(float f, float f2, int i) {
        this.b = f;
        this.c = f2;
        this.d = i;
    }

    public final RenderEffect a() {
        RenderEffect renderEffect = this.a;
        if (renderEffect != null) {
            return renderEffect;
        }
        RenderEffect renderEffectC = io.c(this.b, this.c, this.d);
        this.a = renderEffectC;
        return renderEffectC;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ts0)) {
            return false;
        }
        ts0 ts0Var = (ts0) obj;
        return this.b == ts0Var.b && this.c == ts0Var.c && this.d == ts0Var.d;
    }

    public final int hashCode() {
        return km4.p(this.c, Float.floatToIntBits(this.b) * 31, 31) + this.d;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BlurEffect(renderEffect=null, radiusX=");
        sb.append(this.b);
        sb.append(", radiusY=");
        sb.append(this.c);
        sb.append(", edgeTreatment=");
        int i = this.d;
        sb.append((Object) (i == 0 ? "Clamp" : i == 1 ? "Repeated" : i == 2 ? "Mirror" : i == 3 ? "Decal" : "Unknown"));
        sb.append(')');
        return sb.toString();
    }
}
