package defpackage;

import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.drew.metadata.exif.makernotes.ReconyxHyperFire2MakernoteDirectory;
import gen.model.PostFeedReason;

/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
public final class eg9 {
    public static PostFeedReason a(int i) {
        switch (i) {
            case 0:
                return PostFeedReason.POST_FEED_REASON_UNKNOWN;
            case 1:
                return PostFeedReason.PUBLISHED_BY_COLLECTION;
            case 2:
                return PostFeedReason.PUBLISHED_BY_USER;
            case 3:
                return PostFeedReason.RECOMMENDED_BY_USER;
            case 4:
                return PostFeedReason.RECOMMENDED_IN_TAG;
            case 5:
                return PostFeedReason.TOP_FOR_THE_DAY;
            case 6:
                return PostFeedReason.TOP_PUBLISHED_BY_COLLECTION;
            case 7:
                return PostFeedReason.TOP_PUBLISHED_BY_USER;
            case 8:
                return PostFeedReason.TOP_RECOMMENDED_BY_USER;
            case 9:
                return PostFeedReason.TOP_RECOMMENDED_IN_TAG;
            case 10:
                return PostFeedReason.TOP_CONVERSATION_STARTER;
            case 11:
                return PostFeedReason.TOP_RESPONSE;
            case 12:
                return PostFeedReason.GENERIC_SQL_POST_LIST;
            case 13:
                return PostFeedReason.RECOMMENDED_BY_STAFF;
            case 14:
                return PostFeedReason.TOP_FOR_THE_DAY_GLOBALLY;
            case 15:
                return PostFeedReason.PUBLISHED_IN_TAG;
            case 16:
                return PostFeedReason.BOOKMARKED;
            case 17:
                return PostFeedReason.PUBLISHED_IN_COLLECTION;
            case 18:
                return PostFeedReason.TOP_NEW_PUBLISHED;
            case 19:
                return PostFeedReason.TOP_LONG_READ;
            case 20:
                return PostFeedReason.TOP_MEDIUM_READ;
            case 21:
                return PostFeedReason.TOP_SHORT_READ;
            case 22:
                return PostFeedReason.TOP_MOMENTUM;
            case 23:
                return PostFeedReason.TOP_REFERRED;
            case 24:
                return PostFeedReason.TOP_NEW_AUTHOR;
            case 25:
                return PostFeedReason.USER_PROFILE_FEATURED;
            case 26:
                return PostFeedReason.USER_PROFILE_MOST_RECOMMENDED;
            case 27:
                return PostFeedReason.USER_PROFILE_ROOT_POSTS;
            case 28:
                return PostFeedReason.USER_PROFILE_NOT_A_COMMENT;
            case 29:
                return PostFeedReason.PUBLISHED_BY_AUTHOR;
            case 30:
                return PostFeedReason.PUBLISHED_BY_CURRENT_USER;
            case 31:
                return PostFeedReason.RECOMMENDED_BY_AUTHOR;
            case 32:
                return PostFeedReason.RECOMMENDED_BY_EDITOR;
            case 33:
                return PostFeedReason.RECOMMENDED_BY_CURRENT_USER;
            case 34:
                return PostFeedReason.RESPONSES_MOST_RECOMMENDED;
            case 35:
                return PostFeedReason.TOP_TRENDING;
            case 36:
                return PostFeedReason.TAG_IN_INTEREST_GRAPH;
            case 37:
                return PostFeedReason.SIMILAR_TO_RECENTLY_VOTED_POSTS;
            case 38:
                return PostFeedReason.USER_IN_DEEP_SOCIAL_GRAPH;
            case 39:
                return PostFeedReason.PROMOTED_POSTS;
            case 40:
                return PostFeedReason.TOP_SIMILAR_TO_POST;
            case 41:
                return PostFeedReason.TOP_IN_COLLECTION;
            case 42:
                return PostFeedReason.TOP_POSTS_SHARING_TAGS;
            case 43:
                return PostFeedReason.POSTS_SHARING_TAGS;
            case 44:
                return PostFeedReason.POSTS_SHARING_AUTHOR;
            case 45:
                return PostFeedReason.POSTS_SHARING_COLLECTION_AND_TAGS;
            case 46:
                return PostFeedReason.AMPLIFIED_NEW_STORY;
            case 47:
                return PostFeedReason.CURATED_POSTS_SHARING_TAGS_DEPRECATED;
            case 48:
                return PostFeedReason.CURATED_IN_PRMT_CATALOG;
            case 49:
                return PostFeedReason.CURATED_IN_TOPIC;
            case 50:
                return PostFeedReason.CURATED_IN_SUGGESTED_TOPIC;
            case 51:
                return PostFeedReason.CURATED_IN_POPULAR_TOPIC;
            case 52:
                return PostFeedReason.LATEST_IN_PREMIUM_TOPIC;
            case 53:
                return PostFeedReason.PERSONALIZED_IN_PREMIUM_TOPIC;
            case 54:
                return PostFeedReason.CURATED_IN_POPCHUNK;
            case 55:
                return PostFeedReason.TOP_IN_TOPIC;
            case 56:
                return PostFeedReason.CURATED_NOTEWORTHY_WRITER;
            case 57:
                return PostFeedReason.HOMEPAGE_FEATURED;
            case 58:
                return PostFeedReason.COLLABORATIVE_FILTERING;
            case 59:
                return PostFeedReason.SIMILAR_TO_RECENTLY_READ_OR_VOTED;
            case PanasonicMakernoteDirectory.TAG_PROGRAM_ISO /* 60 */:
                return PostFeedReason.CF_POST_SIMILAR_TO_POST;
            case 61:
                return PostFeedReason.RECOMMENDED_MEMBER_ONLY_CONTENT;
            case 62:
                return PostFeedReason.EVERGREEN;
            case 63:
                return PostFeedReason.FEATURED_IN_TOPIC;
            case 64:
                return PostFeedReason.USER_PROFILE_HAS_RECOMMENDED;
            case 65:
                return PostFeedReason.TOP_STORY_ON_MEDIUM;
            case 66:
                return PostFeedReason.EXPLORE_POST_UNDER_PRESENTED;
            case 67:
                return PostFeedReason.SIMILAR_TO_ONBOARDED_POST;
            case 68:
                return PostFeedReason.TOP_IN_POPULAR_ON_MEDIUM;
            case PanasonicMakernoteDirectory.TAG_BRACKET_SETTINGS /* 69 */:
                return PostFeedReason.PERSONALIZED_IN_COLLECTION_NEWSLETTER;
            case 70:
                return PostFeedReason.COLD_START;
            case PanasonicMakernoteDirectory.TAG_WB_ADJUST_GM /* 71 */:
                return PostFeedReason.TOP_IN_OPENED_DIGESTS;
            case 72:
                return PostFeedReason.TOP_IN_QUICK_READS;
            case 73:
                return PostFeedReason.TOP_POSTS_GLOBALLY;
            case 74:
                return PostFeedReason.RECENT_STAFF_RECOMMENDATION;
            case 75:
                return PostFeedReason.RECENT_OXO;
            case 76:
                return PostFeedReason.STARSPACE;
            case PanasonicMakernoteDirectory.TAG_AF_POINT_POSITION /* 77 */:
                return PostFeedReason.GLOBAL_LATEST;
            case 78:
                return PostFeedReason.TOP_POSTS_IN_FOLLOWED_TOPICS_WITH_FALLBACK;
            case 79:
                return PostFeedReason.POSTS_FROM_SPECIFIED_COLLECTIONS;
            case 80:
                return PostFeedReason.POSTS_FROM_SPECIFIED_AUTHORS;
            case PanasonicMakernoteDirectory.TAG_LENS_TYPE /* 81 */:
                return PostFeedReason.TOP_POSTS_TRENDING;
            case 82:
                return PostFeedReason.POSTS_FROM_RECOMMENDED_AUTHORS;
            case PanasonicMakernoteDirectory.TAG_ACCESSORY_TYPE /* 83 */:
                return PostFeedReason.POSTS_FROM_BG;
            case 84:
                return PostFeedReason.HOT_POSTS_FROM_TAG;
            case 85:
                return PostFeedReason.TOP_POSTS_FROM_TAG_WEEK;
            case 86:
                return PostFeedReason.TOP_POSTS_FROM_TAG_MONTH;
            case 87:
                return PostFeedReason.TOP_POSTS_FROM_TAG_YEAR;
            case ReconyxHyperFire2MakernoteDirectory.TAG_SATURATION /* 88 */:
                return PostFeedReason.TOP_POSTS_FROM_TAG_ALL_TIME;
            case PanasonicMakernoteDirectory.TAG_TRANSFORM /* 89 */:
                return PostFeedReason.NEW_POSTS_IN_TAG;
            case ReconyxHyperFire2MakernoteDirectory.TAG_FLASH /* 90 */:
                return PostFeedReason.COLLABORATIVE_FILTERING_UNDER_QUOTA;
            case 91:
            default:
                return null;
            case 92:
                return PostFeedReason.POST_UNDER_QUOTA;
            case 93:
                return PostFeedReason.STARSPACE_UNDER_QUOTA;
            case 94:
                return PostFeedReason.CLAPPED_BY_NETWORK;
            case 95:
                return PostFeedReason.HIGHLIGHTED_BY_NETWORK;
            case 96:
                return PostFeedReason.TOP_POSTS_INTERNALLY;
            case PanasonicMakernoteDirectory.TAG_FACE_RECOGNITION_INFO /* 97 */:
                return PostFeedReason.RECIRC_POSTS;
            case 98:
                return PostFeedReason.DEEP_RETRIEVAL_MODEL;
            case PanasonicMakernoteDirectory.TAG_RECOGNIZED_FACE_FLAGS /* 99 */:
                return PostFeedReason.CURATED_IN_TAG;
            case 100:
                return PostFeedReason.DEEP_RETRIEVAL_MODEL_UNDER_QUOTA;
            case 101:
                return PostFeedReason.POSTS_FROM_BG_EXPERIMENTAL;
            case 102:
                return PostFeedReason.DEEP_RETRIEVAL_MODEL_TQP;
            case 103:
                return PostFeedReason.STAFF_PICKS;
            case 104:
                return PostFeedReason.AUTHOR_RECIRC;
            case PanasonicMakernoteDirectory.TAG_COUNTRY /* 105 */:
                return PostFeedReason.COLLECTION_RECIRC;
            case 106:
                return PostFeedReason.TRUE_QUALITY_POOL_IN_TAG_UNDER_QUOTA;
            case 107:
                return PostFeedReason.TRUE_QUALITY_POOL_IN_TAG;
            case 108:
                return PostFeedReason.TRUE_QUALITY_POOL_UNDER_QUOTA;
            case 109:
                return PostFeedReason.DEEP_RETRIEVAL_MODEL_CONVERSION;
            case 110:
                return PostFeedReason.TRUE_QUALITY_POOL_UNDER_QUOTA_NON_PERSONALIZED;
            case PanasonicMakernoteDirectory.TAG_LANDMARK /* 111 */:
                return PostFeedReason.TOP_MEMBER_ONLY;
            case PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION /* 112 */:
                return PostFeedReason.FOLLOWED_ENTITY;
            case 113:
                return PostFeedReason.PAYWALL_MODEL;
            case 114:
                return PostFeedReason.REPOSTED_BY_NETWORK;
            case 115:
                return PostFeedReason.RESPONDED_BY_NETWORK;
            case 116:
                return PostFeedReason.ENGAGED_BY_NETWORK;
        }
    }
}
