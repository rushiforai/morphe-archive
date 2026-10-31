package ft;

import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.ConsumerSessionRefresh;
import com.stripe.android.model.LinkAuthIntent;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class j implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final j f55948a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        j jVar = new j();
        f55948a = jVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsumerSessionRefresh", jVar, 2);
        pluginGeneratedSerialDescriptor.addElement("consumer_session", false);
        pluginGeneratedSerialDescriptor.addElement("link_auth_intent", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{f.f55941a, BuiltinSerializersKt.getNullable(z.f56078a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        ConsumerSession consumerSession;
        LinkAuthIntent linkAuthIntent;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        ConsumerSession consumerSession2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            consumerSession = (ConsumerSession) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, f.f55941a, null);
            linkAuthIntent = (LinkAuthIntent) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, z.f56078a, null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            LinkAuthIntent linkAuthIntent2 = null;
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
                    linkAuthIntent2 = (LinkAuthIntent) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, z.f56078a, linkAuthIntent2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            consumerSession = consumerSession2;
            linkAuthIntent = linkAuthIntent2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsumerSessionRefresh(i5, consumerSession, linkAuthIntent);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsumerSessionRefresh value = (ConsumerSessionRefresh) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, f.f55941a, value.f43349a);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, z.f56078a, value.f43350b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
