package kotlinx.serialization.protobuf;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0005\b\u0007\u0018\u00002\u00020\u0001B\u0011\b\u0000\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005R\u001a\u0010\u0006\u001a\u00020\u0007X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\b\u0010\t\"\u0004\b\n\u0010\u000bR\u001a\u0010\f\u001a\u00020\rX\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u000e\u0010\u000f\"\u0004\b\u0010\u0010\u0011¨\u0006\u0012"}, d2 = {"Lkotlinx/serialization/protobuf/ProtoBufBuilder;", b.f42142b, "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;)V", "encodeDefaults", b.f42142b, "getEncodeDefaults", "()Z", "setEncodeDefaults", "(Z)V", "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "setSerializersModule", "(Lkotlinx/serialization/modules/SerializersModule;)V", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes5.dex */
public final class ProtoBufBuilder {
    private boolean encodeDefaults;

    @NotNull
    private SerializersModule serializersModule;

    public ProtoBufBuilder(@NotNull ProtoBuf proto) {
        Intrinsics.g(proto, "proto");
        this.encodeDefaults = proto.getEncodeDefaults();
        this.serializersModule = proto.getSerializersModule();
    }

    public final boolean getEncodeDefaults() {
        return this.encodeDefaults;
    }

    @NotNull
    public final SerializersModule getSerializersModule() {
        return this.serializersModule;
    }

    public final void setEncodeDefaults(boolean z11) {
        this.encodeDefaults = z11;
    }

    public final void setSerializersModule(@NotNull SerializersModule serializersModule) {
        Intrinsics.g(serializersModule, "<set-?>");
        this.serializersModule = serializersModule;
    }
}
