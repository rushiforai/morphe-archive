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
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class e implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final e f45555a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        e eVar = new e();
        f45555a = eVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("TimeOfDayDuration", eVar, 3);
        pluginGeneratedSerialDescriptor.addElement("start", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(1));
        pluginGeneratedSerialDescriptor.addElement("durationMinutes", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(2));
        pluginGeneratedSerialDescriptor.addElement("days", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(3));
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{z.f52095a, LongSerializer.INSTANCE, ConditionModel.TimeOfDayDurationModel.f45542e[2]};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        LocalTime localTime;
        long j11;
        List list;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConditionModel.TimeOfDayDurationModel.f45542e;
        LocalTime localTime2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            LocalTime localTime3 = (LocalTime) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, z.f52095a, null);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 1);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            localTime = localTime3;
            i5 = 7;
            j11 = jDecodeLongElement;
        } else {
            long jDecodeLongElement2 = 0;
            boolean z11 = true;
            int i11 = 0;
            List list2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    localTime2 = (LocalTime) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, z.f52095a, localTime2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 1);
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
            localTime = localTime2;
            j11 = jDecodeLongElement2;
            list = list2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConditionModel.TimeOfDayDurationModel(i5, localTime, j11, list);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConditionModel.TimeOfDayDurationModel timeOfDayDurationModel = (ConditionModel.TimeOfDayDurationModel) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConditionModel.TimeOfDayDurationModel.f45542e;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, z.f52095a, timeOfDayDurationModel.f45543b);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 1, timeOfDayDurationModel.f45544c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], timeOfDayDurationModel.f45545d);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
