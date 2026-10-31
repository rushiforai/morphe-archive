package kotlinx.serialization.internal;

import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.internal.Intrinsics;
import kotlin.text.HexExtensionsKt;
import kotlin.uuid.ExperimentalUuidApi;
import kotlin.uuid.Uuid;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.Decoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000,\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\bÁ\u0002\u0018\u00002\b\u0012\u0004\u0012\u00020\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0003\u0010\u0004J\u0018\u0010\t\u001a\u00020\n2\u0006\u0010\u000b\u001a\u00020\f2\u0006\u0010\r\u001a\u00020\u0002H\u0016J\u0010\u0010\u000e\u001a\u00020\u00022\u0006\u0010\u000f\u001a\u00020\u0010H\u0016R\u0014\u0010\u0005\u001a\u00020\u0006X\u0096\u0004¢\u0006\b\n\u0000\u001a\u0004\b\u0007\u0010\b¨\u0006\u0011"}, d2 = {"Lkotlinx/serialization/internal/UuidSerializer;", "Lkotlinx/serialization/KSerializer;", "Lkotlin/uuid/Uuid;", "<init>", "()V", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getDescriptor", "()Lkotlinx/serialization/descriptors/SerialDescriptor;", "serialize", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "encoder", "Lkotlinx/serialization/encoding/Encoder;", "value", "deserialize", "decoder", "Lkotlinx/serialization/encoding/Decoder;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@PublishedApi
@ExperimentalUuidApi
/* loaded from: classes.dex */
public final class UuidSerializer implements KSerializer<Uuid> {

    @NotNull
    public static final UuidSerializer INSTANCE = new UuidSerializer();

    @NotNull
    private static final SerialDescriptor descriptor = new PrimitiveSerialDescriptor("kotlin.uuid.Uuid", PrimitiveKind.STRING.INSTANCE);

    private UuidSerializer() {
    }

    @Override // kotlinx.serialization.KSerializer, kotlinx.serialization.SerializationStrategy, kotlinx.serialization.DeserializationStrategy
    @NotNull
    public SerialDescriptor getDescriptor() {
        return descriptor;
    }

    @Override // kotlinx.serialization.DeserializationStrategy
    @NotNull
    public Uuid deserialize(@NotNull Decoder decoder) {
        Intrinsics.g(decoder, "decoder");
        Uuid.Companion companion = Uuid.f72055c;
        String uuidString = decoder.decodeString();
        companion.getClass();
        Intrinsics.g(uuidString, "uuidString");
        if (uuidString.length() != 36) {
            throw new IllegalArgumentException("Expected a 36-char string in the standard uuid format.");
        }
        long jB = HexExtensionsKt.b(0, 8, uuidString);
        kotlin.uuid.b.a(8, uuidString);
        long jB2 = HexExtensionsKt.b(9, 13, uuidString);
        kotlin.uuid.b.a(13, uuidString);
        long jB3 = HexExtensionsKt.b(14, 18, uuidString);
        kotlin.uuid.b.a(18, uuidString);
        long jB4 = HexExtensionsKt.b(19, 23, uuidString);
        kotlin.uuid.b.a(23, uuidString);
        long j11 = (jB << 32) | (jB2 << 16) | jB3;
        long jB5 = HexExtensionsKt.b(24, 36, uuidString) | (jB4 << 48);
        return (j11 == 0 && jB5 == 0) ? Uuid.f72056d : new Uuid(j11, jB5);
    }

    @Override // kotlinx.serialization.SerializationStrategy
    public void serialize(@NotNull Encoder encoder, @NotNull Uuid value) {
        Intrinsics.g(encoder, "encoder");
        Intrinsics.g(value, "value");
        encoder.encodeString(value.toString());
    }
}
