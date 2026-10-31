package iw;

import com.tiktok.util.TTConst;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
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
public final /* synthetic */ class d implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d f68126a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d dVar = new d();
        f68126a = dVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("com.stripe.android.uicore.address.CountryAddressSchema", dVar, 3);
        pluginGeneratedSerialDescriptor.addElement(TTConst.TRACK_TYPE, false);
        pluginGeneratedSerialDescriptor.addElement("required", false);
        pluginGeneratedSerialDescriptor.addElement("schema", true);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{BuiltinSerializersKt.getNullable(f.f68127d[0]), BooleanSerializer.INSTANCE, BuiltinSerializersKt.getNullable(g.f68131a)};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        boolean zDecodeBooleanElement;
        int i5;
        m mVar;
        i iVar;
        Intrinsics.g(decoder, "decoder");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        KSerializer[] kSerializerArr = f.f68127d;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            mVar = (m) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, kSerializerArr[0], null);
            zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
            iVar = (i) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, g.f68131a, null);
            i5 = 7;
        } else {
            boolean z11 = true;
            zDecodeBooleanElement = false;
            m mVar2 = null;
            i iVar2 = null;
            int i11 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    mVar2 = (m) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 0, kSerializerArr[0], mVar2);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    zDecodeBooleanElement = compositeDecoderBeginStructure.decodeBooleanElement(serialDescriptor, 1);
                    i11 |= 2;
                } else {
                    if (iDecodeElementIndex != 2) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    iVar2 = (i) compositeDecoderBeginStructure.decodeNullableSerializableElement(serialDescriptor, 2, g.f68131a, iVar2);
                    i11 |= 4;
                }
            }
            i5 = i11;
            mVar = mVar2;
            iVar = iVar2;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new f(i5, mVar, zDecodeBooleanElement, iVar);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        f value = (f) obj;
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        KSerializer kSerializer = f.f68127d[0];
        m mVar = value.f68128a;
        i iVar = value.f68130c;
        compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 0, kSerializer, mVar);
        compositeEncoderBeginStructure.encodeBooleanElement(serialDescriptor, 1, value.f68129b);
        if (compositeEncoderBeginStructure.shouldEncodeElementDefault(serialDescriptor, 2) || iVar != null) {
            compositeEncoderBeginStructure.encodeNullableSerializableElement(serialDescriptor, 2, g.f68131a, iVar);
        }
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
