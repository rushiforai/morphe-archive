package q20;

import java.util.List;
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
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class d implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d f83464a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d dVar = new d();
        f83464a = dVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.shortcutsearch.integrations.spotify.SpotifyApiIntegration.ApiResult", dVar, 3);
        pluginGeneratedSerialDescriptor.addElement("hasError", false);
        pluginGeneratedSerialDescriptor.addElement("links", false);
        pluginGeneratedSerialDescriptor.addElement("bytesReceived", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(f.f83465d[1]), LongSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        long jDecodeLongElement;
        List list;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = f.f83465d;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
            list = (List) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
            i5 = 7;
        } else {
            long jDecodeLongElement2 = 0;
            boolean z11 = true;
            zDecodeBooleanElement = false;
            List list2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    list2 = (List) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, kSerializerArr[1], list2);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            jDecodeLongElement = jDecodeLongElement2;
            list = list2;
        }
        boolean z12 = zDecodeBooleanElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new f(list, z12, jDecodeLongElement, i5);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        f fVar = (f) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = f.f83465d;
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 0, fVar.f83466a);
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, kSerializerArr[1], fVar.f83467b);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 2, fVar.f83468c);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
