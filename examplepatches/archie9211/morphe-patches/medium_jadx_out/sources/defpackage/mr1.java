package defpackage;

import gen.model.CollectionHeadLayout;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class mr1 {
    public static CollectionHeadLayout a(int i) {
        switch (i) {
            case 1:
                return CollectionHeadLayout.FULL_WIDTH_DEPRECATED;
            case 2:
                return CollectionHeadLayout.OVER_STORY_DEPRECATED;
            case 3:
                return CollectionHeadLayout.COLLAPSED_DEPRECATED;
            case 4:
                return CollectionHeadLayout.SMALL;
            case 5:
                return CollectionHeadLayout.MEDIUM;
            case 6:
                return CollectionHeadLayout.LARGE;
            default:
                return null;
        }
    }
}
