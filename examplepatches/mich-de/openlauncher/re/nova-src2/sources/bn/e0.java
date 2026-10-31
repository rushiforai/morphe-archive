package bn;

import java.util.Map;
import kotlin.Lazy;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes3.dex */
public final /* synthetic */ class e0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final e0 f18182a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        e0 e0Var = new e0();
        f18182a = e0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.google.firebase.sessions.SessionData", e0Var, 3);
        pluginGeneratedSerialDescriptor.addElement("sessionDetails", false);
        pluginGeneratedSerialDescriptor.addElement("backgroundTime", true);
        pluginGeneratedSerialDescriptor.addElement("processDataMap", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{j0.f18232a, BuiltinSerializersKt.getNullable(e1.f18183a), BuiltinSerializersKt.getNullable((KSerializer) g0.f18193d[2].getValue())};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        l0 l0Var;
        g1 g1Var;
        Map map;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        Lazy[] lazyArr = g0.f18193d;
        l0 l0Var2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            l0Var = (l0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, j0.f18232a, null);
            g1Var = (g1) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, e1.f18183a, null);
            map = (Map) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, (DeserializationStrategy) lazyArr[2].getValue(), null);
            i5 = 7;
        } else {
            boolean z11 = true;
            int i11 = 0;
            g1 g1Var2 = null;
            Map map2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    l0Var2 = (l0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, j0.f18232a, l0Var2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    g1Var2 = (g1) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 1, e1.f18183a, g1Var2);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    map2 = (Map) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, (DeserializationStrategy) lazyArr[2].getValue(), map2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            l0Var = l0Var2;
            g1Var = g1Var2;
            map = map2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new g0(i5, l0Var, g1Var, map);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        g0 value = (g0) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        Lazy[] lazyArr = g0.f18193d;
        j0 j0Var = j0.f18232a;
        l0 l0Var = value.f18194a;
        Map map = value.f18196c;
        g1 g1Var = value.f18195b;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, j0Var, l0Var);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 1) || g1Var != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 1, e1.f18183a, g1Var);
        }
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || map != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, (SerializationStrategy) lazyArr[2].getValue(), map);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
