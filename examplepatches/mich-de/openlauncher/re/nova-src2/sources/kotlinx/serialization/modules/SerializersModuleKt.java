package kotlinx.serialization.modules;

import b70.h;
import com.fyber.inneractive.sdk.external.InneractiveMediationNameConsts;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Deprecated;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.modules.ContextualProvider;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000(\n\u0000\n\u0002\u0018\u0002\n\u0002\b\t\n\u0002\u0018\u0002\n\u0002\u0010\u000e\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0000\u001a\u0015\u0010\u0006\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0007\u001a\u00020\u0001H\u0086\u0002\u001a\u0015\u0010\b\u001a\u00020\u0001*\u00020\u00012\u0006\u0010\u0007\u001a\u00020\u0001H\u0086\u0004\"\u001c\u0010\u0000\u001a\u00020\u00018\u0006X\u0087\u0004¢\u0006\u000e\n\u0000\u0012\u0004\b\u0002\u0010\u0003\u001a\u0004\b\u0004\u0010\u0005*\\\b\u0000\u0010\t\u001a\u0004\b\u0000\u0010\n\"'\u0012\u0015\u0012\u0013\u0018\u00010\f¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u000f\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\n\u0018\u00010\u00100\u000b2'\u0012\u0015\u0012\u0013\u0018\u00010\f¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u000f\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\n\u0018\u00010\u00100\u000b*X\b\u0000\u0010\u0011\u001a\u0004\b\u0000\u0010\n\"%\u0012\u0013\u0012\u0011H\n¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u0012\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\n\u0018\u00010\u00130\u000b2%\u0012\u0013\u0012\u0011H\n¢\u0006\f\b\r\u0012\b\b\u000e\u0012\u0004\b\b(\u0012\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\n\u0018\u00010\u00130\u000b¨\u0006\u0014"}, d2 = {"EmptySerializersModule", "Lkotlinx/serialization/modules/SerializersModule;", "getEmptySerializersModule$annotations", "()V", "getEmptySerializersModule", "()Lkotlinx/serialization/modules/SerializersModule;", "plus", InneractiveMediationNameConsts.OTHER, "overwriteWith", "PolymorphicDeserializerProvider", "Base", "Lkotlin/Function1;", b.f42142b, "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "className", "Lkotlinx/serialization/DeserializationStrategy;", "PolymorphicSerializerProvider", "value", "Lkotlinx/serialization/SerializationStrategy;", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SerializersModuleKt {

    @NotNull
    private static final SerializersModule EmptySerializersModule;

    static {
        h hVar = h.f17594a;
        EmptySerializersModule = new SerialModuleImpl(hVar, hVar, hVar, hVar, hVar, false);
    }

    @NotNull
    public static final SerializersModule getEmptySerializersModule() {
        return EmptySerializersModule;
    }

    @Deprecated
    public static /* synthetic */ void getEmptySerializersModule$annotations() {
    }

    @NotNull
    public static final SerializersModule overwriteWith(@NotNull SerializersModule serializersModule, @NotNull SerializersModule other) {
        Intrinsics.g(serializersModule, "<this>");
        Intrinsics.g(other, "other");
        final SerializersModuleBuilder serializersModuleBuilder = new SerializersModuleBuilder();
        serializersModuleBuilder.include(serializersModule);
        other.dumpTo(new SerializersModuleCollector() { // from class: kotlinx.serialization.modules.SerializersModuleKt$overwriteWith$1$1
            @Override // kotlinx.serialization.modules.SerializersModuleCollector
            public <T> void contextual(KClass<T> kClass, KSerializer<T> serializer) {
                Intrinsics.g(kClass, "kClass");
                Intrinsics.g(serializer, "serializer");
                serializersModuleBuilder.registerSerializer(kClass, new ContextualProvider.Argless(serializer), true);
            }

            @Override // kotlinx.serialization.modules.SerializersModuleCollector
            public <Base, Sub extends Base> void polymorphic(KClass<Base> baseClass, KClass<Sub> actualClass, KSerializer<Sub> actualSerializer) {
                Intrinsics.g(baseClass, "baseClass");
                Intrinsics.g(actualClass, "actualClass");
                Intrinsics.g(actualSerializer, "actualSerializer");
                serializersModuleBuilder.registerPolymorphicSerializer(baseClass, actualClass, actualSerializer, true);
            }

            @Override // kotlinx.serialization.modules.SerializersModuleCollector
            public <Base> void polymorphicDefaultDeserializer(KClass<Base> baseClass, Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider) {
                Intrinsics.g(baseClass, "baseClass");
                Intrinsics.g(defaultDeserializerProvider, "defaultDeserializerProvider");
                serializersModuleBuilder.registerDefaultPolymorphicDeserializer(baseClass, defaultDeserializerProvider, true);
            }

            @Override // kotlinx.serialization.modules.SerializersModuleCollector
            public <Base> void polymorphicDefaultSerializer(KClass<Base> baseClass, Function1<? super Base, ? extends SerializationStrategy<? super Base>> defaultSerializerProvider) {
                Intrinsics.g(baseClass, "baseClass");
                Intrinsics.g(defaultSerializerProvider, "defaultSerializerProvider");
                serializersModuleBuilder.registerDefaultPolymorphicSerializer(baseClass, defaultSerializerProvider, true);
            }

            @Override // kotlinx.serialization.modules.SerializersModuleCollector
            public <T> void contextual(KClass<T> kClass, Function1<? super List<? extends KSerializer<?>>, ? extends KSerializer<?>> provider) {
                Intrinsics.g(kClass, "kClass");
                Intrinsics.g(provider, "provider");
                serializersModuleBuilder.registerSerializer(kClass, new ContextualProvider.WithTypeArguments(provider), true);
            }
        });
        return serializersModuleBuilder.build();
    }

    @NotNull
    public static final SerializersModule plus(@NotNull SerializersModule serializersModule, @NotNull SerializersModule other) {
        Intrinsics.g(serializersModule, "<this>");
        Intrinsics.g(other, "other");
        SerializersModuleBuilder serializersModuleBuilder = new SerializersModuleBuilder();
        serializersModuleBuilder.include(serializersModule);
        serializersModuleBuilder.include(other);
        return serializersModuleBuilder.build();
    }
}
