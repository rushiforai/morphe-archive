package defpackage;

import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class wia implements aja {
    public final String a;
    public final String b;
    public final List c;
    public final b24 d;

    public wia(String str, String str2, List list, b24 b24Var) {
        str.getClass();
        list.getClass();
        this.a = str;
        this.b = str2;
        this.c = list;
        this.d = b24Var;
    }

    @Override // defpackage.aja
    public final List a() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wia)) {
            return false;
        }
        wia wiaVar = (wia) obj;
        return g76.L(this.a, wiaVar.a) && g76.L(this.b, wiaVar.b) && g76.L(this.c, wiaVar.c) && this.d.equals(wiaVar.d);
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
        return this.d.hashCode() + wgd.p((iHashCode + (str == null ? 0 : str.hashCode())) * 31, 31, this.c);
    }

    public final String toString() {
        StringBuilder sbU = y30.u("PostSectionErrorState(id=", this.a, ", title=", this.b, ", postIds=");
        sbU.append(this.c);
        sbU.append(", errorState=");
        sbU.append(this.d);
        sbU.append(")");
        return sbU.toString();
    }
}
