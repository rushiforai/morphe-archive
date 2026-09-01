package defpackage;

import com.medium.android.tag.recommendedposts.sB.mBTDfueQiGWRV;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class hf9 implements mf9 {
    public final String a;
    public final boolean b;

    public hf9(String str, boolean z) {
        str.getClass();
        this.a = str;
        this.b = z;
    }

    @Override // defpackage.mf9
    public final String b() {
        return this.a;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof hf9)) {
            return false;
        }
        hf9 hf9Var = (hf9) obj;
        return g76.L(this.a, hf9Var.a) && this.b == hf9Var.b;
    }

    public final int hashCode() {
        return (this.a.hashCode() * 31) + (this.b ? 1231 : 1237);
    }

    public final String toString() {
        return km4.z(mBTDfueQiGWRV.dntQmNlsDBJpKM, this.a, ", isPinned=", ")", this.b);
    }
}
