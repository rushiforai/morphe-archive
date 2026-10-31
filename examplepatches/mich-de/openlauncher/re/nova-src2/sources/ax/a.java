package ax;

import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes4.dex */
public final class a implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f15732a = new a();

    /* renamed from: b, reason: collision with root package name */
    public static final SerialDescriptor f15733b = SerialDescriptorsKt.PrimitiveSerialDescriptor("DurationInSeconds", PrimitiveKind.LONG.INSTANCE);

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        Duration.Companion companion = Duration.f72038b;
        return new Duration(DurationKt.h(decoder.decodeLong(), DurationUnit.f72046e));
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f15733b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        long j11 = ((Duration) obj).f72041a;
        Intrinsics.g(encoder, "encoder");
        Duration.Companion companion = Duration.f72038b;
        encoder.encodeLong(Duration.q(j11, DurationUnit.f72046e));
    }
}
