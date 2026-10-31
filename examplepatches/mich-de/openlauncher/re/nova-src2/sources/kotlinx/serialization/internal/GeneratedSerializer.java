package kotlinx.serialization.internal;

import kotlin.Metadata;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0003\bg\u0018\u0000*\u0004\b\u0000\u0010\u00012\b\u0012\u0004\u0012\u0002H\u00010\u0002J\u0017\u0010\u0003\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00020\u0004H&¢\u0006\u0002\u0010\u0005J\u0017\u0010\u0006\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00020\u0004H\u0016¢\u0006\u0002\u0010\u0005¨\u0006\u0007À\u0006\u0003"}, d2 = {"Lkotlinx/serialization/internal/GeneratedSerializer;", "T", "Lkotlinx/serialization/KSerializer;", "childSerializers", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "()[Lkotlinx/serialization/KSerializer;", "typeParametersSerializers", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@InternalSerializationApi
/* loaded from: classes.dex */
public interface GeneratedSerializer<T> extends KSerializer<T> {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        @NotNull
        public static <T> KSerializer<?>[] typeParametersSerializers(@NotNull GeneratedSerializer<T> generatedSerializer) {
            return GeneratedSerializer.super.typeParametersSerializers();
        }
    }

    @NotNull
    KSerializer<?>[] childSerializers();

    @NotNull
    default KSerializer<?>[] typeParametersSerializers() {
        return PluginHelperInterfacesKt.EMPTY_SERIALIZER_ARRAY;
    }
}
