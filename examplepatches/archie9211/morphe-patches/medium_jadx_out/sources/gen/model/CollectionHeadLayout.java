package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.mr1;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0012"}, d2 = {"Lgen/model/CollectionHeadLayout;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "mr1", "FULL_WIDTH_DEPRECATED", "OVER_STORY_DEPRECATED", "COLLAPSED_DEPRECATED", "SMALL", "MEDIUM", "LARGE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionHeadLayout implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CollectionHeadLayout[] $VALUES;
    public static final ProtoAdapter<CollectionHeadLayout> ADAPTER;
    public static final mr1 Companion;
    private final int value;
    public static final CollectionHeadLayout FULL_WIDTH_DEPRECATED = new CollectionHeadLayout("FULL_WIDTH_DEPRECATED", 0, 1);
    public static final CollectionHeadLayout OVER_STORY_DEPRECATED = new CollectionHeadLayout("OVER_STORY_DEPRECATED", 1, 2);
    public static final CollectionHeadLayout COLLAPSED_DEPRECATED = new CollectionHeadLayout("COLLAPSED_DEPRECATED", 2, 3);
    public static final CollectionHeadLayout SMALL = new CollectionHeadLayout("SMALL", 3, 4);
    public static final CollectionHeadLayout MEDIUM = new CollectionHeadLayout("MEDIUM", 4, 5);
    public static final CollectionHeadLayout LARGE = new CollectionHeadLayout("LARGE", 5, 6);

    private static final /* synthetic */ CollectionHeadLayout[] $values() {
        return new CollectionHeadLayout[]{FULL_WIDTH_DEPRECATED, OVER_STORY_DEPRECATED, COLLAPSED_DEPRECATED, SMALL, MEDIUM, LARGE};
    }

    static {
        CollectionHeadLayout[] collectionHeadLayoutArr$values = $values();
        $VALUES = collectionHeadLayoutArr$values;
        $ENTRIES = new i04(collectionHeadLayoutArr$values);
        Companion = new mr1();
        ADAPTER = new CollectionHeadLayout$Companion$ADAPTER$1(n1b.a.b(CollectionHeadLayout.class), Syntax.PROTO_2, null);
    }

    private CollectionHeadLayout(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CollectionHeadLayout fromValue(int i) {
        Companion.getClass();
        return mr1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CollectionHeadLayout valueOf(String str) {
        return (CollectionHeadLayout) Enum.valueOf(CollectionHeadLayout.class, str);
    }

    public static CollectionHeadLayout[] values() {
        return (CollectionHeadLayout[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
