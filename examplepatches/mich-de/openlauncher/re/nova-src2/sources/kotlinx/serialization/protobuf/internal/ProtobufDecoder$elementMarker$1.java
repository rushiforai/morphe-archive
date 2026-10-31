package kotlinx.serialization.protobuf.internal;

import kotlin.Metadata;
import kotlin.jvm.functions.Function2;
import kotlin.jvm.internal.FunctionReferenceImpl;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.descriptors.SerialDescriptor;

@Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public /* synthetic */ class ProtobufDecoder$elementMarker$1 extends FunctionReferenceImpl implements Function2<SerialDescriptor, Integer, Boolean> {
    public ProtobufDecoder$elementMarker$1(Object obj) {
        super(2, 0, ProtobufDecoder.class, obj, "readIfAbsent", "readIfAbsent(Lkotlinx/serialization/descriptors/SerialDescriptor;I)Z");
    }

    public final Boolean invoke(SerialDescriptor p02, int i5) {
        Intrinsics.g(p02, "p0");
        return Boolean.valueOf(((ProtobufDecoder) this.receiver).readIfAbsent(p02, i5));
    }

    @Override // kotlin.jvm.functions.Function2
    public /* bridge */ /* synthetic */ Object invoke(Object obj, Object obj2) {
        return invoke((SerialDescriptor) obj, ((Number) obj2).intValue());
    }
}
