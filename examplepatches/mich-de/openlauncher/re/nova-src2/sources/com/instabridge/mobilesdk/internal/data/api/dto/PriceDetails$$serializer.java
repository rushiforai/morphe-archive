package com.instabridge.mobilesdk.internal.data.api.dto;

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
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0005\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00070\u0006¢\u0006\u0002\u0010\bJ\u000e\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0002R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"com/instabridge/mobilesdk/internal/data/api/dto/PriceDetails.$serializer", "Lkotlinx/serialization/internal/GeneratedSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PriceDetails;", "<init>", "()V", "childSerializers", b.f42142b, "Lkotlinx/serialization/KSerializer;", "()[Lkotlinx/serialization/KSerializer;", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "serialize", b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Deprecated
/* loaded from: classes3.dex */
public /* synthetic */ class PriceDetails$$serializer implements GeneratedSerializer<PriceDetails> {
    public static final int $stable;

    @NotNull
    public static final PriceDetails$$serializer INSTANCE;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        PriceDetails$$serializer priceDetails$$serializer = new PriceDetails$$serializer();
        INSTANCE = priceDetails$$serializer;
        $stable = 8;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.instabridge.mobilesdk.internal.data.api.dto.PriceDetails", priceDetails$$serializer, 7);
        pluginGeneratedSerialDescriptor.addElement("subTotal", true);
        pluginGeneratedSerialDescriptor.addElement("tax", true);
        pluginGeneratedSerialDescriptor.addElement("taxRate", true);
        pluginGeneratedSerialDescriptor.addElement("total", true);
        pluginGeneratedSerialDescriptor.addElement("discount", true);
        pluginGeneratedSerialDescriptor.addElement(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, true);
        pluginGeneratedSerialDescriptor.addElement("discountName", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    private PriceDetails$$serializer() {
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    @NotNull
    public final KSerializer<?>[] childSerializers() {
        DoubleSerializer doubleSerializer = DoubleSerializer.INSTANCE;
        KSerializer<?> nullable = BuiltinSerializersKt.getNullable(doubleSerializer);
        KSerializer<?> nullable2 = BuiltinSerializersKt.getNullable(doubleSerializer);
        KSerializer<?> nullable3 = BuiltinSerializersKt.getNullable(doubleSerializer);
        KSerializer<?> nullable4 = BuiltinSerializersKt.getNullable(doubleSerializer);
        KSerializer<?> nullable5 = BuiltinSerializersKt.getNullable(doubleSerializer);
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{nullable, nullable2, nullable3, nullable4, nullable5, BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(stringSerializer)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final PriceDetails deserialize(@NotNull Decoder decoder) {
        int i5;
        String str;
        Double d5;
        Double d11;
        Double d12;
        Double d13;
        Double d14;
        String str2;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i11 = 6;
        Double d15 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            DoubleSerializer doubleSerializer = DoubleSerializer.INSTANCE;
            Double d16 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, doubleSerializer, null);
            Double d17 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, doubleSerializer, null);
            Double d18 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, doubleSerializer, null);
            Double d19 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, doubleSerializer, null);
            Double d21 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, doubleSerializer, null);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, stringSerializer, null);
            d14 = d21;
            str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 6, stringSerializer, null);
            str2 = str3;
            d13 = d19;
            i5 = 127;
            d12 = d18;
            d11 = d17;
            d5 = d16;
        } else {
            boolean z11 = true;
            int i12 = 0;
            String str4 = null;
            Double d22 = null;
            Double d23 = null;
            Double d24 = null;
            Double d25 = null;
            String str5 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i11 = 6;
                    case 0:
                        d15 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, DoubleSerializer.INSTANCE, d15);
                        i12 |= 1;
                        i11 = 6;
                    case 1:
                        d22 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, DoubleSerializer.INSTANCE, d22);
                        i12 |= 2;
                        i11 = 6;
                    case 2:
                        d23 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, DoubleSerializer.INSTANCE, d23);
                        i12 |= 4;
                    case 3:
                        d24 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, DoubleSerializer.INSTANCE, d24);
                        i12 |= 8;
                    case 4:
                        d25 = (Double) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, DoubleSerializer.INSTANCE, d25);
                        i12 |= 16;
                    case 5:
                        str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, StringSerializer.INSTANCE, str5);
                        i12 |= 32;
                    case 6:
                        str4 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, StringSerializer.INSTANCE, str4);
                        i12 |= 64;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i12;
            str = str4;
            d5 = d15;
            d11 = d22;
            d12 = d23;
            d13 = d24;
            d14 = d25;
            str2 = str5;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new PriceDetails(i5, d5, d11, d12, d13, d14, str2, str, (SerializationConstructorMarker) null);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(@NotNull Encoder encoder, @NotNull PriceDetails value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        PriceDetails.write$Self$mobile_sdk_release(value, compositeEncoderBeginStructure, serialDescriptor);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
