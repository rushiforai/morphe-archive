package kotlinx.serialization.descriptors;

import b70.c;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.ArrayList;
import java.util.Collection;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.collections.EmptyList;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlinx.serialization.ExperimentalSerializationApi;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.internal.SerialDescriptorForNullable;
import kotlinx.serialization.modules.SerialModuleImpl;
import kotlinx.serialization.modules.SerializersModule;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u001e\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0005\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0010 \n\u0002\b\u0003\u001a\u0016\u0010\u0007\u001a\u0004\u0018\u00010\u0002*\u00020\b2\u0006\u0010\t\u001a\u00020\u0002H\u0007\u001a\u001a\u0010\n\u001a\b\u0012\u0004\u0012\u00020\u00020\u000b*\u00020\b2\u0006\u0010\t\u001a\u00020\u0002H\u0007\u001a\u0018\u0010\f\u001a\u00020\u0002*\u00020\u00022\n\u0010\r\u001a\u0006\u0012\u0002\b\u00030\u0001H\u0000\"$\u0010\u0000\u001a\b\u0012\u0002\b\u0003\u0018\u00010\u0001*\u00020\u00028FX\u0087\u0004¢\u0006\f\u0012\u0004\b\u0003\u0010\u0004\u001a\u0004\b\u0005\u0010\u0006¨\u0006\u000e"}, d2 = {"capturedKClass", "Lkotlin/reflect/KClass;", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "getCapturedKClass$annotations", "(Lkotlinx/serialization/descriptors/SerialDescriptor;)V", "getCapturedKClass", "(Lkotlinx/serialization/descriptors/SerialDescriptor;)Lkotlin/reflect/KClass;", "getContextualDescriptor", "Lkotlinx/serialization/modules/SerializersModule;", "descriptor", "getPolymorphicDescriptors", b.f42142b, "withContext", "context", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class ContextAwareKt {
    @Nullable
    public static final KClass<?> getCapturedKClass(@NotNull SerialDescriptor serialDescriptor) {
        Intrinsics.g(serialDescriptor, "<this>");
        if (serialDescriptor instanceof ContextDescriptor) {
            return ((ContextDescriptor) serialDescriptor).kClass;
        }
        if (serialDescriptor instanceof SerialDescriptorForNullable) {
            return getCapturedKClass(((SerialDescriptorForNullable) serialDescriptor).getOriginal());
        }
        return null;
    }

    @ExperimentalSerializationApi
    public static /* synthetic */ void getCapturedKClass$annotations(SerialDescriptor serialDescriptor) {
    }

    @ExperimentalSerializationApi
    @Nullable
    public static final SerialDescriptor getContextualDescriptor(@NotNull SerializersModule serializersModule, @NotNull SerialDescriptor descriptor) {
        KSerializer contextual$default;
        Intrinsics.g(serializersModule, "<this>");
        Intrinsics.g(descriptor, "descriptor");
        KClass<?> capturedKClass = getCapturedKClass(descriptor);
        if (capturedKClass == null || (contextual$default = SerializersModule.getContextual$default(serializersModule, capturedKClass, null, 2, null)) == null) {
            return null;
        }
        return contextual$default.getDescriptor();
    }

    @ExperimentalSerializationApi
    @NotNull
    public static final List<SerialDescriptor> getPolymorphicDescriptors(@NotNull SerializersModule serializersModule, @NotNull SerialDescriptor descriptor) {
        Intrinsics.g(serializersModule, "<this>");
        Intrinsics.g(descriptor, "descriptor");
        KClass<?> capturedKClass = getCapturedKClass(descriptor);
        if (capturedKClass == null) {
            return EmptyList.f71733a;
        }
        Map<KClass<?>, KSerializer<?>> map = ((SerialModuleImpl) serializersModule).polyBase2Serializers.get(capturedKClass);
        Collection<KSerializer<?>> collectionValues = map != null ? map.values() : null;
        if (collectionValues == null) {
            collectionValues = EmptyList.f71733a;
        }
        Collection<KSerializer<?>> collection = collectionValues;
        ArrayList arrayList = new ArrayList(c.u0(collection, 10));
        Iterator<T> it = collection.iterator();
        while (it.hasNext()) {
            arrayList.add(((KSerializer) it.next()).getDescriptor());
        }
        return arrayList;
    }

    @NotNull
    public static final SerialDescriptor withContext(@NotNull SerialDescriptor serialDescriptor, @NotNull KClass<?> context) {
        Intrinsics.g(serialDescriptor, "<this>");
        Intrinsics.g(context, "context");
        return new ContextDescriptor(serialDescriptor, context);
    }
}
