package defpackage;

import com.medium.android.core.susi.SusiDestination;
import com.medium.android.core.susi.SusiOperation;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class y1e implements b2e {
    public final String a;
    public final SusiDestination b;
    public final SusiOperation c;
    public final SourceParameter d;
    public final boolean e;

    public y1e(String str, SusiDestination susiDestination, SusiOperation susiOperation, SourceParameter sourceParameter, boolean z) {
        str.getClass();
        susiOperation.getClass();
        sourceParameter.getClass();
        this.a = str;
        this.b = susiDestination;
        this.c = susiOperation;
        this.d = sourceParameter;
        this.e = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof y1e)) {
            return false;
        }
        y1e y1eVar = (y1e) obj;
        return g76.L(this.a, y1eVar.a) && g76.L(this.b, y1eVar.b) && this.c == y1eVar.c && g76.L(this.d, y1eVar.d) && this.e == y1eVar.e;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        SusiDestination susiDestination = this.b;
        return ev6.o(this.d, (this.c.hashCode() + ((iHashCode + (susiDestination == null ? 0 : susiDestination.hashCode())) * 31)) * 31, 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NavigateToLoginCode(email=");
        sb.append(this.a);
        sb.append(", susiDestination=");
        sb.append(this.b);
        sb.append(", susiOperation=");
        sb.append(this.c);
        sb.append(", sourceParameter=");
        sb.append(this.d);
        sb.append(", rememberMe=");
        return lv8.t(sb, this.e, ")");
    }
}
