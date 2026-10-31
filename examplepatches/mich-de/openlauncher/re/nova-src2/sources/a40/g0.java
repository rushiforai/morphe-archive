package a40;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class g0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final g0 f201a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        g0 g0Var = new g0();
        f201a = g0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.weather.AccuWeatherTemperature", g0Var, 2);
        pluginGeneratedSerialDescriptor.addElement("Metric", false);
        pluginGeneratedSerialDescriptor.addElement("Imperial", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        j0 j0Var = j0.f208a;
        return new KSerializer[]{j0Var, j0Var};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        l0 l0Var;
        l0 l0Var2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        l0 l0Var3 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            j0 j0Var = j0.f208a;
            l0Var = (l0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, j0Var, null);
            l0Var2 = (l0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, j0Var, null);
            i5 = 3;
        } else {
            boolean z11 = true;
            int i11 = 0;
            l0 l0Var4 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    l0Var3 = (l0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, j0.f208a, l0Var3);
                    i11 |= 1;
                } else {
                    if (iDecodeElementIndex != 1) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    l0Var4 = (l0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, j0.f208a, l0Var4);
                    i11 |= 2;
                }
            }
            i5 = i11;
            l0Var = l0Var3;
            l0Var2 = l0Var4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new i0(i5, l0Var, l0Var2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        i0 i0Var = (i0) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        j0 j0Var = j0.f208a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, j0Var, i0Var.f206a);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, j0Var, i0Var.f207b);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
