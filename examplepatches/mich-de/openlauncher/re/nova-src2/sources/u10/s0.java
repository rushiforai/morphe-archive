package u10;

import kotlin.jvm.internal.Intrinsics;
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
public final /* synthetic */ class s0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final s0 f90423a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        s0 s0Var = new s0();
        f90423a = s0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.ShortcutContent", s0Var, 5);
        pluginGeneratedSerialDescriptor.addElement("packageName", false);
        pluginGeneratedSerialDescriptor.addElement("shortcutId", false);
        pluginGeneratedSerialDescriptor.addElement("userSerial", false);
        pluginGeneratedSerialDescriptor.addElement("idHash", false);
        pluginGeneratedSerialDescriptor.addElement("cardContentType", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        StringSerializer stringSerializer = StringSerializer.INSTANCE;
        return new KSerializer[]{stringSerializer, stringSerializer, LongSerializer.INSTANCE, IdHash$$serializer.INSTANCE, pp.y.f82794a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        String str2;
        IdHash idHash;
        pp.u uVar;
        long j11;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        String strDecodeStringElement = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            String strDecodeStringElement2 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            String strDecodeStringElement3 = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 1);
            long jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
            str = strDecodeStringElement2;
            idHash = (IdHash) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, IdHash$$serializer.INSTANCE, null);
            uVar = (pp.u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, pp.y.f82794a, null);
            i5 = 31;
            str2 = strDecodeStringElement3;
            j11 = jDecodeLongElement;
        } else {
            boolean z11 = true;
            int i11 = 0;
            pp.u uVar2 = null;
            long jDecodeLongElement2 = 0;
            String strDecodeStringElement4 = null;
            IdHash idHash2 = null;
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
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
                    i11 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    idHash2 = (IdHash) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, IdHash$$serializer.INSTANCE, idHash2);
                    i11 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    uVar2 = (pp.u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, pp.y.f82794a, uVar2);
                    i11 |= 16;
                }
            }
            i5 = i11;
            str = strDecodeStringElement;
            str2 = strDecodeStringElement4;
            idHash = idHash2;
            uVar = uVar2;
            j11 = jDecodeLongElement2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new com.teslacoilsw.launcher.search.hero.f(i5, str, str2, j11, idHash, uVar);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        com.teslacoilsw.launcher.search.hero.f fVar = (com.teslacoilsw.launcher.search.hero.f) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        String str = fVar.f46260b;
        pp.u uVar = fVar.f46264f;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 1, fVar.f46261c);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 2, fVar.f46262d);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, IdHash$$serializer.INSTANCE, fVar.f46263e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || !Intrinsics.b(uVar, pp.t.f82774c)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, pp.y.f82794a, uVar);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
