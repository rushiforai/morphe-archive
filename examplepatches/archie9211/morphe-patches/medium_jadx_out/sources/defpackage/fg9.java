package defpackage;

import gen.model.PostFeedSource;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class fg9 {
    public static PostFeedSource a(int i) {
        switch (i) {
            case 1:
                return PostFeedSource.CURATED;
            case 2:
                return PostFeedSource.FEED;
            case 3:
                return PostFeedSource.RCL;
            case 4:
                return PostFeedSource.TOP_FEED;
            case 5:
                return PostFeedSource.SINGLE_REASON_FEED;
            case 6:
                return PostFeedSource.GENERIC_SQL;
            case 7:
                return PostFeedSource.RESPONSE_STREAM;
            case 8:
                return PostFeedSource.SERIES;
            case 9:
                return PostFeedSource.NETWORK_SERIES;
            case 10:
                return PostFeedSource.LATEST_SERIES_SCREENED;
            case 11:
                return PostFeedSource.SERIES_CURRENTLY_READING;
            case 12:
                return PostFeedSource.BROWSABLE;
            case 13:
                return PostFeedSource.SERIES_HISTORY;
            case 14:
                return PostFeedSource.PUBLISHED_BY_FOLLOWED_USERS_AND_COLLECTIONS;
            case 15:
                return PostFeedSource.EXTREME_HOMEPAGE_MAIN_FEED;
            default:
                return null;
        }
    }
}
