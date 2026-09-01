package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.bf9;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000b\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\r¨\u0006\u000e"}, d2 = {"Lgen/model/PostContentType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "bf9", "STORY", "SHORT", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostContentType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostContentType[] $VALUES;
    public static final ProtoAdapter<PostContentType> ADAPTER;
    public static final bf9 Companion;
    public static final PostContentType SHORT;
    public static final PostContentType STORY;
    private final int value;

    private static final /* synthetic */ PostContentType[] $values() {
        return new PostContentType[]{STORY, SHORT};
    }

    static {
        PostContentType postContentType = new PostContentType("STORY", 0, 0);
        STORY = postContentType;
        SHORT = new PostContentType("SHORT", 1, 1);
        PostContentType[] postContentTypeArr$values = $values();
        $VALUES = postContentTypeArr$values;
        $ENTRIES = new i04(postContentTypeArr$values);
        Companion = new bf9();
        ADAPTER = new PostContentType$Companion$ADAPTER$1(n1b.a.b(PostContentType.class), Syntax.PROTO_2, postContentType);
    }

    private PostContentType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostContentType fromValue(int i) {
        Companion.getClass();
        if (i == 0) {
            return STORY;
        }
        if (i != 1) {
            return null;
        }
        return SHORT;
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostContentType valueOf(String str) {
        return (PostContentType) Enum.valueOf(PostContentType.class, str);
    }

    public static PostContentType[] values() {
        return (PostContentType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
