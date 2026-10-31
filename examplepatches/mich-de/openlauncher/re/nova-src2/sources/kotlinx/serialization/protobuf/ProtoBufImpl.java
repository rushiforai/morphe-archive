package kotlinx.serialization.protobuf;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u0018\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\b\u0003\u0018\u00002\u00020\u0001B\u0017\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005¢\u0006\u0004\b\u0006\u0010\u0007¨\u0006\b"}, d2 = {"Lkotlinx/serialization/protobuf/ProtoBufImpl;", "Lkotlinx/serialization/protobuf/ProtoBuf;", "encodeDefaults", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "<init>", "(ZLkotlinx/serialization/modules/SerializersModule;)V", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes5.dex */
final class ProtoBufImpl extends ProtoBuf {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ProtoBufImpl(boolean z11, @NotNull SerializersModule serializersModule) {
        super(z11, serializersModule, null);
        Intrinsics.g(serializersModule, "serializersModule");
    }
}
