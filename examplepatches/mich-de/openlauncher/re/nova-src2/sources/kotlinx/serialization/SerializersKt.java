package kotlinx.serialization;

import java.lang.reflect.Type;
import java.util.List;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlin.reflect.KClassifier;
import kotlin.reflect.KType;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"kotlinx/serialization/SerializersKt__SerializersJvmKt", "kotlinx/serialization/SerializersKt__SerializersKt"}, k = 4, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class SerializersKt {
    @PublishedApi
    @NotNull
    public static final KSerializer<?> moduleThenPolymorphic(@NotNull SerializersModule serializersModule, @NotNull KClass<?> kClass) {
        return SerializersKt__SerializersKt.moduleThenPolymorphic(serializersModule, kClass);
    }

    @PublishedApi
    @NotNull
    public static final KSerializer<?> noCompiledSerializer(@NotNull String str) {
        return SerializersKt__SerializersKt.noCompiledSerializer(str);
    }

    @Nullable
    public static final KSerializer<? extends Object> parametrizedSerializerOrNull(@NotNull KClass<Object> kClass, @NotNull List<? extends KSerializer<Object>> list, @NotNull Function0<? extends KClassifier> function0) {
        return SerializersKt__SerializersKt.parametrizedSerializerOrNull(kClass, list, function0);
    }

    public static final /* synthetic */ <T> KSerializer<T> serializer() {
        Intrinsics.k();
        throw null;
    }

    @Nullable
    public static final KSerializer<Object> serializerOrNull(@NotNull Type type) {
        return SerializersKt__SerializersJvmKt.serializerOrNull(type);
    }

    @Nullable
    public static final List<KSerializer<Object>> serializersForParameters(@NotNull SerializersModule serializersModule, @NotNull List<? extends KType> list, boolean z11) {
        return SerializersKt__SerializersKt.serializersForParameters(serializersModule, list, z11);
    }

    @PublishedApi
    @NotNull
    public static final KSerializer<?> moduleThenPolymorphic(@NotNull SerializersModule serializersModule, @NotNull KClass<?> kClass, @NotNull KSerializer<?>[] kSerializerArr) {
        return SerializersKt__SerializersKt.moduleThenPolymorphic(serializersModule, kClass, kSerializerArr);
    }

    @PublishedApi
    @NotNull
    public static final KSerializer<?> noCompiledSerializer(@NotNull SerializersModule serializersModule, @NotNull KClass<?> kClass) {
        return SerializersKt__SerializersKt.noCompiledSerializer(serializersModule, kClass);
    }

    @NotNull
    public static final KSerializer<Object> serializer(@NotNull Type type) {
        return SerializersKt__SerializersJvmKt.serializer(type);
    }

    @InternalSerializationApi
    @Nullable
    public static final <T> KSerializer<T> serializerOrNull(@NotNull KClass<T> kClass) {
        return SerializersKt__SerializersKt.serializerOrNull(kClass);
    }

    @PublishedApi
    @NotNull
    public static final KSerializer<?> noCompiledSerializer(@NotNull SerializersModule serializersModule, @NotNull KClass<?> kClass, @NotNull KSerializer<?>[] kSerializerArr) {
        return SerializersKt__SerializersKt.noCompiledSerializer(serializersModule, kClass, kSerializerArr);
    }

    @InternalSerializationApi
    @NotNull
    public static final <T> KSerializer<T> serializer(@NotNull KClass<T> kClass) {
        return SerializersKt__SerializersKt.serializer(kClass);
    }

    @Nullable
    public static final KSerializer<Object> serializerOrNull(@NotNull KType kType) {
        return SerializersKt__SerializersKt.serializerOrNull(kType);
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final KSerializer<Object> serializer(@NotNull KClass<?> kClass, @NotNull List<? extends KSerializer<?>> list, boolean z11) {
        return SerializersKt__SerializersKt.serializer(kClass, list, z11);
    }

    @Nullable
    public static final KSerializer<Object> serializerOrNull(@NotNull SerializersModule serializersModule, @NotNull Type type) {
        return SerializersKt__SerializersJvmKt.serializerOrNull(serializersModule, type);
    }

    @NotNull
    public static final KSerializer<Object> serializer(@NotNull KType kType) {
        return SerializersKt__SerializersKt.serializer(kType);
    }

    @Nullable
    public static final KSerializer<Object> serializerOrNull(@NotNull SerializersModule serializersModule, @NotNull KType kType) {
        return SerializersKt__SerializersKt.serializerOrNull(serializersModule, kType);
    }

    public static final /* synthetic */ <T> KSerializer<T> serializer(SerializersModule serializersModule) {
        Intrinsics.k();
        throw null;
    }

    @NotNull
    public static final KSerializer<Object> serializer(@NotNull SerializersModule serializersModule, @NotNull Type type) {
        return SerializersKt__SerializersJvmKt.serializer(serializersModule, type);
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final KSerializer<Object> serializer(@NotNull SerializersModule serializersModule, @NotNull KClass<?> kClass, @NotNull List<? extends KSerializer<?>> list, boolean z11) {
        return SerializersKt__SerializersKt.serializer(serializersModule, kClass, list, z11);
    }

    @NotNull
    public static final KSerializer<Object> serializer(@NotNull SerializersModule serializersModule, @NotNull KType kType) {
        return SerializersKt__SerializersKt.serializer(serializersModule, kType);
    }
}
