package o50;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes4.dex */
public final class g0 implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f79570a = new g0();

    /* renamed from: b, reason: collision with root package name */
    public static final SerialDescriptor f79571b = SerialDescriptorsKt.PrimitiveSerialDescriptor("io.ktor.http.Url", PrimitiveKind.STRING.INSTANCE);

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        return ab.e0.i(decoder.decodeString());
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f79571b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        f0 value = (f0) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeString(value.f79561f);
    }
}
