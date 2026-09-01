package defpackage;

import com.medium.android.data.notification.YMl.DtuT;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jgd {
    public final int a;

    public static String a(int i) {
        return i == 1 ? "Left" : i == 2 ? DtuT.QThRgBDLGKuj : i == 3 ? "Center" : i == 4 ? "Justify" : i == 5 ? "Start" : i == 6 ? "End" : i == 0 ? "Unspecified" : "Invalid";
    }

    public final boolean equals(Object obj) {
        if (obj instanceof jgd) {
            return this.a == ((jgd) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        return a(this.a);
    }
}
