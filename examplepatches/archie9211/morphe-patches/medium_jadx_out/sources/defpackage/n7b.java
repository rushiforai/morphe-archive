package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class n7b {
    public final e7b a;
    public final boolean b;
    public final boolean c;

    public n7b(e7b e7bVar, boolean z, boolean z2) {
        this.a = e7bVar;
        this.b = z;
        this.c = z2;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof n7b)) {
            return false;
        }
        n7b n7bVar = (n7b) obj;
        return this.a == n7bVar.a && this.b == n7bVar.b && this.c == n7bVar.c;
    }

    public final int hashCode() {
        e7b e7bVar = this.a;
        return ((((e7bVar == null ? 0 : e7bVar.hashCode()) * 31) + (this.b ? 1231 : 1237)) * 31) + (this.c ? 1231 : 1237);
    }

    public final String toString() {
        StringBuilder sb = new StringBuilder("ViewState(selectedReportUserReason=");
        sb.append(this.a);
        sb.append(", blockUser=");
        sb.append(this.b);
        sb.append(", canReportUser=");
        return lv8.t(sb, this.c, ")");
    }
}
