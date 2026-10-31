package kotlinx.serialization.protobuf;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\u001c\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0000\u001a+\u0010\u0000\u001a\u00020\u00012\b\b\u0002\u0010\u0002\u001a\u00020\u00012\u0017\u0010\u0003\u001a\u0013\u0012\u0004\u0012\u00020\u0005\u0012\u0004\u0012\u00020\u00060\u0004¢\u0006\u0002\b\u0007H\u0007¨\u0006\b"}, d2 = {"ProtoBuf", "Lkotlinx/serialization/protobuf/ProtoBuf;", "from", "builderAction", "Lkotlin/Function1;", "Lkotlinx/serialization/protobuf/ProtoBufBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "kotlinx-serialization-protobuf"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class ProtoBufKt {
    @ExperimentalSerializationApi
    @NotNull
    public static final ProtoBuf ProtoBuf(@NotNull ProtoBuf from, @NotNull Function1<? super ProtoBufBuilder, Unit> builderAction) {
        Intrinsics.g(from, "from");
        Intrinsics.g(builderAction, "builderAction");
        ProtoBufBuilder protoBufBuilder = new ProtoBufBuilder(from);
        builderAction.invoke(protoBufBuilder);
        return new ProtoBufImpl(protoBufBuilder.getEncodeDefaults(), protoBufBuilder.getSerializersModule());
    }

    public static /* synthetic */ ProtoBuf ProtoBuf$default(ProtoBuf protoBuf, Function1 function1, int i5, Object obj) {
        if ((i5 & 1) != 0) {
            protoBuf = ProtoBuf.INSTANCE;
        }
        return ProtoBuf(protoBuf, function1);
    }
}
