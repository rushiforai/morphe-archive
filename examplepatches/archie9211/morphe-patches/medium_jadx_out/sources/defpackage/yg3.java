package defpackage;

import android.os.Build;
import android.view.DisplayCutout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class yg3 {
    public final DisplayCutout a;

    public yg3(DisplayCutout displayCutout) {
        this.a = displayCutout;
    }

    public final b36 a() {
        return Build.VERSION.SDK_INT >= 30 ? b36.d(u4.g(this.a)) : b36.e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (obj == null || yg3.class != obj.getClass()) {
            return false;
        }
        return this.a.equals(((yg3) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "DisplayCutoutCompat{" + this.a + "}";
    }
}
