package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.protobuf.ProtoBuf;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\b\u0002\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0010\u0004\u001a\u00060\u0005j\u0002`\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\u0006\u0010\t\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\u0018\u0010\r\u001a\u00060\u0005j\u0002`\u0006*\u00020\n2\u0006\u0010\u000e\u001a\u00020\u000fH\u0014¨\u0006\u0010"}, d2 = {"Lkotlinx/serialization/protobuf/internal/MapRepeatedEncoder;", "Lkotlinx/serialization/protobuf/internal/ObjectEncoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "parentTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "parentWriter", "Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;JLkotlinx/serialization/protobuf/internal/ProtobufWriter;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "getTag", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
final class MapRepeatedEncoder extends ObjectEncoder {
    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public MapRepeatedEncoder(@NotNull ProtoBuf proto, long j11, @NotNull ProtobufWriter parentWriter, @NotNull SerialDescriptor descriptor) {
        super(proto, j11, parentWriter, null, descriptor, 8, null);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(parentWriter, "parentWriter");
        Intrinsics.g(descriptor, "descriptor");
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufEncoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        if (i5 % 2 == 0) {
            return HelpersKt.getIntegerType(this.parentTag).getSignature() | 1;
        }
        return 2 | HelpersKt.getIntegerType(this.parentTag).getSignature();
    }
}
