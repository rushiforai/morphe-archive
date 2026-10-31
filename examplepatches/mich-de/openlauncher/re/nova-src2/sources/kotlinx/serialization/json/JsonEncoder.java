package kotlinx.serialization.json;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.SubclassOptInRequired;
import kotlin.jvm.internal.Intrinsics;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.encoding.CompositeEncoder;
import kotlinx.serialization.encoding.Encoder;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\"\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\bg\u0018\u00002\u00020\u00012\u00020\u0002J\u0010\u0010\u0007\u001a\u00020\b2\u0006\u0010\t\u001a\u00020\nH&R\u0012\u0010\u0003\u001a\u00020\u0004X¦\u0004¢\u0006\u0006\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000bÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/json/JsonEncoder;", "Lkotlinx/serialization/encoding/Encoder;", "Lkotlinx/serialization/encoding/CompositeEncoder;", "json", "Lkotlinx/serialization/json/Json;", "getJson", "()Lkotlinx/serialization/json/Json;", "encodeJsonElement", b.f42142b, "element", "Lkotlinx/serialization/json/JsonElement;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SubclassOptInRequired
/* loaded from: classes.dex */
public interface JsonEncoder extends Encoder, CompositeEncoder {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    /* loaded from: classes5.dex */
    public static final class DefaultImpls {
        @Deprecated
        @NotNull
        public static CompositeEncoder beginCollection(@NotNull JsonEncoder jsonEncoder, @NotNull SerialDescriptor descriptor, int i5) {
            Intrinsics.g(descriptor, "descriptor");
            return JsonEncoder.super.beginCollection(descriptor, i5);
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static void encodeNotNullMark(@NotNull JsonEncoder jsonEncoder) {
            JsonEncoder.super.encodeNotNullMark();
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static <T> void encodeNullableSerializableValue(@NotNull JsonEncoder jsonEncoder, @NotNull SerializationStrategy<? super T> serializer, @Nullable T t6) {
            Intrinsics.g(serializer, "serializer");
            JsonEncoder.super.encodeNullableSerializableValue(serializer, t6);
        }

        @Deprecated
        public static <T> void encodeSerializableValue(@NotNull JsonEncoder jsonEncoder, @NotNull SerializationStrategy<? super T> serializer, T t6) {
            Intrinsics.g(serializer, "serializer");
            JsonEncoder.super.encodeSerializableValue(serializer, t6);
        }

        @ExperimentalSerializationApi
        @Deprecated
        public static boolean shouldEncodeElementDefault(@NotNull JsonEncoder jsonEncoder, @NotNull SerialDescriptor descriptor, int i5) {
            Intrinsics.g(descriptor, "descriptor");
            return JsonEncoder.super.shouldEncodeElementDefault(descriptor, i5);
        }
    }

    void encodeJsonElement(@NotNull JsonElement element);

    @NotNull
    Json getJson();
}
