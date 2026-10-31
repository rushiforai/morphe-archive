package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.protobuf.ProtoBuf;
import kotlinx.serialization.protobuf.ProtoIntegerType;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000:\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0010\b\n\u0000\n\u0002\u0010\u0002\n\u0000\b\u0010\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0010\u0006\u001a\u00060\u0007j\u0002`\b\u0012\u0006\u0010\t\u001a\u00020\n\u0012\b\b\u0002\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\u0018\u0010\u000f\u001a\u00060\u0007j\u0002`\b*\u00020\n2\u0006\u0010\u0010\u001a\u00020\u0011H\u0014J\u0010\u0010\u0012\u001a\u00020\u00132\u0006\u0010\t\u001a\u00020\nH\u0014R\u0010\u0010\u0004\u001a\u00020\u00058\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0014\u0010\u0006\u001a\u00060\u0007j\u0002`\b8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u000b\u001a\u00020\f8\u0006X\u0087\u0004¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Lkotlinx/serialization/protobuf/internal/NestedRepeatedEncoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufEncoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "writer", "Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", "curTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "stream", "Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufWriter;JLkotlinx/serialization/descriptors/SerialDescriptor;Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;)V", "getTag", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "endEncode", b.f42142b, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public class NestedRepeatedEncoder extends ProtobufEncoder {

    @JvmField
    public final long curTag;

    @JvmField
    @NotNull
    public final ByteArrayOutput stream;

    @JvmField
    @NotNull
    public final ProtobufWriter writer;

    public /* synthetic */ NestedRepeatedEncoder(ProtoBuf protoBuf, ProtobufWriter protobufWriter, long j11, SerialDescriptor serialDescriptor, ByteArrayOutput byteArrayOutput, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(protoBuf, protobufWriter, j11, serialDescriptor, (i5 & 16) != 0 ? new ByteArrayOutput() : byteArrayOutput);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void endEncode(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        this.writer.writeOutput(this.stream, (int) (this.curTag & 2147483647L));
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufEncoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        return ProtoIntegerType.DEFAULT.getSignature() | 1;
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public NestedRepeatedEncoder(@NotNull ProtoBuf proto, @NotNull ProtobufWriter writer, long j11, @NotNull SerialDescriptor descriptor, @NotNull ByteArrayOutput stream) {
        super(proto, new ProtobufWriter(stream), descriptor);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(writer, "writer");
        Intrinsics.g(descriptor, "descriptor");
        Intrinsics.g(stream, "stream");
        this.writer = writer;
        this.curTag = j11;
        this.stream = stream;
    }
}
