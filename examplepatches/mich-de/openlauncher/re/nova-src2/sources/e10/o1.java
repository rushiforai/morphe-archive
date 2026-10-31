package e10;

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
public final /* synthetic */ class o1 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final o1 f51716a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        o1 o1Var = new o1();
        f51716a = o1Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.preferences.PopupMenuStylePersistableConfig", o1Var, 5);
        pluginGeneratedSerialDescriptor.addElement("cardBackground", false);
        pluginGeneratedSerialDescriptor.addElement("burgerLayout", false);
        pluginGeneratedSerialDescriptor.addElement("cornerRadiusDp", false);
        pluginGeneratedSerialDescriptor.addElement("primaryColor", false);
        pluginGeneratedSerialDescriptor.addElement("secondaryColor", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{booleanSerializer, booleanSerializer, intSerializer, intSerializer, intSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int iDecodeIntElement;
        int iDecodeIntElement2;
        int i5;
        boolean z11;
        int i11;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            i5 = iDecodeIntElement3;
            z11 = zDecodeBooleanElement2;
            i11 = 31;
        } else {
            boolean z12 = true;
            zDecodeBooleanElement = false;
            int iDecodeIntElement4 = 0;
            int iDecodeIntElement5 = 0;
            int iDecodeIntElement6 = 0;
            boolean zDecodeBooleanElement3 = false;
            int i12 = 0;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z12 = false;
                } else if (iDecodeElementIndex == 0) {
                    zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
                    i12 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                    i12 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                    i12 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                    i12 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                    i12 |= 16;
                }
            }
            iDecodeIntElement = iDecodeIntElement4;
            iDecodeIntElement2 = iDecodeIntElement5;
            i5 = iDecodeIntElement6;
            z11 = zDecodeBooleanElement3;
            i11 = i12;
        }
        boolean z13 = zDecodeBooleanElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new q1(z13, z11, i11, i5, iDecodeIntElement, iDecodeIntElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        q1 q1Var = (q1) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 0, q1Var.f51763a);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, q1Var.f51764b);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 2, q1Var.f51765c);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, q1Var.f51766d);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, q1Var.f51767e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
