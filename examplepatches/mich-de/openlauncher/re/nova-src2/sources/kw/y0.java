package kw;

import com.stripe.android.uicore.elements.IdentifierSpec;
import com.stripe.android.uicore.elements.ParameterDestination;
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
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class y0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final y0 f72733a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        y0 y0Var = new y0();
        f72733a = y0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.uicore.elements.IdentifierSpec", y0Var, 3);
        pluginGeneratedSerialDescriptor.addElement(com.moloco.sdk.internal.services.init.i.f38066a, false);
        pluginGeneratedSerialDescriptor.addElement("ignoreField", true);
        pluginGeneratedSerialDescriptor.addElement("destination", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{StringSerializer.INSTANCE, BooleanSerializer.INSTANCE, IdentifierSpec.f45363d[2]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        boolean zDecodeBooleanElement;
        String strDecodeStringElement;
        ParameterDestination parameterDestination;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = IdentifierSpec.f45363d;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            parameterDestination = (ParameterDestination) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement2 = null;
            ParameterDestination parameterDestination2 = null;
            boolean zDecodeBooleanElement2 = false;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    parameterDestination2 = (ParameterDestination) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], parameterDestination2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            zDecodeBooleanElement = zDecodeBooleanElement2;
            strDecodeStringElement = strDecodeStringElement2;
            parameterDestination = parameterDestination2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new IdentifierSpec(i5, strDecodeStringElement, zDecodeBooleanElement, parameterDestination);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        IdentifierSpec value = (IdentifierSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = IdentifierSpec.f45363d;
        String str = value.f45384a;
        ParameterDestination parameterDestination = value.f45386c;
        boolean z11 = value.f45385b;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, z11);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || parameterDestination != ParameterDestination.Api.f45387a) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], parameterDestination);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
