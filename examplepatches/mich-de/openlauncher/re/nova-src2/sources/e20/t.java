package e20;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class t implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final t f52086a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        t tVar = new t();
        f52086a = tVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.zero.events.Dismiss", tVar, 2);
        pluginGeneratedSerialDescriptor.addElement("timeStamp", false);
        pluginGeneratedSerialDescriptor.addElement("cardId", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{LongSerializer.INSTANCE, f.f52020a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        long jDecodeLongElement;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
            h hVar = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, f.f52020a, null);
            str = hVar != null ? hVar.f52026a : null;
            i5 = 3;
        } else {
            boolean z11 = true;
            i5 = 0;
            long jDecodeLongElement2 = 0;
            String str2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                    i5 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    h hVar2 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, f.f52020a, str2 != null ? new h(str2) : null);
                    str2 = hVar2 != null ? hVar2.f52026a : null;
                    i5 |= 2;
                }
            }
            str = str2;
            jDecodeLongElement = jDecodeLongElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new v(i5, jDecodeLongElement, str);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        v vVar = (v) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 0, vVar.f52087a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, f.f52020a, new h(vVar.f52088b));
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
