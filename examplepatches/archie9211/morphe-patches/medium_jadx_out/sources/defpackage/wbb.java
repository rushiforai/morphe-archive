package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes.dex */
public final class wbb {
    public final int a;
    public final Integer b;

    public wbb(Integer num, int i) {
        this.a = i;
        this.b = num;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof wbb)) {
            return false;
        }
        wbb wbbVar = (wbb) obj;
        return this.a == wbbVar.a && g76.L(this.b, wbbVar.b);
    }

    public final int hashCode() {
        int i = this.a * 31;
        Integer num = this.b;
        return i + (num == null ? 0 : num.hashCode());
    }

    public final String toString() {
        return "RequestExecutionContext(attemptNumber=" + this.a + ", previousResponseCode=" + this.b + ")";
    }
}
