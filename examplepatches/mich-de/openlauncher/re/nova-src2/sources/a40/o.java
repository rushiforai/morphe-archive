package a40;

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
public final /* synthetic */ class o implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final o f225a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        o oVar = new o();
        f225a = oVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.weather.AccuWeatherLocationAutoComplete", oVar, 5);
        pluginGeneratedSerialDescriptor.addElement("Key", false);
        pluginGeneratedSerialDescriptor.addElement("LocalizedName", false);
        pluginGeneratedSerialDescriptor.addElement("EnglishName", true);
        pluginGeneratedSerialDescriptor.addElement("Country", false);
        pluginGeneratedSerialDescriptor.addElement("AdministrativeArea", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        KSerializer nullable = BuiltinSerializersKt.getNullable(stringSerializer);
        f fVar = f.f198a;
        return new KSerializer[]{stringSerializer, stringSerializer, nullable, fVar, fVar};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        String str2;
        String str3;
        h hVar;
        h hVar2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        String strDecodeStringElement = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            String str4 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, null);
            f fVar = f.f198a;
            str = strDecodeStringElement2;
            hVar = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, fVar, null);
            hVar2 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, fVar, null);
            str3 = str4;
            str2 = strDecodeStringElement3;
            i5 = 31;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement4 = null;
            String str5 = null;
            h hVar3 = null;
            h hVar4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    str5 = (String) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str5);
                    i11 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    hVar3 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, f.f198a, hVar3);
                    i11 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    hVar4 = (h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, f.f198a, hVar4);
                    i11 |= 16;
                }
            }
            i5 = i11;
            str = strDecodeStringElement;
            str2 = strDecodeStringElement4;
            str3 = str5;
            hVar = hVar3;
            hVar2 = hVar4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new q(i5, str, str2, str3, hVar, hVar2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        q qVar = (q) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        String str = qVar.f226a;
        String str2 = qVar.f228c;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, qVar.f227b);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || str2 != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, StringSerializer.INSTANCE, str2);
        }
        f fVar = f.f198a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, fVar, qVar.f229d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, fVar, qVar.f230e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
