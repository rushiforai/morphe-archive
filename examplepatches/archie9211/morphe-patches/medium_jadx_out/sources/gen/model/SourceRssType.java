package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.rkc;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0011\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013¨\u0006\u0014"}, d2 = {"Lgen/model/SourceRssType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "rkc", "LATEST_FEED", "USER_FEED", "USER_RECOMMENDED_FEED", "COLLECTION_FEED", "TAG_FEED", "CATALOG_FEED", "USER_EXPORT_FEED", "TOPIC_FEED", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class SourceRssType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ SourceRssType[] $VALUES;
    public static final ProtoAdapter<SourceRssType> ADAPTER;
    public static final rkc Companion;
    private final int value;
    public static final SourceRssType LATEST_FEED = new SourceRssType("LATEST_FEED", 0, 1);
    public static final SourceRssType USER_FEED = new SourceRssType("USER_FEED", 1, 2);
    public static final SourceRssType USER_RECOMMENDED_FEED = new SourceRssType("USER_RECOMMENDED_FEED", 2, 3);
    public static final SourceRssType COLLECTION_FEED = new SourceRssType("COLLECTION_FEED", 3, 4);
    public static final SourceRssType TAG_FEED = new SourceRssType("TAG_FEED", 4, 5);
    public static final SourceRssType CATALOG_FEED = new SourceRssType("CATALOG_FEED", 5, 6);
    public static final SourceRssType USER_EXPORT_FEED = new SourceRssType("USER_EXPORT_FEED", 6, 7);
    public static final SourceRssType TOPIC_FEED = new SourceRssType("TOPIC_FEED", 7, 8);

    private static final /* synthetic */ SourceRssType[] $values() {
        return new SourceRssType[]{LATEST_FEED, USER_FEED, USER_RECOMMENDED_FEED, COLLECTION_FEED, TAG_FEED, CATALOG_FEED, USER_EXPORT_FEED, TOPIC_FEED};
    }

    static {
        SourceRssType[] sourceRssTypeArr$values = $values();
        $VALUES = sourceRssTypeArr$values;
        $ENTRIES = new i04(sourceRssTypeArr$values);
        Companion = new rkc();
        ADAPTER = new SourceRssType$Companion$ADAPTER$1(n1b.a.b(SourceRssType.class), Syntax.PROTO_2, null);
    }

    private SourceRssType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final SourceRssType fromValue(int i) {
        Companion.getClass();
        return rkc.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static SourceRssType valueOf(String str) {
        return (SourceRssType) Enum.valueOf(SourceRssType.class, str);
    }

    public static SourceRssType[] values() {
        return (SourceRssType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
