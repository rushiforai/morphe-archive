package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.js1;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0012\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014¨\u0006\u0015"}, d2 = {"Lgen/model/CollectionNavItemType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "js1", "TAG_NAV_ITEM", "POST_NAV_ITEM", "EXTERNAL_LINK_NAV_ITEM", "TOPIC_PAGE", "ARCHIVE_NAV_ITEM", "ABOUT_PAGE_NAV_ITEM", "TRENDING_NAV_ITEM", "LATEST_NAV_ITEM", "SOCIAL_ITEM", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionNavItemType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CollectionNavItemType[] $VALUES;
    public static final ProtoAdapter<CollectionNavItemType> ADAPTER;
    public static final js1 Companion;
    private final int value;
    public static final CollectionNavItemType TAG_NAV_ITEM = new CollectionNavItemType("TAG_NAV_ITEM", 0, 1);
    public static final CollectionNavItemType POST_NAV_ITEM = new CollectionNavItemType("POST_NAV_ITEM", 1, 2);
    public static final CollectionNavItemType EXTERNAL_LINK_NAV_ITEM = new CollectionNavItemType("EXTERNAL_LINK_NAV_ITEM", 2, 3);
    public static final CollectionNavItemType TOPIC_PAGE = new CollectionNavItemType("TOPIC_PAGE", 3, 4);
    public static final CollectionNavItemType ARCHIVE_NAV_ITEM = new CollectionNavItemType("ARCHIVE_NAV_ITEM", 4, 5);
    public static final CollectionNavItemType ABOUT_PAGE_NAV_ITEM = new CollectionNavItemType("ABOUT_PAGE_NAV_ITEM", 5, 6);
    public static final CollectionNavItemType TRENDING_NAV_ITEM = new CollectionNavItemType("TRENDING_NAV_ITEM", 6, 7);
    public static final CollectionNavItemType LATEST_NAV_ITEM = new CollectionNavItemType("LATEST_NAV_ITEM", 7, 8);
    public static final CollectionNavItemType SOCIAL_ITEM = new CollectionNavItemType("SOCIAL_ITEM", 8, 9);

    private static final /* synthetic */ CollectionNavItemType[] $values() {
        return new CollectionNavItemType[]{TAG_NAV_ITEM, POST_NAV_ITEM, EXTERNAL_LINK_NAV_ITEM, TOPIC_PAGE, ARCHIVE_NAV_ITEM, ABOUT_PAGE_NAV_ITEM, TRENDING_NAV_ITEM, LATEST_NAV_ITEM, SOCIAL_ITEM};
    }

    static {
        CollectionNavItemType[] collectionNavItemTypeArr$values = $values();
        $VALUES = collectionNavItemTypeArr$values;
        $ENTRIES = new i04(collectionNavItemTypeArr$values);
        Companion = new js1();
        ADAPTER = new CollectionNavItemType$Companion$ADAPTER$1(n1b.a.b(CollectionNavItemType.class), Syntax.PROTO_2, null);
    }

    private CollectionNavItemType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CollectionNavItemType fromValue(int i) {
        Companion.getClass();
        return js1.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CollectionNavItemType valueOf(String str) {
        return (CollectionNavItemType) Enum.valueOf(CollectionNavItemType.class, str);
    }

    public static CollectionNavItemType[] values() {
        return (CollectionNavItemType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
