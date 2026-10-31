package pp;

import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.BooleanSerializer;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class p implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final p f82765a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        p pVar = new p();
        f82765a = pVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("LinkClickEvent", pVar, 3);
        pluginGeneratedSerialDescriptor.addElement("linkOpen", false);
        pluginGeneratedSerialDescriptor.addElement("openLocation", false);
        pluginGeneratedSerialDescriptor.addElement("isContainerFirstResult", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{y.f82794a, x.f82790e[1], BooleanSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        u uVar;
        w wVar;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = x.f82790e;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            uVar = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, y.f82794a, null);
            wVar = (w) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], null);
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
            i5 = 7;
        } else {
            boolean z11 = true;
            boolean zDecodeBooleanElement2 = false;
            u uVar2 = null;
            w wVar2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    uVar2 = (u) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, y.f82794a, uVar2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    wVar2 = (w) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], wVar2);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    zDecodeBooleanElement2 = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 2);
                    i11 |= 4;
                }
            }
            zDecodeBooleanElement = zDecodeBooleanElement2;
            i5 = i11;
            uVar = uVar2;
            wVar = wVar2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new x(i5, uVar, wVar, zDecodeBooleanElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        x value = (x) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = x.f82790e;
        y yVar = y.f82794a;
        u uVar = value.f82791b;
        boolean z11 = value.f82793d;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, yVar, uVar);
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, kSerializerArr[1], value.f82792c);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || z11) {
            compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 2, z11);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] typeParametersSerializers() {
        return GeneratedSerializer.DefaultImpls.typeParametersSerializers(this);
    }
}
