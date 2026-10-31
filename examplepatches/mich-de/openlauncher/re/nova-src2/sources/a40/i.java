package a40;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
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
import kotlinx.serialization.internal.StringSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class i implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i f205a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i iVar = new i();
        f205a = iVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.weather.AccuWeatherCurrentCondition", iVar, 9);
        pluginGeneratedSerialDescriptor.addElement("WeatherText", false);
        pluginGeneratedSerialDescriptor.addElement("WeatherIcon", false);
        pluginGeneratedSerialDescriptor.addElement("Temperature", false);
        pluginGeneratedSerialDescriptor.addElement("RealFeelTemperature", false);
        pluginGeneratedSerialDescriptor.addElement("HasPrecipitation", false);
        pluginGeneratedSerialDescriptor.addElement("IsDayTime", false);
        pluginGeneratedSerialDescriptor.addElement("EpochTime", false);
        pluginGeneratedSerialDescriptor.addElement("MobileLink", false);
        pluginGeneratedSerialDescriptor.addElement("weatherCondition", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer kSerializer = k.f209j[8];
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        g0 g0Var = g0.f201a;
        BooleanSerializer booleanSerializer = BooleanSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, IntSerializer.INSTANCE, g0Var, g0Var, booleanSerializer, booleanSerializer, LongSerializer.INSTANCE, stringSerializer, kSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        k30.u uVar;
        i0 i0Var;
        i0 i0Var2;
        boolean z11;
        boolean z12;
        int i11;
        String str;
        String str2;
        long j11;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = k.f209j;
        int i12 = 7;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            int iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
            g0 g0Var = g0.f201a;
            i0 i0Var3 = (i0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, g0Var, null);
            i0 i0Var4 = (i0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, g0Var, null);
            boolean zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
            boolean zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 6);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 7);
            uVar = (k30.u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], null);
            str = strDecodeStringElement;
            str2 = strDecodeStringElement2;
            i5 = 511;
            z11 = zDecodeBooleanElement2;
            i0Var = i0Var4;
            z12 = zDecodeBooleanElement;
            i0Var2 = i0Var3;
            i11 = iDecodeIntElement;
            j11 = jDecodeLongElement;
        } else {
            boolean z13 = true;
            int i13 = 0;
            k30.u uVar2 = null;
            i0 i0Var5 = null;
            String strDecodeStringElement3 = null;
            String strDecodeStringElement4 = null;
            long jDecodeLongElement2 = 0;
            boolean zDecodeBooleanElement3 = false;
            boolean zDecodeBooleanElement4 = false;
            int iDecodeIntElement2 = 0;
            i0 i0Var6 = null;
            while (z13) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                switch (iDecodeElementIndex) {
                    case -1:
                        z13 = false;
                        i12 = 7;
                    case 0:
                        strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                        i13 |= 1;
                        i12 = 7;
                    case 1:
                        iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 1);
                        i13 |= 2;
                        i12 = 7;
                    case 2:
                        i0Var6 = (i0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, g0.f201a, i0Var6);
                        i13 |= 4;
                        i12 = 7;
                    case 3:
                        i0Var5 = (i0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, g0.f201a, i0Var5);
                        i13 |= 8;
                        i12 = 7;
                    case 4:
                        zDecodeBooleanElement4 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 4);
                        i13 |= 16;
                    case 5:
                        zDecodeBooleanElement3 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 5);
                        i13 |= 32;
                    case 6:
                        jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 6);
                        i13 |= 64;
                    case 7:
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, i12);
                        i13 |= 128;
                    case 8:
                        uVar2 = (k30.u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], uVar2);
                        i13 |= 256;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i13;
            uVar = uVar2;
            i0Var = i0Var5;
            i0Var2 = i0Var6;
            z11 = zDecodeBooleanElement3;
            z12 = zDecodeBooleanElement4;
            i11 = iDecodeIntElement2;
            str = strDecodeStringElement3;
            str2 = strDecodeStringElement4;
            j11 = jDecodeLongElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new k(i5, str, i11, i0Var2, i0Var, z12, z11, j11, str2, uVar);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:26:0x0084  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        k30.u uVar;
        k kVar = (k) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = k.f209j;
        String str = kVar.f210a;
        k30.u uVar2 = kVar.f218i;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        int i5 = kVar.f211b;
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 1, i5);
        g0 g0Var = g0.f201a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, g0Var, kVar.f212c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, g0Var, kVar.f213d);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 4, kVar.f214e);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 5, kVar.f215f);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 6, kVar.f216g);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 7, kVar.f217h);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 8)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 8, kSerializerArr[8], uVar2);
        } else {
            switch (i5) {
                case 1:
                case 2:
                case 3:
                case 4:
                    uVar = k30.u.f71064d;
                    break;
                case 5:
                    uVar = k30.u.f71068h;
                    break;
                case 6:
                case 7:
                    uVar = k30.u.f71065e;
                    break;
                case 8:
                    uVar = k30.u.f71066f;
                    break;
                case 9:
                case 10:
                case 27:
                case 28:
                default:
                    uVar = k30.u.f71063c;
                    break;
                case 11:
                    uVar = k30.u.f71067g;
                    break;
                case 12:
                case 13:
                case 14:
                    uVar = k30.u.f71070j;
                    break;
                case 15:
                case 16:
                case 17:
                    uVar = k30.u.f71072l;
                    break;
                case 18:
                    uVar = k30.u.f71071k;
                    break;
                case 19:
                case 20:
                case 21:
                case 22:
                case 23:
                case 24:
                case 25:
                case 26:
                case 29:
                    uVar = k30.u.f71069i;
                    break;
                case 30:
                    uVar = k30.u.f71074p;
                    break;
                case 31:
                    uVar = k30.u.f71075q;
                    break;
                case 32:
                    uVar = k30.u.f71076r;
                    break;
                case 33:
                case 34:
                case 35:
                case 36:
                    uVar = k30.u.f71064d;
                    break;
                case 37:
                    uVar = k30.u.f71067g;
                    break;
                case 38:
                    uVar = k30.u.f71065e;
                    break;
                case 39:
                case 40:
                    uVar = k30.u.f71071k;
                    break;
                case 41:
                case 42:
                    uVar = k30.u.f71072l;
                    break;
                case 43:
                case 44:
                    uVar = k30.u.f71069i;
                    break;
            }
            if (uVar2 != uVar) {
            }
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
