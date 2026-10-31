package kotlinx.serialization.modules;

import b70.g;
import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import kotlin.Metadata;
import kotlin.PublishedApi;
import kotlin.jvm.JvmName;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.internal.PlatformKt;
import kotlinx.serialization.modules.ContextualProvider;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000j\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010%\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u000b\n\u0000\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0002\b\u0003\n\u0002\u0010 \n\u0002\b\u000e\n\u0002\u0018\u0002\n\u0002\b\n\u0018\u00002\u00020\u0001B\t\b\u0001¢\u0006\u0004\b\u0002\u0010\u0003J.\u0010\u0018\u001a\u00020\u0019\"\b\b\u0000\u0010\u001a*\u00020\u001b2\f\u0010\u001c\u001a\b\u0012\u0004\u0012\u0002H\u001a0\u00062\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u0002H\u001a0\tH\u0016JQ\u0010\u0018\u001a\u00020\u0019\"\b\b\u0000\u0010\u001a*\u00020\u001b2\f\u0010\u001c\u001a\b\u0012\u0004\u0012\u0002H\u001a0\u00062/\u0010\u001e\u001a+\u0012\u001d\u0012\u001b\u0012\b\u0012\u0006\u0012\u0002\b\u00030\t0\u001f¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b( \u0012\b\u0012\u0006\u0012\u0002\b\u00030\t0\u000bH\u0016JF\u0010!\u001a\u00020\u0019\"\b\b\u0000\u0010\"*\u00020\u001b\"\b\b\u0001\u0010#*\u0002H\"2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H\"0\u00062\f\u0010%\u001a\b\u0012\u0004\u0012\u0002H#0\u00062\f\u0010&\u001a\b\u0012\u0004\u0012\u0002H#0\tH\u0016JK\u0010'\u001a\u00020\u0019\"\b\b\u0000\u0010\"*\u00020\u001b2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H\"0\u00062)\u0010(\u001a%\u0012\u0013\u0012\u0011H\"¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b()\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\"\u0018\u00010\f0\u000bH\u0016JM\u0010*\u001a\u00020\u0019\"\b\b\u0000\u0010\"*\u00020\u001b2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H\"0\u00062+\u0010+\u001a'\u0012\u0015\u0012\u0013\u0018\u00010\u000f¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(\u0013\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\"\u0018\u00010\u00140\u000bH\u0016J\u000e\u0010,\u001a\u00020\u00192\u0006\u0010-\u001a\u00020.J2\u0010/\u001a\u00020\u0019\"\b\b\u0000\u0010\u001a*\u00020\u001b2\f\u00100\u001a\b\u0012\u0004\u0012\u0002H\u001a0\u00062\u0006\u0010\u001e\u001a\u00020\u00072\b\b\u0002\u00101\u001a\u00020\u0017H\u0001JS\u00102\u001a\u00020\u0019\"\b\b\u0000\u0010\"*\u00020\u001b2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H\"0\u00062)\u0010(\u001a%\u0012\u0013\u0012\u0011H\"¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b()\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\"\u0018\u00010\f0\u000b2\u0006\u00101\u001a\u00020\u0017H\u0001JU\u00103\u001a\u00020\u0019\"\b\b\u0000\u0010\"*\u00020\u001b2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H\"0\u00062+\u0010+\u001a'\u0012\u0015\u0012\u0013\u0018\u00010\u000f¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(\u0013\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\"\u0018\u00010\u00140\u000b2\u0006\u00101\u001a\u00020\u0017H\u0001JP\u00104\u001a\u00020\u0019\"\b\b\u0000\u0010\"*\u00020\u001b\"\b\b\u0001\u0010#*\u0002H\"2\f\u0010$\u001a\b\u0012\u0004\u0012\u0002H\"0\u00062\f\u00105\u001a\b\u0012\u0004\u0012\u0002H#0\u00062\f\u00106\u001a\b\u0012\u0004\u0012\u0002H#0\t2\b\b\u0002\u00101\u001a\u00020\u0017H\u0001J\b\u00107\u001a\u00020.H\u0001R\u001e\u0010\u0004\u001a\u0012\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0006\u0012\u0004\u0012\u00020\u00070\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R2\u0010\b\u001a&\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0006\u0012\u0018\u0012\u0016\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0006\u0012\b\u0012\u0006\u0012\u0002\b\u00030\t0\u00050\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R6\u0010\n\u001a*\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0006\u0012\u001c\u0012\u001a\u0012\u0002\b\u0003\u0012\n\u0012\b\u0012\u0002\b\u0003\u0018\u00010\f0\u000bj\u0006\u0012\u0002\b\u0003`\r0\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R.\u0010\u000e\u001a\"\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0006\u0012\u0014\u0012\u0012\u0012\u0004\u0012\u00020\u000f\u0012\b\u0012\u0006\u0012\u0002\b\u00030\t0\u00050\u0005X\u0082\u0004¢\u0006\u0002\n\u0000RI\u0010\u0010\u001a=\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u0006\u0012/\u0012-\u0012\u0015\u0012\u0013\u0018\u00010\u000f¢\u0006\f\b\u0011\u0012\b\b\u0012\u0012\u0004\b\b(\u0013\u0012\n\u0012\b\u0012\u0002\b\u0003\u0018\u00010\u00140\u000bj\u0006\u0012\u0002\b\u0003`\u00150\u0005X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\u0016\u001a\u00020\u0017X\u0082\u000e¢\u0006\u0002\n\u0000¨\u00068"}, d2 = {"Lkotlinx/serialization/modules/SerializersModuleBuilder;", "Lkotlinx/serialization/modules/SerializersModuleCollector;", "<init>", "()V", "class2ContextualProvider", b.f42142b, "Lkotlin/reflect/KClass;", "Lkotlinx/serialization/modules/ContextualProvider;", "polyBase2Serializers", "Lkotlinx/serialization/KSerializer;", "polyBase2DefaultSerializerProvider", "Lkotlin/Function1;", "Lkotlinx/serialization/SerializationStrategy;", "Lkotlinx/serialization/modules/PolymorphicSerializerProvider;", "polyBase2NamedSerializers", b.f42142b, "polyBase2DefaultDeserializerProvider", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "className", "Lkotlinx/serialization/DeserializationStrategy;", "Lkotlinx/serialization/modules/PolymorphicDeserializerProvider;", "hasInterfaceContextualSerializers", b.f42142b, "contextual", b.f42142b, "T", b.f42142b, "kClass", "serializer", "provider", b.f42142b, "typeArgumentsSerializers", "polymorphic", "Base", "Sub", "baseClass", "actualClass", "actualSerializer", "polymorphicDefaultSerializer", "defaultSerializerProvider", "value", "polymorphicDefaultDeserializer", "defaultDeserializerProvider", "include", "module", "Lkotlinx/serialization/modules/SerializersModule;", "registerSerializer", "forClass", "allowOverwrite", "registerDefaultPolymorphicSerializer", "registerDefaultPolymorphicDeserializer", "registerPolymorphicSerializer", "concreteClass", "concreteSerializer", "build", "kotlinx-serialization-core"}, k = 1, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes5.dex */
public final class SerializersModuleBuilder implements SerializersModuleCollector {
    private boolean hasInterfaceContextualSerializers;

