package kotlinx.serialization.internal;

import b.c0;
import h6.c1;
import kotlin.KotlinNothingValueException;
import kotlin.Metadata;
import kotlin.jvm.JvmName;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.KClass;
import kotlinx.serialization.SerializationException;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000\u0016\n\u0000\n\u0002\u0010\u0001\n\u0000\n\u0002\u0010\u000e\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0002\u001a\u001e\u0010\u0000\u001a\u00020\u00012\b\u0010\u0002\u001a\u0004\u0018\u00010\u00032\n\u0010\u0004\u001a\u0006\u0012\u0002\b\u00030\u0005H\u0001\u001a \u0010\u0000\u001a\u00020\u00012\n\u0010\u0006\u001a\u0006\u0012\u0002\b\u00030\u00052\n\u0010\u0004\u001a\u0006\u0012\u0002\b\u00030\u0005H\u0001¨\u0006\u0007"}, d2 = {"throwSubtypeNotRegistered", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "subClassName", com.moloco.sdk.xenoss.sdkdevkit.android.core.b.f42142b, "baseClass", "Lkotlin/reflect/KClass;", "subClass", "kotlinx-serialization-core"}, k = 2, mv = {2, 1, 0}, xi = 48)
/* loaded from: classes5.dex */
public final class AbstractPolymorphicSerializerKt {
    @JvmName
    @NotNull
    public static final Void throwSubtypeNotRegistered(@Nullable String str, @NotNull KClass<?> baseClass) {
        String string;
        Intrinsics.g(baseClass, "baseClass");
        String str2 = "in the polymorphic scope of '" + baseClass.getSimpleName() + '\'';
        if (str == null) {
            string = c1.m('.', "Class discriminator was missing and no default serializers were registered ", str2);
        } else {
            StringBuilder sbW = c0.w("Serializer for subclass '", str, "' is not found ", str2, ".\nCheck if class with serial name '");
            c0.D(sbW, str, "' exists and serializer is registered in a corresponding SerializersModule.\nTo be registered automatically, class '", str, "' has to be '@Serializable', and the base class '");
            sbW.append(baseClass.getSimpleName());
            sbW.append("' has to be sealed and '@Serializable'.");
            string = sbW.toString();
        }
        throw new SerializationException(string);
    }

    @JvmName
    @NotNull
    public static final Void throwSubtypeNotRegistered(@NotNull KClass<?> subClass, @NotNull KClass<?> baseClass) {
        Intrinsics.g(subClass, "subClass");
        Intrinsics.g(baseClass, "baseClass");
        String simpleName = subClass.getSimpleName();
        if (simpleName == null) {
            simpleName = String.valueOf(subClass);
        }
        throwSubtypeNotRegistered(simpleName, baseClass);
        throw new KotlinNothingValueException();
    }
}
