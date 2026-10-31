package kotlin.reflect.jvm.internal.impl.descriptors;

import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import kotlin.jvm.internal.DefaultConstructorMarker;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class Modality {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ Modality[] $VALUES;

    @NotNull
    public static final Companion Companion;
    public static final Modality FINAL = new Modality("FINAL", 0);
    public static final Modality SEALED = new Modality("SEALED", 1);
    public static final Modality OPEN = new Modality("OPEN", 2);
    public static final Modality ABSTRACT = new Modality("ABSTRACT", 3);

    public static final class Companion {
        public /* synthetic */ Companion(DefaultConstructorMarker defaultConstructorMarker) {
            this();
        }

        @NotNull
        public final Modality convertFromFlags(boolean z11, boolean z12, boolean z13) {
            return z11 ? Modality.SEALED : z12 ? Modality.ABSTRACT : z13 ? Modality.OPEN : Modality.FINAL;
        }

        private Companion() {
        }
    }

    private static final /* synthetic */ Modality[] $values() {
        return new Modality[]{FINAL, SEALED, OPEN, ABSTRACT};
    }

    static {
        Modality[] modalityArr$values = $values();
        $VALUES = modalityArr$values;
        $ENTRIES = EnumEntriesKt.a(modalityArr$values);
        Companion = new Companion(null);
    }

    private Modality(String str, int i5) {
    }

    public static Modality valueOf(String str) {
        return (Modality) Enum.valueOf(Modality.class, str);
    }

    public static Modality[] values() {
        return (Modality[]) $VALUES.clone();
    }
}
