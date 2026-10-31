package xr;

import com.stripe.android.financialconnections.model.ManualEntry;
import com.stripe.android.financialconnections.model.ManualEntryMode;
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
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class m implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final m f96229a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        m mVar = new m();
        f96229a = mVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.financialconnections.model.ManualEntry", mVar, 1);
        pluginGeneratedSerialDescriptor.addElement("mode", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{p.f96230e};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        ManualEntryMode manualEntryMode;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i5 = 1;
        ManualEntryMode manualEntryMode2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            manualEntryMode = (ManualEntryMode) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, p.f96230e, null);
        } else {
            boolean z11 = true;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else {
                    if (iDecodeElementIndex != 0) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    manualEntryMode2 = (ManualEntryMode) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, p.f96230e, manualEntryMode2);
                    i11 = 1;
                }
            }
            manualEntryMode = manualEntryMode2;
            i5 = i11;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new ManualEntry(i5, manualEntryMode);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        ManualEntry value = (ManualEntry) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, p.f96230e, value.f42748a);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
