package cw;

import com.stripe.android.ui.core.elements.NameSpec;
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
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class l3 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final l3 f48208a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        l3 l3Var = new l3();
        f48208a = l3Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.NameSpec", l3Var, 2);
        pluginGeneratedSerialDescriptor.addElement("api_path", true);
        pluginGeneratedSerialDescriptor.addElement("translation_id", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{kw.y0.f72733a, NameSpec.f45322d[1]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        IdentifierSpec identifierSpec;
        s4 s4Var;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = NameSpec.f45322d;
        IdentifierSpec identifierSpec2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            identifierSpec = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, null);
            s4Var = (s4) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            s4 s4Var2 = null;
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
                    s4Var2 = (s4) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], s4Var2);
                    i11 |= 2;
                }
            }
            i5 = i11;
            identifierSpec = identifierSpec2;
            s4Var = s4Var2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new NameSpec(i5, identifierSpec, s4Var);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x002d  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        NameSpec value = (NameSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        s4 s4Var = value.f45324b;
        IdentifierSpec identifierSpec = value.f45323a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = NameSpec.f45322d;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec);
        } else {
            IdentifierSpec.Companion.getClass();
            if (!Intrinsics.b(identifierSpec, IdentifierSpec.f45364e)) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || s4Var != s4.f48301c) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], s4Var);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
