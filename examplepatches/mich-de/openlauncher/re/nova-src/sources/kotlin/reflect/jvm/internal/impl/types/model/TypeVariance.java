package kotlin.reflect.jvm.internal.impl.types.model;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.enums.EnumEntries;
import kotlin.enums.EnumEntriesKt;
import org.jetbrains.annotations.NotNull;

/* JADX WARN: Failed to restore enum class, 'enum' modifier and super class removed */
/* JADX WARN: Unknown enum class pattern. Please report as an issue! */
/* loaded from: classes5.dex */
public final class TypeVariance {
    private static final /* synthetic */ EnumEntries $ENTRIES;
    private static final /* synthetic */ TypeVariance[] $VALUES;

    @NotNull
    private final String presentation;
    public static final TypeVariance IN = new TypeVariance("IN", 0, "in");
    public static final TypeVariance OUT = new TypeVariance("OUT", 1, "out");
    public static final TypeVariance INV = new TypeVariance("INV", 2, b.f42142b);

    private static final /* synthetic */ TypeVariance[] $values() {
        return new TypeVariance[]{IN, OUT, INV};
    }

    static {
        TypeVariance[] typeVarianceArr$values = $values();
        $VALUES = typeVarianceArr$values;
        $ENTRIES = EnumEntriesKt.a(typeVarianceArr$values);
    }

    private TypeVariance(String str, int i5, String str2) {
        this.presentation = str2;
    }

    public static TypeVariance valueOf(String str) {
        return (TypeVariance) Enum.valueOf(TypeVariance.class, str);
    }

    public static TypeVariance[] values() {
        return (TypeVariance[]) $VALUES.clone();
    }

    @Override // java.lang.Enum
    @NotNull
    public String toString() {
        return this.presentation;
    }
}
