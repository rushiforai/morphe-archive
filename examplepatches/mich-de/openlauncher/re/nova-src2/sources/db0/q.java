package db0;

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
public final /* synthetic */ class q implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final q f49186a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        q qVar = new q();
        f49186a = qVar;
        PluginGeneratedSerialDescriptor pluginGeneratedSerialDescriptor = new PluginGeneratedSerialDescriptor("rdl.Event.StartAppFromLauncher", qVar, 4);
        pluginGeneratedSerialDescriptor.addElement("packageName", false);
        pluginGeneratedSerialDescriptor.addElement("className", false);
        pluginGeneratedSerialDescriptor.addElement("userId", false);
        pluginGeneratedSerialDescriptor.addElement("timestamp", false);
        descriptor = pluginGeneratedSerialDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        d0 d0Var = d0.f49139a;
        LongSerializer longSerializer = LongSerializer.INSTANCE;
        return new KSerializer[]{d0Var, d0Var, longSerializer, longSerializer};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        int i5;
        f0 f0Var;
        long jDecodeLongElement;
        f0 f0Var2;
        long jDecodeLongElement2;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeDecoder compositeDecoderBeginStructure = decoder.beginStructure(serialDescriptor);
        f0 f0Var3 = null;
        if (compositeDecoderBeginStructure.decodeSequentially()) {
            d0 d0Var = d0.f49139a;
            f0 f0Var4 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, d0Var, null);
            f0Var2 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0Var, null);
            i5 = 15;
            jDecodeLongElement = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
            f0Var = f0Var4;
            jDecodeLongElement2 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
        } else {
            long jDecodeLongElement3 = 0;
            boolean z11 = true;
            int i11 = 0;
            f0 f0Var5 = null;
            long jDecodeLongElement4 = 0;
            while (z11) {
                int iDecodeElementIndex = compositeDecoderBeginStructure.decodeElementIndex(serialDescriptor);
                if (iDecodeElementIndex == -1) {
                    z11 = false;
                } else if (iDecodeElementIndex == 0) {
                    f0Var3 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 0, d0.f49139a, f0Var3);
                    i11 |= 1;
                } else if (iDecodeElementIndex == 1) {
                    f0Var5 = (f0) compositeDecoderBeginStructure.decodeSerializableElement(serialDescriptor, 1, d0.f49139a, f0Var5);
                    i11 |= 2;
                } else if (iDecodeElementIndex == 2) {
                    jDecodeLongElement3 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 2);
                    i11 |= 4;
                } else {
                    if (iDecodeElementIndex != 3) {
                        throw new UnknownFieldException(iDecodeElementIndex);
                    }
                    jDecodeLongElement4 = compositeDecoderBeginStructure.decodeLongElement(serialDescriptor, 3);
                    i11 |= 8;
                }
            }
            i5 = i11;
            f0Var = f0Var3;
            jDecodeLongElement = jDecodeLongElement3;
            f0Var2 = f0Var5;
            jDecodeLongElement2 = jDecodeLongElement4;
        }
        compositeDecoderBeginStructure.endStructure(serialDescriptor);
        return new s(i5, f0Var, f0Var2, jDecodeLongElement, jDecodeLongElement2);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        s sVar = (s) obj;
        SerialDescriptor serialDescriptor = descriptor;
        CompositeEncoder compositeEncoderBeginStructure = encoder.beginStructure(serialDescriptor);
        r rVar = s.Companion;
        d0 d0Var = d0.f49139a;
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 0, d0Var, f0.a(sVar.f49197b));
        compositeEncoderBeginStructure.encodeSerializableElement(serialDescriptor, 1, d0Var, f0.a(sVar.f49198c));
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 2, sVar.f49199d);
        compositeEncoderBeginStructure.encodeLongElement(serialDescriptor, 3, sVar.f49200e);
        compositeEncoderBeginStructure.endStructure(serialDescriptor);
    }
}
