package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.SerializationException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.protobuf.ProtoBuf;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000@\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0002\b\u0002\b\u0000\u0018\u00002\u00020\u0001B\u001f\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\u0006\u0010\u0006\u001a\u00020\u0007¢\u0006\u0004\b\b\u0010\tJ\u0018\u0010\f\u001a\u00060\rj\u0002`\u000e*\u00020\u00072\u0006\u0010\u000f\u001a\u00020\u000bH\u0014J\u0010\u0010\u0010\u001a\u00020\u00112\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0010\u0010\u0012\u001a\u00020\u000b2\u0006\u0010\u0006\u001a\u00020\u0007H\u0016J\u0014\u0010\u0013\u001a\u00020\u00142\n\u0010\u0015\u001a\u00060\rj\u0002`\u000eH\u0014R\u000e\u0010\n\u001a\u00020\u000bX\u0082\u000e¢\u0006\u0002\n\u0000¨\u0006\u0016"}, d2 = {"Lkotlinx/serialization/protobuf/internal/PackedArrayDecoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufDecoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "reader", "Lkotlinx/serialization/protobuf/internal/ProtobufReader;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufReader;Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "nextIndex", b.f42142b, "getTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "beginStructure", "Lkotlinx/serialization/encoding/CompositeDecoder;", "decodeElementIndex", "decodeTaggedString", b.f42142b, "tag", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public final class PackedArrayDecoder extends ProtobufDecoder {
    private int nextIndex;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public PackedArrayDecoder(@NotNull ProtoBuf proto, @NotNull ProtobufReader reader, @NotNull SerialDescriptor descriptor) {
        super(proto, reader, descriptor);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(reader, "reader");
        Intrinsics.g(descriptor, "descriptor");
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufDecoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder, kotlinx.serialization.encoding.Decoder
    @NotNull
    public CompositeDecoder beginStructure(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        throw new SerializationException("Packing only supports primitive number types. The input type however was a struct: " + descriptor);
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufDecoder, kotlinx.serialization.encoding.CompositeDecoder
    public int decodeElementIndex(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        if (this.reader.getEof()) {
            return -1;
        }
        int i5 = this.nextIndex;
        this.nextIndex = i5 + 1;
        return i5;
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufDecoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    @NotNull
    public String decodeTaggedString(long tag) {
        throw new SerializationException("Packing only supports primitive number types. The actual reading is for string.");
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufDecoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        return ProtobufTaggedBaseKt.MISSING_TAG;
    }
}
