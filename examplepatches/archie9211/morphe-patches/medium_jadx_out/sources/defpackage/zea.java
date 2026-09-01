package defpackage;

import com.medium.android.postpublishing.ui.publicationSelection.PublicationData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class zea extends gfa {
    public final PublicationData a;

    public zea(PublicationData publicationData) {
        this.a = publicationData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof zea) && g76.L(this.a, ((zea) obj).a);
    }

    public final int hashCode() {
        PublicationData publicationData = this.a;
        if (publicationData == null) {
            return 0;
        }
        return publicationData.hashCode();
    }

    public final String toString() {
        return "SavePublication(publicationData=" + this.a + ")";
    }
}
