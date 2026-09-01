package defpackage;

import com.drew.metadata.pcx.bLHD.HrUBqHumRuLe;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yia implements aja {
    public final String a;
    public final String b;
    public final List c;

    public yia(String str, String str2, List list) {
        str.getClass();
        this.a = str;
        this.b = str2;
        this.c = list;
    }

    @Override // defpackage.aja
    public final List a() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yia)) {
            return false;
        }
        yia yiaVar = (yia) obj;
        return g76.L(this.a, yiaVar.a) && g76.L(this.b, yiaVar.b) && this.c.equals(yiaVar.c);
    }

    @Override // defpackage.aja
    public final String getId() {
        return this.a;
    }

    @Override // defpackage.aja
    public final String getTitle() {
        return this.b;
    }

    public final int hashCode() {
        int iHashCode = this.a.hashCode() * 31;
        String str = this.b;
        return this.c.hashCode() + ((iHashCode + (str == null ? 0 : str.hashCode())) * 31);
    }

    public final String toString() {
        return b09.B(y30.u("PostSectionToLoadState(id=", this.a, HrUBqHumRuLe.uZIA, this.b, ", postIds="), this.c, ")");
    }
}
