package fr;

import java.util.List;
import kotlin.Pair;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.Regex;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialDescriptorsKt;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;

/* loaded from: classes4.dex */
public final class x implements KSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final x f55712a = new x();

    /* renamed from: b, reason: collision with root package name */
    public static final SerialDescriptor f55713b = SerialDescriptorsKt.PrimitiveSerialDescriptor("MarkdownToHtml", PrimitiveKind.STRING.INSTANCE);

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        List list = w.f55711a;
        String string = decoder.decodeString();
        Intrinsics.g(string, "string");
        for (Pair pair : w.f55711a) {
            string = ((Regex) pair.f71683a).g(string, (Function1) pair.f71684b);
        }
        return string;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f55713b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        String value = (String) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeString(value);
    }
}
