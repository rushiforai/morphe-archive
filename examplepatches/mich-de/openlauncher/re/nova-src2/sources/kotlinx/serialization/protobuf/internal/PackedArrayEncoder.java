package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.protobuf.ProtoBuf;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000J\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\b\u0000\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0010\u0006\u001a\u00060\u0007j\u0002`\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\u0018\u0010\u000f\u001a\u00060\u0007j\u0002`\b*\u00020\n2\u0006\u0010\u0010\u001a\u00020\u0011H\u0014J\u0018\u0010\u0012\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\n2\u0006\u0010\u0014\u001a\u00020\u0011H\u0016J\u0010\u0010\u0015\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\nH\u0016J\u0010\u0010\u0016\u001a\u00020\u00172\u0006\u0010\t\u001a\u00020\nH\u0014J\u001c\u0010\u0018\u001a\u00020\u00172\n\u0010\u0019\u001a\u00060\u0007j\u0002`\b2\u0006\u0010\u001a\u001a\u00020\u001bH\u0014¨\u0006\u001c"}, d2 = {"Lkotlinx/serialization/protobuf/internal/PackedArrayEncoder;", "Lkotlinx/serialization/protobuf/internal/NestedRepeatedEncoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "writer", "Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", "curTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "stream", "Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufWriter;JLkotlinx/serialization/descriptors/SerialDescriptor;Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;)V", "getTag", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "beginCollection", "Lkotlinx/serialization/encoding/CompositeEncoder;", "collectionSize", "beginStructure", "endEncode", b.f42142b, "encodeTaggedString", "tag", "value", b.f42142b, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class PackedArrayEncoder extends NestedRepeatedEncoder {
    public /* synthetic */ PackedArrayEncoder(ProtoBuf protoBuf, ProtobufWriter protobufWriter, long j11, SerialDescriptor serialDescriptor, ByteArrayOutput byteArrayOutput, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(protoBuf, protobufWriter, j11, serialDescriptor, (i5 & 16) != 0 ? new ByteArrayOutput() : byteArrayOutput);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufEncoder, kotlinx.serialization.encoding.Encoder
    @NotNull
    public CompositeEncoder beginCollection(@NotNull SerialDescriptor descriptor, int collectionSize) {
        Intrinsics.g(descriptor, "descriptor");
        throw new SerializationException("Packing only supports primitive number types");
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufEncoder, kotlinx.serialization.encoding.Encoder
    @NotNull
    public CompositeEncoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        throw new SerializationException("Packing only supports primitive number types");
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufEncoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void encodeTaggedString(long tag, @NotNull String value) {
        Intrinsics.g(value, "value");
        throw new SerializationException("Packing only supports primitive number types");
    }

    @Override // kotlinx.serialization.protobuf.internal.NestedRepeatedEncoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void endEncode(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        if (this.stream.getPosition() > 0) {
            super.endEncode(descriptor);
        }
    }

    @Override // kotlinx.serialization.protobuf.internal.NestedRepeatedEncoder, kotlinx.serialization.protobuf.internal.ProtobufEncoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        return ProtobufTaggedBaseKt.MISSING_TAG;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PackedArrayEncoder(@NotNull ProtoBuf proto, @NotNull ProtobufWriter writer, long j11, @NotNull SerialDescriptor descriptor, @NotNull ByteArrayOutput stream) {
        super(proto, writer, j11, descriptor, stream);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(writer, "writer");
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(stream, "stream");
    }
}
