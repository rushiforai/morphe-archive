package v50;

import kotlin.Lazy;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.UnknownFieldException;
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
public final /* synthetic */ class b implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final b f92104a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        b bVar = new b();
        f92104a = bVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("io.ktor.util.date.GMTDate", bVar, 9);
        pluginGeneratedSerialDescriptor.addElement("seconds", false);
        pluginGeneratedSerialDescriptor.addElement("minutes", false);
        pluginGeneratedSerialDescriptor.addElement("hours", false);
        pluginGeneratedSerialDescriptor.addElement("dayOfWeek", false);
        pluginGeneratedSerialDescriptor.addElement("dayOfMonth", false);
        pluginGeneratedSerialDescriptor.addElement("dayOfYear", false);
        pluginGeneratedSerialDescriptor.addElement("month", false);
        pluginGeneratedSerialDescriptor.addElement("year", false);
        pluginGeneratedSerialDescriptor.addElement("timestamp", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        Lazy[] lazyArr = d.f92105j;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{intSerializer, intSerializer, intSerializer, lazyArr[3].getValue(), intSerializer, intSerializer, lazyArr[6].getValue(), intSerializer, LongSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        e eVar;
        f fVar;
        int iDecodeIntElement2;
        int i5;
        int i11;
        int i12;
        int i13;
        int i14;
        long jDecodeLongElement;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        Lazy[] lazyArr = d.f92105j;
        int i15 = 7;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            f fVar2 = (f) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, (DeserializationStrategy) lazyArr[3].getValue(), null);
            int iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            int iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 5);
            eVar = (e) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, (DeserializationStrategy) lazyArr[6].getValue(), null);
            iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 7);
            i5 = iDecodeIntElement6;
            i11 = 511;
            i12 = iDecodeIntElement5;
            i13 = iDecodeIntElement4;
            fVar = fVar2;
            i14 = iDecodeIntElement3;
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 8);
        } else {
            boolean z11 = true;
            iDecodeIntElement = 0;
            int iDecodeIntElement7 = 0;
            int iDecodeIntElement8 = 0;
            int iDecodeIntElement9 = 0;
            e eVar2 = null;
            long jDecodeLongElement2 = 0;
            int iDecodeIntElement10 = 0;
            int iDecodeIntElement11 = 0;
            int i16 = 0;
            f fVar3 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i15 = 7;
                    case 0:
                        i16 |= 1;
                        iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
                        i15 = 7;
                    case 1:
                        iDecodeIntElement9 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                        i16 |= 2;
                        i15 = 7;
                    case 2:
                        iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                        i16 |= 4;
                    case 3:
                        fVar3 = (f) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, (DeserializationStrategy) lazyArr[3].getValue(), fVar3);
                        i16 |= 8;
                    case 4:
                        iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                        i16 |= 16;
                    case 5:
                        iDecodeIntElement11 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 5);
                        i16 |= 32;
                    case 6:
                        eVar2 = (e) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, (DeserializationStrategy) lazyArr[6].getValue(), eVar2);
                        i16 |= 64;
                    case 7:
                        iDecodeIntElement10 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, i15);
                        i16 |= 128;
                    case 8:
                        jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 8);
                        i16 |= 256;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            eVar = eVar2;
            fVar = fVar3;
            iDecodeIntElement2 = iDecodeIntElement10;
            i5 = iDecodeIntElement11;
            i11 = i16;
            i12 = iDecodeIntElement7;
            i13 = iDecodeIntElement8;
            i14 = iDecodeIntElement9;
            jDecodeLongElement = jDecodeLongElement2;
        }
        int i17 = iDecodeIntElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new d(i11, i17, i14, i13, fVar, i12, i5, eVar, iDecodeIntElement2, jDecodeLongElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        d value = (d) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        Lazy[] lazyArr = d.f92105j;
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 0, value.f92106a);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, value.f92107b);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 2, value.f92108c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, (SerializationStrategy) lazyArr[3].getValue(), value.f92109d);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, value.f92110e);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 5, value.f92111f);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, (SerializationStrategy) lazyArr[6].getValue(), value.f92112g);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 7, value.f92113h);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 8, value.f92114i);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
