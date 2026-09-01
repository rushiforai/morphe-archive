package defpackage;

import com.medium.android.admin.stagebranch.uG.peNPu;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yre implements ese {
    public final String a;

    public yre(String str) {
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof yre) && g76.L(this.a, ((yre) obj).a);
    }

    public final int hashCode() {
        String str = this.a;
        if (str == null) {
            return 0;
        }
        return str.hashCode();
    }

    public final String toString() {
        return ev6.x(peNPu.kcBOmXzPGOLUE, this.a, ")");
    }
}
