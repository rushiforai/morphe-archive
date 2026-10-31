package sy;

import fz.l;
import fz.p;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f87825a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f87825a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.dock.DockBackground", aVar, 4);
        pluginGeneratedSerialDescriptor.addElement("enabled", false);
        pluginGeneratedSerialDescriptor.addElement("cornerConfig", false);
        pluginGeneratedSerialDescriptor.addElement("horizontalPaddingDp", false);
        pluginGeneratedSerialDescriptor.addElement("drawUnderNavBar", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{booleanSerializer, l.f56295a, IntSerializer.INSTANCE, booleanSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        boolean zDecodeBooleanElement2;
        int i5;
        int i11;
        p pVar;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
            p pVar2 = (p) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, l.f56295a, null);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
            i5 = iDecodeIntElement;
            pVar = pVar2;
            i11 = 15;
        } else {
            boolean z11 = true;
            zDecodeBooleanElement = false;
            int iDecodeIntElement2 = 0;
            int i12 = 0;
            p pVar3 = null;
            boolean zDecodeBooleanElement3 = false;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
                    i12 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    pVar3 = (p) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, l.f56295a, pVar3);
                    i12 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                    i12 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
                    i12 |= 8;
                }
            }
            zDecodeBooleanElement2 = zDecodeBooleanElement3;
            i5 = iDecodeIntElement2;
            i11 = i12;
            pVar = pVar3;
        }
        boolean z12 = zDecodeBooleanElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new c(i11, z12, pVar, i5, zDecodeBooleanElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        c cVar = (c) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 0, cVar.f87828c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, l.f56295a, cVar.f87829d);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 2, cVar.f87830e);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 3, cVar.f87831f);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
