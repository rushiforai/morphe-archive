package u10;

import com.amplitude.android.migration.DatabaseConstants;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginExceptionsKt;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class u0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final u0 f90425a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        u0 u0Var = new u0();
        f90425a = u0Var;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.teslacoilsw.launcher.search.hero.WeatherHeroCard", u0Var, 1);
        pluginGeneratedSerialDescriptor.addElement(DatabaseConstants.KEY_FIELD, false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{e20.f.f52020a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        String str;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            e20.h hVar = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, null);
            str = hVar != null ? hVar.f52026a : null;
            i5 = 1;
        } else {
            boolean z11 = true;
            i5 = 0;
            String str2 = null;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else {
                    if (iDecodeElementIndex != 0) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    e20.h hVar2 = (e20.h) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, str2 != null ? new e20.h(str2) : null);
                    str2 = hVar2 != null ? hVar2.f52026a : null;
                    i5 = 1;
                }
            }
            str = str2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        if (1 != i5) {
            PluginExceptionsKt.throwMissingFieldException(i5, 1, descriptor);
        }
        return new w0(str, 0);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        v0 v0Var = w0.Companion;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, e20.f.f52020a, new e20.h(((w0) obj).f90373a));
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
