package defpackage;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class hdf {
    public final String a;
    public final wdf b;

    public hdf(String str, wdf wdfVar) {
        wdfVar.getClass();
        this.a = str;
        this.b = wdfVar;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hdf)) {
            return false;
        }
        hdf hdfVar = (hdf) obj;
        return g76.L(this.a, hdfVar.a) && this.b == hdfVar.b;
    }

    public final int hashCode() {
        String str = this.a;
        return this.b.hashCode() + ((str == null ? 0 : str.hashCode()) * 31);
    }

    public final String toString() {
        return "TagFeed(tagId=" + this.a + ", tagSort=" + this.b + ")";
    }
}
