package kotlinx.serialization.json.internal;

import com.instabridge.mobilesdk.internal.data.PendingUpgradeStore;
import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.util.List;
import kotlin.Metadata;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.DeserializationStrategy;
import kotlinx.serialization.KSerializer;
import kotlinx.serialization.SerializationStrategy;
import kotlinx.serialization.descriptors.PolymorphicKind;
import kotlinx.serialization.descriptors.PrimitiveKind;
import kotlinx.serialization.descriptors.SerialDescriptor;
import kotlinx.serialization.descriptors.SerialKind;
import kotlinx.serialization.descriptors.StructureKind;
import kotlinx.serialization.json.ClassDiscriminatorMode;
import kotlinx.serialization.json.JsonConfiguration;
import kotlinx.serialization.modules.SerializersModuleCollector;
import org.jetbrains.annotations.NotNull;

@Metadata(d1 = {"\u0000\\\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0010\u000e\n\u0000\n\u0002\u0010\u000b\n\u0002\b\u0002\n\u0002\u0010\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010 \n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\b\n\n\u0002\u0018\u0002\n\u0002\b\u0004\n\u0002\u0018\u0002\n\u0002\b\u0003\n\u0002\u0018\u0002\n\u0000\b\u0000\u0018\u00002\u00020\u0001B\u000f\u0012\u0006\u0010\u0002\u001a\u00020\u0003¢\u0006\u0004\b\u0004\u0010\u0005JQ\u0010\u000b\u001a\u00020\f\"\b\b\u0000\u0010\r*\u00020\u000e2\f\u0010\u000f\u001a\b\u0012\u0004\u0012\u0002H\r0\u00102/\u0010\u0011\u001a+\u0012\u001d\u0012\u001b\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00140\u0013¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b(\u0017\u0012\b\u0012\u0006\u0012\u0002\b\u00030\u00140\u0012H\u0016JF\u0010\u0018\u001a\u00020\f\"\b\b\u0000\u0010\u0019*\u00020\u000e\"\b\b\u0001\u0010\u001a*\u0002H\u00192\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u0002H\u00190\u00102\f\u0010\u001c\u001a\b\u0012\u0004\u0012\u0002H\u001a0\u00102\f\u0010\u001d\u001a\b\u0012\u0004\u0012\u0002H\u001a0\u0014H\u0016J\u001c\u0010\u001e\u001a\u00020\f2\u0006\u0010\u001f\u001a\u00020 2\n\u0010\u001c\u001a\u0006\u0012\u0002\b\u00030\u0010H\u0002J\u001c\u0010!\u001a\u00020\f2\u0006\u0010\u001f\u001a\u00020 2\n\u0010\u001c\u001a\u0006\u0012\u0002\b\u00030\u0010H\u0002JK\u0010\"\u001a\u00020\f\"\b\b\u0000\u0010\u0019*\u00020\u000e2\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u0002H\u00190\u00102)\u0010#\u001a%\u0012\u0013\u0012\u0011H\u0019¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b($\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\u0019\u0018\u00010%0\u0012H\u0016JM\u0010&\u001a\u00020\f\"\b\b\u0000\u0010\u0019*\u00020\u000e2\f\u0010\u001b\u001a\b\u0012\u0004\u0012\u0002H\u00190\u00102+\u0010'\u001a'\u0012\u0015\u0012\u0013\u0018\u00010\u0007¢\u0006\f\b\u0015\u0012\b\b\u0016\u0012\u0004\b\b((\u0012\f\u0012\n\u0012\u0004\u0012\u0002H\u0019\u0018\u00010)0\u0012H\u0016R\u000e\u0010\u0006\u001a\u00020\u0007X\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\b\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000R\u000e\u0010\n\u001a\u00020\tX\u0082\u0004¢\u0006\u0002\n\u0000¨\u0006*"}, d2 = {"Lkotlinx/serialization/json/internal/JsonSerializersModuleValidator;", "Lkotlinx/serialization/modules/SerializersModuleCollector;", "configuration", "Lkotlinx/serialization/json/JsonConfiguration;", "<init>", "(Lkotlinx/serialization/json/JsonConfiguration;)V", "discriminator", b.f42142b, "useArrayPolymorphism", b.f42142b, "isDiscriminatorRequired", "contextual", b.f42142b, "T", b.f42142b, "kClass", "Lkotlin/reflect/KClass;", "provider", "Lkotlin/Function1;", b.f42142b, "Lkotlinx/serialization/KSerializer;", "Lkotlin/ParameterName;", PendingUpgradeStore.KEY_NAME, "typeArgumentsSerializers", "polymorphic", "Base", "Sub", "baseClass", "actualClass", "actualSerializer", "checkKind", "descriptor", "Lkotlinx/serialization/descriptors/SerialDescriptor;", "checkDiscriminatorCollisions", "polymorphicDefaultSerializer", "defaultSerializerProvider", "value", "Lkotlinx/serialization/SerializationStrategy;", "polymorphicDefaultDeserializer", "defaultDeserializerProvider", "className", "Lkotlinx/serialization/DeserializationStrategy;", "kotlinx-serialization-json"}, k = 1, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class JsonSerializersModuleValidator implements SerializersModuleCollector {

    @NotNull
    private final String discriminator;
    private final boolean isDiscriminatorRequired;
    private final boolean useArrayPolymorphism;

    public JsonSerializersModuleValidator(@NotNull JsonConfiguration configuration) {
        Intrinsics.g(configuration, "configuration");
        this.discriminator = configuration.getClassDiscriminator();
        this.useArrayPolymorphism = configuration.getUseArrayPolymorphism();
        this.isDiscriminatorRequired = configuration.getClassDiscriminatorMode() != ClassDiscriminatorMode.NONE;
    }

    private final void checkDiscriminatorCollisions(SerialDescriptor descriptor, KClass<?> actualClass) {
        int elementsCount = descriptor.getElementsCount();
        for (int i5 = 0; i5 < elementsCount; i5++) {
            String elementName = descriptor.getElementName(i5);
            if (Intrinsics.b(elementName, this.discriminator)) {
                throw new IllegalArgumentException("Polymorphic serializer for " + actualClass + " has property '" + elementName + "' that conflicts with JSON class discriminator. You can either change class discriminator in JsonConfiguration, rename property with @SerialName annotation or fall back to array polymorphism");
            }
        }
    }

    private final void checkKind(SerialDescriptor descriptor, KClass<?> actualClass) {
        SerialKind kind = descriptor.getKind();
        if ((kind instanceof PolymorphicKind) || Intrinsics.b(kind, SerialKind.CONTEXTUAL.INSTANCE)) {
            throw new IllegalArgumentException("Serializer for " + actualClass.getSimpleName() + " can't be registered as a subclass for polymorphic serialization because its kind " + kind + " is not concrete. To work with multiple hierarchies, register it as a base class.");
        }
        if (!this.useArrayPolymorphism && this.isDiscriminatorRequired) {
            if (Intrinsics.b(kind, StructureKind.LIST.INSTANCE) || Intrinsics.b(kind, StructureKind.MAP.INSTANCE) || (kind instanceof PrimitiveKind) || (kind instanceof SerialKind.ENUM)) {
                throw new IllegalArgumentException("Serializer for " + actualClass.getSimpleName() + " of kind " + kind + " cannot be serialized polymorphically with class discriminator.");
            }
        }
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <T> void contextual(@NotNull KClass<T> kClass, @NotNull Function1<? super List<? extends KSerializer<?>>, ? extends KSerializer<?>> provider) {
        Intrinsics.g(kClass, "kClass");
        Intrinsics.g(provider, "provider");
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <Base, Sub extends Base> void polymorphic(@NotNull KClass<Base> baseClass, @NotNull KClass<Sub> actualClass, @NotNull KSerializer<Sub> actualSerializer) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(actualClass, "actualClass");
        Intrinsics.g(actualSerializer, "actualSerializer");
        SerialDescriptor descriptor = actualSerializer.getDescriptor();
        checkKind(descriptor, actualClass);
        if (this.useArrayPolymorphism || !this.isDiscriminatorRequired) {
            return;
        }
        checkDiscriminatorCollisions(descriptor, actualClass);
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <Base> void polymorphicDefaultDeserializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super String, ? extends DeserializationStrategy<? extends Base>> defaultDeserializerProvider) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultDeserializerProvider, "defaultDeserializerProvider");
    }

    @Override // kotlinx.serialization.modules.SerializersModuleCollector
    public <Base> void polymorphicDefaultSerializer(@NotNull KClass<Base> baseClass, @NotNull Function1<? super Base, ? extends SerializationStrategy<? super Base>> defaultSerializerProvider) {
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(defaultSerializerProvider, "defaultSerializerProvider");
    }
}
