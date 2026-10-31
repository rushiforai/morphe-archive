package a40;

import java.util.List;
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
public final /* synthetic */ class r implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final r f231a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        r rVar = new r();
        f231a = rVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.weather.AccuWeatherLocationData", rVar, 6);
        pluginGeneratedSerialDescriptor.addElement("Key", false);
        pluginGeneratedSerialDescriptor.addElement("LocalizedName", false);
        pluginGeneratedSerialDescriptor.addElement("EnglishName", true);
        pluginGeneratedSerialDescriptor.addElement("ParentCity", true);
        pluginGeneratedSerialDescriptor.addElement("DataSets", false);
        pluginGeneratedSerialDescriptor.addElement("GeoPosition", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        KSerializer[] kSerializerArr = t.f232g;
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, stringSerializer, BuiltinSerializersKt.getNullable(stringSerializer), BuiltinSerializersKt.getNullable(d0.f193a), kSerializerArr[4], l.f219a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        String str2;
        String str3;
        f0 f0Var;
        List list;
        n nVar;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = t.f232g;
        String strDecodeStringElement = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            String str4 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, null);
            f0 f0Var2 = (f0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, d0.f193a, null);
            list = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], null);
            str = strDecodeStringElement2;
            nVar = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, l.f219a, null);
            f0Var = f0Var2;
            str3 = str4;
            i5 = 63;
            str2 = strDecodeStringElement3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement4 = null;
            String str5 = null;
            f0 f0Var3 = null;
            List list2 = null;
            n nVar2 = null;
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
                        strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                        i11 |= 2;
                        break;
                    case 2:
                        str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str5);
                        i11 |= 4;
                        break;
                    case 3:
                        f0Var3 = (f0) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 3, d0.f193a, f0Var3);
                        i11 |= 8;
                        break;
                    case 4:
                        list2 = (List) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], list2);
                        i11 |= 16;
                        break;
                    case 5:
                        nVar2 = (n) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 5, l.f219a, nVar2);
                        i11 |= 32;
                        break;
                    default:
                        throw new UnknownFieldException(iDecodeElementIndex);
                }
            }
            i5 = i11;
            str = strDecodeStringElement;
            str2 = strDecodeStringElement4;
            str3 = str5;
            f0Var = f0Var3;
            list = list2;
            nVar = nVar2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new t(i5, str, str2, str3, f0Var, list, nVar);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        t tVar = (t) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = t.f232g;
        String str = tVar.f233a;
        f0 f0Var = tVar.f236d;
        String str2 = tVar.f235c;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, tVar.f234b);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || str2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str2);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 3) || f0Var != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 3, d0.f193a, f0Var);
        }
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, kSerializerArr[4], tVar.f237e);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 5, l.f219a, tVar.f238f);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
