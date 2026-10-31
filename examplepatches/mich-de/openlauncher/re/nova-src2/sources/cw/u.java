package cw;

import com.stripe.android.ui.core.elements.BacsDebitConfirmSpec;
import com.stripe.android.uicore.elements.IdentifierSpec;
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
public final /* synthetic */ class u implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final u f48317a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        u uVar = new u();
        f48317a = uVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.ui.core.elements.BacsDebitConfirmSpec", uVar, 1);
        pluginGeneratedSerialDescriptor.addElement("apiPath", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{kw.y0.f72733a};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        IdentifierSpec identifierSpec;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        int i5 = 1;
        IdentifierSpec identifierSpec2 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            identifierSpec = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, null);
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
                    identifierSpec2 = (IdentifierSpec) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec2);
                    i11 = 1;
                }
            }
            identifierSpec = identifierSpec2;
            i5 = i11;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new BacsDebitConfirmSpec(i5, identifierSpec);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    /* JADX WARN: Removed duplicated region for block: B:7:0x002b  */
    @Override // kotlinx.serialization.SerializationStrategy
    /*
        Code decompiled incorrectly, please refer to instructions dump.
    */
    public final void serialize(Encoder encoder, Object obj) {
        BacsDebitConfirmSpec value = (BacsDebitConfirmSpec) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        IdentifierSpec identifierSpec = value.f45295a;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        v vVar = BacsDebitConfirmSpec.Companion;
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 0)) {
            compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, kw.y0.f72733a, identifierSpec);
        } else {
            IdentifierSpec.Companion.getClass();
            if (!Intrinsics.b(identifierSpec, IdentifierSpec.D)) {
            }
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
