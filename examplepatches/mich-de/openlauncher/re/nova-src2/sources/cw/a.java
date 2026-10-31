package cw;

import com.stripe.android.ui.core.elements.AddressSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
import java.util.Set;
import kotlin.collections.EmptySet;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f48055a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f48055a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.AddressSpec", aVar, 4);
        pluginGeneratedSerialDescriptor.addElement("api_path", true);
        pluginGeneratedSerialDescriptor.addElement("allowed_country_codes", true);
        pluginGeneratedSerialDescriptor.addElement("display_fields", true);
        pluginGeneratedSerialDescriptor.addElement("show_label", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = AddressSpec.f45281g;
        return new KSerializer[]{kw.y0.f72733a, kSerializerArr[1], kSerializerArr[2], BooleanSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        IdentifierSpec identifierSpec;
        Set set;
        Set set2;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = AddressSpec.f45281g;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            IdentifierSpec identifierSpec2 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, null);
            Set set3 = (Set) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            set2 = (Set) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            identifierSpec = identifierSpec2;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
            i5 = 15;
            set = set3;
        } else {
            boolean z11 = true;
            boolean zDecodeBooleanElement2 = false;
            IdentifierSpec identifierSpec3 = null;
            Set set4 = null;
            Set set5 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    identifierSpec3 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec3);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    set4 = (Set) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], set4);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    set5 = (Set) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], set5);
                    i11 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
                    i11 |= 8;
                }
            }
            zDecodeBooleanElement = zDecodeBooleanElement2;
            i5 = i11;
            identifierSpec = identifierSpec3;
            set = set4;
            set2 = set5;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new AddressSpec(i5, identifierSpec, set, set2, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x0035  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        AddressSpec value = (AddressSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        boolean z11 = value.f45285d;
        Set set = value.f45284c;
        Set set2 = value.f45283b;
        IdentifierSpec identifierSpec = value.f45282a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = AddressSpec.f45281g;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec);
        } else {
            IdentifierSpec.Companion.getClass();
            if (!Intrinsics.b(identifierSpec, kw.z0.a("billing_details[address]"))) {
            }
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || !Intrinsics.b(set2, cr.e.f47799a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], set2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || !Intrinsics.b(set, EmptySet.f71734a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], set);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 3, z11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
