package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.rn9;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000e¨\u0006\u000f"}, d2 = {"Lgen/model/PostResponseType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "rn9", "LEGACY_RESPONSE", "STORY_RESPONSE", "SIMPLE_RESPONSE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostResponseType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostResponseType[] $VALUES;
    public static final ProtoAdapter<PostResponseType> ADAPTER;
    public static final rn9 Companion;
    private final int value;
    public static final PostResponseType LEGACY_RESPONSE = new PostResponseType("LEGACY_RESPONSE", 0, 1);
    public static final PostResponseType STORY_RESPONSE = new PostResponseType("STORY_RESPONSE", 1, 2);
    public static final PostResponseType SIMPLE_RESPONSE = new PostResponseType("SIMPLE_RESPONSE", 2, 3);

    private static final /* synthetic */ PostResponseType[] $values() {
        return new PostResponseType[]{LEGACY_RESPONSE, STORY_RESPONSE, SIMPLE_RESPONSE};
    }

    static {
        PostResponseType[] postResponseTypeArr$values = $values();
        $VALUES = postResponseTypeArr$values;
        $ENTRIES = new i04(postResponseTypeArr$values);
        Companion = new rn9();
        ADAPTER = new PostResponseType$Companion$ADAPTER$1(n1b.a.b(PostResponseType.class), Syntax.PROTO_2, null);
    }

    private PostResponseType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostResponseType fromValue(int i) {
        Companion.getClass();
        return rn9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostResponseType valueOf(String str) {
        return (PostResponseType) Enum.valueOf(PostResponseType.class, str);
    }

    public static PostResponseType[] values() {
        return (PostResponseType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
