package defpackage;

import com.medium.android.core.share.PostShareData;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class l5c implements n5c {
    public final PostShareData a;

    public l5c(PostShareData postShareData) {
        postShareData.getClass();
        this.a = postShareData;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof l5c) && g76.L(this.a, ((l5c) obj).a);
    }

    public final int hashCode() {
        return this.a.hashCode();
    }

    public final String toString() {
        return "CopyFriendLinkToClipboard(postShareData=" + this.a + ")";
    }
}
