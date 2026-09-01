package gen.model;

import androidx.fragment.app.strictmode.YLGt.ZVsviyDAr;
import com.drew.metadata.exif.makernotes.PanasonicMakernoteDirectory;
import com.google.android.material.internal.It.KLTXZbnQvj;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import com.squareup.wire.sjIw.ezwlgQm;
import defpackage.eg9;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b}\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#j\u0002\b$j\u0002\b%j\u0002\b&j\u0002\b'j\u0002\b(j\u0002\b)j\u0002\b*j\u0002\b+j\u0002\b,j\u0002\b-j\u0002\b.j\u0002\b/j\u0002\b0j\u0002\b1j\u0002\b2j\u0002\b3j\u0002\b4j\u0002\b5j\u0002\b6j\u0002\b7j\u0002\b8j\u0002\b9j\u0002\b:j\u0002\b;j\u0002\b<j\u0002\b=j\u0002\b>j\u0002\b?j\u0002\b@j\u0002\bAj\u0002\bBj\u0002\bCj\u0002\bDj\u0002\bEj\u0002\bFj\u0002\bGj\u0002\bHj\u0002\bIj\u0002\bJj\u0002\bKj\u0002\bLj\u0002\bMj\u0002\bNj\u0002\bOj\u0002\bPj\u0002\bQj\u0002\bRj\u0002\bSj\u0002\bTj\u0002\bUj\u0002\bVj\u0002\bWj\u0002\bXj\u0002\bYj\u0002\bZj\u0002\b[j\u0002\b\\j\u0002\b]j\u0002\b^j\u0002\b_j\u0002\b`j\u0002\baj\u0002\bbj\u0002\bcj\u0002\bdj\u0002\bej\u0002\bfj\u0002\bgj\u0002\bhj\u0002\bij\u0002\bjj\u0002\bkj\u0002\blj\u0002\bmj\u0002\bnj\u0002\boj\u0002\bpj\u0002\bqj\u0002\brj\u0002\bsj\u0002\btj\u0002\buj\u0002\bvj\u0002\bwj\u0002\bxj\u0002\byj\u0002\bzj\u0002\b{j\u0002\b|j\u0002\b}j\u0002\b~j\u0002\b\u007f¨\u0006\u0080\u0001"}, d2 = {"Lgen/model/PostFeedReason;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "eg9", "POST_FEED_REASON_UNKNOWN", "PUBLISHED_BY_COLLECTION", "PUBLISHED_BY_USER", "RECOMMENDED_BY_STAFF", "SIMILAR_TO_RECENTLY_VOTED_POSTS", "SIMILAR_TO_RECENTLY_READ_OR_VOTED", "PERSONALIZED_IN_COLLECTION_NEWSLETTER", "TOP_POSTS_GLOBALLY", "GLOBAL_LATEST", "TOP_POSTS_TRENDING", "POSTS_FROM_BG", "HOT_POSTS_FROM_TAG", "TOP_POSTS_FROM_TAG_WEEK", "TOP_POSTS_FROM_TAG_MONTH", "TOP_POSTS_FROM_TAG_YEAR", "TOP_POSTS_FROM_TAG_ALL_TIME", "NEW_POSTS_IN_TAG", "CLAPPED_BY_NETWORK", "HIGHLIGHTED_BY_NETWORK", "RECIRC_POSTS", "DEEP_RETRIEVAL_MODEL", "CURATED_IN_TAG", "DEEP_RETRIEVAL_MODEL_TQP", "STAFF_PICKS", "AUTHOR_RECIRC", "COLLECTION_RECIRC", "TRUE_QUALITY_POOL_IN_TAG_UNDER_QUOTA", "TRUE_QUALITY_POOL_IN_TAG", "TRUE_QUALITY_POOL_UNDER_QUOTA", "DEEP_RETRIEVAL_MODEL_CONVERSION", "TRUE_QUALITY_POOL_UNDER_QUOTA_NON_PERSONALIZED", "FOLLOWED_ENTITY", "PAYWALL_MODEL", "REPOSTED_BY_NETWORK", "RESPONDED_BY_NETWORK", "ENGAGED_BY_NETWORK", "TOP_MEMBER_ONLY", "PUBLISHED_IN_COLLECTION", "POST_UNDER_QUOTA", "POSTS_FROM_BG_EXPERIMENTAL", "COLLABORATIVE_FILTERING", "TOP_POSTS_INTERNALLY", "DEEP_RETRIEVAL_MODEL_UNDER_QUOTA", "TOP_IN_OPENED_DIGESTS", "RECENT_STAFF_RECOMMENDATION", "COLLABORATIVE_FILTERING_UNDER_QUOTA", "CURATED_IN_SUGGESTED_TOPIC", "CURATED_IN_POPULAR_TOPIC", "STARSPACE_UNDER_QUOTA", "STARSPACE", "POSTS_FROM_RECOMMENDED_AUTHORS", "POSTS_FROM_SPECIFIED_AUTHORS", "POSTS_FROM_SPECIFIED_COLLECTIONS", "USER_IN_DEEP_SOCIAL_GRAPH", "RECENT_OXO", "TOP_IN_QUICK_READS", "TOP_IN_TOPIC", "TOP_IN_POPULAR_ON_MEDIUM", "COLD_START", "CF_POST_SIMILAR_TO_POST", "RECOMMENDED_MEMBER_ONLY_CONTENT", "EVERGREEN", "FEATURED_IN_TOPIC", "EXPLORE_POST_UNDER_PRESENTED", "SIMILAR_TO_ONBOARDED_POST", "LATEST_IN_PREMIUM_TOPIC", "PERSONALIZED_IN_PREMIUM_TOPIC", "CURATED_NOTEWORTHY_WRITER", "HOMEPAGE_FEATURED", "USER_PROFILE_FEATURED", "USER_PROFILE_MOST_RECOMMENDED", "USER_PROFILE_NOT_A_COMMENT", "USER_PROFILE_HAS_RECOMMENDED", "PUBLISHED_BY_AUTHOR", "PUBLISHED_BY_CURRENT_USER", "RECOMMENDED_BY_AUTHOR", "RECOMMENDED_BY_EDITOR", "RECOMMENDED_BY_CURRENT_USER", "RESPONSES_MOST_RECOMMENDED", "TOP_SIMILAR_TO_POST", "TOP_IN_COLLECTION", "TOP_POSTS_SHARING_TAGS", "POSTS_SHARING_TAGS", "POSTS_SHARING_AUTHOR", "POSTS_SHARING_COLLECTION_AND_TAGS", "TOP_NEW_PUBLISHED", "TOP_MOMENTUM", "TOP_REFERRED", "TOP_NEW_AUTHOR", "TOP_TRENDING", "TAG_IN_INTEREST_GRAPH", "PUBLISHED_IN_TAG", "BOOKMARKED", "TOP_FOR_THE_DAY_GLOBALLY", "GENERIC_SQL_POST_LIST", "TOP_RECOMMENDED_BY_USER", "TOP_PUBLISHED_BY_USER", "TOP_PUBLISHED_BY_COLLECTION", "RECOMMENDED_IN_TAG", "RECOMMENDED_BY_USER", "TOP_FOR_THE_DAY", "TOP_RECOMMENDED_IN_TAG", "TOP_CONVERSATION_STARTER", "TOP_RESPONSE", "USER_PROFILE_ROOT_POSTS", "PROMOTED_POSTS", "CURATED_POSTS_SHARING_TAGS_DEPRECATED", "CURATED_IN_PRMT_CATALOG", "AMPLIFIED_NEW_STORY", "CURATED_IN_POPCHUNK", "TOP_LONG_READ", "TOP_MEDIUM_READ", "TOP_SHORT_READ", "TOP_STORY_ON_MEDIUM", "CURATED_IN_TOPIC", "TOP_POSTS_IN_FOLLOWED_TOPICS_WITH_FALLBACK", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostFeedReason implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostFeedReason[] $VALUES;
    public static final ProtoAdapter<PostFeedReason> ADAPTER;
    public static final PostFeedReason AMPLIFIED_NEW_STORY;
    public static final PostFeedReason AUTHOR_RECIRC;
    public static final PostFeedReason BOOKMARKED;
    public static final PostFeedReason CF_POST_SIMILAR_TO_POST;
    public static final PostFeedReason CLAPPED_BY_NETWORK;
    public static final PostFeedReason COLD_START;
    public static final PostFeedReason COLLABORATIVE_FILTERING;
    public static final PostFeedReason COLLABORATIVE_FILTERING_UNDER_QUOTA;
    public static final PostFeedReason COLLECTION_RECIRC;
    public static final PostFeedReason CURATED_IN_POPCHUNK;
    public static final PostFeedReason CURATED_IN_POPULAR_TOPIC;
    public static final PostFeedReason CURATED_IN_PRMT_CATALOG;
    public static final PostFeedReason CURATED_IN_SUGGESTED_TOPIC;
    public static final PostFeedReason CURATED_IN_TAG;
    public static final PostFeedReason CURATED_IN_TOPIC;
    public static final PostFeedReason CURATED_NOTEWORTHY_WRITER;
    public static final PostFeedReason CURATED_POSTS_SHARING_TAGS_DEPRECATED;
    public static final eg9 Companion;
    public static final PostFeedReason DEEP_RETRIEVAL_MODEL;
    public static final PostFeedReason DEEP_RETRIEVAL_MODEL_CONVERSION;
    public static final PostFeedReason DEEP_RETRIEVAL_MODEL_TQP;
    public static final PostFeedReason DEEP_RETRIEVAL_MODEL_UNDER_QUOTA;
    public static final PostFeedReason ENGAGED_BY_NETWORK;
    public static final PostFeedReason EVERGREEN;
    public static final PostFeedReason EXPLORE_POST_UNDER_PRESENTED;
    public static final PostFeedReason FEATURED_IN_TOPIC;
    public static final PostFeedReason FOLLOWED_ENTITY;
    public static final PostFeedReason GENERIC_SQL_POST_LIST;
    public static final PostFeedReason GLOBAL_LATEST;
    public static final PostFeedReason HIGHLIGHTED_BY_NETWORK;
    public static final PostFeedReason HOMEPAGE_FEATURED;
    public static final PostFeedReason HOT_POSTS_FROM_TAG;
    public static final PostFeedReason LATEST_IN_PREMIUM_TOPIC;
    public static final PostFeedReason NEW_POSTS_IN_TAG;
    public static final PostFeedReason PAYWALL_MODEL;
    public static final PostFeedReason PERSONALIZED_IN_COLLECTION_NEWSLETTER;
    public static final PostFeedReason PERSONALIZED_IN_PREMIUM_TOPIC;
    public static final PostFeedReason POSTS_FROM_BG;
    public static final PostFeedReason POSTS_FROM_BG_EXPERIMENTAL;
    public static final PostFeedReason POSTS_FROM_RECOMMENDED_AUTHORS;
    public static final PostFeedReason POSTS_FROM_SPECIFIED_AUTHORS;
    public static final PostFeedReason POSTS_FROM_SPECIFIED_COLLECTIONS;
    public static final PostFeedReason POSTS_SHARING_AUTHOR;
    public static final PostFeedReason POSTS_SHARING_COLLECTION_AND_TAGS;
    public static final PostFeedReason POSTS_SHARING_TAGS;
    public static final PostFeedReason POST_FEED_REASON_UNKNOWN;
    public static final PostFeedReason POST_UNDER_QUOTA;
    public static final PostFeedReason PROMOTED_POSTS;
    public static final PostFeedReason PUBLISHED_BY_AUTHOR;
    public static final PostFeedReason PUBLISHED_BY_COLLECTION;
    public static final PostFeedReason PUBLISHED_BY_CURRENT_USER;
    public static final PostFeedReason PUBLISHED_BY_USER;
    public static final PostFeedReason PUBLISHED_IN_COLLECTION;
    public static final PostFeedReason PUBLISHED_IN_TAG;
    public static final PostFeedReason RECENT_OXO;
    public static final PostFeedReason RECENT_STAFF_RECOMMENDATION;
    public static final PostFeedReason RECIRC_POSTS;
    public static final PostFeedReason RECOMMENDED_BY_AUTHOR;
    public static final PostFeedReason RECOMMENDED_BY_CURRENT_USER;
    public static final PostFeedReason RECOMMENDED_BY_EDITOR;
    public static final PostFeedReason RECOMMENDED_BY_STAFF;
    public static final PostFeedReason RECOMMENDED_BY_USER;
    public static final PostFeedReason RECOMMENDED_IN_TAG;
    public static final PostFeedReason RECOMMENDED_MEMBER_ONLY_CONTENT;
    public static final PostFeedReason REPOSTED_BY_NETWORK;
    public static final PostFeedReason RESPONDED_BY_NETWORK;
    public static final PostFeedReason RESPONSES_MOST_RECOMMENDED;
    public static final PostFeedReason SIMILAR_TO_ONBOARDED_POST;
    public static final PostFeedReason SIMILAR_TO_RECENTLY_READ_OR_VOTED;
    public static final PostFeedReason SIMILAR_TO_RECENTLY_VOTED_POSTS;
    public static final PostFeedReason STAFF_PICKS;
    public static final PostFeedReason STARSPACE;
    public static final PostFeedReason STARSPACE_UNDER_QUOTA;
    public static final PostFeedReason TAG_IN_INTEREST_GRAPH;
    public static final PostFeedReason TOP_CONVERSATION_STARTER;
    public static final PostFeedReason TOP_FOR_THE_DAY;
    public static final PostFeedReason TOP_FOR_THE_DAY_GLOBALLY;
    public static final PostFeedReason TOP_IN_COLLECTION;
    public static final PostFeedReason TOP_IN_OPENED_DIGESTS;
    public static final PostFeedReason TOP_IN_POPULAR_ON_MEDIUM;
    public static final PostFeedReason TOP_IN_QUICK_READS;
    public static final PostFeedReason TOP_IN_TOPIC;
    public static final PostFeedReason TOP_LONG_READ;
    public static final PostFeedReason TOP_MEDIUM_READ;
    public static final PostFeedReason TOP_MEMBER_ONLY;
    public static final PostFeedReason TOP_MOMENTUM;
    public static final PostFeedReason TOP_NEW_AUTHOR;
    public static final PostFeedReason TOP_NEW_PUBLISHED;
    public static final PostFeedReason TOP_POSTS_FROM_TAG_ALL_TIME;
    public static final PostFeedReason TOP_POSTS_FROM_TAG_MONTH;
    public static final PostFeedReason TOP_POSTS_FROM_TAG_WEEK;
    public static final PostFeedReason TOP_POSTS_FROM_TAG_YEAR;
    public static final PostFeedReason TOP_POSTS_GLOBALLY;
    public static final PostFeedReason TOP_POSTS_INTERNALLY;
    public static final PostFeedReason TOP_POSTS_IN_FOLLOWED_TOPICS_WITH_FALLBACK;
    public static final PostFeedReason TOP_POSTS_SHARING_TAGS;
    public static final PostFeedReason TOP_POSTS_TRENDING;
    public static final PostFeedReason TOP_PUBLISHED_BY_COLLECTION;
    public static final PostFeedReason TOP_PUBLISHED_BY_USER;
    public static final PostFeedReason TOP_RECOMMENDED_BY_USER;
    public static final PostFeedReason TOP_RECOMMENDED_IN_TAG;
    public static final PostFeedReason TOP_REFERRED;
    public static final PostFeedReason TOP_RESPONSE;
    public static final PostFeedReason TOP_SHORT_READ;
    public static final PostFeedReason TOP_SIMILAR_TO_POST;
    public static final PostFeedReason TOP_STORY_ON_MEDIUM;
    public static final PostFeedReason TOP_TRENDING;
    public static final PostFeedReason TRUE_QUALITY_POOL_IN_TAG;
    public static final PostFeedReason TRUE_QUALITY_POOL_IN_TAG_UNDER_QUOTA;
    public static final PostFeedReason TRUE_QUALITY_POOL_UNDER_QUOTA;
    public static final PostFeedReason TRUE_QUALITY_POOL_UNDER_QUOTA_NON_PERSONALIZED;
    public static final PostFeedReason USER_IN_DEEP_SOCIAL_GRAPH;
    public static final PostFeedReason USER_PROFILE_FEATURED;
    public static final PostFeedReason USER_PROFILE_HAS_RECOMMENDED;
    public static final PostFeedReason USER_PROFILE_MOST_RECOMMENDED;
    public static final PostFeedReason USER_PROFILE_NOT_A_COMMENT;
    public static final PostFeedReason USER_PROFILE_ROOT_POSTS;
    private final int value;

    private static final /* synthetic */ PostFeedReason[] $values() {
        return new PostFeedReason[]{POST_FEED_REASON_UNKNOWN, PUBLISHED_BY_COLLECTION, PUBLISHED_BY_USER, RECOMMENDED_BY_STAFF, SIMILAR_TO_RECENTLY_VOTED_POSTS, SIMILAR_TO_RECENTLY_READ_OR_VOTED, PERSONALIZED_IN_COLLECTION_NEWSLETTER, TOP_POSTS_GLOBALLY, GLOBAL_LATEST, TOP_POSTS_TRENDING, POSTS_FROM_BG, HOT_POSTS_FROM_TAG, TOP_POSTS_FROM_TAG_WEEK, TOP_POSTS_FROM_TAG_MONTH, TOP_POSTS_FROM_TAG_YEAR, TOP_POSTS_FROM_TAG_ALL_TIME, NEW_POSTS_IN_TAG, CLAPPED_BY_NETWORK, HIGHLIGHTED_BY_NETWORK, RECIRC_POSTS, DEEP_RETRIEVAL_MODEL, CURATED_IN_TAG, DEEP_RETRIEVAL_MODEL_TQP, STAFF_PICKS, AUTHOR_RECIRC, COLLECTION_RECIRC, TRUE_QUALITY_POOL_IN_TAG_UNDER_QUOTA, TRUE_QUALITY_POOL_IN_TAG, TRUE_QUALITY_POOL_UNDER_QUOTA, DEEP_RETRIEVAL_MODEL_CONVERSION, TRUE_QUALITY_POOL_UNDER_QUOTA_NON_PERSONALIZED, FOLLOWED_ENTITY, PAYWALL_MODEL, REPOSTED_BY_NETWORK, RESPONDED_BY_NETWORK, ENGAGED_BY_NETWORK, TOP_MEMBER_ONLY, PUBLISHED_IN_COLLECTION, POST_UNDER_QUOTA, POSTS_FROM_BG_EXPERIMENTAL, COLLABORATIVE_FILTERING, TOP_POSTS_INTERNALLY, DEEP_RETRIEVAL_MODEL_UNDER_QUOTA, TOP_IN_OPENED_DIGESTS, RECENT_STAFF_RECOMMENDATION, COLLABORATIVE_FILTERING_UNDER_QUOTA, CURATED_IN_SUGGESTED_TOPIC, CURATED_IN_POPULAR_TOPIC, STARSPACE_UNDER_QUOTA, STARSPACE, POSTS_FROM_RECOMMENDED_AUTHORS, POSTS_FROM_SPECIFIED_AUTHORS, POSTS_FROM_SPECIFIED_COLLECTIONS, USER_IN_DEEP_SOCIAL_GRAPH, RECENT_OXO, TOP_IN_QUICK_READS, TOP_IN_TOPIC, TOP_IN_POPULAR_ON_MEDIUM, COLD_START, CF_POST_SIMILAR_TO_POST, RECOMMENDED_MEMBER_ONLY_CONTENT, EVERGREEN, FEATURED_IN_TOPIC, EXPLORE_POST_UNDER_PRESENTED, SIMILAR_TO_ONBOARDED_POST, LATEST_IN_PREMIUM_TOPIC, PERSONALIZED_IN_PREMIUM_TOPIC, CURATED_NOTEWORTHY_WRITER, HOMEPAGE_FEATURED, USER_PROFILE_FEATURED, USER_PROFILE_MOST_RECOMMENDED, USER_PROFILE_NOT_A_COMMENT, USER_PROFILE_HAS_RECOMMENDED, PUBLISHED_BY_AUTHOR, PUBLISHED_BY_CURRENT_USER, RECOMMENDED_BY_AUTHOR, RECOMMENDED_BY_EDITOR, RECOMMENDED_BY_CURRENT_USER, RESPONSES_MOST_RECOMMENDED, TOP_SIMILAR_TO_POST, TOP_IN_COLLECTION, TOP_POSTS_SHARING_TAGS, POSTS_SHARING_TAGS, POSTS_SHARING_AUTHOR, POSTS_SHARING_COLLECTION_AND_TAGS, TOP_NEW_PUBLISHED, TOP_MOMENTUM, TOP_REFERRED, TOP_NEW_AUTHOR, TOP_TRENDING, TAG_IN_INTEREST_GRAPH, PUBLISHED_IN_TAG, BOOKMARKED, TOP_FOR_THE_DAY_GLOBALLY, GENERIC_SQL_POST_LIST, TOP_RECOMMENDED_BY_USER, TOP_PUBLISHED_BY_USER, TOP_PUBLISHED_BY_COLLECTION, RECOMMENDED_IN_TAG, RECOMMENDED_BY_USER, TOP_FOR_THE_DAY, TOP_RECOMMENDED_IN_TAG, TOP_CONVERSATION_STARTER, TOP_RESPONSE, USER_PROFILE_ROOT_POSTS, PROMOTED_POSTS, CURATED_POSTS_SHARING_TAGS_DEPRECATED, CURATED_IN_PRMT_CATALOG, AMPLIFIED_NEW_STORY, CURATED_IN_POPCHUNK, TOP_LONG_READ, TOP_MEDIUM_READ, TOP_SHORT_READ, TOP_STORY_ON_MEDIUM, CURATED_IN_TOPIC, TOP_POSTS_IN_FOLLOWED_TOPICS_WITH_FALLBACK};
    }

    private PostFeedReason(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostFeedReason fromValue(int i) {
        Companion.getClass();
        return eg9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostFeedReason valueOf(String str) {
        return (PostFeedReason) Enum.valueOf(PostFeedReason.class, str);
    }

    public static PostFeedReason[] values() {
        return (PostFeedReason[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }

    static {
        PostFeedReason postFeedReason = new PostFeedReason("POST_FEED_REASON_UNKNOWN", 0, 0);
        POST_FEED_REASON_UNKNOWN = postFeedReason;
        PUBLISHED_BY_COLLECTION = new PostFeedReason("PUBLISHED_BY_COLLECTION", 1, 1);
        PUBLISHED_BY_USER = new PostFeedReason("PUBLISHED_BY_USER", 2, 2);
        RECOMMENDED_BY_STAFF = new PostFeedReason("RECOMMENDED_BY_STAFF", 3, 13);
        SIMILAR_TO_RECENTLY_VOTED_POSTS = new PostFeedReason("SIMILAR_TO_RECENTLY_VOTED_POSTS", 4, 37);
        SIMILAR_TO_RECENTLY_READ_OR_VOTED = new PostFeedReason("SIMILAR_TO_RECENTLY_READ_OR_VOTED", 5, 59);
        PERSONALIZED_IN_COLLECTION_NEWSLETTER = new PostFeedReason("PERSONALIZED_IN_COLLECTION_NEWSLETTER", 6, 69);
        TOP_POSTS_GLOBALLY = new PostFeedReason("TOP_POSTS_GLOBALLY", 7, 73);
        GLOBAL_LATEST = new PostFeedReason("GLOBAL_LATEST", 8, 77);
        TOP_POSTS_TRENDING = new PostFeedReason("TOP_POSTS_TRENDING", 9, 81);
        POSTS_FROM_BG = new PostFeedReason("POSTS_FROM_BG", 10, 83);
        HOT_POSTS_FROM_TAG = new PostFeedReason("HOT_POSTS_FROM_TAG", 11, 84);
        TOP_POSTS_FROM_TAG_WEEK = new PostFeedReason("TOP_POSTS_FROM_TAG_WEEK", 12, 85);
        TOP_POSTS_FROM_TAG_MONTH = new PostFeedReason("TOP_POSTS_FROM_TAG_MONTH", 13, 86);
        TOP_POSTS_FROM_TAG_YEAR = new PostFeedReason("TOP_POSTS_FROM_TAG_YEAR", 14, 87);
        TOP_POSTS_FROM_TAG_ALL_TIME = new PostFeedReason("TOP_POSTS_FROM_TAG_ALL_TIME", 15, 88);
        NEW_POSTS_IN_TAG = new PostFeedReason("NEW_POSTS_IN_TAG", 16, 89);
        CLAPPED_BY_NETWORK = new PostFeedReason("CLAPPED_BY_NETWORK", 17, 94);
        HIGHLIGHTED_BY_NETWORK = new PostFeedReason("HIGHLIGHTED_BY_NETWORK", 18, 95);
        RECIRC_POSTS = new PostFeedReason("RECIRC_POSTS", 19, 97);
        DEEP_RETRIEVAL_MODEL = new PostFeedReason("DEEP_RETRIEVAL_MODEL", 20, 98);
        CURATED_IN_TAG = new PostFeedReason("CURATED_IN_TAG", 21, 99);
        DEEP_RETRIEVAL_MODEL_TQP = new PostFeedReason("DEEP_RETRIEVAL_MODEL_TQP", 22, 102);
        STAFF_PICKS = new PostFeedReason("STAFF_PICKS", 23, 103);
        AUTHOR_RECIRC = new PostFeedReason("AUTHOR_RECIRC", 24, 104);
        COLLECTION_RECIRC = new PostFeedReason("COLLECTION_RECIRC", 25, PanasonicMakernoteDirectory.TAG_COUNTRY);
        TRUE_QUALITY_POOL_IN_TAG_UNDER_QUOTA = new PostFeedReason("TRUE_QUALITY_POOL_IN_TAG_UNDER_QUOTA", 26, 106);
        TRUE_QUALITY_POOL_IN_TAG = new PostFeedReason("TRUE_QUALITY_POOL_IN_TAG", 27, 107);
        TRUE_QUALITY_POOL_UNDER_QUOTA = new PostFeedReason("TRUE_QUALITY_POOL_UNDER_QUOTA", 28, 108);
        DEEP_RETRIEVAL_MODEL_CONVERSION = new PostFeedReason("DEEP_RETRIEVAL_MODEL_CONVERSION", 29, 109);
        TRUE_QUALITY_POOL_UNDER_QUOTA_NON_PERSONALIZED = new PostFeedReason("TRUE_QUALITY_POOL_UNDER_QUOTA_NON_PERSONALIZED", 30, 110);
        FOLLOWED_ENTITY = new PostFeedReason("FOLLOWED_ENTITY", 31, PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION);
        PAYWALL_MODEL = new PostFeedReason("PAYWALL_MODEL", 32, 113);
        REPOSTED_BY_NETWORK = new PostFeedReason("REPOSTED_BY_NETWORK", 33, 114);
        RESPONDED_BY_NETWORK = new PostFeedReason("RESPONDED_BY_NETWORK", 34, 115);
        ENGAGED_BY_NETWORK = new PostFeedReason("ENGAGED_BY_NETWORK", 35, 116);
        TOP_MEMBER_ONLY = new PostFeedReason("TOP_MEMBER_ONLY", 36, PanasonicMakernoteDirectory.TAG_LANDMARK);
        PUBLISHED_IN_COLLECTION = new PostFeedReason("PUBLISHED_IN_COLLECTION", 37, 17);
        POST_UNDER_QUOTA = new PostFeedReason("POST_UNDER_QUOTA", 38, 92);
        POSTS_FROM_BG_EXPERIMENTAL = new PostFeedReason("POSTS_FROM_BG_EXPERIMENTAL", 39, 101);
        COLLABORATIVE_FILTERING = new PostFeedReason("COLLABORATIVE_FILTERING", 40, 58);
        TOP_POSTS_INTERNALLY = new PostFeedReason("TOP_POSTS_INTERNALLY", 41, 96);
        DEEP_RETRIEVAL_MODEL_UNDER_QUOTA = new PostFeedReason("DEEP_RETRIEVAL_MODEL_UNDER_QUOTA", 42, 100);
        TOP_IN_OPENED_DIGESTS = new PostFeedReason("TOP_IN_OPENED_DIGESTS", 43, 71);
        RECENT_STAFF_RECOMMENDATION = new PostFeedReason("RECENT_STAFF_RECOMMENDATION", 44, 74);
        COLLABORATIVE_FILTERING_UNDER_QUOTA = new PostFeedReason("COLLABORATIVE_FILTERING_UNDER_QUOTA", 45, 90);
        CURATED_IN_SUGGESTED_TOPIC = new PostFeedReason("CURATED_IN_SUGGESTED_TOPIC", 46, 50);
        CURATED_IN_POPULAR_TOPIC = new PostFeedReason(KLTXZbnQvj.YWAHWTvXHiaj, 47, 51);
        STARSPACE_UNDER_QUOTA = new PostFeedReason("STARSPACE_UNDER_QUOTA", 48, 93);
        STARSPACE = new PostFeedReason("STARSPACE", 49, 76);
        POSTS_FROM_RECOMMENDED_AUTHORS = new PostFeedReason("POSTS_FROM_RECOMMENDED_AUTHORS", 50, 82);
        POSTS_FROM_SPECIFIED_AUTHORS = new PostFeedReason("POSTS_FROM_SPECIFIED_AUTHORS", 51, 80);
        POSTS_FROM_SPECIFIED_COLLECTIONS = new PostFeedReason("POSTS_FROM_SPECIFIED_COLLECTIONS", 52, 79);
        USER_IN_DEEP_SOCIAL_GRAPH = new PostFeedReason("USER_IN_DEEP_SOCIAL_GRAPH", 53, 38);
        RECENT_OXO = new PostFeedReason("RECENT_OXO", 54, 75);
        TOP_IN_QUICK_READS = new PostFeedReason("TOP_IN_QUICK_READS", 55, 72);
        TOP_IN_TOPIC = new PostFeedReason("TOP_IN_TOPIC", 56, 55);
        TOP_IN_POPULAR_ON_MEDIUM = new PostFeedReason("TOP_IN_POPULAR_ON_MEDIUM", 57, 68);
        COLD_START = new PostFeedReason("COLD_START", 58, 70);
        CF_POST_SIMILAR_TO_POST = new PostFeedReason("CF_POST_SIMILAR_TO_POST", 59, 60);
        RECOMMENDED_MEMBER_ONLY_CONTENT = new PostFeedReason("RECOMMENDED_MEMBER_ONLY_CONTENT", 60, 61);
        EVERGREEN = new PostFeedReason("EVERGREEN", 61, 62);
        FEATURED_IN_TOPIC = new PostFeedReason("FEATURED_IN_TOPIC", 62, 63);
        EXPLORE_POST_UNDER_PRESENTED = new PostFeedReason("EXPLORE_POST_UNDER_PRESENTED", 63, 66);
        SIMILAR_TO_ONBOARDED_POST = new PostFeedReason("SIMILAR_TO_ONBOARDED_POST", 64, 67);
        LATEST_IN_PREMIUM_TOPIC = new PostFeedReason("LATEST_IN_PREMIUM_TOPIC", 65, 52);
        PERSONALIZED_IN_PREMIUM_TOPIC = new PostFeedReason("PERSONALIZED_IN_PREMIUM_TOPIC", 66, 53);
        CURATED_NOTEWORTHY_WRITER = new PostFeedReason("CURATED_NOTEWORTHY_WRITER", 67, 56);
        HOMEPAGE_FEATURED = new PostFeedReason("HOMEPAGE_FEATURED", 68, 57);
        USER_PROFILE_FEATURED = new PostFeedReason("USER_PROFILE_FEATURED", 69, 25);
        USER_PROFILE_MOST_RECOMMENDED = new PostFeedReason("USER_PROFILE_MOST_RECOMMENDED", 70, 26);
        USER_PROFILE_NOT_A_COMMENT = new PostFeedReason("USER_PROFILE_NOT_A_COMMENT", 71, 28);
        USER_PROFILE_HAS_RECOMMENDED = new PostFeedReason("USER_PROFILE_HAS_RECOMMENDED", 72, 64);
        PUBLISHED_BY_AUTHOR = new PostFeedReason("PUBLISHED_BY_AUTHOR", 73, 29);
        PUBLISHED_BY_CURRENT_USER = new PostFeedReason("PUBLISHED_BY_CURRENT_USER", 74, 30);
        RECOMMENDED_BY_AUTHOR = new PostFeedReason("RECOMMENDED_BY_AUTHOR", 75, 31);
        RECOMMENDED_BY_EDITOR = new PostFeedReason("RECOMMENDED_BY_EDITOR", 76, 32);
        RECOMMENDED_BY_CURRENT_USER = new PostFeedReason("RECOMMENDED_BY_CURRENT_USER", 77, 33);
        RESPONSES_MOST_RECOMMENDED = new PostFeedReason("RESPONSES_MOST_RECOMMENDED", 78, 34);
        TOP_SIMILAR_TO_POST = new PostFeedReason("TOP_SIMILAR_TO_POST", 79, 40);
        TOP_IN_COLLECTION = new PostFeedReason("TOP_IN_COLLECTION", 80, 41);
        TOP_POSTS_SHARING_TAGS = new PostFeedReason("TOP_POSTS_SHARING_TAGS", 81, 42);
        POSTS_SHARING_TAGS = new PostFeedReason("POSTS_SHARING_TAGS", 82, 43);
        POSTS_SHARING_AUTHOR = new PostFeedReason(ezwlgQm.LbOHOoCzzcKo, 83, 44);
        POSTS_SHARING_COLLECTION_AND_TAGS = new PostFeedReason("POSTS_SHARING_COLLECTION_AND_TAGS", 84, 45);
        TOP_NEW_PUBLISHED = new PostFeedReason("TOP_NEW_PUBLISHED", 85, 18);
        TOP_MOMENTUM = new PostFeedReason("TOP_MOMENTUM", 86, 22);
        TOP_REFERRED = new PostFeedReason(ZVsviyDAr.IuWuDFRPo, 87, 23);
        TOP_NEW_AUTHOR = new PostFeedReason("TOP_NEW_AUTHOR", 88, 24);
        TOP_TRENDING = new PostFeedReason("TOP_TRENDING", 89, 35);
        TAG_IN_INTEREST_GRAPH = new PostFeedReason("TAG_IN_INTEREST_GRAPH", 90, 36);
        PUBLISHED_IN_TAG = new PostFeedReason("PUBLISHED_IN_TAG", 91, 15);
        BOOKMARKED = new PostFeedReason("BOOKMARKED", 92, 16);
        TOP_FOR_THE_DAY_GLOBALLY = new PostFeedReason("TOP_FOR_THE_DAY_GLOBALLY", 93, 14);
        GENERIC_SQL_POST_LIST = new PostFeedReason("GENERIC_SQL_POST_LIST", 94, 12);
        TOP_RECOMMENDED_BY_USER = new PostFeedReason("TOP_RECOMMENDED_BY_USER", 95, 8);
        TOP_PUBLISHED_BY_USER = new PostFeedReason("TOP_PUBLISHED_BY_USER", 96, 7);
        TOP_PUBLISHED_BY_COLLECTION = new PostFeedReason("TOP_PUBLISHED_BY_COLLECTION", 97, 6);
        RECOMMENDED_IN_TAG = new PostFeedReason("RECOMMENDED_IN_TAG", 98, 4);
        RECOMMENDED_BY_USER = new PostFeedReason("RECOMMENDED_BY_USER", 99, 3);
        TOP_FOR_THE_DAY = new PostFeedReason("TOP_FOR_THE_DAY", 100, 5);
        TOP_RECOMMENDED_IN_TAG = new PostFeedReason("TOP_RECOMMENDED_IN_TAG", 101, 9);
        TOP_CONVERSATION_STARTER = new PostFeedReason("TOP_CONVERSATION_STARTER", 102, 10);
        TOP_RESPONSE = new PostFeedReason("TOP_RESPONSE", 103, 11);
        USER_PROFILE_ROOT_POSTS = new PostFeedReason("USER_PROFILE_ROOT_POSTS", 104, 27);
        PROMOTED_POSTS = new PostFeedReason("PROMOTED_POSTS", PanasonicMakernoteDirectory.TAG_COUNTRY, 39);
        CURATED_POSTS_SHARING_TAGS_DEPRECATED = new PostFeedReason("CURATED_POSTS_SHARING_TAGS_DEPRECATED", 106, 47);
        CURATED_IN_PRMT_CATALOG = new PostFeedReason("CURATED_IN_PRMT_CATALOG", 107, 48);
        AMPLIFIED_NEW_STORY = new PostFeedReason("AMPLIFIED_NEW_STORY", 108, 46);
        CURATED_IN_POPCHUNK = new PostFeedReason("CURATED_IN_POPCHUNK", 109, 54);
        TOP_LONG_READ = new PostFeedReason("TOP_LONG_READ", 110, 19);
        TOP_MEDIUM_READ = new PostFeedReason("TOP_MEDIUM_READ", PanasonicMakernoteDirectory.TAG_LANDMARK, 20);
        TOP_SHORT_READ = new PostFeedReason("TOP_SHORT_READ", PanasonicMakernoteDirectory.TAG_INTELLIGENT_RESOLUTION, 21);
        TOP_STORY_ON_MEDIUM = new PostFeedReason("TOP_STORY_ON_MEDIUM", 113, 65);
        CURATED_IN_TOPIC = new PostFeedReason("CURATED_IN_TOPIC", 114, 49);
        TOP_POSTS_IN_FOLLOWED_TOPICS_WITH_FALLBACK = new PostFeedReason("TOP_POSTS_IN_FOLLOWED_TOPICS_WITH_FALLBACK", 115, 78);
        PostFeedReason[] postFeedReasonArr$values = $values();
        $VALUES = postFeedReasonArr$values;
        $ENTRIES = new i04(postFeedReasonArr$values);
        Companion = new eg9();
        ADAPTER = new PostFeedReason$Companion$ADAPTER$1(n1b.a.b(PostFeedReason.class), Syntax.PROTO_2, postFeedReason);
    }
}
