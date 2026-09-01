package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.qd3;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b.\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#j\u0002\b$j\u0002\b%j\u0002\b&j\u0002\b'j\u0002\b(j\u0002\b)j\u0002\b*j\u0002\b+j\u0002\b,j\u0002\b-j\u0002\b.j\u0002\b/j\u0002\b0¨\u00061"}, d2 = {"Lgen/model/DigestSectionType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "qd3", "TOP_POSTS", "FROM_YOUR_FOLLOWING", "PROMO", "ONBOARDING_TAG", "ONBOARDING_MORE_READS", "POSTS_TAG_FOLLOWED", "CURATED_CATALOGS", "PRMT_CATALOG", "POSTS_LATEST_IN_PREMIUM_TOPIC", "FEATURED_CHUNK", "POPCHUNK", "FROM_YOUR_NETWORK", "RANKED_FEED", "RANKED_FEED_EXTENDED", "TOP_POSTS_EXTENDED", "UPSELL", "POSTS_POPULAR", "POSTS_PUBLISHED_USERS_COLLECTIONS", "POSTS_IN_POPULAR_TOPIC", "POSTS_PERSONALIZED_IN_PREMIUM_TOPIC", "POSTS_RECOMMENDED_USERS", "POSTS_PUBLISHED_USERS", "POSTS_PUBLISHED_COLLECTION", "EVERGREEN_SECTION", "TOPICS_TO_FOLLOW", "FROM_AUTHORS_YOU_MAY_ENJOY", "FROM_CREATORS_YOU_ARE_ENJOYING", "FROM_YOUR_RECENT_FOLLOWS", "RECENTLY_BOOKMARKED", "POSTS_IN_FOLLOWED_TOPIC", "POSTS_IN_SUGGESTED_TOPIC", "POSTS_SUGGESTED", "COLLABORATIVE_FILTERING_CHUNK", "IN_CASE_YOU_MISSED_IT", "QUICK_READS", "MORE_FOR_YOU", "POSTS_IN_FOLLOWED_TAG", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class DigestSectionType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ DigestSectionType[] $VALUES;
    public static final ProtoAdapter<DigestSectionType> ADAPTER;
    public static final qd3 Companion;
    private final int value;
    public static final DigestSectionType TOP_POSTS = new DigestSectionType("TOP_POSTS", 0, 1);
    public static final DigestSectionType FROM_YOUR_FOLLOWING = new DigestSectionType("FROM_YOUR_FOLLOWING", 1, 31);
    public static final DigestSectionType PROMO = new DigestSectionType("PROMO", 2, 10);
    public static final DigestSectionType ONBOARDING_TAG = new DigestSectionType("ONBOARDING_TAG", 3, 37);
    public static final DigestSectionType ONBOARDING_MORE_READS = new DigestSectionType("ONBOARDING_MORE_READS", 4, 38);
    public static final DigestSectionType POSTS_TAG_FOLLOWED = new DigestSectionType("POSTS_TAG_FOLLOWED", 5, 7);
    public static final DigestSectionType CURATED_CATALOGS = new DigestSectionType("CURATED_CATALOGS", 6, 8);
    public static final DigestSectionType PRMT_CATALOG = new DigestSectionType("PRMT_CATALOG", 7, 9);
    public static final DigestSectionType POSTS_LATEST_IN_PREMIUM_TOPIC = new DigestSectionType("POSTS_LATEST_IN_PREMIUM_TOPIC", 8, 13);
    public static final DigestSectionType FEATURED_CHUNK = new DigestSectionType("FEATURED_CHUNK", 9, 15);
    public static final DigestSectionType POPCHUNK = new DigestSectionType("POPCHUNK", 10, 18);
    public static final DigestSectionType FROM_YOUR_NETWORK = new DigestSectionType("FROM_YOUR_NETWORK", 11, 23);
    public static final DigestSectionType RANKED_FEED = new DigestSectionType("RANKED_FEED", 12, 24);
    public static final DigestSectionType RANKED_FEED_EXTENDED = new DigestSectionType("RANKED_FEED_EXTENDED", 13, 25);
    public static final DigestSectionType TOP_POSTS_EXTENDED = new DigestSectionType("TOP_POSTS_EXTENDED", 14, 22);
    public static final DigestSectionType UPSELL = new DigestSectionType("UPSELL", 15, 20);
    public static final DigestSectionType POSTS_POPULAR = new DigestSectionType("POSTS_POPULAR", 16, 17);
    public static final DigestSectionType POSTS_PUBLISHED_USERS_COLLECTIONS = new DigestSectionType("POSTS_PUBLISHED_USERS_COLLECTIONS", 17, 2);
    public static final DigestSectionType POSTS_IN_POPULAR_TOPIC = new DigestSectionType("POSTS_IN_POPULAR_TOPIC", 18, 26);
    public static final DigestSectionType POSTS_PERSONALIZED_IN_PREMIUM_TOPIC = new DigestSectionType("POSTS_PERSONALIZED_IN_PREMIUM_TOPIC", 19, 14);
    public static final DigestSectionType POSTS_RECOMMENDED_USERS = new DigestSectionType("POSTS_RECOMMENDED_USERS", 20, 5);
    public static final DigestSectionType POSTS_PUBLISHED_USERS = new DigestSectionType("POSTS_PUBLISHED_USERS", 21, 3);
    public static final DigestSectionType POSTS_PUBLISHED_COLLECTION = new DigestSectionType("POSTS_PUBLISHED_COLLECTION", 22, 4);
    public static final DigestSectionType EVERGREEN_SECTION = new DigestSectionType("EVERGREEN_SECTION", 23, 21);
    public static final DigestSectionType TOPICS_TO_FOLLOW = new DigestSectionType("TOPICS_TO_FOLLOW", 24, 19);
    public static final DigestSectionType FROM_AUTHORS_YOU_MAY_ENJOY = new DigestSectionType("FROM_AUTHORS_YOU_MAY_ENJOY", 25, 32);
    public static final DigestSectionType FROM_CREATORS_YOU_ARE_ENJOYING = new DigestSectionType("FROM_CREATORS_YOU_ARE_ENJOYING", 26, 33);
    public static final DigestSectionType FROM_YOUR_RECENT_FOLLOWS = new DigestSectionType("FROM_YOUR_RECENT_FOLLOWS", 27, 34);
    public static final DigestSectionType RECENTLY_BOOKMARKED = new DigestSectionType("RECENTLY_BOOKMARKED", 28, 30);
    public static final DigestSectionType POSTS_IN_FOLLOWED_TOPIC = new DigestSectionType("POSTS_IN_FOLLOWED_TOPIC", 29, 11);
    public static final DigestSectionType POSTS_IN_SUGGESTED_TOPIC = new DigestSectionType("POSTS_IN_SUGGESTED_TOPIC", 30, 12);
    public static final DigestSectionType POSTS_SUGGESTED = new DigestSectionType("POSTS_SUGGESTED", 31, 6);
    public static final DigestSectionType COLLABORATIVE_FILTERING_CHUNK = new DigestSectionType("COLLABORATIVE_FILTERING_CHUNK", 32, 16);
    public static final DigestSectionType IN_CASE_YOU_MISSED_IT = new DigestSectionType("IN_CASE_YOU_MISSED_IT", 33, 27);
    public static final DigestSectionType QUICK_READS = new DigestSectionType("QUICK_READS", 34, 28);
    public static final DigestSectionType MORE_FOR_YOU = new DigestSectionType("MORE_FOR_YOU", 35, 29);
    public static final DigestSectionType POSTS_IN_FOLLOWED_TAG = new DigestSectionType("POSTS_IN_FOLLOWED_TAG", 36, 35);

    private static final /* synthetic */ DigestSectionType[] $values() {
        return new DigestSectionType[]{TOP_POSTS, FROM_YOUR_FOLLOWING, PROMO, ONBOARDING_TAG, ONBOARDING_MORE_READS, POSTS_TAG_FOLLOWED, CURATED_CATALOGS, PRMT_CATALOG, POSTS_LATEST_IN_PREMIUM_TOPIC, FEATURED_CHUNK, POPCHUNK, FROM_YOUR_NETWORK, RANKED_FEED, RANKED_FEED_EXTENDED, TOP_POSTS_EXTENDED, UPSELL, POSTS_POPULAR, POSTS_PUBLISHED_USERS_COLLECTIONS, POSTS_IN_POPULAR_TOPIC, POSTS_PERSONALIZED_IN_PREMIUM_TOPIC, POSTS_RECOMMENDED_USERS, POSTS_PUBLISHED_USERS, POSTS_PUBLISHED_COLLECTION, EVERGREEN_SECTION, TOPICS_TO_FOLLOW, FROM_AUTHORS_YOU_MAY_ENJOY, FROM_CREATORS_YOU_ARE_ENJOYING, FROM_YOUR_RECENT_FOLLOWS, RECENTLY_BOOKMARKED, POSTS_IN_FOLLOWED_TOPIC, POSTS_IN_SUGGESTED_TOPIC, POSTS_SUGGESTED, COLLABORATIVE_FILTERING_CHUNK, IN_CASE_YOU_MISSED_IT, QUICK_READS, MORE_FOR_YOU, POSTS_IN_FOLLOWED_TAG};
    }

    static {
        DigestSectionType[] digestSectionTypeArr$values = $values();
        $VALUES = digestSectionTypeArr$values;
        $ENTRIES = new i04(digestSectionTypeArr$values);
        Companion = new qd3();
        ADAPTER = new DigestSectionType$Companion$ADAPTER$1(n1b.a.b(DigestSectionType.class), Syntax.PROTO_2, null);
    }

    private DigestSectionType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final DigestSectionType fromValue(int i) {
        Companion.getClass();
        return qd3.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static DigestSectionType valueOf(String str) {
        return (DigestSectionType) Enum.valueOf(DigestSectionType.class, str);
    }

    public static DigestSectionType[] values() {
        return (DigestSectionType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
