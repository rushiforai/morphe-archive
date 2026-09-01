package defpackage;

import com.medium.android.yourfollowingfeed.ui.FollowedType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class gw4 {
    public final FollowedType a;
    public final boolean b;

    public gw4(FollowedType followedType, boolean z) {
        followedType.getClass();
        this.a = followedType;
        this.b = z;
    }

    public final boolean equals(Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof gw4)) {
            return false;
        }
        gw4 gw4Var = (gw4) obj;
        return this.a == gw4Var.a && this.b == gw4Var.b;
    }

    public final int hashCode() {
        return (((this.a.hashCode() * 31) + (this.b ? 1231 : 1237)) * 31) + 1237;
    }

    public final String toString() {
        return "FollowedTypePillUiModel(followedType=" + this.a + ", isSelected=" + this.b + ", hasNewContent=false)";
    }
}
