package com.instabridge.mobilesdk.internal.data.api.dto;

import androidx.recyclerview.widget.u1;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.google.firebase.crashlytics.internal.metadata.UserMetadata;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.contents.TTContentsEventConstants;
import io.branch.requery.android.database.sqlite.SQLiteDatabase;
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
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.DoubleSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import kotlinx.serialization.json.internal.ReaderJsonLexerKt;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0005\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00070\u0006¢\u0006\u0002\u0010\bJ\u000e\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0002R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"com/instabridge/mobilesdk/internal/data/api/dto/LocalEsimPriceDto.$serializer", "Lkotlinx/serialization/internal/GeneratedSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/LocalEsimPriceDto;", "<init>", "()V", "childSerializers", b.f42142b, "Lkotlinx/serialization/KSerializer;", "()[Lkotlinx/serialization/KSerializer;", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "serialize", b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Deprecated
/* loaded from: classes3.dex */
public /* synthetic */ class LocalEsimPriceDto$$serializer implements GeneratedSerializer<LocalEsimPriceDto> {
    public static final int $stable;

    @NotNull
    public static final LocalEsimPriceDto$$serializer INSTANCE;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        LocalEsimPriceDto$$serializer localEsimPriceDto$$serializer = new LocalEsimPriceDto$$serializer();
        INSTANCE = localEsimPriceDto$$serializer;
        $stable = 8;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.instabridge.mobilesdk.internal.data.api.dto.LocalEsimPriceDto", localEsimPriceDto$$serializer, 18);
        pluginGeneratedSerialDescriptor.addElement("packageId", false);
        pluginGeneratedSerialDescriptor.addElement("packageName", true);
        pluginGeneratedSerialDescriptor.addElement("durationHours", true);
        pluginGeneratedSerialDescriptor.addElement("basePrice", true);
        pluginGeneratedSerialDescriptor.addElement("finalPrice", true);
        pluginGeneratedSerialDescriptor.addElement("basePriceDecimal", true);
        pluginGeneratedSerialDescriptor.addElement("finalPriceDecimal", true);
        pluginGeneratedSerialDescriptor.addElement(TTContentsEventConstants.Params.EVENT_PROPERTY_CURRENCY, true);
        pluginGeneratedSerialDescriptor.addElement("data", true);
        pluginGeneratedSerialDescriptor.addElement(ActionCategory.SMS, true);
        pluginGeneratedSerialDescriptor.addElement(ActionCategory.CALL, true);
        pluginGeneratedSerialDescriptor.addElement("subscription", true);
        pluginGeneratedSerialDescriptor.addElement("interval", true);
        pluginGeneratedSerialDescriptor.addElement("intervalCount", true);
        pluginGeneratedSerialDescriptor.addElement("trial", true);
        pluginGeneratedSerialDescriptor.addElement("externalPlanId", true);
        pluginGeneratedSerialDescriptor.addElement("externalPlanType", true);
        pluginGeneratedSerialDescriptor.addElement("externalPlanProvider", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    private LocalEsimPriceDto$$serializer() {
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    @NotNull
    public final KSerializer<?>[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        KSerializer<?> nullable = BuiltinSerializersKt.getNullable(TrialDto$$serializer.INSTANCE);
        KSerializer<?> nullable2 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer<?> nullable3 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer<?> nullable4 = BuiltinSerializersKt.getNullable(stringSerializer);
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        IntSerializer intSerializer = IntSerializer.INSTANCE;
        DoubleSerializer doubleSerializer = DoubleSerializer.INSTANCE;
        return new KSerializer[]{longSerializer, stringSerializer, intSerializer, longSerializer, longSerializer, doubleSerializer, doubleSerializer, stringSerializer, longSerializer, intSerializer, intSerializer, BooleanSerializer.INSTANCE, stringSerializer, intSerializer, nullable, nullable2, nullable3, nullable4};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final LocalEsimPriceDto deserialize(@NotNull Decoder decoder) {
        String str;
        TrialDto trialDto;
        String str2;
        int i5;
        int i11;
        String str3;
        int i12;
        long j11;
        String str4;
        String str5;
        String str6;
        int i13;
        boolean z11;
        int i14;
        double d5;
        long j12;
        long j13;
        double d11;
        long j14;
        int i15;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i16 = 5;
        int i17 = 8;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
            long jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
            long jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
            double dDecodeDoubleElement = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 5);
            double dDecodeDoubleElement2 = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 6);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 7);
            long jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 8);
            int iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 9);
            int iDecodeIntElement3 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 10);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 11);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 12);
            int iDecodeIntElement4 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 13);
            TrialDto trialDto2 = (TrialDto) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 14, TrialDto$$serializer.INSTANCE, null);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 15, stringSerializer, null);
            String str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 16, stringSerializer, null);
            str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 17, stringSerializer, null);
            i5 = 262143;
            i12 = iDecodeIntElement;
            i13 = iDecodeIntElement4;
            z11 = zDecodeBooleanElement;
            i14 = iDecodeIntElement3;
            str6 = strDecodeStringElement3;
            str5 = strDecodeStringElement2;
            d5 = dDecodeDoubleElement2;
            j12 = jDecodeLongElement3;
            str2 = str7;
            trialDto = trialDto2;
            str4 = strDecodeStringElement;
            i11 = iDecodeIntElement2;
            j13 = jDecodeLongElement;
            d11 = dDecodeDoubleElement;
            j14 = jDecodeLongElement4;
            j11 = jDecodeLongElement2;
        } else {
            int iDecodeIntElement5 = 0;
            int iDecodeIntElement6 = 0;
            boolean zDecodeBooleanElement2 = false;
            int iDecodeIntElement7 = 0;
            boolean z12 = true;
            String str8 = null;
            str = null;
            String str9 = null;
            String strDecodeStringElement4 = null;
            String strDecodeStringElement5 = null;
            long jDecodeLongElement5 = 0;
            long jDecodeLongElement6 = 0;
            long jDecodeLongElement7 = 0;
            double dDecodeDoubleElement3 = 0.0d;
            double dDecodeDoubleElement4 = 0.0d;
            int i18 = 0;
            int iDecodeIntElement8 = 0;
            TrialDto trialDto3 = null;
            String strDecodeStringElement6 = null;
            long jDecodeLongElement8 = 0;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        i17 = 8;
                        i16 = 5;
                    case 0:
                        jDecodeLongElement6 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                        i18 |= 1;
                        i17 = 8;
                        i16 = 5;
                    case 1:
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i18 |= 2;
                        i17 = 8;
                        i16 = 5;
                    case 2:
                        iDecodeIntElement8 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 2);
                        i18 |= 4;
                        i17 = 8;
                        i16 = 5;
                    case 3:
                        jDecodeLongElement8 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
                        i18 |= 8;
                        i17 = 8;
                        i16 = 5;
                    case 4:
                        jDecodeLongElement5 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
                        i18 |= 16;
                        i17 = 8;
                        i16 = 5;
                    case 5:
                        int i19 = i16;
                        dDecodeDoubleElement4 = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, i19);
                        i18 |= 32;
                        i16 = i19;
                        i17 = 8;
                    case 6:
                        dDecodeDoubleElement3 = compositeDecoderBeginStructure.decodeDoubleElement(serialDescriptor, 6);
                        i18 |= 64;
                        i16 = 5;
                    case 7:
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 7);
                        i18 |= 128;
                        i16 = 5;
                    case 8:
                        jDecodeLongElement7 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, i17);
                        i18 |= 256;
                        i16 = 5;
                    case 9:
                        iDecodeIntElement5 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 9);
                        i18 |= EventBridgeChannel.QUEUE_CAPACITY;
                        i16 = 5;
                    case 10:
                        iDecodeIntElement7 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 10);
                        i18 |= 1024;
                        i16 = 5;
                    case 11:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 11);
                        i18 |= 2048;
                        i16 = 5;
                    case 12:
                        strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 12);
                        i18 |= u1.FLAG_APPEARED_IN_PRE_LAYOUT;
                        i16 = 5;
                    case 13:
                        iDecodeIntElement6 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 13);
                        i18 |= UserMetadata.MAX_INTERNAL_KEY_SIZE;
                        i16 = 5;
                    case 14:
                        trialDto3 = (TrialDto) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 14, TrialDto$$serializer.INSTANCE, trialDto3);
                        i18 |= ReaderJsonLexerKt.BATCH_SIZE;
                        i16 = 5;
                    case 15:
                        str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 15, StringSerializer.INSTANCE, str);
                        i15 = SQLiteDatabase.OPEN_NOMUTEX;
                        i18 |= i15;
                        i16 = 5;
                    case 16:
                        str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 16, StringSerializer.INSTANCE, str8);
                        i15 = SQLiteDatabase.OPEN_FULLMUTEX;
                        i18 |= i15;
                        i16 = 5;
                    case 17:
                        str9 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 17, StringSerializer.INSTANCE, str9);
                        i15 = SQLiteDatabase.OPEN_SHAREDCACHE;
                        i18 |= i15;
                        i16 = 5;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            trialDto = trialDto3;
            str2 = str8;
            i5 = i18;
            i11 = iDecodeIntElement5;
            str3 = str9;
            i12 = iDecodeIntElement8;
            j11 = jDecodeLongElement8;
            str4 = strDecodeStringElement6;
            str5 = strDecodeStringElement4;
            str6 = strDecodeStringElement5;
            i13 = iDecodeIntElement6;
            z11 = zDecodeBooleanElement2;
            i14 = iDecodeIntElement7;
            d5 = dDecodeDoubleElement3;
            j12 = jDecodeLongElement5;
            j13 = jDecodeLongElement6;
            d11 = dDecodeDoubleElement4;
            j14 = jDecodeLongElement7;
        }
        String str10 = str;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new LocalEsimPriceDto(i5, j13, str4, i12, j11, j12, d11, d5, str5, j14, i11, i14, z11, str6, i13, trialDto, str10, str2, str3, (SerializationConstructorMarker) null);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(@NotNull Encoder encoder, @NotNull LocalEsimPriceDto value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        LocalEsimPriceDto.write$Self$mobile_sdk_release(value, compositeEncoderBeginStructure, serialDescriptor);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
