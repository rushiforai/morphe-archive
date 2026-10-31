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

@Metadata(d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0003\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\n\n\u0000\n\u0002\u0010\f\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0003\bf\u0018\u00002\u00020\u0001J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH&J\u0018\u0010\n\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\rH\u0017J \u0010\u000e\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u000bH&J \u0010\u0010\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0011H&J \u0010\u0012\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0013H&J \u0010\u0014\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0015H&J \u0010\u0016\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\rH&J \u0010\u0017\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u0018H&J \u0010\u0019\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u001aH&J \u0010\u001b\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u001cH&J \u0010\u001d\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\u0006\u0010\u000f\u001a\u00020\u001eH&J\u0018\u0010\u001f\u001a\u00020 2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\rH&J?\u0010!\u001a\u00020\u0007\"\n\b\u0000\u0010\"*\u0004\u0018\u00010\u00012\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\f\u0010#\u001a\b\u0012\u0004\u0012\u0002H\"0$2\u0006\u0010\u000f\u001a\u0002H\"H&¢\u0006\u0002\u0010%J?\u0010&\u001a\u00020\u0007\"\b\b\u0000\u0010\"*\u00020\u00012\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\f\u001a\u00020\r2\f\u0010#\u001a\b\u0012\u0004\u0012\u0002H\"0$2\b\u0010\u000f\u001a\u0004\u0018\u0001H\"H'¢\u0006\u0002\u0010%R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005¨\u0006'À\u0006\u0003"}, d2 = {"Lkotlinx/serialization/encoding/CompositeEncoder;", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "endStructure", b.f42142b, "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "shouldEncodeElementDefault", b.f42142b, TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, b.f42142b, "encodeBooleanElement", "value", "encodeByteElement", b.f42142b, "encodeShortElement", b.f42142b, "encodeCharElement", b.f42142b, "encodeIntElement", "encodeLongElement", b.f42142b, "encodeFloatElement", b.f42142b, "encodeDoubleElement", b.f42142b, "encodeStringElement", b.f42142b, "encodeInlineElement", "Lkotlinx/serialization/encoding/Encoder;", "encodeSerializableElement", "T", "serializer", "Lkotlinx/serialization/SerializationStrategy;", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/SerializationStrategy;Ljava/lang/Object;)V", "encodeNullableSerializableElement", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface CompositeEncoder {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @ExperimentalSerializationApi
        @Deprecated
        public static boolean shouldEncodeElementDefault(@NotNull CompositeEncoder compositeEncoder, @NotNull SerialDescriptor descriptor, int i5) {
            Intrinsics.g(descriptor, "descriptor");
            return CompositeEncoder.super.shouldEncodeElementDefault(descriptor, i5);
        }
    }

    void encodeBooleanElement(@NotNull SerialDescriptor descriptor, int index, boolean value);

    void encodeByteElement(@NotNull SerialDescriptor descriptor, int index, byte value);

    void encodeCharElement(@NotNull SerialDescriptor descriptor, int index, char value);

    void encodeDoubleElement(@NotNull SerialDescriptor descriptor, int index, double value);

    void encodeFloatElement(@NotNull SerialDescriptor descriptor, int index, float value);

    @NotNull
    Encoder encodeInlineElement(@NotNull SerialDescriptor descriptor, int index);

    void encodeIntElement(@NotNull SerialDescriptor descriptor, int index, int value);

    void encodeLongElement(@NotNull SerialDescriptor descriptor, int index, long value);

    @ExperimentalSerializationApi
    <T> void encodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull SerializationStrategy<? super T> serializer, @Nullable T value);

    <T> void encodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull SerializationStrategy<? super T> serializer, T value);

    void encodeShortElement(@NotNull SerialDescriptor descriptor, int index, short value);

    void encodeStringElement(@NotNull SerialDescriptor descriptor, int index, @NotNull String value);

    void endStructure(@NotNull SerialDescriptor descriptor);

    @NotNull
    SerializersModule getSerializersModule();

    @ExperimentalSerializationApi
    default boolean shouldEncodeElementDefault(@NotNull SerialDescriptor descriptor, int index) {
        Intrinsics.g(descriptor, "descriptor");
        return true;
    }
}
