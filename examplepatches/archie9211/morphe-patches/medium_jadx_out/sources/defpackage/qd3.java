package defpackage;

import gen.model.DigestSectionType;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class qd3 {
    public static DigestSectionType a(int i) {
        switch (i) {
            case 1:
                return DigestSectionType.TOP_POSTS;
            case 2:
                return DigestSectionType.POSTS_PUBLISHED_USERS_COLLECTIONS;
            case 3:
                return DigestSectionType.POSTS_PUBLISHED_USERS;
            case 4:
                return DigestSectionType.POSTS_PUBLISHED_COLLECTION;
            case 5:
                return DigestSectionType.POSTS_RECOMMENDED_USERS;
            case 6:
                return DigestSectionType.POSTS_SUGGESTED;
            case 7:
                return DigestSectionType.POSTS_TAG_FOLLOWED;
            case 8:
                return DigestSectionType.CURATED_CATALOGS;
            case 9:
                return DigestSectionType.PRMT_CATALOG;
            case 10:
                return DigestSectionType.PROMO;
            case 11:
                return DigestSectionType.POSTS_IN_FOLLOWED_TOPIC;
            case 12:
                return DigestSectionType.POSTS_IN_SUGGESTED_TOPIC;
            case 13:
                return DigestSectionType.POSTS_LATEST_IN_PREMIUM_TOPIC;
            case 14:
                return DigestSectionType.POSTS_PERSONALIZED_IN_PREMIUM_TOPIC;
            case 15:
                return DigestSectionType.FEATURED_CHUNK;
            case 16:
                return DigestSectionType.COLLABORATIVE_FILTERING_CHUNK;
            case 17:
                return DigestSectionType.POSTS_POPULAR;
            case 18:
                return DigestSectionType.POPCHUNK;
            case 19:
                return DigestSectionType.TOPICS_TO_FOLLOW;
            case 20:
                return DigestSectionType.UPSELL;
            case 21:
                return DigestSectionType.EVERGREEN_SECTION;
            case 22:
                return DigestSectionType.TOP_POSTS_EXTENDED;
            case 23:
                return DigestSectionType.FROM_YOUR_NETWORK;
            case 24:
                return DigestSectionType.RANKED_FEED;
            case 25:
                return DigestSectionType.RANKED_FEED_EXTENDED;
            case 26:
                return DigestSectionType.POSTS_IN_POPULAR_TOPIC;
            case 27:
                return DigestSectionType.IN_CASE_YOU_MISSED_IT;
            case 28:
                return DigestSectionType.QUICK_READS;
            case 29:
                return DigestSectionType.MORE_FOR_YOU;
            case 30:
                return DigestSectionType.RECENTLY_BOOKMARKED;
            case 31:
                return DigestSectionType.FROM_YOUR_FOLLOWING;
            case 32:
                return DigestSectionType.FROM_AUTHORS_YOU_MAY_ENJOY;
            case 33:
                return DigestSectionType.FROM_CREATORS_YOU_ARE_ENJOYING;
            case 34:
                return DigestSectionType.FROM_YOUR_RECENT_FOLLOWS;
            case 35:
                return DigestSectionType.POSTS_IN_FOLLOWED_TAG;
            case 36:
            default:
                return null;
            case 37:
                return DigestSectionType.ONBOARDING_TAG;
            case 38:
                return DigestSectionType.ONBOARDING_MORE_READS;
        }
    }
}
