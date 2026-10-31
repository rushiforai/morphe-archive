package com.teslacoilsw.conditions.rules;

import com.teslacoilsw.conditions.rules.ConditionModel;
import e20.z;
import java.time.LocalTime;
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
    public static final i f45557a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i iVar = new i();
        f45557a = iVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("TimeOfDayHourRange", iVar, 3);
        pluginGeneratedSerialDescriptor.addElement("start", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(1));
        pluginGeneratedSerialDescriptor.addElement("end", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(2));
        pluginGeneratedSerialDescriptor.addElement("days", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(3));
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer kSerializer = ConditionModel.TimeOfDayHourRangeModel.f45546e[2];
        z zVar = z.f52095a;
        return new KSerializer[]{zVar, zVar, kSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        LocalTime localTime;
        LocalTime localTime2;
        List list;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConditionModel.TimeOfDayHourRangeModel.f45546e;
        LocalTime localTime3 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            z zVar = z.f52095a;
            localTime = (LocalTime) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, zVar, null);
            localTime2 = (LocalTime) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, zVar, null);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            LocalTime localTime4 = null;
            List list2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    localTime3 = (LocalTime) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, z.f52095a, localTime3);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    localTime4 = (LocalTime) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, z.f52095a, localTime4);
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
            localTime = localTime3;
            localTime2 = localTime4;
            list = list2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConditionModel.TimeOfDayHourRangeModel(i5, localTime, localTime2, list);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConditionModel.TimeOfDayHourRangeModel timeOfDayHourRangeModel = (ConditionModel.TimeOfDayHourRangeModel) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConditionModel.TimeOfDayHourRangeModel.f45546e;
        z zVar = z.f52095a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, zVar, timeOfDayHourRangeModel.f45547b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, zVar, timeOfDayHourRangeModel.f45548c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], timeOfDayHourRangeModel.f45549d);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
