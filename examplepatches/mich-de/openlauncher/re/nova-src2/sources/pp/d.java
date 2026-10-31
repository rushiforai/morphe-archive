package pp;

import java.util.List;
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
public final /* synthetic */ class d implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d f82703a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d dVar = new d();
        f82703a = dVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("CardUpdateEvent", dVar, 7);
        pluginGeneratedSerialDescriptor.addElement("cardType", false);
        pluginGeneratedSerialDescriptor.addElement("isNewCard", false);
        pluginGeneratedSerialDescriptor.addElement("suggestionsEnabled", false);
        pluginGeneratedSerialDescriptor.addElement("hasFeaturedAction", false);
        pluginGeneratedSerialDescriptor.addElement("regularActions", false);
        pluginGeneratedSerialDescriptor.addElement("showInDrawerEnabled", false);
        pluginGeneratedSerialDescriptor.addElement("conditionsTypes", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = h.f82744i;
        KSerializer kSerializer = kSerializerArr[0];
        KSerializer kSerializer2 = kSerializerArr[6];
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{kSerializer, booleanSerializer, booleanSerializer, booleanSerializer, IntSerializer.INSTANCE, booleanSerializer, kSerializer2};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean z11;
        e eVar;
        List list;
        boolean z12;
        int i5;
        boolean z13;
        int i11;
        boolean z14;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = h.f82744i;
        int i12 = 5;
        int i13 = 3;
        int i14 = 4;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            e eVar2 = (e) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
            boolean zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 4);
            boolean zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], null);
            eVar = eVar2;
            z11 = zDecodeBooleanElement4;
            z12 = zDecodeBooleanElement3;
            i5 = iDecodeIntElement;
            z13 = zDecodeBooleanElement2;
            i11 = 127;
            z14 = zDecodeBooleanElement;
        } else {
            boolean z15 = true;
            boolean zDecodeBooleanElement5 = false;
            int iDecodeIntElement2 = 0;
            boolean zDecodeBooleanElement6 = false;
            int i15 = 0;
            boolean zDecodeBooleanElement7 = false;
            e eVar3 = null;
            boolean zDecodeBooleanElement8 = false;
            List list2 = null;
            while (z15) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z15 = false;
                        i13 = 3;
                        i14 = 4;
                    case 0:
                        eVar3 = (e) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], eVar3);
                        i15 |= 1;
                        i12 = 5;
                        i13 = 3;
                        i14 = 4;
                    case 1:
                        zDecodeBooleanElement7 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                        i15 |= 2;
                    case 2:
                        zDecodeBooleanElement6 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
                        i15 |= 4;
                    case 3:
                        zDecodeBooleanElement8 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i13);
                        i15 |= 8;
                    case 4:
                        iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, i14);
                        i15 |= 16;
                    case 5:
                        zDecodeBooleanElement5 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i12);
                        i15 |= 32;
                    case 6:
                        list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], list2);
                        i15 |= 64;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            z11 = zDecodeBooleanElement5;
            eVar = eVar3;
            list = list2;
            z12 = zDecodeBooleanElement8;
            i5 = iDecodeIntElement2;
            z13 = zDecodeBooleanElement6;
            i11 = i15;
            z14 = zDecodeBooleanElement7;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new h(i11, eVar, z14, z13, z12, i5, z11, list);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        h value = (h) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = h.f82744i;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], value.f82745b);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, value.f82746c);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 2, value.f82747d);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 3, value.f82748e);
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 4, value.f82749f);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 5, value.f82750g);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], value.f82751h);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
