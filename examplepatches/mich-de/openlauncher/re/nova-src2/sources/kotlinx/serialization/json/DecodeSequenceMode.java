package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlinx.serialization.ExperimentalSerializationApi;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
@Metadata(d1 = {"\u0000\f\n\u0002\u0018\u0002\n\u0002\u0010\u0010\n\u0002\b\u0006\b\u0087\u0081\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00000\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003j\u0002\b\u0004j\u0002\b\u0005j\u0002\b\u0006¨\u0006\u0007"}, d2 = {"Lkotlinx/serialization/json/DecodeSequenceMode;", b.f42142b, "<init>", "(Ljava/lang/String;I)V", "WHITESPACE_SEPARATED", "ARRAY_WRAPPED", "AUTO_DETECT", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes5.dex */
public final class DecodeSequenceMode {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ DecodeSequenceMode[] $VALUES;
    public static final DecodeSequenceMode WHITESPACE_SEPARATED = new DecodeSequenceMode("WHITESPACE_SEPARATED", 0);
    public static final DecodeSequenceMode ARRAY_WRAPPED = new DecodeSequenceMode("ARRAY_WRAPPED", 1);
    public static final DecodeSequenceMode AUTO_DETECT = new DecodeSequenceMode("AUTO_DETECT", 2);

    private static final /* synthetic */ DecodeSequenceMode[] $values() {
        return new DecodeSequenceMode[]{WHITESPACE_SEPARATED, ARRAY_WRAPPED, AUTO_DETECT};
    }

    static {
        DecodeSequenceMode[] decodeSequenceModeArr$values = $values();
        $VALUES = decodeSequenceModeArr$values;
        $ENTRIES = EnumEntriesKt.a(decodeSequenceModeArr$values);
    }

    private DecodeSequenceMode(String str, int i5) {
    }

    @NotNull
    public static EnumEntries<DecodeSequenceMode> getEntries() {
        return $ENTRIES;
    }

    public static DecodeSequenceMode valueOf(String str) {
        return (DecodeSequenceMode) Enum.valueOf(DecodeSequenceMode.class, str);
    }

    public static DecodeSequenceMode[] values() {
        return (DecodeSequenceMode[]) $VALUES.clone();
    }
}
