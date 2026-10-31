package com.instabridge.mobilesdk.internal.data.repo;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0005\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00070\u0006¢\u0006\u0002\u0010\bJ\u000e\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0002R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"com/instabridge/mobilesdk/internal/data/repo/TravelPlan.$serializer", "Lkotlinx/serialization/internal/GeneratedSerializer;", "Lcom/instabridge/mobilesdk/internal/data/repo/TravelPlan;", "<init>", "()V", "childSerializers", b.f42142b, "Lkotlinx/serialization/KSerializer;", "()[Lkotlinx/serialization/KSerializer;", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "serialize", b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Deprecated
/* loaded from: classes3.dex */
public /* synthetic */ class TravelPlan$$serializer implements GeneratedSerializer<TravelPlan> {
    public static final int $stable;

    @NotNull
    public static final TravelPlan$$serializer INSTANCE;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        TravelPlan$$serializer travelPlan$$serializer = new TravelPlan$$serializer();
        INSTANCE = travelPlan$$serializer;
        $stable = 8;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.instabridge.mobilesdk.internal.data.repo.TravelPlan", travelPlan$$serializer, 6);
        pluginGeneratedSerialDescriptor.addElement("dataBytes", false);
        pluginGeneratedSerialDescriptor.addElement("durationHours", false);
        pluginGeneratedSerialDescriptor.addElement("totalPrice", false);
        pluginGeneratedSerialDescriptor.addElement(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, false);
        pluginGeneratedSerialDescriptor.addElement("savingsPercent", true);
        pluginGeneratedSerialDescriptor.addElement("subTotal", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    private TravelPlan$$serializer() {
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    @NotNull
    public final KSerializer<?>[] childSerializers() {
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        DoubleSerializer doubleSerializer = DoubleSerializer.INSTANCE;
        return new KSerializer[]{LongSerializer.INSTANCE, intSerializer, doubleSerializer, StringSerializer.INSTANCE, BuiltinSerializersKt.getNullable(intSerializer), BuiltinSerializersKt.getNullable(doubleSerializer)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final TravelPlan deserialize(@NotNull Decoder decoder) {
        int iDecodeIntElement;
        int i5;
        String str;
        Integer num;
        double d5;
        Double d11;
        long j11;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            double dDecodeDoubleElement = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 2);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
            Integer num2 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, IntSerializer.INSTANCE, null);
            d11 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, DoubleSerializer.INSTANCE, null);
            str = strDecodeStringElement;
            num = num2;
            d5 = dDecodeDoubleElement;
            i5 = 63;
            j11 = jDecodeLongElement;
        } else {
            double dDecodeDoubleElement2 = 0.0d;
            boolean z11 = true;
            iDecodeIntElement = 0;
            Double d12 = null;
            long jDecodeLongElement2 = 0;
            int i11 = 0;
            String strDecodeStringElement2 = null;
            Integer num3 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        continue;
                    case 0:
                        jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                        i11 |= 1;
                        continue;
                    case 1:
                        iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                        i11 |= 2;
                        break;
                    case 2:
                        dDecodeDoubleElement2 = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 2);
                        i11 |= 4;
                        break;
                    case 3:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
                        i11 |= 8;
                        break;
                    case 4:
                        num3 = (Integer) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, IntSerializer.INSTANCE, num3);
                        i11 |= 16;
                        break;
                    case 5:
                        d12 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, DoubleSerializer.INSTANCE, d12);
                        i11 |= 32;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i11;
            str = strDecodeStringElement2;
            num = num3;
            d5 = dDecodeDoubleElement2;
            d11 = d12;
            j11 = jDecodeLongElement2;
        }
        int i12 = iDecodeIntElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new TravelPlan(i5, j11, i12, d5, str, num, d11, (SerializationConstructorMarker) null);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(@NotNull Encoder encoder, @NotNull TravelPlan value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        TravelPlan.write$Self$mobile_sdk_release(value, compositeEncoderBeginStructure, serialDescriptor);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
