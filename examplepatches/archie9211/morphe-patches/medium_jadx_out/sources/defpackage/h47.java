package defpackage;

import com.medium.android.explore.ui.vAWg.OphtYB;
import java.util.ArrayList;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class h47 extends k47 {
    public final ArrayList a;
    public final boolean b;

    public h47(ArrayList arrayList, boolean z) {
        this.a = arrayList;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof h47)) {
            return false;
        }
        h47 h47Var = (h47) obj;
        return this.a.equals(h47Var.a) && this.b == h47Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "Catalogs(items=" + this.a + ", saving=" + this.b + OphtYB.eAWf;
    }
}
