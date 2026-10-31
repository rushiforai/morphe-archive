package a40;

import java.util.List;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
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
public final /* synthetic */ class u implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final u f239a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        u uVar = new u();
        f239a = uVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.weather.AccuWeatherMinutecast", uVar, 3);
        pluginGeneratedSerialDescriptor.addElement("Summary", false);
        pluginGeneratedSerialDescriptor.addElement("Summaries", false);
        pluginGeneratedSerialDescriptor.addElement("MobileLink", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{a0.f188a, w.f240d[1], StringSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        c0 c0Var;
        List list;
        String strDecodeStringElement;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = w.f240d;
        c0 c0Var2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            c0Var = (c0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, a0.f188a, null);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            List list2 = null;
            String strDecodeStringElement2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    c0Var2 = (c0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, a0.f188a, c0Var2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], list2);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            c0Var = c0Var2;
            list = list2;
            strDecodeStringElement = strDecodeStringElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new w(i5, c0Var, list, strDecodeStringElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        w wVar = (w) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = w.f240d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, a0.f188a, wVar.f242a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], wVar.f243b);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, wVar.f244c);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
