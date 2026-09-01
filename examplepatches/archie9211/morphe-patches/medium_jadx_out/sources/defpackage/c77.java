package defpackage;

import gen.model.LockedPostSource;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class c77 {
    public static LockedPostSource a(int i) {
        switch (i) {
            case 0:
                return LockedPostSource.LOCKED_POST_SOURCE_NONE;
            case 1:
                return LockedPostSource.LOCKED_POST_SOURCE_UGC;
            case 2:
                return LockedPostSource.LOCKED_POST_SOURCE_COMMISSIONED;
            case 3:
                return LockedPostSource.LOCKED_POST_SOURCE_SYNDICATED;
            case 4:
                return LockedPostSource.LOCKED_POST_SOURCE_PUBLICATION_MEMBERSHIP;
            case 5:
                return LockedPostSource.LOCKED_POST_SOURCE_FEATURE_LOCK;
            case 6:
                return LockedPostSource.LOCKED_POST_SOURCE_UGC_UNENROLLED;
            case 7:
                return LockedPostSource.LOCKED_POST_SOURCE_PARTNERSHIPS;
            default:
                return null;
        }
    }
}
