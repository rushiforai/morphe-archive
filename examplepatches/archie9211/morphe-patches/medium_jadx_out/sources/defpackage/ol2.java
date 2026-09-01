package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;
import java.util.Set;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class ol2 implements pl2 {
    public final Set a;
    public final boolean b;
    public final boolean c;
    public final String d;

    public ol2(Set set, boolean z, boolean z2, String str) {
        set.getClass();
        str.getClass();
        this.a = set;
        this.b = z;
        this.c = z2;
        this.d = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof ol2)) {
            return false;
        }
        ol2 ol2Var = (ol2) obj;
        return this.a.equals(ol2Var.a) && this.b == ol2Var.b && this.c == ol2Var.c && g76.L(this.d, ol2Var.d);
    }

    public final int hashCode() {
        return this.d.hashCode() + (((((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "Main(icons=" + this.a + Plbho.TpTkKWmb + this.b + ", canUpgrade=" + this.c + ", source=" + this.d + ")";
    }
}
