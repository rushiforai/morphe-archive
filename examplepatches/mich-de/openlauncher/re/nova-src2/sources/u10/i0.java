package u10;

import android.net.Uri;
import e10.q4;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import kotlinx.serialization.internal.StringSerializer;
import nova.branch.engage.sesame_lite.internal.IdHash;
import nova.branch.engage.sesame_lite.internal.IdHash$$serializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class i0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final i0 f90383a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        i0 i0Var = new i0();
        f90383a = i0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.IntentContent", i0Var, 5);
        pluginGeneratedSerialDescriptor.addElement("label", false);
        pluginGeneratedSerialDescriptor.addElement("iconUri", false);
        pluginGeneratedSerialDescriptor.addElement("intent", false);
        pluginGeneratedSerialDescriptor.addElement("idHash", false);
        pluginGeneratedSerialDescriptor.addElement("cardContentType", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{StringSerializer.INSTANCE, q4.f51772a, k0.f90390a, IdHash$$serializer.INSTANCE, pp.y.f82794a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        String strDecodeStringElement;
        IdHash idHash;
        pp.u uVar;
        String str;
        Uri uri;
        int i5;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
            Uri uri2 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, q4.f51772a, null);
            m0 m0Var = (m0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, k0.f90390a, null);
            String str2 = m0Var != null ? m0Var.f90398a : null;
            idHash = (IdHash) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 3, IdHash$$serializer.INSTANCE, null);
            uVar = (pp.u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 4, pp.y.f82794a, null);
            str = str2;
            uri = uri2;
            i5 = 31;
        } else {
            boolean z11 = true;
            int i11 = 0;
            strDecodeStringElement = null;
            IdHash idHash2 = null;
            pp.u uVar2 = null;
            String str3 = null;
            Uri uri3 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    strDecodeStringElement = compositeDecoderBeginStructure.decodeStringElement(serialDescriptor, 0);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    uri3 = (Uri) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, q4.f51772a, uri3);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    m0 m0Var2 = (m0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, k0.f90390a, str3 != null ? new m0(str3) : null);
                    str3 = m0Var2 != null ? m0Var2.f90398a : null;
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
            idHash = idHash2;
            uVar = uVar2;
            str = str3;
            uri = uri3;
            i5 = i11;
        }
        String str4 = strDecodeStringElement;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new com.teslacoilsw.launcher.search.hero.e(i5, str4, uri, str, idHash, uVar);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        com.teslacoilsw.launcher.search.hero.e eVar = (com.teslacoilsw.launcher.search.hero.e) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        String str = eVar.f46255b;
        pp.u uVar = eVar.f46259f;
        compositeEncoderBeginStructure.encodeStringElement(serialDescriptor, 0, str);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, q4.f51772a, eVar.f46256c);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, k0.f90390a, new m0(eVar.f46257d));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 3, IdHash$$serializer.INSTANCE, eVar.f46258e);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 4) || !Intrinsics.b(uVar, pp.r.f82773j)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 4, pp.y.f82794a, uVar);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
