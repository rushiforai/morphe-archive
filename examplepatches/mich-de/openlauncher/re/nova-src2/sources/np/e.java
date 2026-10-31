package np;

import java.time.LocalDate;
import java.util.Arrays;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes.dex */
public final class e implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final e f78510a = new e();

    /* renamed from: b, reason: collision with root package name */
    public static final SerialDescriptor f78511b = SerialDescriptorsKt.PrimitiveSerialDescriptor("LocalDate", PrimitiveKind.STRING.INSTANCE);

    public static LocalDate a(String value) {
        Intrinsics.g(value, "value");
        List listH1 = r70.k.h1(value, new char[]{'-'}, 6);
        LocalDate localDateOf = LocalDate.of(Integer.parseInt((String) listH1.get(0)), Integer.parseInt((String) listH1.get(1)), Integer.parseInt((String) listH1.get(2)));
        Intrinsics.f(localDateOf, "of(...)");
        return localDateOf;
    }

    public static String b(LocalDate value) {
        Intrinsics.g(value, "value");
        return String.format("%04d-%02d-%02d", Arrays.copyOf(new Object[]{Integer.valueOf(value.getYear()), Integer.valueOf(value.getMonthValue()), Integer.valueOf(value.getDayOfMonth())}, 3));
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        return a(decoder.decodeString());
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f78511b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        LocalDate value = (LocalDate) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeString(b(value));
    }
}
