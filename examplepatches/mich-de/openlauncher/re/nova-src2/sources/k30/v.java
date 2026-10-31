package k30;

import com.amplitude.eventbridge.EventBridgeChannel;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class v implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final v f71080a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        v vVar = new v();
        f71080a = vVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.weather.WeatherData", vVar, 10);
        pluginGeneratedSerialDescriptor.addElement("temp", false);
        pluginGeneratedSerialDescriptor.addElement("realFeel", false);
        pluginGeneratedSerialDescriptor.addElement("condition", false);
        pluginGeneratedSerialDescriptor.addElement("timeOfDay", false);
        pluginGeneratedSerialDescriptor.addElement("moonPhase", false);
        pluginGeneratedSerialDescriptor.addElement("location", false);
        pluginGeneratedSerialDescriptor.addElement("serverTimestampMs", false);
        pluginGeneratedSerialDescriptor.addElement("fetchedTimestampMs", false);
        pluginGeneratedSerialDescriptor.addElement(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, true);
        pluginGeneratedSerialDescriptor.addElement("pending", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = x.f71081k;
        KSerializer kSerializer = kSerializerArr[2];
        KSerializer kSerializer2 = kSerializerArr[3];
        KSerializer kSerializer3 = kSerializerArr[4];
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        KSerializer nullable = BuiltinSerializersKt.getNullable(stringSerializer);
        KSerializer nullable2 = BuiltinSerializersKt.getNullable(i0.f70992a);
        FloatSerializer floatSerializer = FloatSerializer.INSTANCE;
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{floatSerializer, floatSerializer, kSerializer, kSerializer2, kSerializer3, stringSerializer, longSerializer, longSerializer, nullable, nullable2};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        float fDecodeFloatElement;
        String str;
        k0 k0Var;
        d dVar;
        s sVar;
        u uVar;
        int i5;
        long j11;
        float f11;
        String str2;
        long j12;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = x.f71081k;
        int i11 = 9;
        int i12 = 7;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            fDecodeFloatElement = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 0);
            float fDecodeFloatElement2 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 1);
            u uVar2 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], null);
            s sVar2 = (s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            d dVar2 = (d) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], null);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 6);
            long jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 7);
            String str3 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, StringSerializer.INSTANCE, null);
            dVar = dVar2;
            k0Var = (k0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 9, i0.f70992a, null);
            j11 = jDecodeLongElement2;
            str2 = strDecodeStringElement;
            str = str3;
            sVar = sVar2;
            i5 = 1023;
            uVar = uVar2;
            f11 = fDecodeFloatElement2;
            j12 = jDecodeLongElement;
        } else {
            fDecodeFloatElement = 0.0f;
            long jDecodeLongElement3 = 0;
            float fDecodeFloatElement3 = 0.0f;
            int i13 = 3;
            int i14 = 4;
            boolean z11 = true;
            String str4 = null;
            k0 k0Var2 = null;
            d dVar3 = null;
            s sVar3 = null;
            String strDecodeStringElement2 = null;
            long jDecodeLongElement4 = 0;
            int i15 = 0;
            u uVar3 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        i11 = 9;
                        i13 = 3;
                        i14 = 4;
                    case 0:
                        i15 |= 1;
                        fDecodeFloatElement = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 0);
                        i11 = 9;
                        i12 = 7;
                        i13 = 3;
                        i14 = 4;
                    case 1:
                        fDecodeFloatElement3 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 1);
                        i15 |= 2;
                        i11 = 9;
                        i12 = 7;
                        i13 = 3;
                        i14 = 4;
                    case 2:
                        uVar3 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], uVar3);
                        i15 |= 4;
                        i11 = 9;
                        i12 = 7;
                        i13 = 3;
                        i14 = 4;
                    case 3:
                        sVar3 = (s) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i13, kSerializerArr[i13], sVar3);
                        i15 |= 8;
                        i11 = 9;
                        i12 = 7;
                        i14 = 4;
                    case 4:
                        dVar3 = (d) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i14, kSerializerArr[i14], dVar3);
                        i15 |= 16;
                        i11 = 9;
                        i12 = 7;
                    case 5:
                        strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 5);
                        i15 |= 32;
                    case 6:
                        jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 6);
                        i15 |= 64;
                    case 7:
                        jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, i12);
                        i15 |= 128;
                    case 8:
                        str4 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 8, StringSerializer.INSTANCE, str4);
                        i15 |= 256;
                    case 9:
                        k0Var2 = (k0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, i11, i0.f70992a, k0Var2);
                        i15 |= EventBridgeChannel.QUEUE_CAPACITY;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            str = str4;
            k0Var = k0Var2;
            dVar = dVar3;
            sVar = sVar3;
            uVar = uVar3;
            i5 = i15;
            j11 = jDecodeLongElement3;
            f11 = fDecodeFloatElement3;
            str2 = strDecodeStringElement2;
            j12 = jDecodeLongElement4;
        }
        float f12 = fDecodeFloatElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new x(i5, f12, f11, uVar, sVar, dVar, str2, j12, j11, str, k0Var);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        x xVar = (x) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = x.f71081k;
        float f11 = xVar.f71083a;
        k0 k0Var = xVar.f71092j;
        String str = xVar.f71091i;
        compositeEncoderBeginStructure.encodeFloatElement(serialDescriptor, 0, f11);
        compositeEncoderBeginStructure.encodeFloatElement(serialDescriptor, 1, xVar.f71084b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, kSerializerArr[2], xVar.f71085c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, kSerializerArr[3], xVar.f71086d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], xVar.f71087e);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 5, xVar.f71088f);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 6, xVar.f71089g);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 7, xVar.f71090h);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8) || str != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 8, StringSerializer.INSTANCE, str);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 9) || k0Var != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 9, i0.f70992a, k0Var);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
