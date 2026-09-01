package defpackage;

import com.medium.android.data.post.model.ReportPostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class x6b {
    public final ReportPostReason a;
    public final boolean b;
    public final boolean c;
    public final boolean d;
    public final boolean e;

    public x6b(ReportPostReason reportPostReason, boolean z, boolean z2, boolean z3, boolean z4) {
        this.a = reportPostReason;
        this.b = z;
        this.c = z2;
        this.d = z3;
        this.e = z4;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof x6b)) {
            return false;
        }
        x6b x6bVar = (x6b) obj;
        return this.a == x6bVar.a && this.b == x6bVar.b && this.c == x6bVar.c && this.d == x6bVar.d && this.e == x6bVar.e;
    }

    public final int hashCode() {
        ReportPostReason reportPostReason = this.a;
        return ((((((((reportPostReason == null ? 0 : reportPostReason.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31) + (this.d ? 1231 : 1237)) * 31) + (this.e ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(selectedReportResponseReason=");
        sb.append(this.a);
        sb.append(", blockAuthor=");
        sb.append(this.b);
        sb.append(", hideResponse=");
        ho2.R(sb, this.c, ", canReportResponse=", this.d, ", canHideResponse=");
        return lv8.t(sb, this.e, ")");
    }
}
