package defpackage;

import com.medium.android.graphql.type.DigestSectionType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class rd3 {
    public final sd3 a(DigestSectionType digestSectionType) {
        digestSectionType.getClass();
        int i = pd3.a[digestSectionType.ordinal()];
        if (i == 1) {
            return sd3.TOP_POSTS;
        }
        if (i == 2) {
            return sd3.FROM_YOUR_FOLLOWING;
        }
        wld.a.n(null, "DigestSectionType " + this + " not handled", new Object[0]);
        return null;
    }
}
