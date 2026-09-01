package defpackage;

import gen.model.SourceParameter;
import java.util.List;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class jxc implements nxc {
    public final boolean a;
    public final int b;
    public final Long c;
    public final Integer d;
    public final List e;
    public final boolean f;
    public final SourceParameter g;

    public jxc(boolean z, int i, Long l, Integer num, List list, boolean z2, SourceParameter sourceParameter) {
        list.getClass();
        sourceParameter.getClass();
        this.a = z;
        this.b = i;
        this.c = l;
        this.d = num;
        this.e = list;
        this.f = z2;
        this.g = sourceParameter;
    }

    @Override // defpackage.nxc
    public final boolean a() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof jxc)) {
            return false;
        }
        jxc jxcVar = (jxc) obj;
        return this.a == jxcVar.a && this.b == jxcVar.b && g76.L(this.c, jxcVar.c) && g76.L(this.d, jxcVar.d) && g76.L(this.e, jxcVar.e) && this.f == jxcVar.f && g76.L(this.g, jxcVar.g);
    }

    public final int hashCode() {
        int i = (((this.a ? 1231 : 1237) * 31) + this.b) * 31;
        Long l = this.c;
        int iHashCode = (i + (l == null ? 0 : l.hashCode())) * 31;
        Integer num = this.d;
        return this.g.hashCode() + ((wgd.p((iHashCode + (num != null ? num.hashCode() : 0)) * 31, 31, this.e) + (this.f ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("Content(isRefreshing=");
        sb.append(this.a);
        sb.append(", subscriberCount=");
        sb.append(this.b);
        sb.append(", accountCreatedAt=");
        sb.append(this.c);
        sb.append(", subscribersPreviousMonth=");
        sb.append(this.d);
        sb.append(", subscribers=");
        sb.append(this.e);
        sb.append(", isLoadingMore=");
        sb.append(this.f);
        sb.append(", sourceParameter=");
        return y30.r(sb, this.g, ")");
    }
}
