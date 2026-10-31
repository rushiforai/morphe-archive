package k30;

import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class i0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i0 f70992a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i0 i0Var = new i0();
        f70992a = i0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.weather.WeatherPendingCondition", i0Var, 4);
        pluginGeneratedSerialDescriptor.addElement("condition", false);
        pluginGeneratedSerialDescriptor.addElement("time", false);
        pluginGeneratedSerialDescriptor.addElement(TTEDPEventConstants.EDP_EVENT_PROPERTY_WEBVIEW_REQUEST_URL, false);
        pluginGeneratedSerialDescriptor.addElement("timeOfDay", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = k0.f71004e;
        return new KSerializer[]{kSerializerArr[0], LongSerializer.INSTANCE, StringSerializer.INSTANCE, BuiltinSerializersKt.getNullable(kSerializerArr[3])};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        u uVar;
        long j11;
        String str;
        s sVar;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = k0.f71004e;
        u uVar2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            u uVar3 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 1);
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            sVar = (s) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, kSerializerArr[3], null);
            uVar = uVar3;
            str = strDecodeStringElement;
            i5 = 15;
            j11 = jDecodeLongElement;
        } else {
            long jDecodeLongElement2 = 0;
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement2 = null;
            s sVar2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    uVar2 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], uVar2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 1);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                    i11 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    sVar2 = (s) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, kSerializerArr[3], sVar2);
                    i11 |= 8;
                }
            }
            i5 = i11;
            uVar = uVar2;
            j11 = jDecodeLongElement2;
            str = strDecodeStringElement2;
            sVar = sVar2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new k0(i5, uVar, j11, str, sVar);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        k0 k0Var = (k0) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = k0.f71004e;
        KSerializer kSerializer = kSerializerArr[0];
        u uVar = k0Var.f71005a;
        s sVar = k0Var.f71008d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kSerializer, uVar);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 1, k0Var.f71006b);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, k0Var.f71007c);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || sVar != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, kSerializerArr[3], sVar);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
