package db0;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.UnknownFieldException;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.IntSerializer;
import kotlinx.serialization.internal.LongSerializer;
import kotlinx.serialization.internal.PluginGeneratedSerialDescriptor;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes.dex */
public final /* synthetic */ class d implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d f49138a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d dVar = new d();
        f49138a = dVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("rdl.Event.AppUsage", dVar, 5);
        pluginGeneratedSerialDescriptor.addElement("packageName", false);
        pluginGeneratedSerialDescriptor.addElement("className", false);
        pluginGeneratedSerialDescriptor.addElement("shortcutId", false);
        pluginGeneratedSerialDescriptor.addElement("eventType", false);
        pluginGeneratedSerialDescriptor.addElement("timestamp", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        d0 d0Var = d0.f49139a;
        return new KSerializer[]{d0Var, d0Var, d0Var, IntSerializer.INSTANCE, LongSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        int iDecodeIntElement;
        long jDecodeLongElement;
        f0 f0Var;
        f0 f0Var2;
        f0 f0Var3;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            d0 d0Var = d0.f49139a;
            f0 f0Var4 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, d0Var, null);
            f0 f0Var5 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0Var, null);
            i5 = 31;
            f0Var3 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, d0Var, null);
            iDecodeIntElement = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
            f0Var2 = f0Var5;
            f0Var = f0Var4;
        } else {
            long jDecodeLongElement2 = 0;
            boolean z11 = true;
            int iDecodeIntElement2 = 0;
            f0 f0Var6 = null;
            f0 f0Var7 = null;
            f0 f0Var8 = null;
            i5 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    f0Var6 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, d0.f49139a, f0Var6);
                    i5 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    f0Var7 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0.f49139a, f0Var7);
                    i5 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    f0Var8 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 2, d0.f49139a, f0Var8);
                    i5 |= 4;
                } else if (iDecodeElementIndex == 3) {
                    iDecodeIntElement2 = compositeDecoderBeginStructure.decodeIntElement(serialDescriptor, 3);
                    i5 |= 8;
                } else {
                    if (iDecodeElementIndex != 4) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 4);
                    i5 |= 16;
                }
            }
            iDecodeIntElement = iDecodeIntElement2;
            jDecodeLongElement = jDecodeLongElement2;
            f0Var = f0Var6;
            f0Var2 = f0Var7;
            f0Var3 = f0Var8;
        }
        int i11 = i5;
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new f(i11, f0Var, f0Var2, f0Var3, iDecodeIntElement, jDecodeLongElement);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        f fVar = (f) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        e eVar = f.Companion;
        d0 d0Var = d0.f49139a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, d0Var, f0.a(fVar.f49140b));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, d0Var, f0.a(fVar.f49141c));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 2, d0Var, f0.a(fVar.f49142d));
        compositeEncoderBeginStructure.encodeIntElement(serialDescriptor, 3, fVar.f49143e);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 4, fVar.f49144f);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
