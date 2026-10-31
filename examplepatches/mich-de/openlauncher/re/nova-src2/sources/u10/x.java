package u10;

import android.net.Uri;
import e10.q4;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import nova.branch.engage.sesame_lite.internal.IdHash;
import nova.branch.engage.sesame_lite.internal.IdHash$$serializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class x implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final x f90432a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        x xVar = new x();
        f90432a = xVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.ContactContent", xVar, 5);
        pluginGeneratedSerialDescriptor.addElement("contactId", false);
        pluginGeneratedSerialDescriptor.addElement("idHash", false);
        pluginGeneratedSerialDescriptor.addElement("lookupKey", false);
        pluginGeneratedSerialDescriptor.addElement("iconUri", false);
        pluginGeneratedSerialDescriptor.addElement("label", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{LongSerializer.INSTANCE, IdHash$$serializer.INSTANCE, stringSerializer, q4.f51772a, stringSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        IdHash idHash;
        String str;
        Uri uri;
        String strDecodeStringElement;
        long j11;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        IdHash idHash2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
            IdHash idHash3 = (IdHash) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, IdHash$$serializer.INSTANCE, null);
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
            idHash = idHash3;
            uri = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, q4.f51772a, null);
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 4);
            str = strDecodeStringElement2;
            i5 = 31;
            j11 = jDecodeLongElement;
        } else {
            boolean z11 = true;
            int i11 = 0;
            String strDecodeStringElement3 = null;
            long jDecodeLongElement2 = 0;
            String strDecodeStringElement4 = null;
            Uri uri2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    idHash2 = (IdHash) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, IdHash$$serializer.INSTANCE, idHash2);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    strDecodeStringElement4 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 2);
                    i11 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    uri2 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, q4.f51772a, uri2);
                    i11 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 4);
                    i11 |= 16;
                }
            }
            i5 = i11;
            idHash = idHash2;
            str = strDecodeStringElement4;
            uri = uri2;
            strDecodeStringElement = strDecodeStringElement3;
            j11 = jDecodeLongElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new com.teslacoilsw.launcher.search.hero.d(i5, j11, idHash, str, uri, strDecodeStringElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        com.teslacoilsw.launcher.search.hero.d dVar = (com.teslacoilsw.launcher.search.hero.d) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 0, dVar.f46250b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, IdHash$$serializer.INSTANCE, dVar.f46251c);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 2, dVar.f46252d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, q4.f51772a, dVar.f46253e);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 4, dVar.f46254f);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
