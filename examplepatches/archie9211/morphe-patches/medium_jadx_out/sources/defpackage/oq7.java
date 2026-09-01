package defpackage;

import gen.model.MediumMembershipType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class oq7 {
    public static MediumMembershipType a(int i) {
        if (i == 0) {
            return MediumMembershipType.MEDIUM_MONTHLY;
        }
        if (i == 1) {
            return MediumMembershipType.MEDIUM_YEARLY;
        }
        if (i == 2) {
            return MediumMembershipType.PREMIUM_MEDIUM_MONTHLY;
        }
        if (i != 3) {
            return null;
        }
        return MediumMembershipType.PREMIUM_MEDIUM_YEARLY;
    }
}
