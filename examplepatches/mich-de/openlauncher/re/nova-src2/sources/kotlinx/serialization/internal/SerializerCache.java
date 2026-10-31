package kotlinx.serialization.internal;

import com.amplitude.android.migration.DatabaseConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\b`\u0018\u0000*\u0004\b\u0000\u0010\u00012\u00020\u0002J\u001e\u0010\u0003\u001a\n\u0012\u0004\u0012\u00028\u0000\u0018\u00010\u00042\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u00020\u00020\u0006H&J\u0014\u0010\u0007\u001a\u00020\b2\n\u0010\u0005\u001a\u0006\u0012\u0002\b\u00030\u0006H\u0016¨\u0006\tÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/internal/SerializerCache;", "T", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "get", "Lkotlinx/serialization/KSerializer;", DatabaseConstants.KEY_FIELD, "Lkotlin/reflect/KClass;", "isStored", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface SerializerCache<T> {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        public static <T> boolean isStored(@NotNull SerializerCache<T> serializerCache, @NotNull KClass<?> key) {
            Intrinsics.g(key, "key");
            return SerializerCache.super.isStored(key);
        }
    }

    @Nullable
    KSerializer<T> get(@NotNull KClass<Object> key);

    default boolean isStored(@NotNull KClass<?> key) {
        Intrinsics.g(key, "key");
        return false;
    }
}
