package kotlin.reflect.jvm.internal.impl.descriptors.runtime.components;

import java.lang.reflect.Constructor;
import java.lang.reflect.Field;
import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure.ReflectClassUtilKt;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
final class SignatureSerializer {

    @NotNull
    public static final SignatureSerializer INSTANCE = new SignatureSerializer();

    private SignatureSerializer() {
    }

    @NotNull
    public final String constructorDesc(@NotNull Constructor<?> constructor) {
        Intrinsics.g(constructor, "constructor");
        StringBuilder sb2 = new StringBuilder("(");
        Class<?>[] parameterTypes = constructor.getParameterTypes();
        Intrinsics.f(parameterTypes, "getParameterTypes(...)");
        for (Class<?> cls : parameterTypes) {
            Intrinsics.d(cls);
            sb2.append(ReflectClassUtilKt.getDesc(cls));
        }
        sb2.append(")V");
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }

    @NotNull
    public final String fieldDesc(@NotNull Field field) {
        Intrinsics.g(field, "field");
        Class<?> type = field.getType();
        Intrinsics.f(type, "getType(...)");
        return ReflectClassUtilKt.getDesc(type);
    }

    @NotNull
    public final String methodDesc(@NotNull Method method) {
        Intrinsics.g(method, "method");
        StringBuilder sb2 = new StringBuilder("(");
        Class<?>[] parameterTypes = method.getParameterTypes();
        Intrinsics.f(parameterTypes, "getParameterTypes(...)");
        for (Class<?> cls : parameterTypes) {
            Intrinsics.d(cls);
            sb2.append(ReflectClassUtilKt.getDesc(cls));
        }
        sb2.append(")");
        Class<?> returnType = method.getReturnType();
        Intrinsics.f(returnType, "getReturnType(...)");
        sb2.append(ReflectClassUtilKt.getDesc(returnType));
        String string = sb2.toString();
        Intrinsics.f(string, "toString(...)");
        return string;
    }
}
