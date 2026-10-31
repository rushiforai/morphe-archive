package db0;

import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.InlineClassDescriptor;
import kotlinx.serialization.internal.LongSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final /* synthetic */ class d0 implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final d0 f49139a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        d0 d0Var = new d0();
        f49139a = d0Var;
        InlineClassDescriptor inlineClassDescriptor = new InlineClassDescriptor("rdl.HashedString", d0Var);
        inlineClassDescriptor.addElement("hash", false);
        descriptor = inlineClassDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{LongSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        return new f0(decoder.decodeInline(descriptor).decodeLong());
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        long j11 = ((f0) obj).f49145a;
        Encoder encoderEncodeInline = encoder.encodeInline(descriptor);
        if (encoderEncodeInline == null) {
            return;
        }
        encoderEncodeInline.encodeLong(j11);
    }
}
