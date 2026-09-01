package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.ei9;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0011\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013¨\u0006\u0014"}, d2 = {"Lgen/model/PostMongerRequestType;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "ei9", "ELEVATE", "ELEVATE_BONUS", "FEATURE_LOCK", "FEATURE_LOCK_MINIMUM_GUARANTEE", "MINIMUM_GUARANTEE", "ELEVATE_MINIMUM_GUARANTEE", "ELEVATE_LOCKED", "ELEVATE_LOCKED_MINIMUM_GUARANTEE", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostMongerRequestType implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostMongerRequestType[] $VALUES;
    public static final ProtoAdapter<PostMongerRequestType> ADAPTER;
    public static final ei9 Companion;
    private final int value;
    public static final PostMongerRequestType ELEVATE = new PostMongerRequestType("ELEVATE", 0, 4);
    public static final PostMongerRequestType ELEVATE_BONUS = new PostMongerRequestType("ELEVATE_BONUS", 1, 8);
    public static final PostMongerRequestType FEATURE_LOCK = new PostMongerRequestType("FEATURE_LOCK", 2, 1);
    public static final PostMongerRequestType FEATURE_LOCK_MINIMUM_GUARANTEE = new PostMongerRequestType("FEATURE_LOCK_MINIMUM_GUARANTEE", 3, 2);
    public static final PostMongerRequestType MINIMUM_GUARANTEE = new PostMongerRequestType("MINIMUM_GUARANTEE", 4, 3);
    public static final PostMongerRequestType ELEVATE_MINIMUM_GUARANTEE = new PostMongerRequestType("ELEVATE_MINIMUM_GUARANTEE", 5, 5);
    public static final PostMongerRequestType ELEVATE_LOCKED = new PostMongerRequestType("ELEVATE_LOCKED", 6, 6);
    public static final PostMongerRequestType ELEVATE_LOCKED_MINIMUM_GUARANTEE = new PostMongerRequestType("ELEVATE_LOCKED_MINIMUM_GUARANTEE", 7, 7);

    private static final /* synthetic */ PostMongerRequestType[] $values() {
        return new PostMongerRequestType[]{ELEVATE, ELEVATE_BONUS, FEATURE_LOCK, FEATURE_LOCK_MINIMUM_GUARANTEE, MINIMUM_GUARANTEE, ELEVATE_MINIMUM_GUARANTEE, ELEVATE_LOCKED, ELEVATE_LOCKED_MINIMUM_GUARANTEE};
    }

    static {
        PostMongerRequestType[] postMongerRequestTypeArr$values = $values();
        $VALUES = postMongerRequestTypeArr$values;
        $ENTRIES = new i04(postMongerRequestTypeArr$values);
        Companion = new ei9();
        ADAPTER = new PostMongerRequestType$Companion$ADAPTER$1(n1b.a.b(PostMongerRequestType.class), Syntax.PROTO_2, null);
    }

    private PostMongerRequestType(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostMongerRequestType fromValue(int i) {
        Companion.getClass();
        return ei9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostMongerRequestType valueOf(String str) {
        return (PostMongerRequestType) Enum.valueOf(PostMongerRequestType.class, str);
    }

    public static PostMongerRequestType[] values() {
        return (PostMongerRequestType[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
