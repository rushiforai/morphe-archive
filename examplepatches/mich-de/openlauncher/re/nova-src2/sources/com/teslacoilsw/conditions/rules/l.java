package com.teslacoilsw.conditions.rules;

import com.teslacoilsw.conditions.rules.ConditionModel;
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
public final /* synthetic */ class l implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final l f45558a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        l lVar = new l();
        f45558a = lVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("WeatherChange", lVar, 2);
        pluginGeneratedSerialDescriptor.addElement("minutesBefore", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(1));
        pluginGeneratedSerialDescriptor.addElement("minutesAfter", false);
        pluginGeneratedSerialDescriptor.pushAnnotation(new h(2));
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{longSerializer, longSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        long jDecodeLongElement;
        long j11;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            long jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 1);
            j11 = jDecodeLongElement2;
            i5 = 3;
        } else {
            long jDecodeLongElement3 = 0;
            boolean z11 = true;
            int i11 = 0;
            long jDecodeLongElement4 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 1);
                    i11 |= 2;
                }
            }
            i5 = i11;
            jDecodeLongElement = jDecodeLongElement3;
            j11 = jDecodeLongElement4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConditionModel.WeatherChangeModel(i5, j11, jDecodeLongElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConditionModel.WeatherChangeModel weatherChangeModel = (ConditionModel.WeatherChangeModel) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 0, weatherChangeModel.f45550b);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 1, weatherChangeModel.f45551c);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
