package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class whb extends aib {
    public final boolean c;
    public final boolean d;
    public final String e;
    public final String f;
    public final String g;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public whb(String str, String str2, String str3, boolean z, boolean z2) {
        super(ResponsesReference.ResponseViewType.Standard, str3);
        str2.getClass();
        this.c = z;
        this.d = z2;
        this.e = str;
        this.f = str2;
        this.g = str3;
    }

    @Override // defpackage.aib
    public final String a() {
        return this.g;
    }

    @Override // defpackage.aib
    public final String b() {
        return this.f;
    }

    @Override // defpackage.aib
    public final String c() {
        return this.e;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof whb)) {
            return false;
        }
        whb whbVar = (whb) obj;
        return this.c == whbVar.c && this.d == whbVar.d && this.e.equals(whbVar.e) && g76.L(this.f, whbVar.f) && g76.L(this.g, whbVar.g);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o((((this.c ? 1231 : 1237) * 31) + (this.d ? 1231 : 1237)) * 31, 31, this.e), 31, this.f);
        String str = this.g;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("HiddenResponses(usePostCopies=");
        sb.append(this.c);
        sb.append(", canHide=");
        sb.append(this.d);
        sb.append(", source=");
        ka1.C(sb, this.e, ", rootId=", this.f, ", postVersionId=");
        return ka1.v(sb, this.g, ")");
    }
}
