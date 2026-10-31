package mz;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class m implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final m f77357a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        m mVar = new m();
        f77357a = mVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.launcher3.dot.UnreadBadgeStyle", mVar, 5);
        pluginGeneratedSerialDescriptor.addElement("strokeColor", false);
        pluginGeneratedSerialDescriptor.addElement("innerColor", false);
        pluginGeneratedSerialDescriptor.addElement("textColor", false);
        pluginGeneratedSerialDescriptor.addElement("sizeDp", false);
        pluginGeneratedSerialDescriptor.addElement("radiusDp", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{intSerializer, intSerializer, intSerializer, intSerializer, intSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        int iDecodeIntElement2;
        int iDecodeIntElement3;
        int i5;
        int i11;
        int i12;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
            int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            int iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            i5 = iDecodeIntElement5;
            i11 = iDecodeIntElement4;
            i12 = 31;
        } else {
            boolean z11 = true;
            iDecodeIntElement = 0;
            int iDecodeIntElement6 = 0;
            int iDecodeIntElement7 = 0;
            int iDecodeIntElement8 = 0;
            int iDecodeIntElement9 = 0;
            int i13 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 0);
                    i13 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    iDecodeIntElement9 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                    i13 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                    i13 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                    i13 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                    i13 |= 16;
                }
            }
            iDecodeIntElement2 = iDecodeIntElement6;
            iDecodeIntElement3 = iDecodeIntElement7;
            i5 = iDecodeIntElement8;
            i11 = iDecodeIntElement9;
            i12 = i13;
        }
        int i14 = iDecodeIntElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new o(i12, i14, i11, i5, iDecodeIntElement2, iDecodeIntElement3);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        o oVar = (o) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 0, oVar.f77359a);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, oVar.f77360b);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 2, oVar.f77361c);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, oVar.f77362d);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, oVar.f77363e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
