package kotlin.reflect.jvm.internal.impl.serialization.deserialization;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.metadata.deserialization.NameResolver;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.Name;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class NameResolverUtilKt {
    @NotNull
    public static final ClassId getClassId(@NotNull NameResolver nameResolver, int i5) {
        Intrinsics.g(nameResolver, "<this>");
        ClassId classIdFromString = ClassId.fromString(nameResolver.getQualifiedClassName(i5), nameResolver.isLocalClassName(i5));
        Intrinsics.f(classIdFromString, "fromString(...)");
        return classIdFromString;
    }

    @NotNull
    public static final Name getName(@NotNull NameResolver nameResolver, int i5) {
        Intrinsics.g(nameResolver, "<this>");
        Name nameGuessByFirstCharacter = Name.guessByFirstCharacter(nameResolver.getString(i5));
        Intrinsics.f(nameGuessByFirstCharacter, "guessByFirstCharacter(...)");
        return nameGuessByFirstCharacter;
    }
}
