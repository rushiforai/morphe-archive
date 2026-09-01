package defpackage;

import com.medium.android.profile.ui.premium.cfCC.mgKMENwrbHf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class jz6 {
    public final int a;

    public final boolean equals(Object obj) {
        if (obj instanceof jz6) {
            return this.a == ((jz6) obj).a;
        }
        return false;
    }

    public final int hashCode() {
        return this.a;
    }

    public final String toString() {
        int i = this.a;
        return i == 0 ? "LineHeightStyle.Mode.Fixed" : i == 1 ? mgKMENwrbHf.fjn : i == 2 ? "LineHeightStyle.Mode.Tight" : "Invalid";
    }
}
