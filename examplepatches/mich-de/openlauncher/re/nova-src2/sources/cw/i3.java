package cw;

import com.stripe.android.ui.core.elements.MandateTextSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import kotlin.jvm.internal.Intrinsics;
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

/* loaded from: classes4.dex */
public final /* synthetic */ class i3 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i3 f48170a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i3 i3Var = new i3();
        f48170a = i3Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.MandateTextSpec", i3Var, 2);
        pluginGeneratedSerialDescriptor.addElement("api_path", true);
        pluginGeneratedSerialDescriptor.addElement("stringResId", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{kw.y0.f72733a, IntSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int iDecodeIntElement;
        int i5;
        IdentifierSpec identifierSpec;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            identifierSpec = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, null);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            i5 = 3;
        } else {
            boolean z11 = true;
            int iDecodeIntElement2 = 0;
            IdentifierSpec identifierSpec2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    identifierSpec2 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec2);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                    i11 |= 2;
                }
            }
            iDecodeIntElement = iDecodeIntElement2;
            i5 = i11;
            identifierSpec = identifierSpec2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new MandateTextSpec(i5, identifierSpec, iDecodeIntElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x002f  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        MandateTextSpec value = (MandateTextSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        IdentifierSpec identifierSpec = value.f45320a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        j3 j3Var = MandateTextSpec.Companion;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec);
        } else {
            IdentifierSpec.Companion.getClass();
            if (!Intrinsics.b(identifierSpec, kw.z0.a("mandate"))) {
            }
        }
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, value.f45321b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
