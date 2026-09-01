package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class sj3 {
    public final long a;
    public final boolean b;

    public sj3(long j, boolean z) {
        this.a = j;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof sj3)) {
            return false;
        }
        sj3 sj3Var = (sj3) obj;
        return this.a == sj3Var.a && this.b == sj3Var.b;
    }

    public final int hashCode() {
        long j = this.a;
        return (((int) (j ^ (j >>> 32))) * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "ViewState(downloadedContentSizeInByte=" + this.a + ", canRemoveDownloadedContent=" + this.b + ")";
    }
}
