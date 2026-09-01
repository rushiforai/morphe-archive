package defpackage;

import gen.model.PostLicense;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class nh9 {
    public static PostLicense a(int i) {
        switch (i) {
            case 0:
                return PostLicense.ALL_RIGHTS_RESERVED;
            case 1:
                return PostLicense.CC_40_BY;
            case 2:
                return PostLicense.CC_40_BY_ND;
            case 3:
                return PostLicense.CC_40_BY_SA;
            case 4:
                return PostLicense.CC_40_BY_NC;
            case 5:
                return PostLicense.CC_40_BY_NC_ND;
            case 6:
                return PostLicense.CC_40_BY_NC_SA;
            case 7:
                return PostLicense.CC_40_ZERO;
            case 8:
                return PostLicense.PUBLIC_DOMAIN;
            default:
                return null;
        }
    }
}
