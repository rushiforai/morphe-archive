package db0;

import com.tiktok.util.TTConst;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class n implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final n f49174a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        n nVar = new n();
        f49174a = nVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("rdl.Event.PackageEvent", nVar, 4);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, false);
        pluginGeneratedSerialDescriptor.addElement("pkg", false);
        pluginGeneratedSerialDescriptor.addElement("userId", false);
        pluginGeneratedSerialDescriptor.addElement("timestamp", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{p.f49180f[0], d0.f49139a, longSerializer, longSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        j0 j0Var;
        long jDecodeLongElement;
        long jDecodeLongElement2;
        f0 f0Var;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = p.f49180f;
        int i11 = 0;
        j0 j0Var2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            j0 j0Var3 = (j0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            j0Var = j0Var3;
            f0Var = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0.f49139a, null);
            i5 = 15;
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
            jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
        } else {
            long jDecodeLongElement3 = 0;
            int i12 = 1;
            int i13 = 0;
            f0 f0Var2 = null;
            long jDecodeLongElement4 = 0;
            while (i12 != 0) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                int i14 = i11;
                if (iDecodeElementIndex == -1) {
                    i11 = i14;
                    i12 = i11;
                } else if (iDecodeElementIndex != 0) {
                    if (iDecodeElementIndex == 1) {
                        f0Var2 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0.f49139a, f0Var2);
                        i13 |= 2;
                    } else if (iDecodeElementIndex == 2) {
                        jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
                        i13 |= 4;
                    } else {
                        if (iDecodeElementIndex != 3) {
                            throw new UnknownFieldException(iDecodeElementIndex);
                        }
                        jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
                        i13 |= 8;
                    }
                    i11 = i14;
                } else {
                    j0Var2 = (j0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, i14, kSerializerArr[i14], j0Var2);
                    i13 |= 1;
                    i11 = i14;
                }
            }
            i5 = i13;
            j0Var = j0Var2;
            jDecodeLongElement = jDecodeLongElement3;
            jDecodeLongElement2 = jDecodeLongElement4;
            f0Var = f0Var2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new p(i5, j0Var, f0Var, jDecodeLongElement, jDecodeLongElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        p pVar = (p) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, p.f49180f[0], pVar.f49181b);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, d0.f49139a, f0.a(pVar.f49182c));
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 2, pVar.f49183d);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 3, pVar.f49184e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
