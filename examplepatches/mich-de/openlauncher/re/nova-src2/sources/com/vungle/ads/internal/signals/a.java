package com.vungle.ads.internal.signals;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.bykv.vk.openvk.preload.falconx.statistic.StatisticData;
import com.vungle.ads.internal.model.q3;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.ArrayListSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;

/* loaded from: classes4.dex */
public final class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f47483a;

    /* renamed from: b, reason: collision with root package name */
    public static final /* synthetic */ PluginGeneratedSerialDescriptor f47484b;

    static {
        a aVar = new a();
        f47483a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.vungle.ads.internal.signals.SessionData", aVar, 12);
        pluginGeneratedSerialDescriptor.addElement("103", false);
        pluginGeneratedSerialDescriptor.addElement(StatisticData.ERROR_CODE_IO_ERROR, true);
        pluginGeneratedSerialDescriptor.addElement(StatisticData.ERROR_CODE_NOT_FOUND, true);
        pluginGeneratedSerialDescriptor.addElement("106", true);
        pluginGeneratedSerialDescriptor.addElement("102", true);
        pluginGeneratedSerialDescriptor.addElement("104", true);
        pluginGeneratedSerialDescriptor.addElement("105", true);
        pluginGeneratedSerialDescriptor.addElement("112", true);
        pluginGeneratedSerialDescriptor.addElement("113", true);
        pluginGeneratedSerialDescriptor.addElement("114", true);
        pluginGeneratedSerialDescriptor.addElement("115", true);
        pluginGeneratedSerialDescriptor.addElement("116", true);
        f47484b = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        ArrayListSerializer arrayListSerializer = new ArrayListSerializer(k.f47514a);
        ArrayListSerializer arrayListSerializer2 = new ArrayListSerializer(q3.f47133a);
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{intSerializer, StringSerializer.INSTANCE, longSerializer, arrayListSerializer, longSerializer, intSerializer, arrayListSerializer2, intSerializer, intSerializer, intSerializer, intSerializer, intSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        Object objDecodeSerializableElement;
        Object objDecodeSerializableElement2;
        int iDecodeIntElement;
        int i11;
        int i12;
        int i13;
        int i14;
        int iDecodeIntElement2;
        long j11;
        String str;
        long j12;
        Intrinsics.g(decoder, "decoder");
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = f47484b;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(pluginGeneratedSerialDescriptor);
        int i15 = 0;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 0);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 1);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(pluginGeneratedSerialDescriptor, 2);
            objDecodeSerializableElement = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 3, new ArrayListSerializer(k.f47514a), null);
            long jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(pluginGeneratedSerialDescriptor, 4);
            int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 5);
            objDecodeSerializableElement2 = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 6, new ArrayListSerializer(q3.f47133a), null);
            int iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 7);
            int iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 8);
            int iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 9);
            i15 = 4095;
            i5 = iDecodeIntElement3;
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 10);
            i11 = iDecodeIntElement7;
            i12 = iDecodeIntElement5;
            i13 = iDecodeIntElement6;
            i14 = iDecodeIntElement4;
            iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 11);
            j11 = jDecodeLongElement2;
            str = strDecodeStringElement;
            j12 = jDecodeLongElement;
        } else {
            int i16 = 11;
            boolean z11 = true;
            int iDecodeIntElement8 = 0;
            int iDecodeIntElement9 = 0;
            int iDecodeIntElement10 = 0;
            int iDecodeIntElement11 = 0;
            Object objDecodeSerializableElement3 = null;
            Object objDecodeSerializableElement4 = null;
            String strDecodeStringElement2 = null;
            long jDecodeLongElement3 = 0;
            long jDecodeLongElement4 = 0;
            int iDecodeIntElement12 = 0;
            int iDecodeIntElement13 = 0;
            int iDecodeIntElement14 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(pluginGeneratedSerialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i16 = 11;
                    case 0:
                        i15 |= 1;
                        iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 0);
                        i16 = 11;
                    case 1:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(pluginGeneratedSerialDescriptor, 1);
                        i15 |= 2;
                        i16 = 11;
                    case 2:
                        jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(pluginGeneratedSerialDescriptor, 2);
                        i15 |= 4;
                        i16 = 11;
                    case 3:
                        objDecodeSerializableElement3 = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 3, new ArrayListSerializer(k.f47514a), objDecodeSerializableElement3);
                        i15 |= 8;
                        i16 = 11;
                    case 4:
                        jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(pluginGeneratedSerialDescriptor, 4);
                        i15 |= 16;
                        i16 = 11;
                    case 5:
                        iDecodeIntElement10 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 5);
                        i15 |= 32;
                        i16 = 11;
                    case 6:
                        objDecodeSerializableElement4 = compositeDecoderBeginStructure.decodeSerializableElement(pluginGeneratedSerialDescriptor, 6, new ArrayListSerializer(q3.f47133a), objDecodeSerializableElement4);
                        i15 |= 64;
                        i16 = 11;
                    case 7:
                        iDecodeIntElement14 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 7);
                        i15 |= 128;
                    case 8:
                        iDecodeIntElement9 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 8);
                        i15 |= 256;
                    case 9:
                        iDecodeIntElement13 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 9);
                        i15 |= EventBridgeChannel.QUEUE_CAPACITY;
                    case 10:
                        iDecodeIntElement12 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, 10);
                        i15 |= 1024;
                    case 11:
                        iDecodeIntElement11 = compositeDecoderBeginStructure.decodeIntElement(pluginGeneratedSerialDescriptor, i16);
                        i15 |= 2048;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = iDecodeIntElement8;
            objDecodeSerializableElement = objDecodeSerializableElement3;
            objDecodeSerializableElement2 = objDecodeSerializableElement4;
            iDecodeIntElement = iDecodeIntElement12;
            i11 = iDecodeIntElement13;
            i12 = iDecodeIntElement14;
            i13 = iDecodeIntElement9;
            i14 = iDecodeIntElement10;
            iDecodeIntElement2 = iDecodeIntElement11;
            j11 = jDecodeLongElement3;
            str = strDecodeStringElement2;
            j12 = jDecodeLongElement4;
        }
        int i17 = i15;
        compositeDecoderBeginStructure.endStructure(pluginGeneratedSerialDescriptor);
        return new c(i17, i5, str, j12, (List) objDecodeSerializableElement, j11, i14, (List) objDecodeSerializableElement2, i12, i13, i11, iDecodeIntElement, iDecodeIntElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return f47484b;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        c value = (c) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = f47484b;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(pluginGeneratedSerialDescriptor);
        c.a(value, compositeEncoderBeginStructure, pluginGeneratedSerialDescriptor);
        compositeEncoderBeginStructure.endStructure(pluginGeneratedSerialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
