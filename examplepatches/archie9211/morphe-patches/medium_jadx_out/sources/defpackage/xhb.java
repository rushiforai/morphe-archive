package defpackage;

import com.medium.android.core.navigation.ResponsesReference;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class xhb extends aib {
    public final ResponsesReference.ResponseViewType c;
    public final String d;
    public final String e;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public xhb(ResponsesReference.ResponseViewType responseViewType, String str, String str2) {
        super(responseViewType, null);
        responseViewType.getClass();
        str2.getClass();
        this.c = responseViewType;
        this.d = str;
        this.e = str2;
    }

    @Override // defpackage.aib
    public final String b() {
        return this.e;
    }

    @Override // defpackage.aib
    public final String c() {
        return this.d;
    }

    @Override // defpackage.aib
    public final ResponsesReference.ResponseViewType d() {
        return this.c;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof xhb)) {
            return false;
        }
        xhb xhbVar = (xhb) obj;
        return this.c == xhbVar.c && this.d.equals(xhbVar.d) && g76.L(this.e, xhbVar.e);
    }

    public final int hashCode() {
        return this.e.hashCode() + wgd.o(this.c.hashCode() * 31, 31, this.d);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Loading(viewType=");
        sb.append(this.c);
        sb.append(", source=");
        sb.append(this.d);
        sb.append(", rootId=");
        return ka1.v(sb, this.e, ")");
    }
}
