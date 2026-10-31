package kotlinx.serialization.encoding;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0002\b\u0003\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\b\n\u0000\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000e\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\b\u0010\u0006\u001a\u00020\u0007H\u0017J\b\u0010\b\u001a\u00020\u0007H'J\u0010\u0010\t\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000bH&J\u0010\u0010\f\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\rH&J\u0010\u0010\u000e\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u000fH&J\u0010\u0010\u0010\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0011H&J\u0010\u0010\u0012\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0013H&J\u0010\u0010\u0014\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0015H&J\u0010\u0010\u0016\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0017H&J\u0010\u0010\u0018\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u0019H&J\u0010\u0010\u001a\u001a\u00020\u00072\u0006\u0010\n\u001a\u00020\u001bH&J\u0018\u0010\u001c\u001a\u00020\u00072\u0006\u0010\u001d\u001a\u00020\u001e2\u0006\u0010\u001f\u001a\u00020\u0013H&J\u0010\u0010 \u001a\u00020\u00002\u0006\u0010!\u001a\u00020\u001eH&J\u0010\u0010\"\u001a\u00020#2\u0006\u0010!\u001a\u00020\u001eH&J\u0018\u0010$\u001a\u00020#2\u0006\u0010!\u001a\u00020\u001e2\u0006\u0010%\u001a\u00020\u0013H\u0016J/\u0010&\u001a\u00020\u0007\"\n\b\u0000\u0010'*\u0004\u0018\u00010\u00012\f\u0010(\u001a\b\u0012\u0004\u0012\u0002H'0)2\u0006\u0010\n\u001a\u0002H'H\u0016¢\u0006\u0002\u0010*J/\u0010+\u001a\u00020\u0007\"\b\b\u0000\u0010'*\u00020\u00012\f\u0010(\u001a\b\u0012\u0004\u0012\u0002H'0)2\b\u0010\n\u001a\u0004\u0018\u0001H'H\u0017¢\u0006\u0002\u0010*R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005¨\u0006,À\u0006\u0003"}, d2 = {"Lkotlinx/serialization/encoding/Encoder;", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "encodeNotNullMark", b.f42142b, "encodeNull", "encodeBoolean", "value", b.f42142b, "encodeByte", b.f42142b, "encodeShort", b.f42142b, "encodeChar", b.f42142b, "encodeInt", b.f42142b, "encodeLong", b.f42142b, "encodeFloat", b.f42142b, "encodeDouble", b.f42142b, "encodeString", b.f42142b, "encodeEnum", "enumDescriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "encodeInline", "descriptor", "beginStructure", "Lkotlinx/serialization/encoding/CompositeEncoder;", "beginCollection", "collectionSize", "encodeSerializableValue", "T", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V", "encodeNullableSerializableValue", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface Encoder {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        @NotNull
        public static CompositeEncoder beginCollection(@NotNull Encoder encoder, @NotNull SerialDescriptor descriptor, int i5) {
            Intrinsics.g(descriptor, "descriptor");
            return Encoder.super.beginCollection(descriptor, i5);
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static void encodeNotNullMark(@NotNull Encoder encoder) {
            Encoder.super.encodeNotNullMark();
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static <T> void encodeNullableSerializableValue(@NotNull Encoder encoder, @NotNull SerializationStrategy<? super T> serializer, @Nullable T t6) {
            Intrinsics.g(serializer, "serializer");
            Encoder.super.encodeNullableSerializableValue(serializer, t6);
        }

        @Deprecated
        public static <T> void encodeSerializableValue(@NotNull Encoder encoder, @NotNull SerializationStrategy<? super T> serializer, T t6) {
            Intrinsics.g(serializer, "serializer");
            Encoder.super.encodeSerializableValue(serializer, t6);
        }
    }

    @NotNull
    default CompositeEncoder beginCollection(@NotNull SerialDescriptor descriptor, int collectionSize) {
        Intrinsics.g(descriptor, "descriptor");
        return beginStructure(descriptor);
    }

    @NotNull
    CompositeEncoder beginStructure(@NotNull SerialDescriptor descriptor);

    void encodeBoolean(boolean value);

    void encodeByte(byte value);

    void encodeChar(char value);

    void encodeDouble(double value);

    void encodeEnum(@NotNull SerialDescriptor enumDescriptor, int index);

    void encodeFloat(float value);

    @NotNull
    Encoder encodeInline(@NotNull SerialDescriptor descriptor);

    void encodeInt(int value);

    void encodeLong(long value);

    @ExperimentalSerializationApi
    default void encodeNotNullMark() {
    }

    @ExperimentalSerializationApi
    void encodeNull();

    @ExperimentalSerializationApi
    default <T> void encodeNullableSerializableValue(@NotNull SerializationStrategy<? super T> serializer, @Nullable T value) {
        Intrinsics.g(serializer, "serializer");
        if (serializer.getDescriptor().getIsNullable()) {
            encodeSerializableValue(serializer, value);
        } else if (value == null) {
            encodeNull();
        } else {
            encodeNotNullMark();
            encodeSerializableValue(serializer, value);
        }
    }

    /* JADX WARN: Multi-variable type inference failed */
    default <T> void encodeSerializableValue(@NotNull SerializationStrategy<? super T> serializer, T value) {
        Intrinsics.g(serializer, "serializer");
        serializer.serialize(this, value);
    }

    void encodeShort(short value);

    void encodeString(@NotNull String value);

    @NotNull
    SerializersModule getSerializersModule();
}
