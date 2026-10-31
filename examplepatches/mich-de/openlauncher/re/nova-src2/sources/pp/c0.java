package pp;

import kotlin.Pair;
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
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class c0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final c0 f82702a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        c0 c0Var = new c0();
        f82702a = c0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("SearchEvent", c0Var, 6);
        pluginGeneratedSerialDescriptor.addElement("openMethod", false);
        pluginGeneratedSerialDescriptor.addElement("resultClicked", true);
        pluginGeneratedSerialDescriptor.addElement("displayedResults", false);
        pluginGeneratedSerialDescriptor.addElement("queryLength", false);
        pluginGeneratedSerialDescriptor.addElement("duration", false);
        pluginGeneratedSerialDescriptor.addElement("time", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = e0.f82715h;
        KSerializer kSerializer = kSerializerArr[0];
        KSerializer nullable = BuiltinSerializersKt.getNullable(kSerializerArr[1]);
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{kSerializer, nullable, i.f82752a, IntSerializer.INSTANCE, longSerializer, longSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        int iDecodeIntElement;
        long jDecodeLongElement;
        f0 f0Var;
        Pair pair;
        k kVar;
        long jDecodeLongElement2;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = e0.f82715h;
        int i11 = 5;
        int i12 = 0;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            f0 f0Var2 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            Pair pair2 = (Pair) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            k kVar2 = (k) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, i.f82752a, null);
            pair = pair2;
            f0Var = f0Var2;
            i5 = 63;
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            kVar = kVar2;
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
            jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 5);
        } else {
            long jDecodeLongElement3 = 0;
            int i13 = 1;
            int i14 = 0;
            f0 f0Var3 = null;
            Pair pair3 = null;
            k kVar3 = null;
            long jDecodeLongElement4 = 0;
            int iDecodeIntElement2 = 0;
            while (i13 != 0) {
                int i15 = i12;
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        i12 = i15;
                        i13 = i12;
                        i11 = 5;
                    case 0:
                        f0Var3 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i15, kSerializerArr[i15], f0Var3);
                        i14 |= 1;
                        i12 = i15;
                        i11 = 5;
                    case 1:
                        pair3 = (Pair) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, kSerializerArr[1], pair3);
                        i14 |= 2;
                        i12 = i15;
                    case 2:
                        kVar3 = (k) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, i.f82752a, kVar3);
                        i14 |= 4;
                        i12 = i15;
                    case 3:
                        iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                        i14 |= 8;
                        i12 = i15;
                    case 4:
                        jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
                        i14 |= 16;
                        i12 = i15;
                    case 5:
                        jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, i11);
                        i14 |= 32;
                        i12 = i15;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i14;
            iDecodeIntElement = iDecodeIntElement2;
            jDecodeLongElement = jDecodeLongElement3;
            f0Var = f0Var3;
            pair = pair3;
            kVar = kVar3;
            jDecodeLongElement2 = jDecodeLongElement4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new e0(i5, f0Var, pair, kVar, iDecodeIntElement, jDecodeLongElement, jDecodeLongElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        e0 value = (e0) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = e0.f82715h;
        KSerializer kSerializer = kSerializerArr[0];
        f0 f0Var = value.f82716b;
        Pair pair = value.f82717c;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializer, f0Var);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || pair != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, kSerializerArr[1], pair);
        }
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, i.f82752a, value.f82718d);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, value.f82719e);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 4, value.f82720f);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 5, value.f82721g);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