    @NotNull
    private final Map<KClass<?>, ContextualProvider> class2ContextualProvider = new HashMap();

    @NotNull
    private final Map<KClass<?>, Map<KClass<?>, KSerializer<?>>> polyBase2Serializers = new HashMap();

    @NotNull
    private final Map<KClass<?>, Function1<?, SerializationStrategy<?>>> polyBase2DefaultSerializerProvider = new HashMap();

    @NotNull
    private final Map<KClass<?>, Map<String, KSerializer<?>>> polyBase2NamedSerializers = new HashMap();

    @NotNull
    private final Map<KClass<?>, Function1<String, DeserializationStrategy<?>>> polyBase2DefaultDeserializerProvider = new HashMap();

    @PublishedApi
    public SerializersModuleBuilder() {
    }

    public static /* synthetic */ void registerPolymorphicSerializer$default(SerializersModuleBuilder serializersModuleBuilder, KClass kClass, KClass kClass2, KSerializer kSerializer, boolean z11, int i5, Object obj) {
        if ((i5 & 8) != 0) {
            z11 = false;
        }
        serializersModuleBuilder.registerPolymorphicSerializer(kClass, kClass2, kSerializer, z11);
    }

    public static /* synthetic */ void registerSerializer$default(SerializersModuleBuilder serializersModuleBuilder, KClass kClass, ContextualProvider contextualProvider, boolean z11, int i5, Object obj) {
        if ((i5 & 4) != 0) {
            z11 = false;
        }
        serializersModuleBuilder.registerSerializer(kClass, contextualProvider, z11);
    }

