package kotlinx.serialization.internal;

import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.ULong;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.LongCompanionObject;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.builtins.BuiltinSerializersKt;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0015"}, d2 = {"Lkotlinx/serialization/internal/ULongSerializer;", "Lkotlinx/serialization/KSerializer;", "Lkotlin/ULong;", "<init>", "()V", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "serialize-2TYgG_w", "(Lkotlinx/serialization/encoding/Encoder;J)V", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "deserialize-I7RO_PI", "(Lkotlinx/serialization/encoding/Decoder;)J", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes.dex */
public final class ULongSerializer implements KSerializer<ULong> {

    @NotNull
    public static final ULongSerializer INSTANCE = new ULongSerializer();

    @NotNull
    private static final SerialDescriptor descriptor = InlineClassDescriptorKt.InlinePrimitiveDescriptor("kotlin.ULong", BuiltinSerializersKt.serializer(LongCompanionObject.f71857a));

    private ULongSerializer() {
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public /* synthetic */ Object deserialize(Decoder decoder) {
        return new ULong(m395deserializeI7RO_PI(decoder));
    }

    /* renamed from: deserialize-I7RO_PI, reason: not valid java name */
    public long m395deserializeI7RO_PI(@NotNull Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        long jDecodeLong = decoder.decodeInline(getDescriptor()).decodeLong();
        ULong.Companion companion = ULong.f71699b;
        return jDecodeLong;
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public /* synthetic */ void serialize(Encoder encoder, Object obj) {
        m396serialize2TYgG_w(encoder, ((ULong) obj).f71700a);
    }

    /* renamed from: serialize-2TYgG_w, reason: not valid java name */
    public void m396serialize2TYgG_w(@NotNull Encoder encoder, long value) {
        Intrinsics.g(encoder, "encoder");
        encoder.encodeInline(getDescriptor()).encodeLong(value);
    }
}
