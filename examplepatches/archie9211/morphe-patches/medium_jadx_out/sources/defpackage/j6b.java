package defpackage;

import com.medium.android.data.post.model.ReportRepostReason;
import gen.model.SourceParameter;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class j6b {
    public final ReportRepostReason a;
    public final boolean b;
    public final boolean c;
    public final SourceParameter d;

    public j6b(ReportRepostReason reportRepostReason, boolean z, boolean z2, SourceParameter sourceParameter) {
        sourceParameter.getClass();
        this.a = reportRepostReason;
        this.b = z;
        this.c = z2;
        this.d = sourceParameter;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof j6b)) {
            return false;
        }
        j6b j6bVar = (j6b) obj;
        return this.a == j6bVar.a && this.b == j6bVar.b && this.c == j6bVar.c && g76.L(this.d, j6bVar.d);
    }

    public final int hashCode() {
        ReportRepostReason reportRepostReason = this.a;
        return this.d.hashCode() + ((((((reportRepostReason == null ? 0 : reportRepostReason.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237)) * 31);
    }

    public final String toString() {
        return "ViewState(selectedReportRepostReason=" + this.a + ", blockUser=" + this.b + ", canReportRepost=" + this.c + ", sourceParameter=" + this.d + ")";
    }
}
