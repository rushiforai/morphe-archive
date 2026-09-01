package defpackage;

import gen.model.PostMongerRequestType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class ei9 {
    public static PostMongerRequestType a(int i) {
        switch (i) {
            case 1:
                return PostMongerRequestType.FEATURE_LOCK;
            case 2:
                return PostMongerRequestType.FEATURE_LOCK_MINIMUM_GUARANTEE;
            case 3:
                return PostMongerRequestType.MINIMUM_GUARANTEE;
            case 4:
                return PostMongerRequestType.ELEVATE;
            case 5:
                return PostMongerRequestType.ELEVATE_MINIMUM_GUARANTEE;
            case 6:
                return PostMongerRequestType.ELEVATE_LOCKED;
            case 7:
                return PostMongerRequestType.ELEVATE_LOCKED_MINIMUM_GUARANTEE;
            case 8:
                return PostMongerRequestType.ELEVATE_BONUS;
            default:
                return null;
        }
    }
}
