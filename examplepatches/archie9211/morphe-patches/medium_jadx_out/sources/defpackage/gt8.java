package defpackage;

import gen.model.OnboardingStatus;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class gt8 {
    public static OnboardingStatus a(int i) {
        if (i == 0) {
            return OnboardingStatus.NOT_ONBOARDED;
        }
        if (i == 1) {
            return OnboardingStatus.ONBOARDED;
        }
        if (i == 2) {
            return OnboardingStatus.SKIPPED;
        }
        if (i != 3) {
            return null;
        }
        return OnboardingStatus.ONBOARDED_WITH_TOPICS;
    }
}
