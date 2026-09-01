package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.a07;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/LinkAlternateType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "a07", "AMP", "IOS_APPLINK", "ANDROID_APPLINK", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class LinkAlternateType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ LinkAlternateType[] $VALUES;
    public static final ProtoAdapter<LinkAlternateType> ADAPTER;
    public static final a07 Companion;
    private final int value;
    public static final LinkAlternateType AMP = new LinkAlternateType("AMP", 0, 1);
    public static final LinkAlternateType IOS_APPLINK = new LinkAlternateType("IOS_APPLINK", 1, 2);
    public static final LinkAlternateType ANDROID_APPLINK = new LinkAlternateType("ANDROID_APPLINK", 2, 3);

    private static final /* synthetic */ LinkAlternateType[] $values() {
        return new LinkAlternateType[]{AMP, IOS_APPLINK, ANDROID_APPLINK};
    }

    static {
        LinkAlternateType[] linkAlternateTypeArr$values = $values();
        $VALUES = linkAlternateTypeArr$values;
        $ENTRIES = new i04(linkAlternateTypeArr$values);
        Companion = new a07();
        ADAPTER = new LinkAlternateType$Companion$ADAPTER$1(n1b.a.b(LinkAlternateType.class), Syntax.PROTO_2, null);
    }

    private LinkAlternateType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final LinkAlternateType fromValue(int i) {
        Companion.getClass();
        return a07.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static LinkAlternateType valueOf(String str) {
        return (LinkAlternateType) Enum.valueOf(LinkAlternateType.class, str);
    }

    public static LinkAlternateType[] values() {
        return (LinkAlternateType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
