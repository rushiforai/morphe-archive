package kotlinx.serialization.encoding;

import com.moloco.sdk.xenoss.sdkdevkit.android.adrenderer.internal.vast.k;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import com.tiktok.appevents.edp.TTEDPEventConstants;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000h\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\b\n\u0002\b\u0004\n\u0002\u0010\u0005\n\u0000\n\u0002\u0010\f\n\u0000\n\u0002\u0010\n\n\u0002\b\u0002\n\u0002\u0010\t\n\u0000\n\u0002\u0010\u0007\n\u0000\n\u0002\u0010\u0006\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0005\bf\u0018\u0000 )2\u00020\u0001:\u0001)J\u0010\u0010\u0006\u001a\u00020\u00072\u0006\u0010\b\u001a\u00020\tH&J\b\u0010\n\u001a\u00020\u000bH\u0017J\u0010\u0010\f\u001a\u00020\r2\u0006\u0010\b\u001a\u00020\tH&J\u0010\u0010\u000e\u001a\u00020\r2\u0006\u0010\b\u001a\u00020\tH\u0016J\u0018\u0010\u000f\u001a\u00020\u000b2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u0011\u001a\u00020\u00122\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u0013\u001a\u00020\u00142\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u0015\u001a\u00020\u00162\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u0017\u001a\u00020\r2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u0018\u001a\u00020\u00192\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u001a\u001a\u00020\u001b2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u001c\u001a\u00020\u001d2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010\u001e\u001a\u00020\u001f2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&J\u0018\u0010 \u001a\u00020!2\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\rH&JC\u0010\"\u001a\u0002H#\"\n\b\u0000\u0010#*\u0004\u0018\u00010\u00012\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\r2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H#0%2\n\b\u0002\u0010&\u001a\u0004\u0018\u0001H#H&¢\u0006\u0002\u0010'JE\u0010(\u001a\u0004\u0018\u0001H#\"\b\b\u0000\u0010#*\u00020\u00012\u0006\u0010\b\u001a\u00020\t2\u0006\u0010\u0010\u001a\u00020\r2\u000e\u0010$\u001a\n\u0012\u0006\u0012\u0004\u0018\u0001H#0%2\n\b\u0002\u0010&\u001a\u0004\u0018\u0001H#H'¢\u0006\u0002\u0010'R\u0012\u0010\u0002\u001a\u00020\u0003X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0004\u0010\u0005¨\u0006*À\u0006\u0003"}, d2 = {"Lkotlinx/serialization/encoding/CompositeDecoder;", b.f42142b, "serializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getSerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "endStructure", b.f42142b, "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "decodeSequentially", b.f42142b, "decodeElementIndex", b.f42142b, "decodeCollectionSize", "decodeBooleanElement", TTEDPEventConstants.EDP_EVENT_PROPERTY_INDEX, "decodeByteElement", b.f42142b, "decodeCharElement", b.f42142b, "decodeShortElement", b.f42142b, "decodeIntElement", "decodeLongElement", b.f42142b, "decodeFloatElement", b.f42142b, "decodeDoubleElement", b.f42142b, "decodeStringElement", b.f42142b, "decodeInlineElement", "Lkotlinx/serialization/encoding/Decoder;", "decodeSerializableElement", "T", "deserializer", "Lkotlinx/serialization/DeserializationStrategy;", "previousValue", "(Lkotlinx/serialization/descriptors/SerialDescriptor;ILkotlinx/serialization/DeserializationStrategy;Ljava/lang/Object;)Ljava/lang/Object;", "decodeNullableSerializableElement", k.O, "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public interface CompositeDecoder {

    /* renamed from: Companion, reason: from kotlin metadata */
    @NotNull
    public static final Companion INSTANCE = Companion.$$INSTANCE;
    public static final int DECODE_DONE = -1;
    public static final int UNKNOWN_NAME = -3;

    @Metadata(d1 = {"\u0000\u0014\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010\b\n\u0002\b\u0002\b\u0086\u0003\u0018\u00002\u00020\u0001B\t\b\u0002¢\u0006\u0004\b\u0002\u0010\u0003R\u000e\u0010\u0004\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000R\u000e\u0010\u0006\u001a\u00020\u0005X\u0086T¢\u0006\u0002\n\u0000¨\u0006\u0007"}, d2 = {"Lkotlinx/serialization/encoding/CompositeDecoder$Companion;", b.f42142b, "<init>", "()V", "DECODE_DONE", b.f42142b, "UNKNOWN_NAME", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
    public static final class Companion {
        static final /* synthetic */ Companion $$INSTANCE = new Companion();
        public static final int DECODE_DONE = -1;
        public static final int UNKNOWN_NAME = -3;

        private Companion() {
        }
    }

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        public static int decodeCollectionSize(@NotNull CompositeDecoder compositeDecoder, @NotNull SerialDescriptor descriptor) {
            Intrinsics.g(descriptor, "descriptor");
            return CompositeDecoder.super.decodeCollectionSize(descriptor);
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static boolean decodeSequentially(@NotNull CompositeDecoder compositeDecoder) {
            return CompositeDecoder.super.decodeSequentially();
        }
    }

    static /* synthetic */ Object decodeNullableSerializableElement$default(CompositeDecoder compositeDecoder, SerialDescriptor serialDescriptor, int i5, DeserializationStrategy deserializationStrategy, Object obj, int i11, Object obj2) {
        if (obj2 != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: decodeNullableSerializableElement");
        }
        if ((i11 & 8) != 0) {
            obj = null;
        }
        return compositeDecoder.decodeNullableSerializableElement(serialDescriptor, i5, deserializationStrategy, obj);
    }

    static /* synthetic */ Object decodeSerializableElement$default(CompositeDecoder compositeDecoder, SerialDescriptor serialDescriptor, int i5, DeserializationStrategy deserializationStrategy, Object obj, int i11, Object obj2) {
        if (obj2 != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: decodeSerializableElement");
        }
        if ((i11 & 8) != 0) {
            obj = null;
        }
        return compositeDecoder.decodeSerializableElement(serialDescriptor, i5, deserializationStrategy, obj);
    }

    boolean decodeBooleanElement(@NotNull SerialDescriptor descriptor, int index);

    byte decodeByteElement(@NotNull SerialDescriptor descriptor, int index);

    char decodeCharElement(@NotNull SerialDescriptor descriptor, int index);

    default int decodeCollectionSize(@NotNull SerialDescriptor descriptor) {
        Intrinsics.g(descriptor, "descriptor");
        return -1;
    }

    double decodeDoubleElement(@NotNull SerialDescriptor descriptor, int index);

    int decodeElementIndex(@NotNull SerialDescriptor descriptor);

    float decodeFloatElement(@NotNull SerialDescriptor descriptor, int index);

    @NotNull
    Decoder decodeInlineElement(@NotNull SerialDescriptor descriptor, int index);

    int decodeIntElement(@NotNull SerialDescriptor descriptor, int index);

    long decodeLongElement(@NotNull SerialDescriptor descriptor, int index);

    @ExperimentalSerializationApi
    @Nullable
    <T> T decodeNullableSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue);

    @ExperimentalSerializationApi
    default boolean decodeSequentially() {
        return false;
    }

    <T> T decodeSerializableElement(@NotNull SerialDescriptor descriptor, int index, @NotNull DeserializationStrategy<? extends T> deserializer, @Nullable T previousValue);

    short decodeShortElement(@NotNull SerialDescriptor descriptor, int index);

    @NotNull
    String decodeStringElement(@NotNull SerialDescriptor descriptor, int index);

    void endStructure(@NotNull SerialDescriptor descriptor);

    @NotNull
    SerializersModule getSerializersModule();
}
