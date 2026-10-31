package e20;

import java.time.LocalTime;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes4.dex */
public final class z implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final z f52095a = new z();

    /* renamed from: b, reason: collision with root package name */
    public static final SerialDescriptor f52096b = SerialDescriptorsKt.PrimitiveSerialDescriptor("java.time.LocalTime", PrimitiveKind.LONG.INSTANCE);

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        return LocalTime.ofNanoOfDay(decoder.decodeLong());
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f52096b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        encoder.encodeLong(((LocalTime) obj).toNanoOfDay());
    }
}
