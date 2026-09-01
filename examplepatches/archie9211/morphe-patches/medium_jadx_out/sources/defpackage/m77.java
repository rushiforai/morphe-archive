package defpackage;

import com.medium.android.common.ui.Ezz.Plbho;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class m77 {
    public final String a;
    public final String b;

    public m77(String str, String str2) {
        this.a = str;
        this.b = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof m77)) {
            return false;
        }
        m77 m77Var = (m77) obj;
        return g76.L(this.a, m77Var.a) && g76.L(this.b, m77Var.b);
    }

    public final int hashCode() {
        String str = this.a;
        int iHashCode = (str == null ? 0 : str.hashCode()) * 31;
        String str2 = this.b;
        return iHashCode + (str2 != null ? str2.hashCode() : 0);
    }

    public final String toString() {
        return ev6.y("SimCarrier(id=", this.a, ", name=", this.b, Plbho.pHwFoDR);
    }
}
