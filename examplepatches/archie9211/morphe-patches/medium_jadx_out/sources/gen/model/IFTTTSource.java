package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.yt5;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/IFTTTSource;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "yt5", "TRIGGER_POSTS_RECOMMENDED_BY_YOU", "TRIGGER_POSTS_BOOKMARKED_BY_YOU", "TRIGGER_POSTS_PUBLISHED_BY_YOU", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class IFTTTSource implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ IFTTTSource[] $VALUES;
    public static final ProtoAdapter<IFTTTSource> ADAPTER;
    public static final yt5 Companion;
    private final int value;
    public static final IFTTTSource TRIGGER_POSTS_RECOMMENDED_BY_YOU = new IFTTTSource("TRIGGER_POSTS_RECOMMENDED_BY_YOU", 0, 1);
    public static final IFTTTSource TRIGGER_POSTS_BOOKMARKED_BY_YOU = new IFTTTSource("TRIGGER_POSTS_BOOKMARKED_BY_YOU", 1, 2);
    public static final IFTTTSource TRIGGER_POSTS_PUBLISHED_BY_YOU = new IFTTTSource("TRIGGER_POSTS_PUBLISHED_BY_YOU", 2, 3);

    private static final /* synthetic */ IFTTTSource[] $values() {
        return new IFTTTSource[]{TRIGGER_POSTS_RECOMMENDED_BY_YOU, TRIGGER_POSTS_BOOKMARKED_BY_YOU, TRIGGER_POSTS_PUBLISHED_BY_YOU};
    }

    static {
        IFTTTSource[] iFTTTSourceArr$values = $values();
        $VALUES = iFTTTSourceArr$values;
        $ENTRIES = new i04(iFTTTSourceArr$values);
        Companion = new yt5();
        ADAPTER = new IFTTTSource$Companion$ADAPTER$1(n1b.a.b(IFTTTSource.class), Syntax.PROTO_2, null);
    }

    private IFTTTSource(String str, int i, int i2) {
        this.value = i2;
    }

    public static final IFTTTSource fromValue(int i) {
        Companion.getClass();
        return yt5.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static IFTTTSource valueOf(String str) {
        return (IFTTTSource) Enum.valueOf(IFTTTSource.class, str);
    }

    public static IFTTTSource[] values() {
        return (IFTTTSource[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
