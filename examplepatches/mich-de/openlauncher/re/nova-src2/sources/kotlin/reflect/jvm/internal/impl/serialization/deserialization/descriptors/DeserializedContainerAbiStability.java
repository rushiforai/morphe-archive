package kotlin.reflect.jvm.internal.impl.serialization.deserialization.descriptors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class DeserializedContainerAbiStability {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ DeserializedContainerAbiStability[] $VALUES;
    public static final DeserializedContainerAbiStability STABLE = new DeserializedContainerAbiStability("STABLE", 0);
    public static final DeserializedContainerAbiStability FIR_UNSTABLE = new DeserializedContainerAbiStability("FIR_UNSTABLE", 1);
    public static final DeserializedContainerAbiStability IR_UNSTABLE = new DeserializedContainerAbiStability("IR_UNSTABLE", 2);

    private static final /* synthetic */ DeserializedContainerAbiStability[] $values() {
        return new DeserializedContainerAbiStability[]{STABLE, FIR_UNSTABLE, IR_UNSTABLE};
    }

    static {
        DeserializedContainerAbiStability[] deserializedContainerAbiStabilityArr$values = $values();
        $VALUES = deserializedContainerAbiStabilityArr$values;
        $ENTRIES = EnumEntriesKt.a(deserializedContainerAbiStabilityArr$values);
    }

    private DeserializedContainerAbiStability(String str, int i5) {
    }

    public static DeserializedContainerAbiStability valueOf(String str) {
        return (DeserializedContainerAbiStability) Enum.valueOf(DeserializedContainerAbiStability.class, str);
    }

    public static DeserializedContainerAbiStability[] values() {
        return (DeserializedContainerAbiStability[]) $VALUES.clone();
    }
}
