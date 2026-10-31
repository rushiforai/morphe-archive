package kotlinx.serialization.modules;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import h10.y0;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000D\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0010\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\b\u000b\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\bg\u0018\u00002\u00020\u0001J.\u0010\u0002\u001a\u00020\u0003\"\b\b\u0000\u0010\u0004*\u00020\u00012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u0002H\u00040\u00062\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u0002H\u00040\bH\u0016JQ\u0010\u0002\u001a\u00020\u0003\"\b\b\u0000\u0010\u0004*\u00020\u00012\f\u0010\u0005\u001a\b\u0012\u0004\u0012\u0002H\u00040\u00062/\u0010\t\u001a+\u0012\u001d\u0012\u001b\u0012\b\u0012\u0006\u0012\u0002\b\u00030\b0\u000b¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u000e\u0012\b\u0012\u0006\u0012\u0002\b\u00030\b0\nH&JF\u0010\u000f\u001a\u00020\u0003\"\b\b\u0000\u0010\u0010*\u00020\u0001\"\b\b\u0001\u0010\u0011*\u0002H\u00102\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u0002H\u00100\u00062\f\u0010\u0013\u001a\b\u0012\u0004\u0012\u0002H\u00110\u00062\f\u0010\u0014\u001a\b\u0012\u0004\u0012\u0002H\u00110\bH&JK\u0010\u0015\u001a\u00020\u0003\"\b\b\u0000\u0010\u0010*\u00020\u00012\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u0002H\u00100\u00062)\u0010\u0016\u001a%\u0012\u0013\u0012\u0011H\u0010¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u0017\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\u0010\u0018\u00010\u00180\nH&JM\u0010\u0019\u001a\u00020\u0003\"\b\b\u0000\u0010\u0010*\u00020\u00012\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u0002H\u00100\u00062+\u0010\u001a\u001a'\u0012\u0015\u0012\u0013\u0018\u00010\u001b¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u001c\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\u0010\u0018\u00010\u001d0\nH&JM\u0010\u001e\u001a\u00020\u0003\"\b\b\u0000\u0010\u0010*\u00020\u00012\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u0002H\u00100\u00062+\u0010\u001a\u001a'\u0012\u0015\u0012\u0013\u0018\u00010\u001b¢\u0006\f\b\f\u0012\b\b\r\u0012\u0004\b\b(\u001c\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\u0010\u0018\u00010\u001d0\nH\u0017¨\u0006\u001fÀ\u0006\u0003"}, d2 = {"Lkotlinx/serialization/modules/SerializersModuleCollector;", b.f42142b, "contextual", b.f42142b, "T", "kClass", "Lkotlin/reflect/KClass;", "serializer", "Lkotlinx/serialization/KSerializer;", "provider", "Lkotlin/Function1;", b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "typeArgumentsSerializers", "polymorphic", "Base", "Sub", "baseClass", "actualClass", "actualSerializer", "polymorphicDefaultSerializer", "defaultSerializerProvider", "value", "Lkotlinx/serialization/SerializationStrategy;", "polymorphicDefaultDeserializer", "defaultDeserializerProvider", b.f42142b, "className", "Lkotlinx/serialization/DeserializationStrategy;", "polymorphicDefault", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@ExperimentalSerializationApi
/* loaded from: classes5.dex */
public interface SerializersModuleCollector {

    @Metadata(k = 3, mv = {2, 1, 0}, xi = 48)
    public static final class DefaultImpls {
        @Deprecated
        public static <T> void contextual(@NotNull SerializersModuleCollector serializersModuleCollector, @NotNull KClass<T> kClass, @NotNull KSerializer<T> serializer) {
            Intrinsics.g(kClass, "kClass");
            Intrinsics.g(serializer, "serializer");
            SerializersModuleCollector.super.contextual(kClass, serializer);
        }

        @Deprecated
        @Deprecated
        public static <Base> void polymorphicDefault(@NotNull SerializersModuleCollector serializersModuleCollector, @NotNull KClass<Base> baseClass, @NotNull Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider) {
            Intrinsics.g(baseClass, "baseClass");
            Intrinsics.g(defaultDeserializerProvider, "defaultDeserializerProvider");
            SerializersModuleCollector.super.polymorphicDefault(baseClass, defaultDeserializerProvider);
        }
    }

    /* JADX INFO: Access modifiers changed from: private */
    static KSerializer contextual$lambda$0(KSerializer kSerializer, List it) {
        Intrinsics.g(it, "it");
        return kSerializer;
    }

    <T> void contextual(@NotNull KClass<T> kClass, @NotNull Function1<? super List<? extends KSerializer<?>>, ? extends KSerializer<?>> provider);

    default <T> void contextual(@NotNull KClass<T> kClass, @NotNull KSerializer<T> serializer) {
        Intrinsics.g(kClass, "kClass");
        Intrinsics.g(serializer, "serializer");
        contextual(kClass, new y0(serializer, 18));
    }

    <Base, Sub extends Base> void polymorphic(@NotNull KClass<Base> baseClass, @NotNull KClass<Sub> actualClass, @NotNull KSerializer<Sub> actualSerializer);

    @Deprecated
    default <Base> void polymorphicDefault(@NotNull KClass<Base> baseClass, @NotNull Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultDeserializerProvider, "defaultDeserializerProvider");
        polymorphicDefaultDeserializer(baseClass, defaultDeserializerProvider);
    }

    <Base> void polymorphicDefaultDeserializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider);

    <Base> void polymorphicDefaultSerializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super Base, ? extends SerializationStrategy<? super Base>> defaultSerializerProvider);
}
