package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.tae;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\r\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000f¨\u0006\u0010"}, d2 = {"Lgen/model/UserFlag;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "tae", "AURORA_PROFILE_PAGE", "ENABLE_WEB_MEMBERSHIP_TRIAL", "ENABLE_PARTNER_PROGRAM_ENROLLMENT", "ENABLE_GROUP_GIFTING", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class UserFlag implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ UserFlag[] $VALUES;
    public static final ProtoAdapter<UserFlag> ADAPTER;
    public static final tae Companion;
    private final int value;
    public static final UserFlag AURORA_PROFILE_PAGE = new UserFlag("AURORA_PROFILE_PAGE", 0, 1);
    public static final UserFlag ENABLE_WEB_MEMBERSHIP_TRIAL = new UserFlag("ENABLE_WEB_MEMBERSHIP_TRIAL", 1, 2);
    public static final UserFlag ENABLE_PARTNER_PROGRAM_ENROLLMENT = new UserFlag("ENABLE_PARTNER_PROGRAM_ENROLLMENT", 2, 3);
    public static final UserFlag ENABLE_GROUP_GIFTING = new UserFlag("ENABLE_GROUP_GIFTING", 3, 4);

    private static final /* synthetic */ UserFlag[] $values() {
        return new UserFlag[]{AURORA_PROFILE_PAGE, ENABLE_WEB_MEMBERSHIP_TRIAL, ENABLE_PARTNER_PROGRAM_ENROLLMENT, ENABLE_GROUP_GIFTING};
    }

    static {
        UserFlag[] userFlagArr$values = $values();
        $VALUES = userFlagArr$values;
        $ENTRIES = new i04(userFlagArr$values);
        Companion = new tae();
        ADAPTER = new UserFlag$Companion$ADAPTER$1(n1b.a.b(UserFlag.class), Syntax.PROTO_2, null);
    }

    private UserFlag(String str, int i, int i2) {
        this.value = i2;
    }

    public static final UserFlag fromValue(int i) {
        Companion.getClass();
        return tae.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static UserFlag valueOf(String str) {
        return (UserFlag) Enum.valueOf(UserFlag.class, str);
    }

    public static UserFlag[] values() {
        return (UserFlag[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
