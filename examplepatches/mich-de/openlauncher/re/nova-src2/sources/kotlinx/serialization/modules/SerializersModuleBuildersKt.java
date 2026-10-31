package kotlinx.serialization.modules;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import kotlin.Metadata;
import kotlin.Unit;
import kotlin.jvm.functions.Function1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import kotlin.reflect.KClass;
import kotlinx.serialization.KSerializer;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u00006\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\u0018\u0002\n\u0002\u0010\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0000\u001a,\u0010\u0000\u001a\u00020\u0001\"\b\b\u0000\u0010\u0002*\u00020\u00032\f\u0010\u0004\u001a\b\u0012\u0004\u0012\u0002H\u00020\u00052\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0007\u001a#\u0010\u0000\u001a\u00020\u0001\"\n\b\u0000\u0010\u0002\u0018\u0001*\u00020\u00032\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0007H\u0086\b\u001a%\u0010\b\u001a\u00020\u00012\u0017\u0010\t\u001a\u0013\u0012\u0004\u0012\u00020\u000b\u0012\u0004\u0012\u00020\f0\n¢\u0006\u0002\b\rH\u0086\bø\u0001\u0000\u001a\u0006\u0010\u000e\u001a\u00020\u0001\u001a'\u0010\u000f\u001a\u00020\f\"\n\b\u0000\u0010\u0002\u0018\u0001*\u00020\u0003*\u00020\u000b2\f\u0010\u0006\u001a\b\u0012\u0004\u0012\u0002H\u00020\u0007H\u0086\b\u001a[\u0010\u0010\u001a\u00020\f\"\b\b\u0000\u0010\u0011*\u00020\u0003*\u00020\u000b2\f\u0010\u0012\u001a\b\u0012\u0004\u0012\u0002H\u00110\u00052\u0010\b\u0002\u0010\u0013\u001a\n\u0012\u0004\u0012\u0002H\u0011\u0018\u00010\u00072\u001f\b\u0002\u0010\t\u001a\u0019\u0012\n\u0012\b\u0012\u0004\u0012\u0002H\u00110\u0014\u0012\u0004\u0012\u00020\f0\n¢\u0006\u0002\b\rH\u0086\bø\u0001\u0000\u0082\u0002\u0007\n\u0005\b\u009920\u0001¨\u0006\u0015"}, d2 = {"serializersModuleOf", "Lkotlinx/serialization/modules/SerializersModule;", "T", b.f42142b, "kClass", "Lkotlin/reflect/KClass;", "serializer", "Lkotlinx/serialization/KSerializer;", "SerializersModule", "builderAction", "Lkotlin/Function1;", "Lkotlinx/serialization/modules/SerializersModuleBuilder;", b.f42142b, "Lkotlin/ExtensionFunctionType;", "EmptySerializersModule", "contextual", "polymorphic", "Base", "baseClass", "baseSerializer", "Lkotlinx/serialization/modules/PolymorphicModuleBuilder;", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes.dex */
public final class SerializersModuleBuildersKt {
    @NotNull
    public static final SerializersModule EmptySerializersModule() {
        return SerializersModuleKt.getEmptySerializersModule();
    }

    @NotNull
    public static final SerializersModule SerializersModule(@NotNull Function1<? super SerializersModuleBuilder, Unit> builderAction) {
        Intrinsics.g(builderAction, "builderAction");
        SerializersModuleBuilder serializersModuleBuilder = new SerializersModuleBuilder();
        builderAction.invoke(serializersModuleBuilder);
        return serializersModuleBuilder.build();
    }

    public static final <T> void contextual(SerializersModuleBuilder serializersModuleBuilder, KSerializer<T> serializer) {
        Intrinsics.g(serializersModuleBuilder, "<this>");
        Intrinsics.g(serializer, "serializer");
        Intrinsics.k();
        throw null;
    }

    public static final <Base> void polymorphic(@NotNull SerializersModuleBuilder serializersModuleBuilder, @NotNull KClass<Base> baseClass, @Nullable KSerializer<Base> kSerializer, @NotNull Function1<? super PolymorphicModuleBuilder<? super Base>, Unit> builderAction) {
        Intrinsics.g(serializersModuleBuilder, "<this>");
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(builderAction, "builderAction");
        PolymorphicModuleBuilder polymorphicModuleBuilder = new PolymorphicModuleBuilder(baseClass, kSerializer);
        builderAction.invoke(polymorphicModuleBuilder);
        polymorphicModuleBuilder.buildTo(serializersModuleBuilder);
    }

    public static /* synthetic */ void polymorphic$default(SerializersModuleBuilder serializersModuleBuilder, KClass baseClass, KSerializer kSerializer, Function1 builderAction, int i5, Object obj) {
        if ((i5 & 2) != 0) {
            kSerializer = null;
        }
        if ((i5 & 4) != 0) {
            builderAction = new Function1() { // from class: kotlinx.serialization.modules.SerializersModuleBuildersKt.polymorphic.1
                public final void invoke(PolymorphicModuleBuilder polymorphicModuleBuilder) {
                    Intrinsics.g(polymorphicModuleBuilder, "<this>");
                }

                @Override // kotlin.jvm.functions.Function1
                public /* bridge */ /* synthetic */ Object invoke(Object obj2) {
                    invoke((PolymorphicModuleBuilder) obj2);
                    return Unit.f71706a;
                }
            };
        }
        Intrinsics.g(serializersModuleBuilder, "<this>");
        Intrinsics.g(baseClass, "baseClass");
        Intrinsics.g(builderAction, "builderAction");
        PolymorphicModuleBuilder polymorphicModuleBuilder = new PolymorphicModuleBuilder(baseClass, kSerializer);
        builderAction.invoke(polymorphicModuleBuilder);
        polymorphicModuleBuilder.buildTo(serializersModuleBuilder);
    }

    public static final <T> SerializersModule serializersModuleOf(KSerializer<T> serializer) {
        Intrinsics.g(serializer, "serializer");
        Intrinsics.k();
        throw null;
    }

    @NotNull
    public static final <T> SerializersModule serializersModuleOf(@NotNull KClass<T> kClass, @NotNull KSerializer<T> serializer) {
        Intrinsics.g(kClass, "kClass");
        Intrinsics.g(serializer, "serializer");
        SerializersModuleBuilder serializersModuleBuilder = new SerializersModuleBuilder();
        serializersModuleBuilder.contextual(kClass, serializer);
        return serializersModuleBuilder.build();
    }
}
