package defpackage;

import com.medium.android.admin.admininternalstatus.jO.ziYqbdHrAXvj;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class j9e implements k9e {
    public final boolean a;
    public final String b;
    public final SourceParameter c;

    public j9e(SourceParameter sourceParameter, String str, boolean z) {
        sourceParameter.getClass();
        this.a = z;
        this.b = str;
        this.c = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j9e)) {
            return false;
        }
        j9e j9eVar = (j9e) obj;
        return this.a == j9eVar.a && g76.L(this.b, j9eVar.b) && g76.L(this.c, j9eVar.c);
    }

    public final int hashCode() {
        int i = (this.a ? 1231 : 1237) * 31;
        String str = this.b;
        return this.c.hashCode() + ((i + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder(ziYqbdHrAXvj.nuSVxCgeaXj);
        sb.append(this.a);
        sb.append(", userName=");
        sb.append(this.b);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.c, ")");
    }
}
