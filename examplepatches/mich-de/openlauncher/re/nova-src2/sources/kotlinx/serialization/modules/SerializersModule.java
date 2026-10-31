package kotlinx.serialization.modules;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.DefaultConstructorMarker;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.InternalSerializationApi;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000P\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b6\u0018\u00002\u00020\u0001B\t\b\u0004¢\u0006\u0004\b\u0002\u0010\u0003J(\u0010\u0004\u001a\n\u0012\u0004\u0012\u0002H\u0006\u0018\u00010\u0005\"\b\b\u0000\u0010\u0006*\u00020\u00012\f\u0010\u0007\u001a\b\u0012\u0004\u0012\u0002H\u00060\bH\u0007J<\u0010\u0004\u001a\n\u0012\u0004\u0012\u0002H\u0006\u0018\u00010\u0005\"\b\b\u0000\u0010\u0006*\u00020\u00012\f\u0010\t\u001a\b\u0012\u0004\u0012\u0002H\u00060\b2\u0012\b\u0002\u0010\n\u001a\f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00050\u000bH'J7\u0010\f\u001a\n\u0012\u0004\u0012\u0002H\u0006\u0018\u00010\r\"\b\b\u0000\u0010\u0006*\u00020\u00012\u000e\u0010\u000e\u001a\n\u0012\u0006\b\u0000\u0012\u0002H\u00060\b2\u0006\u0010\u000f\u001a\u0002H\u0006H'¢\u0006\u0002\u0010\u0010J4\u0010\f\u001a\n\u0012\u0004\u0012\u0002H\u0006\u0018\u00010\u0011\"\b\b\u0000\u0010\u0006*\u00020\u00012\u000e\u0010\u000e\u001a\n\u0012\u0006\b\u0000\u0012\u0002H\u00060\b2\b\u0010\u0012\u001a\u0004\u0018\u00010\u0013H'J\u0010\u0010\u0014\u001a\u00020\u00152\u0006\u0010\u0016\u001a\u00020\u0017H'R\u001a\u0010\u0018\u001a\u00020\u00198 X¡\u0004¢\u0006\f\u0012\u0004\b\u001a\u0010\u0003\u001a\u0004\b\u001b\u0010\u001c\u0082\u0001\u0001\u001d¨\u0006\u001e"}, d2 = {"Lkotlinx/serialization/modules/SerializersModule;", b.f42142b, "<init>", "()V", "getContextual", "Lkotlinx/serialization/KSerializer;", "T", "kclass", "Lkotlin/reflect/KClass;", "kClass", "typeArgumentsSerializers", b.f42142b, "getPolymorphic", "Lkotlinx/serialization/SerializationStrategy;", "baseClass", "value", "(Lkotlin/reflect/KClass;Ljava/lang/Object;)Lkotlinx/serialization/SerializationStrategy;", "Lkotlinx/serialization/DeserializationStrategy;", "serializedClassName", b.f42142b, "dumpTo", b.f42142b, "collector", "Lkotlinx/serialization/modules/SerializersModuleCollector;", "hasInterfaceContextualSerializers", b.f42142b, "getHasInterfaceContextualSerializers$kotlinx_serialization_core$annotations", "getHasInterfaceContextualSerializers$kotlinx_serialization_core", "()Z", "Lkotlinx/serialization/modules/SerialModuleImpl;", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes.dex */
public abstract class SerializersModule {
    public /* synthetic */ SerializersModule(DefaultConstructorMarker defaultConstructorMarker) {
        this();
    }

    /* JADX WARN: Multi-variable type inference failed */
    public static KSerializer getContextual$default(SerializersModule serializersModule, KClass kClass, List list, int i5, Object obj) {
        if (obj != null) {
            throw new UnsupportedOperationException("Super calls with default arguments not supported in this target, function: getContextual");
        }
        if ((i5 & 2) != 0) {
            list = EmptyList.f71733a;
        }
        return serializersModule.getContextual(kClass, list);
    }

    @InternalSerializationApi
    public static /* synthetic */ void getHasInterfaceContextualSerializers$kotlinx_serialization_core$annotations() {
    }

    @ExperimentalSerializationApi
    public abstract void dumpTo(@NotNull SerializersModuleCollector collector);

    @Deprecated
    @ExperimentalSerializationApi
    public final KSerializer getContextual(KClass kclass) {
        Intrinsics.g(kclass, "kclass");
        return getContextual(kclass, EmptyList.f71733a);
    }

    @ExperimentalSerializationApi
    @Nullable
    public abstract <T> KSerializer<T> getContextual(@NotNull KClass<T> kClass, @NotNull List<? extends KSerializer<?>> typeArgumentsSerializers);

    public abstract boolean getHasInterfaceContextualSerializers$kotlinx_serialization_core();

    @ExperimentalSerializationApi
    @Nullable
    public abstract <T> DeserializationStrategy<T> getPolymorphic(@NotNull KClass<? super T> baseClass, @Nullable String serializedClassName);

    @ExperimentalSerializationApi
    @Nullable
    public abstract <T> SerializationStrategy<T> getPolymorphic(@NotNull KClass<? super T> baseClass, @NotNull T value);

    private SerializersModule() {
    }
}
