package defpackage;

import android.graphics.ColorFilter;
import android.graphics.PorterDuffColorFilter;
import android.os.Build;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class bs0 {
    public final ColorFilter a;
    public final long b;
    public final int c;

    public bs0(int i, long j) {
        ColorFilter porterDuffColorFilter;
        if (Build.VERSION.SDK_INT >= 29) {
            cs0.f();
            porterDuffColorFilter = cs0.a(op8.n0(j), nm.K(i));
        } else {
            porterDuffColorFilter = new PorterDuffColorFilter(op8.n0(j), nm.M(i));
        }
        this.a = porterDuffColorFilter;
        this.b = j;
        this.c = i;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof bs0)) {
            return false;
        }
        bs0 bs0Var = (bs0) obj;
        long j = bs0Var.b;
        int i = uu1.i;
        return ezd.a(this.b, j) && this.c == bs0Var.c;
    }

    public final int hashCode() {
        int i = uu1.i;
        return (ev6.n(this.b) * 31) + this.c;
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("BlendModeColorFilter(color=");
        ev6.F(this.b, ", blendMode=", sb);
        sb.append((Object) pxf.O(this.c));
        sb.append(')');
        return sb.toString();
    }
}
