package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.nh9;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u0012\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011j\u0002\b\u0012j\u0002\b\u0013j\u0002\b\u0014¨\u0006\u0015"}, d2 = {"Lgen/model/PostLicense;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "nh9", "ALL_RIGHTS_RESERVED", "CC_40_BY", "CC_40_BY_ND", "CC_40_BY_SA", "CC_40_BY_NC", "CC_40_BY_NC_ND", "CC_40_BY_NC_SA", "CC_40_ZERO", "PUBLIC_DOMAIN", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class PostLicense implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ PostLicense[] $VALUES;
    public static final ProtoAdapter<PostLicense> ADAPTER;
    public static final PostLicense ALL_RIGHTS_RESERVED;
    public static final PostLicense CC_40_BY;
    public static final PostLicense CC_40_BY_NC;
    public static final PostLicense CC_40_BY_NC_ND;
    public static final PostLicense CC_40_BY_NC_SA;
    public static final PostLicense CC_40_BY_ND;
    public static final PostLicense CC_40_BY_SA;
    public static final PostLicense CC_40_ZERO;
    public static final nh9 Companion;
    public static final PostLicense PUBLIC_DOMAIN;
    private final int value;

    private static final /* synthetic */ PostLicense[] $values() {
        return new PostLicense[]{ALL_RIGHTS_RESERVED, CC_40_BY, CC_40_BY_ND, CC_40_BY_SA, CC_40_BY_NC, CC_40_BY_NC_ND, CC_40_BY_NC_SA, CC_40_ZERO, PUBLIC_DOMAIN};
    }

    static {
        PostLicense postLicense = new PostLicense("ALL_RIGHTS_RESERVED", 0, 0);
        ALL_RIGHTS_RESERVED = postLicense;
        CC_40_BY = new PostLicense("CC_40_BY", 1, 1);
        CC_40_BY_ND = new PostLicense("CC_40_BY_ND", 2, 2);
        CC_40_BY_SA = new PostLicense("CC_40_BY_SA", 3, 3);
        CC_40_BY_NC = new PostLicense("CC_40_BY_NC", 4, 4);
        CC_40_BY_NC_ND = new PostLicense("CC_40_BY_NC_ND", 5, 5);
        CC_40_BY_NC_SA = new PostLicense("CC_40_BY_NC_SA", 6, 6);
        CC_40_ZERO = new PostLicense("CC_40_ZERO", 7, 7);
        PUBLIC_DOMAIN = new PostLicense("PUBLIC_DOMAIN", 8, 8);
        PostLicense[] postLicenseArr$values = $values();
        $VALUES = postLicenseArr$values;
        $ENTRIES = new i04(postLicenseArr$values);
        Companion = new nh9();
        ADAPTER = new PostLicense$Companion$ADAPTER$1(n1b.a.b(PostLicense.class), Syntax.PROTO_2, postLicense);
    }

    private PostLicense(String str, int i, int i2) {
        this.value = i2;
    }

    public static final PostLicense fromValue(int i) {
        Companion.getClass();
        return nh9.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static PostLicense valueOf(String str) {
        return (PostLicense) Enum.valueOf(PostLicense.class, str);
    }

    public static PostLicense[] values() {
        return (PostLicense[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
