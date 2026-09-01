package gen.model;

import com.medium.android.common.post.text.Kmm.pUlNWdybf;
import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.ar1;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000b\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lgen/model/CollectionColorBehavior;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "ar1", "ACCENT_COLOR", "ACCENT_COLOR_AND_FILL_BACKGROUND", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class CollectionColorBehavior implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ CollectionColorBehavior[] $VALUES;
    public static final CollectionColorBehavior ACCENT_COLOR = new CollectionColorBehavior("ACCENT_COLOR", 0, 1);
    public static final CollectionColorBehavior ACCENT_COLOR_AND_FILL_BACKGROUND = new CollectionColorBehavior(pUlNWdybf.YSaDWPdU, 1, 2);
    public static final ProtoAdapter<CollectionColorBehavior> ADAPTER;
    public static final ar1 Companion;
    private final int value;

    private static final /* synthetic */ CollectionColorBehavior[] $values() {
        return new CollectionColorBehavior[]{ACCENT_COLOR, ACCENT_COLOR_AND_FILL_BACKGROUND};
    }

    private CollectionColorBehavior(String str, int i, int i2) {
        this.value = i2;
    }

    public static final CollectionColorBehavior fromValue(int i) {
        Companion.getClass();
        if (i == 1) {
            return ACCENT_COLOR;
        }
        if (i != 2) {
            return null;
        }
        return ACCENT_COLOR_AND_FILL_BACKGROUND;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static CollectionColorBehavior valueOf(String str) {
        return (CollectionColorBehavior) Enum.valueOf(CollectionColorBehavior.class, str);
    }

    public static CollectionColorBehavior[] values() {
        return (CollectionColorBehavior[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }

    static {
        CollectionColorBehavior[] collectionColorBehaviorArr$values = $values();
        $VALUES = collectionColorBehaviorArr$values;
        $ENTRIES = new i04(collectionColorBehaviorArr$values);
        Companion = new ar1();
        ADAPTER = new CollectionColorBehavior$Companion$ADAPTER$1(n1b.a.b(CollectionColorBehavior.class), Syntax.PROTO_2, null);
    }
}
