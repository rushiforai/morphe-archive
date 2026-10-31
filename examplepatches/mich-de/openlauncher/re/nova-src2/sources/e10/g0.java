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
public final /* synthetic */ class g0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f51541a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g0 g0Var = new g0();
        f51541a = g0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.preferences.FolderIconConfig", g0Var, 7);
        pluginGeneratedSerialDescriptor.addElement("_shape", false);
        pluginGeneratedSerialDescriptor.addElement("preview", false);
        pluginGeneratedSerialDescriptor.addElement("_clipToBounds", false);
        pluginGeneratedSerialDescriptor.addElement("_matchWindowColorWhenSetToColorAuto", false);
        pluginGeneratedSerialDescriptor.addElement("unused_oldIconAlpha", true);
        pluginGeneratedSerialDescriptor.addElement("outline", true);
        pluginGeneratedSerialDescriptor.addElement("prioritizeFirstIcon", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer kSerializer = i0.f51582h[1];
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        return new KSerializer[]{fz.d.Companion, kSerializer, booleanSerializer, intSerializer, intSerializer, booleanSerializer, booleanSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        fz.d dVar;
        e2 e2Var;
        boolean z11;
        int i5;
        int i11;
        boolean z12;
        int i12;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = i0.f51582h;
        int i13 = 6;
        int i14 = 5;
        int i15 = 1;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            fz.d dVar2 = (fz.d) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, fz.d.Companion, null);
            e2 e2Var2 = (e2) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            int iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            boolean zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
            e2Var = e2Var2;
            dVar = dVar2;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 6);
            z11 = zDecodeBooleanElement3;
            i5 = iDecodeIntElement;
            i11 = iDecodeIntElement2;
            z12 = zDecodeBooleanElement2;
            i12 = 127;
        } else {
            boolean z13 = true;
            boolean zDecodeBooleanElement4 = false;
            int iDecodeIntElement3 = 0;
            int iDecodeIntElement4 = 0;
            boolean zDecodeBooleanElement5 = false;
            int i16 = 0;
            fz.d dVar3 = null;
            boolean zDecodeBooleanElement6 = false;
            e2 e2Var3 = null;
            while (z13) {
                int i17 = i15;
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z13 = false;
                        i13 = 6;
                        i14 = 5;
                        i15 = 1;
                    case 0:
                        dVar3 = (fz.d) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, fz.d.Companion, dVar3);
                        i16 |= 1;
                        i13 = 6;
                        i14 = 5;
                        i15 = 1;
                    case 1:
                        e2Var3 = (e2) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i17, kSerializerArr[i17], e2Var3);
                        i16 |= 2;
                        i15 = i17;
                        i13 = 6;
                    case 2:
                        zDecodeBooleanElement5 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
                        i16 |= 4;
                        i15 = i17;
                    case 3:
                        iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                        i16 |= 8;
                        i15 = i17;
                    case 4:
                        iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
                        i16 |= 16;
                        i15 = i17;
                    case 5:
                        zDecodeBooleanElement6 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i14);
                        i16 |= 32;
                        i15 = i17;
                    case 6:
                        zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i13);
                        i16 |= 64;
                        i15 = i17;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            zDecodeBooleanElement = zDecodeBooleanElement4;
            dVar = dVar3;
            e2Var = e2Var3;
            z11 = zDecodeBooleanElement6;
            i5 = iDecodeIntElement3;
            i11 = iDecodeIntElement4;
            z12 = zDecodeBooleanElement5;
            i12 = i16;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new i0(i12, dVar, e2Var, z12, i5, i11, z11, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        i0 i0Var = (i0) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = i0.f51582h;
        fz.c cVar = fz.d.Companion;
        fz.d dVar = i0Var.f51585a;
        boolean z11 = i0Var.f51591g;
        boolean z12 = i0Var.f51590f;
        int i5 = i0Var.f51589e;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, cVar, dVar);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], i0Var.f51586b);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 2, i0Var.f51587c);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, i0Var.f51588d);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || i5 != 255) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, i5);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !z12) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 5, z12);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 6, z11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
