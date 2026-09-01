package defpackage;

import gen.model.UserFlag;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class tae {
    public static UserFlag a(int i) {
        if (i == 1) {
            return UserFlag.AURORA_PROFILE_PAGE;
        }
        if (i == 2) {
            return UserFlag.ENABLE_WEB_MEMBERSHIP_TRIAL;
        }
        if (i == 3) {
            return UserFlag.ENABLE_PARTNER_PROGRAM_ENROLLMENT;
        }
        if (i != 4) {
            return null;
        }
        return UserFlag.ENABLE_GROUP_GIFTING;
    }
}
