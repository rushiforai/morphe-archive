package cw;

import com.stripe.android.ui.core.elements.SimpleTextSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;
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

/* loaded from: classes4.dex */
public final /* synthetic */ class m4 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final m4 f48217a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        m4 m4Var = new m4();
        f48217a = m4Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.SimpleTextSpec", m4Var, 5);
        pluginGeneratedSerialDescriptor.addElement("api_path", false);
        pluginGeneratedSerialDescriptor.addElement("label", false);
        pluginGeneratedSerialDescriptor.addElement("capitalization", true);
        pluginGeneratedSerialDescriptor.addElement("keyboard_type", true);
        pluginGeneratedSerialDescriptor.addElement("show_optional_label", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = SimpleTextSpec.f45340f;
        return new KSerializer[]{kw.y0.f72733a, IntSerializer.INSTANCE, kSerializerArr[2], kSerializerArr[3], BooleanSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        int i11;
        IdentifierSpec identifierSpec;
        i0 i0Var;
        a3 a3Var;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SimpleTextSpec.f45340f;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            IdentifierSpec identifierSpec2 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, null);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            i0 i0Var2 = (i0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            a3Var = (a3) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            identifierSpec = identifierSpec2;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            i5 = 31;
            i0Var = i0Var2;
            i11 = iDecodeIntElement;
        } else {
            boolean z11 = true;
            boolean zDecodeBooleanElement2 = false;
            int iDecodeIntElement2 = 0;
            IdentifierSpec identifierSpec3 = null;
            i0 i0Var3 = null;
            a3 a3Var2 = null;
            int i12 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    identifierSpec3 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec3);
                    i12 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                    i12 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    i0Var3 = (i0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], i0Var3);
                    i12 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    a3Var2 = (a3) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], a3Var2);
                    i12 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                    i12 |= 16;
                }
            }
            zDecodeBooleanElement = zDecodeBooleanElement2;
            i5 = i12;
            i11 = iDecodeIntElement2;
            identifierSpec = identifierSpec3;
            i0Var = i0Var3;
            a3Var = a3Var2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new SimpleTextSpec(i5, identifierSpec, i11, i0Var, a3Var, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        SimpleTextSpec value = (SimpleTextSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = SimpleTextSpec.f45340f;
        kw.y0 y0Var = kw.y0.f72733a;
        IdentifierSpec identifierSpec = value.f45341a;
        boolean z11 = value.f45345e;
        a3 a3Var = value.f45344d;
        i0 i0Var = value.f45343c;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, y0Var, identifierSpec);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, value.f45342b);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || i0Var != i0.f48165b) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], i0Var);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || a3Var != a3.f48067c) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], a3Var);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, z11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
