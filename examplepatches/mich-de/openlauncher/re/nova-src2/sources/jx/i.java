package jx;

import com.teslacoilsw.conditions.ConditionSetId;
import com.teslacoilsw.conditions.ConditionSetRecord;
import java.util.List;
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

/* loaded from: classes.dex */
public final /* synthetic */ class i implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i f70413a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i iVar = new i();
        f70413a = iVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.conditions.ConditionSetRecord", iVar, 2);
        pluginGeneratedSerialDescriptor.addElement("id", false);
        pluginGeneratedSerialDescriptor.addElement("conditionModels", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{g.f70412a, ConditionSetRecord.f45530c[1]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        List list;
        String str;
        int i5;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConditionSetRecord.f45530c;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            ConditionSetId conditionSetId = (ConditionSetId) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, g.f70412a, null);
            str = conditionSetId != null ? conditionSetId.f45529a : null;
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            List list2 = null;
            String str2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    ConditionSetId conditionSetId2 = (ConditionSetId) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, g.f70412a, str2 != null ? new ConditionSetId(str2) : null);
                    str2 = conditionSetId2 != null ? conditionSetId2.f45529a : null;
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], list2);
                    i11 |= 2;
                }
            }
            list = list2;
            str = str2;
            i5 = i11;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConditionSetRecord(i5, str, list);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConditionSetRecord conditionSetRecord = (ConditionSetRecord) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConditionSetRecord.f45530c;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, g.f70412a, new ConditionSetId(conditionSetRecord.f45532a));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], conditionSetRecord.f45533b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
