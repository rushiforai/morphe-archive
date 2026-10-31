package mx;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class h implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final h f77104a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        h hVar = new h();
        f77104a = hVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.CellSpecConfig", hVar, 8);
        pluginGeneratedSerialDescriptor.addElement("rawIconScale", true);
        pluginGeneratedSerialDescriptor.addElement("labelVisible", true);
        pluginGeneratedSerialDescriptor.addElement("labelSizeSp", true);
        pluginGeneratedSerialDescriptor.addElement("unused", true);
        pluginGeneratedSerialDescriptor.addElement("labelShadow", true);
        pluginGeneratedSerialDescriptor.addElement("labelFont", true);
        pluginGeneratedSerialDescriptor.addElement("labelSingleLine", true);
        pluginGeneratedSerialDescriptor.addElement("matchDesktopSize", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        FloatSerializer floatSerializer = FloatSerializer.INSTANCE;
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{floatSerializer, booleanSerializer, floatSerializer, IntSerializer.INSTANCE, booleanSerializer, StringSerializer.INSTANCE, booleanSerializer, booleanSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        float fDecodeFloatElement;
        boolean zDecodeBooleanElement;
        boolean z11;
        String str;
        int i5;
        boolean z12;
        float f11;
        boolean z13;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 0;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            fDecodeFloatElement = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 0);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            float fDecodeFloatElement2 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 2);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            boolean zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
            boolean zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 6);
            i11 = 255;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 7);
            z11 = zDecodeBooleanElement4;
            str = strDecodeStringElement;
            i5 = iDecodeIntElement;
            z12 = zDecodeBooleanElement3;
            f11 = fDecodeFloatElement2;
            z13 = zDecodeBooleanElement2;
        } else {
            fDecodeFloatElement = 0.0f;
            float fDecodeFloatElement3 = 0.0f;
            boolean z14 = true;
            boolean zDecodeBooleanElement5 = false;
            int iDecodeIntElement2 = 0;
            boolean zDecodeBooleanElement6 = false;
            boolean zDecodeBooleanElement7 = false;
            String strDecodeStringElement2 = null;
            boolean zDecodeBooleanElement8 = false;
            while (z14) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z14 = false;
                        break;
                    case 0:
                        i11 |= 1;
                        fDecodeFloatElement = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 0);
                        continue;
                    case 1:
                        zDecodeBooleanElement7 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                        i11 |= 2;
                        continue;
                    case 2:
                        fDecodeFloatElement3 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 2);
                        i11 |= 4;
                        break;
                    case 3:
                        iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                        i11 |= 8;
                        break;
                    case 4:
                        zDecodeBooleanElement6 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                        i11 |= 16;
                        break;
                    case 5:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
                        i11 |= 32;
                        break;
                    case 6:
                        zDecodeBooleanElement5 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 6);
                        i11 |= 64;
                        break;
                    case 7:
                        zDecodeBooleanElement8 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 7);
                        i11 |= 128;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            zDecodeBooleanElement = zDecodeBooleanElement8;
            z11 = zDecodeBooleanElement5;
            str = strDecodeStringElement2;
            i5 = iDecodeIntElement2;
            z12 = zDecodeBooleanElement6;
            f11 = fDecodeFloatElement3;
            z13 = zDecodeBooleanElement7;
        }
        float f12 = fDecodeFloatElement;
        int i12 = i11;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new j(i12, f12, z13, f11, i5, z12, str, z11, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        j jVar = (j) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0) || Float.compare(jVar.f77123a, 1.25f) != 0) {
            compositeEncoderBeginStructure.encodeFloatElement(serialDescriptor, 0, jVar.f77123a);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || !jVar.f77124b) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, jVar.f77124b);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || Float.compare(jVar.f77125c, 13.0f) != 0) {
            compositeEncoderBeginStructure.encodeFloatElement(serialDescriptor, 2, jVar.f77125c);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || jVar.f77126d != 262914) {
            compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, jVar.f77126d);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || jVar.f77127e) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, jVar.f77127e);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || !Intrinsics.b(jVar.f77128f, "sans-serif-condensed")) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 5, jVar.f77128f);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || !jVar.f77129g) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 6, jVar.f77129g);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 7) || jVar.f77130h) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 7, jVar.f77130h);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
