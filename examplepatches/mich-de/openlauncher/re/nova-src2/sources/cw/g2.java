package cw;

import com.stripe.android.ui.core.elements.DropdownSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.List;
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
public final /* synthetic */ class g2 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g2 f48153a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g2 g2Var = new g2();
        f48153a = g2Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.DropdownSpec", g2Var, 3);
        pluginGeneratedSerialDescriptor.addElement("api_path", false);
        pluginGeneratedSerialDescriptor.addElement("translation_id", false);
        pluginGeneratedSerialDescriptor.addElement("items", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = DropdownSpec.f45305d;
        return new KSerializer[]{kw.y0.f72733a, kSerializerArr[1], kSerializerArr[2]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        IdentifierSpec identifierSpec;
        s4 s4Var;
        List list;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = DropdownSpec.f45305d;
        IdentifierSpec identifierSpec2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            identifierSpec = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, null);
            s4Var = (s4) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            s4 s4Var2 = null;
            List list2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    identifierSpec2 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    s4Var2 = (s4) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], s4Var2);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], list2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            identifierSpec = identifierSpec2;
            s4Var = s4Var2;
            list = list2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new DropdownSpec(i5, identifierSpec, s4Var, list);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        DropdownSpec value = (DropdownSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = DropdownSpec.f45305d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, value.f45306a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], value.f45307b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], value.f45308c);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
