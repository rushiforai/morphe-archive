package defpackage;

import com.medium.proto.event.PostClientVisibilityState;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes4.dex */
public final class af9 {
    public static PostClientVisibilityState a(int i) {
        if (i == 0) {
            return PostClientVisibilityState.PUBLIC;
        }
        if (i == 1) {
            return PostClientVisibilityState.UNLISTED;
        }
        if (i == 2) {
            return PostClientVisibilityState.LOCKED_MEMBER;
        }
        if (i != 3) {
            return null;
        }
        return PostClientVisibilityState.LOCKED_PREVIEW;
    }
}
