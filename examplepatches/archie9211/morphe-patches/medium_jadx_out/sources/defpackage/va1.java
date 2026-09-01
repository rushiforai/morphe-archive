package defpackage;

import com.google.android.material.internal.It.KLTXZbnQvj;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes2.dex */
public final class va1 implements ya1 {
    public final String a;

    public va1(String str) {
        str.getClass();
        this.a = str;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof va1) && g76.L(this.a, ((va1) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return ev6.x("RemoveDownloadedCatalog(catalogId=", this.a, KLTXZbnQvj.VEMijbWQ);
    }
}
