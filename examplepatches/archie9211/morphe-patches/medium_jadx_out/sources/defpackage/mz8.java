package defpackage;

import com.drew.imaging.riff.pvS.uuLAxLN;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class mz8 {
    public final yz8 a;
    public final boolean b;

    public mz8(yz8 yz8Var, boolean z) {
        this.a = yz8Var;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof mz8)) {
            return false;
        }
        mz8 mz8Var = (mz8) obj;
        return this.a.equals(mz8Var.a) && this.b == mz8Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return "PaginatedCatalogItems(data=" + this.a + ", isLocalData=" + this.b + uuLAxLN.slGXjTv;
    }
}
