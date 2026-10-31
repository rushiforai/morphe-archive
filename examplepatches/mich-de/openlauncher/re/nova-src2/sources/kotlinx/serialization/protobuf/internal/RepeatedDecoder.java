package kotlinx.serialization.protobuf.internal;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.protobuf.ProtoBuf;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\t\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0006\b\u0002\u0018\u00002\u00020\u0001B+\u0012\u0006\u0010\u0002\u001a\u00020\u0003\u0012\u0006\u0010\u0004\u001a\u00020\u0005\u0012\n\u0010\u0006\u001a\u00060\u0007j\u0002`\b\u0012\u0006\u0010\t\u001a\u00020\n¢\u0006\u0004\b\u000b\u0010\fJ\u0010\u0010\u0010\u001a\u00020\u000e2\u0006\u0010\t\u001a\u00020\nH\u0016J\b\u0010\u0011\u001a\u00020\u000eH\u0002J\b\u0010\u0012\u001a\u00020\u000eH\u0002J\u0018\u0010\u0013\u001a\u00060\u0007j\u0002`\b*\u00020\n2\u0006\u0010\r\u001a\u00020\u000eH\u0014R\u000e\u0010\r\u001a\u00020\u000eX\u0082\u000e¢\u0006\u0002\n\u0000R\u000e\u0010\u000f\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006\u0014"}, d2 = {"Lkotlinx/serialization/protobuf/internal/RepeatedDecoder;", "Lkotlinx/serialization/protobuf/internal/ProtobufDecoder;", "proto", "Lkotlinx/serialization/protobuf/ProtoBuf;", "decoder", "Lkotlinx/serialization/protobuf/internal/ProtobufReader;", "currentTag", b.f42142b, "Lkotlinx/serialization/protobuf/internal/ProtoDesc;", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "<init>", "(Lkotlinx/serialization/protobuf/ProtoBuf;Lkotlinx/serialization/protobuf/internal/ProtobufReader;JLkotlinx/serialization/descriptors/SerialDescriptor;)V", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "tagOrSize", "decodeElementIndex", "decodeListIndexNoTag", "decodeTaggedListIndex", "getTag", "kotlinx-serialization-protobuf"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
final class RepeatedDecoder extends ProtobufDecoder {
    private int index;
    private final long tagOrSize;

    /* JADX WARN: 'super' call moved to the top of the method (can break code semantics) */
    public RepeatedDecoder(@NotNull ProtoBuf proto, @NotNull ProtobufReader decoder, long j11, @NotNull SerialDescriptor descriptor) {
        super(proto, decoder, descriptor);
        Intrinsics.g(proto, "proto");
        Intrinsics.g(decoder, "decoder");
        Intrinsics.g(descriptor, "descriptor");
        this.index = -1;
        if (j11 == ProtobufTaggedBaseKt.MISSING_TAG) {
            int int32NoTag = this.reader.readInt32NoTag();
            if (int32NoTag < 0) {
                throw new IllegalArgumentException(("Expected positive length for " + descriptor + ", but got " + int32NoTag).toString());
            }
            j11 = -int32NoTag;
        }
        this.tagOrSize = j11;
    }

    private final int decodeListIndexNoTag() {
        long j11 = -this.tagOrSize;
        int i5 = this.index + 1;
        this.index = i5;
        if (i5 == j11 || this.reader.getEof()) {
            return -1;
        }
        return i5;
    }

    private final int decodeTaggedListIndex() {
        if ((this.index == -1 ? this.reader.currentId : this.reader.readTag()) != ((int) (this.tagOrSize & 2147483647L))) {
            this.reader.pushBackTag();
            return -1;
        }
        int i5 = this.index + 1;
        this.index = i5;
        return i5;
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufDecoder, kotlinx.serialization.encoding.CompositeDecoder
    public int decodeElementIndex(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return this.tagOrSize > 0 ? decodeTaggedListIndex() : decodeListIndexNoTag();
    }

    @Override // kotlinx.serialization.protobuf.internal.ProtobufDecoder, kotlinx.serialization.protobuf.internal.ProtobufTaggedDecoder
    public long getTag(@NotNull SerialDescriptor serialDescriptor, int i5) {
        Intrinsics.g(serialDescriptor, "<this>");
        long j11 = this.tagOrSize;
        return j11 > 0 ? j11 : ProtobufTaggedBaseKt.MISSING_TAG;
    }
}
