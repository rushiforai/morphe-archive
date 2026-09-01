package gen.model;

import com.squareup.wire.ProtoAdapter;
import com.squareup.wire.Syntax;
import com.squareup.wire.WireEnum;
import defpackage.g04;
import defpackage.i04;
import defpackage.n1b;
import defpackage.z94;
import kotlin.Metadata;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* JADX INFO: compiled from: r8-map-id-b2309a5993a3f14549aeb617bc4a78ecbec51e99a3efca387f8965087335ae2d */
/* JADX INFO: loaded from: classes5.dex */
@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\u0010\b\n\u0002\b\u000f\b\u0086\u0081\u0002\u0018\u0000 \n2\u00020\u00012\b\u0012\u0004\u0012\u00020\u00000\u0002:\u0001\u000bB\u0011\b\u0002\u0012\u0006\u0010\u0004\u001a\u00020\u0003¢\u0006\u0004\b\u0005\u0010\u0006R\u001a\u0010\u0004\u001a\u00020\u00038\u0016X\u0096\u0004¢\u0006\f\n\u0004\b\u0004\u0010\u0007\u001a\u0004\b\b\u0010\tj\u0002\b\fj\u0002\b\rj\u0002\b\u000ej\u0002\b\u000fj\u0002\b\u0010j\u0002\b\u0011¨\u0006\u0012"}, d2 = {"Lgen/model/FastrakBetaVersion;", "Lcom/squareup/wire/WireEnum;", "", "", "value", "<init>", "(Ljava/lang/String;II)V", "I", "getValue", "()I", "Companion", "z94", "BETA_UNKNOWN", "BETA_1", "BETA_2", "BETA_3", "ROLLOUT_INVITE", "ROLLOUT_NEW_USER", "proto_release"}, k = 1, mv = {2, 2, 0}, xi = 48)
public final class FastrakBetaVersion implements WireEnum {
    private static final /* synthetic */ g04 $ENTRIES;
    private static final /* synthetic */ FastrakBetaVersion[] $VALUES;
    public static final ProtoAdapter<FastrakBetaVersion> ADAPTER;
    public static final FastrakBetaVersion BETA_1;
    public static final FastrakBetaVersion BETA_2;
    public static final FastrakBetaVersion BETA_3;
    public static final FastrakBetaVersion BETA_UNKNOWN;
    public static final z94 Companion;
    public static final FastrakBetaVersion ROLLOUT_INVITE;
    public static final FastrakBetaVersion ROLLOUT_NEW_USER;
    private final int value;

    private static final /* synthetic */ FastrakBetaVersion[] $values() {
        return new FastrakBetaVersion[]{BETA_UNKNOWN, BETA_1, BETA_2, BETA_3, ROLLOUT_INVITE, ROLLOUT_NEW_USER};
    }

    static {
        FastrakBetaVersion fastrakBetaVersion = new FastrakBetaVersion("BETA_UNKNOWN", 0, 0);
        BETA_UNKNOWN = fastrakBetaVersion;
        BETA_1 = new FastrakBetaVersion("BETA_1", 1, 1);
        BETA_2 = new FastrakBetaVersion("BETA_2", 2, 2);
        BETA_3 = new FastrakBetaVersion("BETA_3", 3, 3);
        ROLLOUT_INVITE = new FastrakBetaVersion("ROLLOUT_INVITE", 4, 4);
        ROLLOUT_NEW_USER = new FastrakBetaVersion("ROLLOUT_NEW_USER", 5, 5);
        FastrakBetaVersion[] fastrakBetaVersionArr$values = $values();
        $VALUES = fastrakBetaVersionArr$values;
        $ENTRIES = new i04(fastrakBetaVersionArr$values);
        Companion = new z94();
        ADAPTER = new FastrakBetaVersion$Companion$ADAPTER$1(n1b.a.b(FastrakBetaVersion.class), Syntax.PROTO_2, fastrakBetaVersion);
    }

    private FastrakBetaVersion(String str, int i, int i2) {
        this.value = i2;
    }

    public static final FastrakBetaVersion fromValue(int i) {
        Companion.getClass();
        return z94.a(i);
    }

    public static g04 getEntries() {
        return $ENTRIES;
    }

    public static FastrakBetaVersion valueOf(String str) {
        return (FastrakBetaVersion) Enum.valueOf(FastrakBetaVersion.class, str);
    }

    public static FastrakBetaVersion[] values() {
        return (FastrakBetaVersion[]) $VALUES.clone();
    }

    @Override // com.squareup.wire.WireEnum
    public int getValue() {
        return this.value;
    }
}
