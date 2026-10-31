package kotlin.reflect.jvm.internal.impl.storage;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KProperty;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class StorageKt {
    @NotNull
    public static final <T> T getValue(@NotNull NotNullLazyValue<? extends T> notNullLazyValue, @Nullable Object obj, @NotNull KProperty<?> p11) {
        Intrinsics.g(notNullLazyValue, "<this>");
        Intrinsics.g(p11, "p");
        return (T) notNullLazyValue.invoke();
    }

    @Nullable
    public static final <T> T getValue(@NotNull NullableLazyValue<? extends T> nullableLazyValue, @Nullable Object obj, @NotNull KProperty<?> p11) {
        Intrinsics.g(nullableLazyValue, "<this>");
        Intrinsics.g(p11, "p");
        return (T) nullableLazyValue.invoke();
    }
}
