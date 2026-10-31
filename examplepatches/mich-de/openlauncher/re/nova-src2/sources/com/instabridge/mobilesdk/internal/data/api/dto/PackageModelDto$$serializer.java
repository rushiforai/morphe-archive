package com.instabridge.mobilesdk.internal.data.api.dto;

import com.amplitude.android.TrackingOptions;
import com.amplitude.eventbridge.EventBridgeChannel;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.util.TTConst;
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
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.SerializationConstructorMarker;
import kotlinx.serialization.internal.StringSerializer;
import ninja.sesame.lib.bridge.v1.ActionCategory;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0011\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\bÇ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0015\u0010\u0005\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00070\u0006¢\u0006\u0002\u0010\bJ\u000e\u0010\t\u001a\u00020\u00022\u0006\u0010\n\u001a\u00020\u000bJ\u0016\u0010\f\u001a\u00020\r2\u0006\u0010\u000e\u001a\u00020\u000f2\u0006\u0010\u0010\u001a\u00020\u0002R\u0011\u0010\u0011\u001a\u00020\u0012¢\u0006\b\n\u0000\u001a\u0004\b\u0013\u0010\u0014¨\u0006\u0015"}, d2 = {"com/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto.$serializer", "Lkotlinx/serialization/internal/GeneratedSerializer;", "Lcom/instabridge/mobilesdk/internal/data/api/dto/PackageModelDto;", "<init>", "()V", "childSerializers", b.f42142b, "Lkotlinx/serialization/KSerializer;", "()[Lkotlinx/serialization/KSerializer;", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "serialize", b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "mobile-sdk_release"}, k = 1, mv = {2, 1, 0}, xi = 48)
@Deprecated
/* loaded from: classes3.dex */
public /* synthetic */ class PackageModelDto$$serializer implements GeneratedSerializer<PackageModelDto> {
    public static final int $stable;

    @NotNull
    public static final PackageModelDto$$serializer INSTANCE;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        PackageModelDto$$serializer packageModelDto$$serializer = new PackageModelDto$$serializer();
        INSTANCE = packageModelDto$$serializer;
        $stable = 8;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.instabridge.mobilesdk.internal.data.api.dto.PackageModelDto", packageModelDto$$serializer, 11);
        pluginGeneratedSerialDescriptor.addElement("packageId", true);
        pluginGeneratedSerialDescriptor.addElement(PendingUpgradeStore.KEY_NAME, true);
        pluginGeneratedSerialDescriptor.addElement("amount", true);
        pluginGeneratedSerialDescriptor.addElement(ActionCategory.SMS, true);
        pluginGeneratedSerialDescriptor.addElement("voice", true);
        pluginGeneratedSerialDescriptor.addElement("durationHours", true);
        pluginGeneratedSerialDescriptor.addElement("cycles", true);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, true);
        pluginGeneratedSerialDescriptor.addElement("external_plan_type", true);
        pluginGeneratedSerialDescriptor.addElement("isPremium", true);
        pluginGeneratedSerialDescriptor.addElement(TrackingOptions.AMP_TRACKING_OPTION_REGION, true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    private PackageModelDto$$serializer() {
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    @NotNull
    public final KSerializer<?>[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        KSerializer<?> nullable = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer<?> nullable2 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer<?> nullable3 = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer<?> nullable4 = BuiltinSerializersKt.getNullable(stringSerializer);
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{longSerializer, nullable, longSerializer, longSerializer, longSerializer, longSerializer, IntSerializer.INSTANCE, nullable2, nullable3, BooleanSerializer.INSTANCE, nullable4};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final PackageModelDto deserialize(@NotNull Decoder decoder) {
        int i5;
        String str;
        String str2;
        String str3;
        String str4;
        boolean z11;
        int i11;
        long j11;
        long j12;
        long j13;
        long j14;
        long j15;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i12 = 10;
        int i13 = 9;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, stringSerializer, null);
            long jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
            long jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
            long jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
            long jDecodeLongElement5 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 5);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 6);
            String str6 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, stringSerializer, null);
            String str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, stringSerializer, null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 9);
            str = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 10, stringSerializer, null);
            i5 = 2047;
            z11 = zDecodeBooleanElement;
            str3 = str6;
            i11 = iDecodeIntElement;
            j11 = jDecodeLongElement5;
            str2 = str7;
            j12 = jDecodeLongElement4;
            str4 = str5;
            j13 = jDecodeLongElement;
            j14 = jDecodeLongElement2;
            j15 = jDecodeLongElement3;
        } else {
            boolean z12 = true;
            int i14 = 0;
            String str8 = null;
            String str9 = null;
            String str10 = null;
            long jDecodeLongElement6 = 0;
            long jDecodeLongElement7 = 0;
            long jDecodeLongElement8 = 0;
            long jDecodeLongElement9 = 0;
            boolean zDecodeBooleanElement2 = false;
            int iDecodeIntElement2 = 0;
            String str11 = null;
            long jDecodeLongElement10 = 0;
            while (z12) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z12 = false;
                        i12 = 10;
                    case 0:
                        jDecodeLongElement7 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                        i14 |= 1;
                        i12 = 10;
                        i13 = 9;
                    case 1:
                        str11 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, StringSerializer.INSTANCE, str11);
                        i14 |= 2;
                        i12 = 10;
                        i13 = 9;
                    case 2:
                        jDecodeLongElement8 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
                        i14 |= 4;
                        i12 = 10;
                    case 3:
                        jDecodeLongElement9 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
                        i14 |= 8;
                        i12 = 10;
                    case 4:
                        jDecodeLongElement6 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
                        i14 |= 16;
                    case 5:
                        jDecodeLongElement10 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 5);
                        i14 |= 32;
                    case 6:
                        iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 6);
                        i14 |= 64;
                    case 7:
                        str10 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, StringSerializer.INSTANCE, str10);
                        i14 |= 128;
                    case 8:
                        str9 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, StringSerializer.INSTANCE, str9);
                        i14 |= 256;
                    case 9:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, i13);
                        i14 |= EventBridgeChannel.QUEUE_CAPACITY;
                    case 10:
                        str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i12, StringSerializer.INSTANCE, str8);
                        i14 |= 1024;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i14;
            str = str8;
            str2 = str9;
            str3 = str10;
            str4 = str11;
            z11 = zDecodeBooleanElement2;
            i11 = iDecodeIntElement2;
            j11 = jDecodeLongElement10;
            j12 = jDecodeLongElement6;
            j13 = jDecodeLongElement7;
            j14 = jDecodeLongElement8;
            j15 = jDecodeLongElement9;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new PackageModelDto(i5, j13, str4, j14, j15, j12, j11, i11, str3, str2, z11, str, (SerializationConstructorMarker) null);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(@NotNull Encoder encoder, @NotNull PackageModelDto value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        PackageModelDto.write$Self$mobile_sdk_release(value, compositeEncoderBeginStructure, serialDescriptor);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
