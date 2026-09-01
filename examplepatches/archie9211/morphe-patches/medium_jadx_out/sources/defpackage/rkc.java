package defpackage;

import gen.model.SourceRssType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class rkc {
    public static SourceRssType a(int i) {
        switch (i) {
            case 1:
                return SourceRssType.LATEST_FEED;
            case 2:
                return SourceRssType.USER_FEED;
            case 3:
                return SourceRssType.USER_RECOMMENDED_FEED;
            case 4:
                return SourceRssType.COLLECTION_FEED;
            case 5:
                return SourceRssType.TAG_FEED;
            case 6:
                return SourceRssType.CATALOG_FEED;
            case 7:
                return SourceRssType.USER_EXPORT_FEED;
            case 8:
                return SourceRssType.TOPIC_FEED;
            default:
                return null;
        }
    }
}
