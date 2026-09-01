package defpackage;

import com.medium.android.data.post.model.ReportPostReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class t5b {
    public final ReportPostReason a;
    public final boolean b;
    public final boolean c;

    public t5b(ReportPostReason reportPostReason, boolean z, boolean z2) {
        this.a = reportPostReason;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof t5b)) {
            return false;
        }
        t5b t5bVar = (t5b) obj;
        return this.a == t5bVar.a && this.b == t5bVar.b && this.c == t5bVar.c;
    }

    public final int hashCode() {
        ReportPostReason reportPostReason = this.a;
        return ((((reportPostReason == null ? 0 : reportPostReason.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(selectedReportPostReason=");
        sb.append(this.a);
        sb.append(", blockAuthor=");
        sb.append(this.b);
        sb.append(", canReportPost=");
        return lv8.t(sb, this.c, ")");
    }
}