    @PublishedApi
    @NotNull
    public final SerializersModule build() {
        return new SerialModuleImpl(this.class2ContextualProvider, this.polyBase2Serializers, this.polyBase2DefaultSerializerProvider, this.polyBase2NamedSerializers, this.polyBase2DefaultDeserializerProvider, this.hasInterfaceContextualSerializers);
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <T> void contextual(@NotNull KClass<T> kClass, @NotNull KSerializer<T> serializer) {
        Intrinsics.g(kClass, "kClass");
        Intrinsics.g(serializer, "serializer");
        registerSerializer$default(this, kClass, new ContextualProvider.Argless(serializer), false, 4, null);
    }

    public final void include(@NotNull SerializersModule module) {
        Intrinsics.g(module, "module");
        module.dumpTo(this);
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <Base, Sub extends Base> void polymorphic(@NotNull KClass<Base> baseClass, @NotNull KClass<Sub> actualClass, @NotNull KSerializer<Sub> actualSerializer) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(actualClass, "actualClass");
        Intrinsics.g(actualSerializer, "actualSerializer");
        registerPolymorphicSerializer$default(this, baseClass, actualClass, actualSerializer, false, 8, null);
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <Base> void polymorphicDefaultDeserializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultDeserializerProvider, "defaultDeserializerProvider");
        registerDefaultPolymorphicDeserializer(baseClass, defaultDeserializerProvider, false);
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <Base> void polymorphicDefaultSerializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super Base, ? extends SerializationStrategy<? super Base>> defaultSerializerProvider) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultSerializerProvider, "defaultSerializerProvider");
        registerDefaultPolymorphicSerializer(baseClass, defaultSerializerProvider, false);
    }

    @JvmName
    public final <Base> void registerDefaultPolymorphicDeserializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider, boolean allowOverwrite) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultDeserializerProvider, "defaultDeserializerProvider");
        Function1<String, DeserializationStrategy<?>> function1 = this.polyBase2DefaultDeserializerProvider.get(baseClass);
        if (function1 == null || function1.equals(defaultDeserializerProvider) || allowOverwrite) {
            this.polyBase2DefaultDeserializerProvider.put(baseClass, defaultDeserializerProvider);
            return;
        }
        throw new IllegalArgumentException("Default deserializers provider for " + baseClass + " is already registered: " + function1);
    }

    @JvmName
    public final <Base> void registerDefaultPolymorphicSerializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super Base, ? extends SerializationStrategy<? super Base>> defaultSerializerProvider, boolean allowOverwrite) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultSerializerProvider, "defaultSerializerProvider");
        Function1<?, SerializationStrategy<?>> function1 = this.polyBase2DefaultSerializerProvider.get(baseClass);
        if (function1 == null || function1.equals(defaultSerializerProvider) || allowOverwrite) {
            this.polyBase2DefaultSerializerProvider.put(baseClass, defaultSerializerProvider);
            return;
        }
        throw new IllegalArgumentException("Default serializers provider for " + baseClass + " is already registered: " + function1);
    }

    @JvmName
    public final <Base, Sub extends Base> void registerPolymorphicSerializer(@NotNull KClass<Base> baseClass, @NotNull KClass<Sub> concreteClass, @NotNull KSerializer<Sub> concreteSerializer, boolean allowOverwrite) {
        Object next;
        KClass kClass;
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(concreteClass, "concreteClass");
        Intrinsics.g(concreteSerializer, "concreteSerializer");
        String serialName = concreteSerializer.getDescriptor().getSerialName();
        Map<KClass<?>, Map<KClass<?>, KSerializer<?>>> map = this.polyBase2Serializers;
        Map<KClass<?>, KSerializer<?>> map2 = map.get(baseClass);
        if (map2 == null) {
            map2 = new HashMap<>();
            map.put(baseClass, map2);
        }
        Map<KClass<?>, KSerializer<?>> map3 = map2;
        Map<KClass<?>, Map<String, KSerializer<?>>> map4 = this.polyBase2NamedSerializers;
        Map<String, KSerializer<?>> map5 = map4.get(baseClass);
        if (map5 == null) {
            map5 = new HashMap<>();
            map4.put(baseClass, map5);
        }
        Map<String, KSerializer<?>> map6 = map5;
        KSerializer<?> kSerializer = map3.get(concreteClass);
        if (kSerializer != null && !kSerializer.equals(concreteSerializer)) {
            if (!allowOverwrite) {
                throw new SerializerAlreadyRegisteredException(baseClass, concreteClass);
            }
            map6.remove(kSerializer.getDescriptor().getSerialName());
        }
        KSerializer<?> kSerializer2 = map6.get(serialName);
        if (kSerializer2 != null && !kSerializer2.equals(concreteSerializer)) {
            Iterator it = g.M0(map3.entrySet()).f71731a.iterator();
            while (true) {
                if (!it.hasNext()) {
                    next = null;
                    break;
                } else {
                    next = it.next();
                    if (((Map.Entry) next).getValue() == kSerializer2) {
                        break;
                    }
                }
            }
            Map.Entry entry = (Map.Entry) next;
            if (entry == null || (kClass = (KClass) entry.getKey()) == null) {
                throw new IllegalStateException(("Name " + serialName + " is registered in the module but no Kotlin class is associated with it.").toString());
            }
            if (!allowOverwrite) {
                throw new IllegalArgumentException("Multiple polymorphic serializers in a scope of '" + baseClass + "' have the same serial name '" + serialName + "': " + concreteSerializer + " for '" + concreteClass + "' and " + kSerializer2 + " for '" + kClass + '\'');
            }
            map3.remove(kClass);
        }
        map3.put(concreteClass, concreteSerializer);
        map6.put(serialName, concreteSerializer);
    }

    @JvmName
    public final <T> void registerSerializer(@NotNull KClass<T> forClass, @NotNull ContextualProvider provider, boolean allowOverwrite) {
        ContextualProvider contextualProvider;
        Intrinsics.g(forClass, "forClass");
        Intrinsics.g(provider, "provider");
        if (!allowOverwrite && (contextualProvider = this.class2ContextualProvider.get(forClass)) != null && !contextualProvider.equals(provider)) {
            throw new SerializerAlreadyRegisteredException("Contextual serializer or serializer provider for " + forClass + " already registered in this module");
        }
        this.class2ContextualProvider.put(forClass, provider);
        if (PlatformKt.isInterface(forClass)) {
            this.hasInterfaceContextualSerializers = true;
        }
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <T> void contextual(@NotNull KClass<T> kClass, @NotNull Function1<? super List<? extends KSerializer<?>>, ? extends KSerializer<?>> provider) {
        Intrinsics.g(kClass, "kClass");
        Intrinsics.g(provider, "provider");
        registerSerializer$default(this, kClass, new ContextualProvider.WithTypeArguments(provider), false, 4, null);
    }
}
