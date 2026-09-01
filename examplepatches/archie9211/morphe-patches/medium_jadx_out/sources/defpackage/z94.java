package defpackage;

import gen.model.FastrakBetaVersion;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class z94 {
    public static FastrakBetaVersion a(int i) {
        if (i == 0) {
            return FastrakBetaVersion.BETA_UNKNOWN;
        }
        if (i == 1) {
            return FastrakBetaVersion.BETA_1;
        }
        if (i == 2) {
            return FastrakBetaVersion.BETA_2;
        }
        if (i == 3) {
            return FastrakBetaVersion.BETA_3;
        }
        if (i == 4) {
            return FastrakBetaVersion.ROLLOUT_INVITE;
        }
        if (i != 5) {
            return null;
        }
        return FastrakBetaVersion.ROLLOUT_NEW_USER;
    }
}
