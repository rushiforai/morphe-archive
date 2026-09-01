package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class vhb extends aib {
    public final b24 c;
    public final ResponsesReference.ResponseViewType d;
    public final String e;
    public final String f;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public vhb(b24 b24Var, ResponsesReference.ResponseViewType responseViewType, String str, String str2) {
        super(responseViewType, null);
        responseViewType.getClass();
        str2.getClass();
        this.c = b24Var;
        this.d = responseViewType;
        this.e = str;
        this.f = str2;
    }

    @Override // defpackage.aib
    public final String b() {
        return this.f;
    }

    @Override // defpackage.aib
    public final String c() {
        return this.e;
    }

    @Override // defpackage.aib
    public final ResponsesReference.ResponseViewType d() {
        return this.d;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof vhb)) {
            return false;
        }
        vhb vhbVar = (vhb) obj;
        return this.c.equals(vhbVar.c) && this.d == vhbVar.d && this.e.equals(vhbVar.e) && g76.L(this.f, vhbVar.f);
    }

    public final int hashCode() {
        return this.f.hashCode() + wgd.o((this.d.hashCode() + (this.c.hashCode() * 31)) * 31, 31, this.e);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Error(errorState=");
        sb.append(this.c);
        sb.append(", viewType=");
        sb.append(this.d);
        sb.append(", source=");
        return km4.C(sb, this.e, ", rootId=", this.f, ")");
    }
}
