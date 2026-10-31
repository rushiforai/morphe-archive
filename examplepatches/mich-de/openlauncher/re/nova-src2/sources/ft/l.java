package ft;

import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.ConsumerSessionSignup;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class l implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final l f55959a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        l lVar = new l();
        f55959a = lVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsumerSessionSignup", lVar, 2);
        pluginGeneratedSerialDescriptor.addElement("consumer_session", false);
        pluginGeneratedSerialDescriptor.addElement("publishable_key", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{f.f55941a, BuiltinSerializersKt.getNullable(StringSerializer.INSTANCE)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        ConsumerSession consumerSession;
        String str;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        ConsumerSession consumerSession2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            consumerSession = (ConsumerSession) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, f.f55941a, null);
            str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String str2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    consumerSession2 = (ConsumerSession) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, f.f55941a, consumerSession2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    str2 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, str2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            consumerSession = consumerSession2;
            str = str2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsumerSessionSignup(i5, consumerSession, str);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsumerSessionSignup value = (ConsumerSessionSignup) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        f fVar = f.f55941a;
        ConsumerSession consumerSession = value.f43351a;
        String str = value.f43352b;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, fVar, consumerSession);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || str != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, str);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
