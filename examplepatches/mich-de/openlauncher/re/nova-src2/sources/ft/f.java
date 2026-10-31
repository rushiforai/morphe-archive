package ft;

import com.stripe.android.model.ConsumerSession;
import com.stripe.android.model.MobileFallbackWebviewParams;
import java.util.List;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class f implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final f f55941a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        f fVar = new f();
        f55941a = fVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.model.ConsumerSession", fVar, 8);
        pluginGeneratedSerialDescriptor.addElement("client_secret", true);
        pluginGeneratedSerialDescriptor.addElement("email_address", false);
        pluginGeneratedSerialDescriptor.addElement("redacted_formatted_phone_number", false);
        pluginGeneratedSerialDescriptor.addElement("redacted_phone_number", false);
        pluginGeneratedSerialDescriptor.addElement("unredacted_phone_number", true);
        pluginGeneratedSerialDescriptor.addElement("phone_number_country", true);
        pluginGeneratedSerialDescriptor.addElement("verification_sessions", true);
        pluginGeneratedSerialDescriptor.addElement("mobile_fallback_webview_params", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = ConsumerSession.f43315i;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, stringSerializer, stringSerializer, stringSerializer, BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(stringSerializer), kSerializerArr[6], BuiltinSerializersKt.getNullable(g0.f55946a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        MobileFallbackWebviewParams mobileFallbackWebviewParams;
        List list;
        String str;
        String str2;
        String str3;
        String str4;
        String str5;
        String str6;
        char c11;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConsumerSession.f43315i;
        int i11 = 7;
        String strDecodeStringElement = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            String strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
            StringSerializer stringSerializer = StringSerializer.INSTANCE;
            String str7 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, stringSerializer, null);
            String str8 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, stringSerializer, null);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], null);
            str3 = strDecodeStringElement2;
            mobileFallbackWebviewParams = (MobileFallbackWebviewParams) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 7, g0.f55946a, null);
            str = str8;
            str6 = strDecodeStringElement5;
            str2 = str7;
            str5 = strDecodeStringElement4;
            i5 = 255;
            str4 = strDecodeStringElement3;
        } else {
            boolean z11 = true;
            int i12 = 0;
            MobileFallbackWebviewParams mobileFallbackWebviewParams2 = null;
            List list2 = null;
            String str9 = null;
            String str10 = null;
            String strDecodeStringElement6 = null;
            String strDecodeStringElement7 = null;
            String strDecodeStringElement8 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                    case 0:
                        i12 |= 1;
                        strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i11 = 7;
                    case 1:
                        i12 |= 2;
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i11 = 7;
                    case 2:
                        i12 |= 4;
                        strDecodeStringElement7 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                        i11 = 7;
                    case 3:
                        c11 = 4;
                        strDecodeStringElement8 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
                        i12 |= 8;
                        i11 = 7;
                    case 4:
                        c11 = 4;
                        str10 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str10);
                        i12 |= 16;
                        i11 = 7;
                    case 5:
                        str9 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 5, StringSerializer.INSTANCE, str9);
                        i12 |= 32;
                    case 6:
                        list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], list2);
                        i12 |= 64;
                    case 7:
                        mobileFallbackWebviewParams2 = (MobileFallbackWebviewParams) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, g0.f55946a, mobileFallbackWebviewParams2);
                        i12 |= 128;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i12;
            mobileFallbackWebviewParams = mobileFallbackWebviewParams2;
            list = list2;
            str = str9;
            str2 = str10;
            str3 = strDecodeStringElement;
            str4 = strDecodeStringElement6;
            str5 = strDecodeStringElement7;
            str6 = strDecodeStringElement8;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ConsumerSession(i5, str3, str4, str5, str6, str2, str, list, mobileFallbackWebviewParams);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ConsumerSession value = (ConsumerSession) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        String str = value.f43316a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = ConsumerSession.f43315i;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0) || !Intrinsics.b(str, com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b)) {
            compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        }
        String str2 = value.f43317b;
        MobileFallbackWebviewParams mobileFallbackWebviewParams = value.f43323h;
        List list = value.f43322g;
        String str3 = value.f43321f;
        String str4 = value.f43320e;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, str2);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, value.f43318c);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 3, value.f43319d);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || str4 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 4, StringSerializer.INSTANCE, str4);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || str3 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 5, StringSerializer.INSTANCE, str3);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || !Intrinsics.b(list, EmptyList.f71733a)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 6, kSerializerArr[6], list);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 7) || mobileFallbackWebviewParams != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 7, g0.f55946a, mobileFallbackWebviewParams);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
