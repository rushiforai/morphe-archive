package kotlin.reflect.jvm.internal.impl.types;

import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public interface CustomTypeParameter {
    boolean isTypeParameter();

    @NotNull
    KotlinType substitutionResult(@NotNull KotlinType kotlinType);
}
