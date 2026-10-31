package kotlinx.serialization.internal;

import b.c0;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import kotlin.time.Duration;
import kotlin.time.DurationKt;
import kotlin.time.DurationUnit;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000.\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\bÁ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u001f\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0002H\u0016¢\u0006\u0004\b\u000e\u0010\u000fJ\u0017\u0010\u0010\u001a\u00020\u00022\u0006\u0010\u0011\u001a\u00020\u0012H\u0016¢\u0006\u0004\b\u0013\u0010\u0014R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0015"}, d2 = {"Lkotlinx/serialization/internal/DurationSerializer;", "Lkotlinx/serialization/KSerializer;", "Lkotlin/time/Duration;", "<init>", "()V", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "serialize-HG0u8IE", "(Lkotlinx/serialization/encoding/Encoder;J)V", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "deserialize-5sfh64U", "(Lkotlinx/serialization/encoding/Decoder;)J", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
/* loaded from: classes.dex */
public final class DurationSerializer implements KSerializer<Duration> {

    @NotNull
    public static final DurationSerializer INSTANCE = new DurationSerializer();

    @NotNull
    private static final SerialDescriptor descriptor = new PrimitiveSerialDescriptor("kotlin.time.Duration", PrimitiveKind.STRING.INSTANCE);

    private DurationSerializer() {
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    public /* synthetic */ Object deserialize(Decoder decoder) {
        return new Duration(m368deserialize5sfh64U(decoder));
    }

    /* renamed from: deserialize-5sfh64U, reason: not valid java name */
    public long m368deserialize5sfh64U(@NotNull Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        Duration.Companion companion = Duration.f72038b;
        String value = decoder.decodeString();
        companion.getClass();
        Intrinsics.g(value, "value");
        try {
            return DurationKt.a(value);
        } catch (IllegalArgumentException e3) {
            throw new IllegalArgumentException(c0.l("Invalid ISO duration string format: '", value, "'."), e3);
        }
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public /* synthetic */ void serialize(Encoder encoder, Object obj) {
        m369serializeHG0u8IE(encoder, ((Duration) obj).f72041a);
    }

    /* renamed from: serialize-HG0u8IE, reason: not valid java name */
    public void m369serializeHG0u8IE(@NotNull Encoder encoder, long value) {
        Intrinsics.g(encoder, "encoder");
        Duration.Companion companion = Duration.f72038b;
        StringBuilder sb2 = new StringBuilder();
        if (value < 0) {
            sb2.append('-');
        }
        sb2.append("PT");
        long jT = value < 0 ? Duration.t(value) : value;
        long jQ = Duration.q(jT, DurationUnit.f72048g);
        boolean z11 = false;
        int iQ = Duration.k(jT) ? 0 : (int) (Duration.q(jT, DurationUnit.f72047f) % 60);
        int iJ = Duration.j(jT);
        int i5 = Duration.i(jT);
        if (Duration.k(value)) {
            jQ = 9999999999999L;
        }
        boolean z12 = jQ != 0;
        boolean z13 = (iJ == 0 && i5 == 0) ? false : true;
        if (iQ != 0 || (z13 && z12)) {
            z11 = true;
        }
        if (z12) {
            sb2.append(jQ);
            sb2.append('H');
        }
        if (z11) {
            sb2.append(iQ);
            sb2.append('M');
        }
        if (z13 || (!z12 && !z11)) {
            Duration.b(sb2, iJ, i5, 9, "S", true);
        }
        encoder.encodeString(sb2.toString());
    }
}
