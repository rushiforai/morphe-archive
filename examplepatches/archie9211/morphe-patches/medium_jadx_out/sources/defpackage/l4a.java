package defpackage;

import com.google.android.gms.analytics.wYI.ivbZv;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l4a {
    public final String a;
    public final List b;
    public final List c;
    public final boolean d;
    public final String e;

    public l4a(String str, List list, List list2, boolean z, String str2) {
        str.getClass();
        list2.getClass();
        str2.getClass();
        this.a = str;
        this.b = list;
        this.c = list2;
        this.d = z;
        this.e = str2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof l4a)) {
            return false;
        }
        l4a l4aVar = (l4a) obj;
        return g76.L(this.a, l4aVar.a) && this.b.equals(l4aVar.b) && g76.L(this.c, l4aVar.c) && this.d == l4aVar.d && g76.L(this.e, l4aVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + ((wgd.p(wgd.p(this.a.hashCode() * 31, 31, this.b), 31, this.c) + (this.d ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sbE = b09.E(ivbZv.ZCNn, this.a, ", filterValues=", ", selectedPronouns=", this.b);
        sbE.append(this.c);
        sbE.append(", isSaving=");
        sbE.append(this.d);
        sbE.append(", source=");
        return ka1.v(sbE, this.e, ")");
    }
}
