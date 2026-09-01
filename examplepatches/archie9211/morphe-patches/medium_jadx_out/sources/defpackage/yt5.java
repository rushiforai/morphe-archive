package defpackage;

import gen.model.IFTTTSource;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class yt5 {
    public static IFTTTSource a(int i) {
        if (i == 1) {
            return IFTTTSource.TRIGGER_POSTS_RECOMMENDED_BY_YOU;
        }
        if (i == 2) {
            return IFTTTSource.TRIGGER_POSTS_BOOKMARKED_BY_YOU;
        }
        if (i != 3) {
            return null;
        }
        return IFTTTSource.TRIGGER_POSTS_PUBLISHED_BY_YOU;
    }
}
