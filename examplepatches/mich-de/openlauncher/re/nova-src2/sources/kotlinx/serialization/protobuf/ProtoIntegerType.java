package kotlinx.serialization.protobuf;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.ExperimentalSerializationApi;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\u0012\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0000\n\u0002\u0010\t\n\u0002\b\b\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\u0011\b\u0002\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u0014\u0010\u0002\u001a\u00020\u0003X\u0080\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0006\u0010\u0007j\u0002\b\bj\u0002\b\tj\u0002\b\n¨\u0006\u000b"}, d2 = {"Lkotlinx/serialization/protobuf/ProtoIntegerType;", b.f42142b, "signature", b.f42142b, "<init>", "(Ljava/lang/String;IJ)V", "getSignature$kotlinx_serialization_protobuf", "()J", "DEFAULT", "SIGNED", "FIXED", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes.dex */
public final class ProtoIntegerType {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ ProtoIntegerType[] $VALUES;
    private final long signature;
    public static final ProtoIntegerType DEFAULT = new ProtoIntegerType("DEFAULT", 0, 0);
    public static final ProtoIntegerType SIGNED = new ProtoIntegerType("SIGNED", 1, 8589934592L);
    public static final ProtoIntegerType FIXED = new ProtoIntegerType("FIXED", 2, 17179869184L);

    private static final /* synthetic */ ProtoIntegerType[] $values() {
        return new ProtoIntegerType[]{DEFAULT, SIGNED, FIXED};
    }

    static {
        ProtoIntegerType[] protoIntegerTypeArr$values = $values();
        $VALUES = protoIntegerTypeArr$values;
        $ENTRIES = EnumEntriesKt.a(protoIntegerTypeArr$values);
    }

    private ProtoIntegerType(String str, int i5, long j11) {
        this.signature = j11;
    }

    @NotNull
    public static EnumEntries<ProtoIntegerType> getEntries() {
        return $ENTRIES;
    }

    public static ProtoIntegerType valueOf(String str) {
        return (ProtoIntegerType) Enum.valueOf(ProtoIntegerType.class, str);
    }

    public static ProtoIntegerType[] values() {
        return (ProtoIntegerType[]) $VALUES.clone();
    }

    /* renamed from: getSignature$kotlinx_serialization_protobuf, reason: from getter */
    public final long getSignature() {
        return this.signature;
    }
}
