package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class yhb extends aib {
    public final bib c;
    public final boolean d;
    public final boolean e;
    public final boolean f;
    public final boolean g;
    public final String h;
    public final String i;
    public final String j;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public yhb(bib bibVar, boolean z, boolean z2, boolean z3, boolean z4, String str, String str2, String str3) {
        super(ResponsesReference.ResponseViewType.Standard, str3);
        bibVar.getClass();
        str2.getClass();
        this.c = bibVar;
        this.d = z;
        this.e = z2;
        this.f = z3;
        this.g = z4;
        this.h = str;
        this.i = str2;
        this.j = str3;
    }

    @Override // defpackage.aib
    public final String a() {
        return this.j;
    }

    @Override // defpackage.aib
    public final String b() {
        return this.i;
    }

    @Override // defpackage.aib
    public final String c() {
        return this.h;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof yhb)) {
            return false;
        }
        yhb yhbVar = (yhb) obj;
        return g76.L(this.c, yhbVar.c) && this.d == yhbVar.d && this.e == yhbVar.e && this.f == yhbVar.f && this.g == yhbVar.g && this.h.equals(yhbVar.h) && g76.L(this.i, yhbVar.i) && g76.L(this.j, yhbVar.j);
    }

    public final int hashCode() {
        int iO = wgd.o(wgd.o(((((((((this.c.hashCode() * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237)) * 31) + (this.f ? 1231 : 1237)) * 31) + (this.g ? 1231 : 1237)) * 31, 31, this.h), 31, this.i);
        String str = this.j;
        return iO + (str == null ? 0 : str.hashCode());
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("NoResponses(writeState=");
        sb.append(this.c);
        sb.append(", isLocked=");
        sb.append(this.d);
        sb.append(", canLock=");
        ho2.R(sb, this.e, ", canHide=", this.f, ", usePostCopies=");
        sb.append(this.g);
        sb.append(", source=");
        sb.append(this.h);
        sb.append(", rootId=");
        return km4.C(sb, this.i, ", postVersionId=", this.j, ")");
    }
}
