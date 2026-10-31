package kotlin.reflect.jvm.internal.impl.types;

import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class TypeCapabilitiesKt {
    @Nullable
    public static final CustomTypeParameter getCustomTypeParameter(@NotNull KotlinType kotlinType) {
        Intrinsics.g(kotlinType, "<this>");
        Object objUnwrap = kotlinType.unwrap();
        CustomTypeParameter customTypeParameter = objUnwrap instanceof CustomTypeParameter ? (CustomTypeParameter) objUnwrap : null;
        if (customTypeParameter == null || !customTypeParameter.isTypeParameter()) {
            return null;
        }
        return customTypeParameter;
    }

    public static final boolean isCustomTypeParameter(@NotNull KotlinType kotlinType) {
        Intrinsics.g(kotlinType, "<this>");
        Object objUnwrap = kotlinType.unwrap();
        CustomTypeParameter customTypeParameter = objUnwrap instanceof CustomTypeParameter ? (CustomTypeParameter) objUnwrap : null;
        if (customTypeParameter != null) {
            return customTypeParameter.isTypeParameter();
        }
        return false;
    }
}
