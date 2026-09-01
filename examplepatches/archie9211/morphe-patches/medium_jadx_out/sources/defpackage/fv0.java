package defpackage;

import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class fv0 implements hv0 {
    public final PostShareData a;

    public fv0(PostShareData postShareData) {
        this.a = postShareData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof fv0) && this.a.equals(((fv0) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "Enabled(postShareData=" + this.a + ")";
    }
}
