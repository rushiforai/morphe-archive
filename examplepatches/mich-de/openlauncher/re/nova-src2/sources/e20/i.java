package e20;

import java.util.List;
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

/* loaded from: classes.dex */
public final /* synthetic */ class i implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i f52030a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i iVar = new i();
        f52030a = iVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.zero.events.CardRecord", iVar, 4);
        pluginGeneratedSerialDescriptor.addElement("conditionIds", false);
        pluginGeneratedSerialDescriptor.addElement("cardId", false);
        pluginGeneratedSerialDescriptor.addElement("card", false);
        pluginGeneratedSerialDescriptor.addElement("conditionsEnabled", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = k.f52038e;
        return new KSerializer[]{kSerializerArr[0], f.f52020a, kSerializerArr[2], BooleanSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        u10.e0 e0Var;
        List list;
        boolean zDecodeBooleanElement;
        int i5;
        String str;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = k.f52038e;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            List list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            h hVar = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, f.f52020a, null);
            String str2 = hVar != null ? hVar.f52026a : null;
            e0Var = (u10.e0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            list = list2;
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
            i5 = 15;
            str = str2;
        } else {
            boolean z11 = true;
            boolean zDecodeBooleanElement2 = false;
            int i11 = 0;
            u10.e0 e0Var2 = null;
            List list3 = null;
            String str3 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], list3);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    h hVar2 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, f.f52020a, str3 != null ? new h(str3) : null);
                    str3 = hVar2 != null ? hVar2.f52026a : null;
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    e0Var2 = (u10.e0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], e0Var2);
                    i11 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 3);
                    i11 |= 8;
                }
            }
            e0Var = e0Var2;
            list = list3;
            zDecodeBooleanElement = zDecodeBooleanElement2;
            i5 = i11;
            str = str3;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new k(i5, list, str, e0Var, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        k kVar = (k) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = k.f52038e;
        KSerializer kSerializer = kSerializerArr[0];
        List list = kVar.f52039a;
        boolean z11 = kVar.f52042d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializer, list);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, f.f52020a, new h(kVar.f52040b));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], kVar.f52041c);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || !z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 3, z11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
