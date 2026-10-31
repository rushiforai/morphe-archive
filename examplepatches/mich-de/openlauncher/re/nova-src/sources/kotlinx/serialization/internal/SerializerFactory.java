package kotlinx.serialization.internal;

import kotlin.Deprecated;
import kotlin.Metadata;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;

@Deprecated
@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0011\n\u0002\b\u0002\bg\u0018\u00002\u00020\u0001J-\u0010\u0002\u001a\u0006\u0012\u0002\b\u00030\u00032\u001a\u0010\u0004\u001a\u000e\u0012\n\b\u0001\u0012\u0006\u0012\u0002\b\u00030\u00030\u0005\"\u0006\u0012\u0002\b\u00030\u0003H&¢\u0006\u0002\u0010\u0006¨\u0006\u0007À\u0006\u0003"}, d2 = {"Lkotlinx/serialization/internal/SerializerFactory;", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "serializer", "Lkotlinx/serialization/KSerializer;", "typeParamsSerializers", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "([Lkotlinx/serialization/KSerializer;)Lkotlinx/serialization/KSerializer;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public interface SerializerFactory {
    @NotNull
    KSerializer<?> serializer(@NotNull KSerializer<?>... typeParamsSerializers);
}
