package kotlinx.serialization.json;

import kotlin.Metadata;
import kotlin.SubclassOptInRequired;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeDecoder;
import kotlinx.serialization.encoding.Decoder;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\bg\u0018\u00002\u00020\u00012\u00020\u0002J\b\u0010\u0007\u001a\u00020\bH&R\u0012\u0010\u0003\u001a\u00020\u0004X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006¨\u0006\tÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/json/JsonDecoder;", "Lkotlinx/serialization/encoding/Decoder;", "Lkotlinx/serialization/encoding/CompositeDecoder;", "json", "Lkotlinx/serialization/json/Json;", "getJson", "()Lkotlinx/serialization/json/Json;", "decodeJsonElement", "Lkotlinx/serialization/json/JsonElement;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SubclassOptInRequired
/* loaded from: classes.dex */
public interface JsonDecoder extends Decoder, CompositeDecoder {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        public static int decodeCollectionSize(@NotNull JsonDecoder jsonDecoder, @NotNull SerialDescriptor descriptor) {
            Intrinsics.g(descriptor, "descriptor");
            return JsonDecoder.super.decodeCollectionSize(descriptor);
        }

        @ExperimentalSerializationApi
        @Deprecated
        @Nullable
        public static <T> T decodeNullableSerializableValue(@NotNull JsonDecoder jsonDecoder, @NotNull DeserializationStrategy<? extends T> deserializer) {
            Intrinsics.g(deserializer, "deserializer");
            return (T) JsonDecoder.super.decodeNullableSerializableValue(deserializer);
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static boolean decodeSequentially(@NotNull JsonDecoder jsonDecoder) {
            return JsonDecoder.super.decodeSequentially();
        }

        @Deprecated
        public static <T> T decodeSerializableValue(@NotNull JsonDecoder jsonDecoder, @NotNull DeserializationStrategy<? extends T> deserializer) {
            Intrinsics.g(deserializer, "deserializer");
            return (T) JsonDecoder.super.decodeSerializableValue(deserializer);
        }
    }

    @NotNull
    JsonElement decodeJsonElement();

    @NotNull
    Json getJson();
}
