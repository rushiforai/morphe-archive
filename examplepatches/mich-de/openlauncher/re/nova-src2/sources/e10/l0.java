package e10;

import com.amplitude.eventbridge.EventBridgeChannel;
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
public final /* synthetic */ class l0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final l0 f51633a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        l0 l0Var = new l0();
        f51633a = l0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.preferences.FolderWindowConfig", l0Var, 12);
        pluginGeneratedSerialDescriptor.addElement("style", false);
        pluginGeneratedSerialDescriptor.addElement("rawBackgroundAlpha", false);
        pluginGeneratedSerialDescriptor.addElement("rawBackgroundColor", false);
        pluginGeneratedSerialDescriptor.addElement("cornerRadiusDp", false);
        pluginGeneratedSerialDescriptor.addElement("rawCardBackground", false);
        pluginGeneratedSerialDescriptor.addElement("showFolderName", false);
        pluginGeneratedSerialDescriptor.addElement("rows", false);
        pluginGeneratedSerialDescriptor.addElement("cols", false);
        pluginGeneratedSerialDescriptor.addElement("scrollDirection", false);
        pluginGeneratedSerialDescriptor.addElement("rawShadow", true);
        pluginGeneratedSerialDescriptor.addElement("pinToBottom", true);
        pluginGeneratedSerialDescriptor.addElement("ignoreNightMode", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = n0.f51676m;
        KSerializer kSerializer = kSerializerArr[0];
        KSerializer kSerializer2 = kSerializerArr[8];
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{kSerializer, intSerializer, intSerializer, intSerializer, booleanSerializer, booleanSerializer, intSerializer, intSerializer, kSerializer2, booleanSerializer, booleanSerializer, booleanSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        p0 p0Var;
        int i5;
        k0 k0Var;
        boolean zDecodeBooleanElement;
        boolean zDecodeBooleanElement2;
        boolean zDecodeBooleanElement3;
        int i11;
        int i12;
        boolean z11;
        int i13;
        boolean z12;
        int i14;
        int i15;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = n0.f51676m;
        int i16 = 10;
        p0 p0Var2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            p0 p0Var3 = (p0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            int iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            boolean zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            boolean zDecodeBooleanElement5 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
            int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 6);
            int iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 7);
            k0 k0Var2 = (k0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], null);
            k0Var = k0Var2;
            p0Var = p0Var3;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 9);
            zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 10);
            zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 11);
            i11 = iDecodeIntElement5;
            i12 = iDecodeIntElement4;
            z11 = zDecodeBooleanElement5;
            i13 = iDecodeIntElement3;
            z12 = zDecodeBooleanElement4;
            i14 = iDecodeIntElement2;
            i5 = 4095;
            i15 = iDecodeIntElement;
        } else {
            int i17 = 11;
            boolean z13 = true;
            int i18 = 0;
            boolean zDecodeBooleanElement6 = false;
            boolean zDecodeBooleanElement7 = false;
            boolean zDecodeBooleanElement8 = false;
            int iDecodeIntElement6 = 0;
            int iDecodeIntElement7 = 0;
            boolean zDecodeBooleanElement9 = false;
            int iDecodeIntElement8 = 0;
            boolean zDecodeBooleanElement10 = false;
            int iDecodeIntElement9 = 0;
            int iDecodeIntElement10 = 0;
            k0 k0Var3 = null;
            while (z13) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z13 = false;
                        i16 = 10;
                    case 0:
                        p0Var2 = (p0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], p0Var2);
                        i18 |= 1;
                        i17 = 11;
                        i16 = 10;
                    case 1:
                        iDecodeIntElement10 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                        i18 |= 2;
                        i17 = 11;
                    case 2:
                        iDecodeIntElement9 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                        i18 |= 4;
                    case 3:
                        iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                        i18 |= 8;
                    case 4:
                        zDecodeBooleanElement10 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                        i18 |= 16;
                    case 5:
                        zDecodeBooleanElement9 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
                        i18 |= 32;
                    case 6:
                        iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 6);
                        i18 |= 64;
                    case 7:
                        iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 7);
                        i18 |= 128;
                    case 8:
                        k0Var3 = (k0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], k0Var3);
                        i18 |= 256;
                    case 9:
                        zDecodeBooleanElement6 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 9);
                        i18 |= EventBridgeChannel.QUEUE_CAPACITY;
                    case 10:
                        zDecodeBooleanElement7 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i16);
                        i18 |= 1024;
                    case 11:
                        zDecodeBooleanElement8 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i17);
                        i18 |= 2048;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            p0Var = p0Var2;
            i5 = i18;
            k0Var = k0Var3;
            zDecodeBooleanElement = zDecodeBooleanElement6;
            zDecodeBooleanElement2 = zDecodeBooleanElement7;
            zDecodeBooleanElement3 = zDecodeBooleanElement8;
            i11 = iDecodeIntElement6;
            i12 = iDecodeIntElement7;
            z11 = zDecodeBooleanElement9;
            i13 = iDecodeIntElement8;
            z12 = zDecodeBooleanElement10;
            i14 = iDecodeIntElement9;
            i15 = iDecodeIntElement10;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new n0(i5, p0Var, i15, i14, i13, z12, z11, i12, i11, k0Var, zDecodeBooleanElement, zDecodeBooleanElement2, zDecodeBooleanElement3);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        n0 n0Var = (n0) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = n0.f51676m;
        KSerializer kSerializer = kSerializerArr[0];
        p0 p0Var = n0Var.f51677a;
        boolean z11 = n0Var.f51687k;
        boolean z12 = n0Var.f51686j;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializer, p0Var);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, n0Var.f51678b);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 2, n0Var.f51679c);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, n0Var.f51680d);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, n0Var.f51681e);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 5, n0Var.f51682f);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 6, n0Var.f51683g);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 7, n0Var.f51684h);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], n0Var.f51685i);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || !z12) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 9, z12);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 10) || z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 10, z11);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 11) || !n0Var.f51688l) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 11, n0Var.f51688l);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
