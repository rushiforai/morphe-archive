package tz;

import kotlin.UInt;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import kotlinx.serialization.internal.GeneratedSerializer;
import kotlinx.serialization.internal.InlineClassDescriptor;
import kotlinx.serialization.internal.UIntSerializer;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final /* synthetic */ class a implements GeneratedSerializer {

    /* renamed from: a, reason: collision with root package name */
    public static final a f90096a;

    @NotNull
    private static final SerialDescriptor descriptor;

    static {
        a aVar = new a();
        f90096a = aVar;
        InlineClassDescriptor inlineClassDescriptor = new InlineClassDescriptor("com.teslacoilsw.launcher.materialyou.ArgbInt", aVar);
        inlineClassDescriptor.addElement("v", false);
        descriptor = inlineClassDescriptor;
    }

    @Override // kotlinx.serialization.internal.GeneratedSerializer
    public final KSerializer[] childSerializers() {
        return new KSerializer[]{UIntSerializer.INSTANCE};
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public final Object deserialize(Decoder decoder) {
        return new c(((UInt) decoder.decodeInline(descriptor).decodeSerializableValue(UIntSerializer.INSTANCE)).f71697a);
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    public final SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public final void serialize(Encoder encoder, Object obj) {
        int i5 = ((c) obj).f90097a;
        Encoder encoderEncodeInline = encoder.encodeInline(descriptor);
        if (encoderEncodeInline == null) {
            return;
        }
        encoderEncodeInline.encodeSerializableValue(UIntSerializer.INSTANCE, new UInt(i5));
    }
}
