package defpackage;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class qde implements tde {
    public final Throwable a;

    public qde(Throwable th) {
        this.a = th;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof qde) && this.a.equals(((qde) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return y30.p(pUlNWdybf.PXrh, ")", this.a);
    }
}
