package l10;

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
public final /* synthetic */ class u implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final u f74460a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        u uVar = new u();
        f74460a = uVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.quicksearchbar.QsbConfig", uVar, 4);
        pluginGeneratedSerialDescriptor.addElement("bg", false);
        pluginGeneratedSerialDescriptor.addElement("monochrome", false);
        pluginGeneratedSerialDescriptor.addElement("startActions", false);
        pluginGeneratedSerialDescriptor.addElement("endActions", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = w.f74461e;
        return new KSerializer[]{r.f74452a, BooleanSerializer.INSTANCE, kSerializerArr[2], kSerializerArr[3]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        boolean z11;
        t tVar;
        List list;
        List list2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = w.f74461e;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            t tVar2 = (t) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, r.f74452a, null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            List list3 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            tVar = tVar2;
            i5 = 15;
            list = list3;
            z11 = zDecodeBooleanElement;
        } else {
            boolean z12 = true;
            int i11 = 0;
            t tVar3 = null;
            List list4 = null;
            List list5 = null;
            boolean zDecodeBooleanElement2 = false;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z12 = false;
                } else if (iDecodeElementIndex == 0) {
                    tVar3 = (t) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, r.f74452a, tVar3);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    list4 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], list4);
                    i11 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    list5 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], list5);
                    i11 |= 8;
                }
            }
            i5 = i11;
            z11 = zDecodeBooleanElement2;
            tVar = tVar3;
            list = list4;
            list2 = list5;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new w(i5, tVar, z11, list, list2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        w wVar = (w) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = w.f74461e;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, r.f74452a, wVar.f74464a);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, wVar.f74465b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], wVar.f74466c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], wVar.f74467d);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
