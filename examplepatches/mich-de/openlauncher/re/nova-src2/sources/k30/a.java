package k30;

import com.amplitude.android.migration.DatabaseConstants;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.FloatSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f70903a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f70903a = aVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.weather.LocationForWeather", aVar, 7);
        pluginGeneratedSerialDescriptor.addElement(DatabaseConstants.KEY_FIELD, false);
        pluginGeneratedSerialDescriptor.addElement("cityName", false);
        pluginGeneratedSerialDescriptor.addElement("state", false);
        pluginGeneratedSerialDescriptor.addElement("countryId", false);
        pluginGeneratedSerialDescriptor.addElement("latitude", true);
        pluginGeneratedSerialDescriptor.addElement("longitude", true);
        pluginGeneratedSerialDescriptor.addElement("canMinutecast", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        FloatSerializer floatSerializer = FloatSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, stringSerializer, stringSerializer, stringSerializer, floatSerializer, floatSerializer, BooleanSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        String strDecodeStringElement;
        boolean zDecodeBooleanElement;
        float f11;
        String str;
        float f12;
        String str2;
        String str3;
        int i5;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            String strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
            float fDecodeFloatElement = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 4);
            float fDecodeFloatElement2 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 5);
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 6);
            f11 = fDecodeFloatElement2;
            str = strDecodeStringElement4;
            f12 = fDecodeFloatElement;
            str2 = strDecodeStringElement3;
            str3 = strDecodeStringElement2;
            i5 = 127;
        } else {
            strDecodeStringElement = null;
            String strDecodeStringElement5 = null;
            String strDecodeStringElement6 = null;
            String strDecodeStringElement7 = null;
            boolean z11 = true;
            int i11 = 0;
            float fDecodeFloatElement3 = 0.0f;
            float fDecodeFloatElement4 = 0.0f;
            boolean zDecodeBooleanElement2 = false;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z11 = false;
                        continue;
                    case 0:
                        strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i11 |= 1;
                        continue;
                    case 1:
                        strDecodeStringElement7 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i11 |= 2;
                        break;
                    case 2:
                        strDecodeStringElement6 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                        i11 |= 4;
                        break;
                    case 3:
                        strDecodeStringElement5 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 3);
                        i11 |= 8;
                        break;
                    case 4:
                        fDecodeFloatElement4 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 4);
                        i11 |= 16;
                        break;
                    case 5:
                        fDecodeFloatElement3 = compositeDecoderBeginStructure.decodeFloatElement(serialDescriptor, 5);
                        i11 |= 32;
                        break;
                    case 6:
                        zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 6);
                        i11 |= 64;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            zDecodeBooleanElement = zDecodeBooleanElement2;
            f11 = fDecodeFloatElement3;
            str = strDecodeStringElement5;
            f12 = fDecodeFloatElement4;
            str2 = strDecodeStringElement6;
            str3 = strDecodeStringElement7;
            i5 = i11;
        }
        String str4 = strDecodeStringElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new c(i5, str4, str3, str2, str, f12, f11, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        c cVar = (c) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        String str = cVar.f70910a;
        boolean z11 = cVar.f70916g;
        float f11 = cVar.f70915f;
        float f12 = cVar.f70914e;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, cVar.f70911b);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, cVar.f70912c);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 3, cVar.f70913d);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || Float.compare(f12, 0.0f) != 0) {
            compositeEncoderBeginStructure.encodeFloatElement(serialDescriptor, 4, f12);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 5) || Float.compare(f11, 0.0f) != 0) {
            compositeEncoderBeginStructure.encodeFloatElement(serialDescriptor, 5, f11);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 6) || z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 6, z11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
