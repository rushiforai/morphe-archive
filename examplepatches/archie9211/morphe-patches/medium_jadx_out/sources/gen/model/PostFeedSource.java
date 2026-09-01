package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.fg9;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0018\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015j\u0002\b\u0016j\u0002\b\u0017j\u0002\b\u0018j\u0002\b\u0019j\u0002\b\u001a¨\u0006\u001b"}, d2 = {"Lgen/model/PostFeedSource;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "fg9", "CURATED", "FEED", "RCL", "TOP_FEED", "SINGLE_REASON_FEED", "GENERIC_SQL", "RESPONSE_STREAM", "SERIES", "NETWORK_SERIES", "LATEST_SERIES_SCREENED", "SERIES_CURRENTLY_READING", "BROWSABLE", "SERIES_HISTORY", "PUBLISHED_BY_FOLLOWED_USERS_AND_COLLECTIONS", "EXTREME_HOMEPAGE_MAIN_FEED", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostFeedSource implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostFeedSource[] $VALUES;
    public static final ProtoAdapter<PostFeedSource> ADAPTER;
    public static final fg9 Companion;
    private final int value;
    public static final PostFeedSource CURATED = new PostFeedSource("CURATED", 0, 1);
    public static final PostFeedSource FEED = new PostFeedSource("FEED", 1, 2);
    public static final PostFeedSource RCL = new PostFeedSource("RCL", 2, 3);
    public static final PostFeedSource TOP_FEED = new PostFeedSource("TOP_FEED", 3, 4);
    public static final PostFeedSource SINGLE_REASON_FEED = new PostFeedSource("SINGLE_REASON_FEED", 4, 5);
    public static final PostFeedSource GENERIC_SQL = new PostFeedSource("GENERIC_SQL", 5, 6);
    public static final PostFeedSource RESPONSE_STREAM = new PostFeedSource("RESPONSE_STREAM", 6, 7);
    public static final PostFeedSource SERIES = new PostFeedSource("SERIES", 7, 8);
    public static final PostFeedSource NETWORK_SERIES = new PostFeedSource("NETWORK_SERIES", 8, 9);
    public static final PostFeedSource LATEST_SERIES_SCREENED = new PostFeedSource("LATEST_SERIES_SCREENED", 9, 10);
    public static final PostFeedSource SERIES_CURRENTLY_READING = new PostFeedSource("SERIES_CURRENTLY_READING", 10, 11);
    public static final PostFeedSource BROWSABLE = new PostFeedSource("BROWSABLE", 11, 12);
    public static final PostFeedSource SERIES_HISTORY = new PostFeedSource("SERIES_HISTORY", 12, 13);
    public static final PostFeedSource PUBLISHED_BY_FOLLOWED_USERS_AND_COLLECTIONS = new PostFeedSource("PUBLISHED_BY_FOLLOWED_USERS_AND_COLLECTIONS", 13, 14);
    public static final PostFeedSource EXTREME_HOMEPAGE_MAIN_FEED = new PostFeedSource("EXTREME_HOMEPAGE_MAIN_FEED", 14, 15);

    private static final /* synthetic */ PostFeedSource[] $values() {
        return new PostFeedSource[]{CURATED, FEED, RCL, TOP_FEED, SINGLE_REASON_FEED, GENERIC_SQL, RESPONSE_STREAM, SERIES, NETWORK_SERIES, LATEST_SERIES_SCREENED, SERIES_CURRENTLY_READING, BROWSABLE, SERIES_HISTORY, PUBLISHED_BY_FOLLOWED_USERS_AND_COLLECTIONS, EXTREME_HOMEPAGE_MAIN_FEED};
    }

    static {
        PostFeedSource[] postFeedSourceArr$values = $values();
        $VALUES = postFeedSourceArr$values;
        $ENTRIES = new i04(postFeedSourceArr$values);
        Companion = new fg9();
        ADAPTER = new PostFeedSource$Companion$ADAPTER$1(n1b.a.b(PostFeedSource.class), Syntax.PROTO_2, null);
    }

    private PostFeedSource(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostFeedSource fromValue(int i) {
        Companion.getClass();
        return fg9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostFeedSource valueOf(String str) {
        return (PostFeedSource) Enum.valueOf(PostFeedSource.class, str);
    }

    public static PostFeedSource[] values() {
        return (PostFeedSource[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
