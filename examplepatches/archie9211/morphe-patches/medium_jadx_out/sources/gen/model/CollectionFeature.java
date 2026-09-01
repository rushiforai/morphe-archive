package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.ir1;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b'\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001aj\u0002\b\u001bj\u0002\b\u001cj\u0002\b\u001dj\u0002\b\u001ej\u0002\b\u001fj\u0002\b j\u0002\b!j\u0002\b\"j\u0002\b#j\u0002\b$j\u0002\b%j\u0002\b&j\u0002\b'j\u0002\b(j\u0002\b)¨\u0006*"}, d2 = {"Lgen/model/CollectionFeature;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "ir1", "REVENUE_PROMOTED_STORIES", "ARCHIVE_PAGE", "AURORA_ALPHA", "CREATE_CLAIMS_IN_MIGRATIONS", "EDIT_TOPIC_PAGE", "FORCE_RELATED_READS_COLLECTION_STRATEGY", "HOMEPAGE_PROMOS", "MANUAL_SECTION_HEADER", "REVENUE_MEMBERSHIP", "SPONSORED_STORIES", "TAKEOVERS", "GOOGLE_NEWS_SITEMAP", "ENABLE_PATH_REDIRECTION", "RESTRICTED_MODE", "CHANGE_AUTHOR_TOOL", "REDIRECT_ON_MISSING_POST", "IMPORT_MAILING_LIST", "FACEBOOK_IA_API", "ACCELERATED_MOBILE_PAGES", "PARSELY_INTEGRATION", "FILTER_SUBMISSIONS", "MIGRATIONS", "RESTRICT_UNLISTED_POST_ACCESS", "REDIRECT_CUSTOM_DOMAIN_TO_SUBDIRECTORY", "AUTOTIER", "ADD_POST_TOPICS", "MARK_COMMISSIONED", "NEWSLETTER_V3", "AURORA_ELIGIBLE", "EDIT_METER_SETTING", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionFeature implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CollectionFeature[] $VALUES;
    public static final ProtoAdapter<CollectionFeature> ADAPTER;
    public static final ir1 Companion;
    private final int value;
    public static final CollectionFeature REVENUE_PROMOTED_STORIES = new CollectionFeature("REVENUE_PROMOTED_STORIES", 0, 2);
    public static final CollectionFeature ARCHIVE_PAGE = new CollectionFeature("ARCHIVE_PAGE", 1, 5);
    public static final CollectionFeature AURORA_ALPHA = new CollectionFeature("AURORA_ALPHA", 2, 26);
    public static final CollectionFeature CREATE_CLAIMS_IN_MIGRATIONS = new CollectionFeature("CREATE_CLAIMS_IN_MIGRATIONS", 3, 9);
    public static final CollectionFeature EDIT_TOPIC_PAGE = new CollectionFeature("EDIT_TOPIC_PAGE", 4, 16);
    public static final CollectionFeature FORCE_RELATED_READS_COLLECTION_STRATEGY = new CollectionFeature("FORCE_RELATED_READS_COLLECTION_STRATEGY", 5, 3);
    public static final CollectionFeature HOMEPAGE_PROMOS = new CollectionFeature("HOMEPAGE_PROMOS", 6, 18);
    public static final CollectionFeature MANUAL_SECTION_HEADER = new CollectionFeature("MANUAL_SECTION_HEADER", 7, 15);
    public static final CollectionFeature REVENUE_MEMBERSHIP = new CollectionFeature("REVENUE_MEMBERSHIP", 8, 1);
    public static final CollectionFeature SPONSORED_STORIES = new CollectionFeature("SPONSORED_STORIES", 9, 7);
    public static final CollectionFeature TAKEOVERS = new CollectionFeature("TAKEOVERS", 10, 13);
    public static final CollectionFeature GOOGLE_NEWS_SITEMAP = new CollectionFeature("GOOGLE_NEWS_SITEMAP", 11, 19);
    public static final CollectionFeature ENABLE_PATH_REDIRECTION = new CollectionFeature("ENABLE_PATH_REDIRECTION", 12, 17);
    public static final CollectionFeature RESTRICTED_MODE = new CollectionFeature("RESTRICTED_MODE", 13, 22);
    public static final CollectionFeature CHANGE_AUTHOR_TOOL = new CollectionFeature("CHANGE_AUTHOR_TOOL", 14, 4);
    public static final CollectionFeature REDIRECT_ON_MISSING_POST = new CollectionFeature("REDIRECT_ON_MISSING_POST", 15, 6);
    public static final CollectionFeature IMPORT_MAILING_LIST = new CollectionFeature("IMPORT_MAILING_LIST", 16, 8);
    public static final CollectionFeature FACEBOOK_IA_API = new CollectionFeature("FACEBOOK_IA_API", 17, 10);
    public static final CollectionFeature ACCELERATED_MOBILE_PAGES = new CollectionFeature("ACCELERATED_MOBILE_PAGES", 18, 11);
    public static final CollectionFeature PARSELY_INTEGRATION = new CollectionFeature("PARSELY_INTEGRATION", 19, 12);
    public static final CollectionFeature FILTER_SUBMISSIONS = new CollectionFeature("FILTER_SUBMISSIONS", 20, 20);
    public static final CollectionFeature MIGRATIONS = new CollectionFeature("MIGRATIONS", 21, 21);
    public static final CollectionFeature RESTRICT_UNLISTED_POST_ACCESS = new CollectionFeature("RESTRICT_UNLISTED_POST_ACCESS", 22, 23);
    public static final CollectionFeature REDIRECT_CUSTOM_DOMAIN_TO_SUBDIRECTORY = new CollectionFeature("REDIRECT_CUSTOM_DOMAIN_TO_SUBDIRECTORY", 23, 24);
    public static final CollectionFeature AUTOTIER = new CollectionFeature("AUTOTIER", 24, 25);
    public static final CollectionFeature ADD_POST_TOPICS = new CollectionFeature("ADD_POST_TOPICS", 25, 27);
    public static final CollectionFeature MARK_COMMISSIONED = new CollectionFeature("MARK_COMMISSIONED", 26, 28);
    public static final CollectionFeature NEWSLETTER_V3 = new CollectionFeature("NEWSLETTER_V3", 27, 29);
    public static final CollectionFeature AURORA_ELIGIBLE = new CollectionFeature("AURORA_ELIGIBLE", 28, 30);
    public static final CollectionFeature EDIT_METER_SETTING = new CollectionFeature("EDIT_METER_SETTING", 29, 31);

    private static final /* synthetic */ CollectionFeature[] $values() {
        return new CollectionFeature[]{REVENUE_PROMOTED_STORIES, ARCHIVE_PAGE, AURORA_ALPHA, CREATE_CLAIMS_IN_MIGRATIONS, EDIT_TOPIC_PAGE, FORCE_RELATED_READS_COLLECTION_STRATEGY, HOMEPAGE_PROMOS, MANUAL_SECTION_HEADER, REVENUE_MEMBERSHIP, SPONSORED_STORIES, TAKEOVERS, GOOGLE_NEWS_SITEMAP, ENABLE_PATH_REDIRECTION, RESTRICTED_MODE, CHANGE_AUTHOR_TOOL, REDIRECT_ON_MISSING_POST, IMPORT_MAILING_LIST, FACEBOOK_IA_API, ACCELERATED_MOBILE_PAGES, PARSELY_INTEGRATION, FILTER_SUBMISSIONS, MIGRATIONS, RESTRICT_UNLISTED_POST_ACCESS, REDIRECT_CUSTOM_DOMAIN_TO_SUBDIRECTORY, AUTOTIER, ADD_POST_TOPICS, MARK_COMMISSIONED, NEWSLETTER_V3, AURORA_ELIGIBLE, EDIT_METER_SETTING};
    }

    static {
        CollectionFeature[] collectionFeatureArr$values = $values();
        $VALUES = collectionFeatureArr$values;
        $ENTRIES = new i04(collectionFeatureArr$values);
        Companion = new ir1();
        ADAPTER = new CollectionFeature$Companion$ADAPTER$1(n1b.a.b(CollectionFeature.class), Syntax.PROTO_2, null);
    }

    private CollectionFeature(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CollectionFeature fromValue(int i) {
        Companion.getClass();
        return ir1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CollectionFeature valueOf(String str) {
        return (CollectionFeature) Enum.valueOf(CollectionFeature.class, str);
    }

    public static CollectionFeature[] values() {
        return (CollectionFeature[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
