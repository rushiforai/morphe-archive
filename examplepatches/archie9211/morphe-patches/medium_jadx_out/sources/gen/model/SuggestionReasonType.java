package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.j1d;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0013\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014j\u0002\b\u0015¨\u0006\u0016"}, d2 = {"Lgen/model/SuggestionReasonType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "j1d", "SUGGESTION_FEATURED", "SUGGESTION_CURATED", "SUGGESTION_COLLECTION_INTEREST_GRAPH", "SUGGESTION_TAG_INTEREST_GRAPH", "SUGGESTION_COLLAB_FILTERING", "SUGGESTION_USER_INTEREST_GRAPH", "SUGGESTION_TWITTER_GRAPH", "SUGGESTION_WRITER_IN_TOPIC", "SUGGESTION_RELATED_TOPIC", "SUGGESTION_TOPIC_INTEREST_GRAPH", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SuggestionReasonType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SuggestionReasonType[] $VALUES;
    public static final ProtoAdapter<SuggestionReasonType> ADAPTER;
    public static final j1d Companion;
    private final int value;
    public static final SuggestionReasonType SUGGESTION_FEATURED = new SuggestionReasonType("SUGGESTION_FEATURED", 0, 1);
    public static final SuggestionReasonType SUGGESTION_CURATED = new SuggestionReasonType("SUGGESTION_CURATED", 1, 2);
    public static final SuggestionReasonType SUGGESTION_COLLECTION_INTEREST_GRAPH = new SuggestionReasonType("SUGGESTION_COLLECTION_INTEREST_GRAPH", 2, 3);
    public static final SuggestionReasonType SUGGESTION_TAG_INTEREST_GRAPH = new SuggestionReasonType("SUGGESTION_TAG_INTEREST_GRAPH", 3, 4);
    public static final SuggestionReasonType SUGGESTION_COLLAB_FILTERING = new SuggestionReasonType("SUGGESTION_COLLAB_FILTERING", 4, 5);
    public static final SuggestionReasonType SUGGESTION_USER_INTEREST_GRAPH = new SuggestionReasonType("SUGGESTION_USER_INTEREST_GRAPH", 5, 6);
    public static final SuggestionReasonType SUGGESTION_TWITTER_GRAPH = new SuggestionReasonType("SUGGESTION_TWITTER_GRAPH", 6, 10);
    public static final SuggestionReasonType SUGGESTION_WRITER_IN_TOPIC = new SuggestionReasonType("SUGGESTION_WRITER_IN_TOPIC", 7, 7);
    public static final SuggestionReasonType SUGGESTION_RELATED_TOPIC = new SuggestionReasonType("SUGGESTION_RELATED_TOPIC", 8, 8);
    public static final SuggestionReasonType SUGGESTION_TOPIC_INTEREST_GRAPH = new SuggestionReasonType("SUGGESTION_TOPIC_INTEREST_GRAPH", 9, 9);

    private static final /* synthetic */ SuggestionReasonType[] $values() {
        return new SuggestionReasonType[]{SUGGESTION_FEATURED, SUGGESTION_CURATED, SUGGESTION_COLLECTION_INTEREST_GRAPH, SUGGESTION_TAG_INTEREST_GRAPH, SUGGESTION_COLLAB_FILTERING, SUGGESTION_USER_INTEREST_GRAPH, SUGGESTION_TWITTER_GRAPH, SUGGESTION_WRITER_IN_TOPIC, SUGGESTION_RELATED_TOPIC, SUGGESTION_TOPIC_INTEREST_GRAPH};
    }

    static {
        SuggestionReasonType[] suggestionReasonTypeArr$values = $values();
        $VALUES = suggestionReasonTypeArr$values;
        $ENTRIES = new i04(suggestionReasonTypeArr$values);
        Companion = new j1d();
        ADAPTER = new SuggestionReasonType$Companion$ADAPTER$1(n1b.a.b(SuggestionReasonType.class), Syntax.PROTO_2, null);
    }

    private SuggestionReasonType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SuggestionReasonType fromValue(int i) {
        Companion.getClass();
        return j1d.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SuggestionReasonType valueOf(String str) {
        return (SuggestionReasonType) Enum.valueOf(SuggestionReasonType.class, str);
    }

    public static SuggestionReasonType[] values() {
        return (SuggestionReasonType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
