package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.jvm.JvmField;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.protobuf.ProtoBuf;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00004\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\b\u0012\u0018\u00002\u00020\u0001B5\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\n\u0010\u0004\u001a\u00060\u0005j\u0002`\u0006\u0012\u0006\u0010\u0007\u001a\u00020\b\u0012\b\b\u0002\u0010\t\u001a\u00020\n\u0012\u0006\u0010\u000b\u001a\u00020\f¢\u0006\u0004\b\r\u0010\u000eJ\u0010\u0010\u000f\u001a\u00020\u00102\u0006\u0010\u000b\u001a\u00020\fH\u0014R\u0014\u0010\u0004\u001a\u00060\u0005j\u0002`\u00068\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\u0007\u001a\u00020\b8\u0004X\u0085\u0004¢\u0006\u0002\n\u0000R\u0010\u0010\t\u001a\u00020\n8\u0004X\u0085\u0004¢\u0006\u0002\n\u0000¨\u0006\u0011"}, d2 = {"Lkotlinx/serialization/protobuf/internal/ObjectEncoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufEncoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "parentTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "parentWriter", "Lkotlinx/serialization/protobuf/internal/ProtobufWriter;", "stream", "Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;JLkotlinx/serialization/protobuf/internal/ProtobufWriter;Lkotlinx/serialization/protobuf/internal/ByteArrayOutput;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "endEncode", b.f42142b, "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
class ObjectEncoder extends ProtobufEncoder {

    @JvmField
    protected final long parentTag;

    @JvmField
    @NotNull
    protected final ProtobufWriter parentWriter;

    @JvmField
    @NotNull
    protected final ByteArrayOutput stream;

    public /* synthetic */ ObjectEncoder(ProtoBuf protoBuf, long j11, ProtobufWriter protobufWriter, ByteArrayOutput byteArrayOutput, SerialDescriptor serialDescriptor, int i5, DefaultConstructorMarker defaultConstructorMarker) {
        this(protoBuf, j11, protobufWriter, (i5 & 8) != 0 ? new ByteArrayOutput() : byteArrayOutput, serialDescriptor);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufTaggedEncoder
    public void endEncode(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        long j11 = this.parentTag;
        if (j11 != ProtobufTaggedBaseKt.MISSING_TAG) {
            this.parentWriter.writeOutput(this.stream, (int) (j11 & 2147483647L));
        } else {
            this.parentWriter.writeOutput(this.stream);
        }
    }

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public ObjectEncoder(@NotNull ProtoBuf proto, long j11, @NotNull ProtobufWriter parentWriter, @NotNull ByteArrayOutput stream, @NotNull SerialDescriptor descriptor) {
        super(proto, new ProtobufWriter(stream), descriptor);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(parentWriter, "parentWriter");
        Intrinsics.g(stream, "stream");
        Intrinsics.g(descriptor, "descriptor");
        this.parentTag = j11;
        this.parentWriter = parentWriter;
        this.stream = stream;
    }
}
