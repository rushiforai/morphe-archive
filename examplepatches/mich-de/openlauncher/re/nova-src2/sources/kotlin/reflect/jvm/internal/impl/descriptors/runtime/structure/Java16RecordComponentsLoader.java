package kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
final class Java16RecordComponentsLoader {

    @NotNull
    public static final Java16RecordComponentsLoader INSTANCE = new Java16RecordComponentsLoader();

    @Nullable
    private static Cache _cache;

    public static final class Cache {

        @Nullable
        private final Method getAccessor;

        @Nullable
        private final Method getType;

        public Cache(@Nullable Method method, @Nullable Method method2) {
            this.getType = method;
            this.getAccessor = method2;
        }

        @Nullable
        public final Method getGetAccessor() {
            return this.getAccessor;
        }

        @Nullable
        public final Method getGetType() {
            return this.getType;
        }
    }

    private Java16RecordComponentsLoader() {
    }

    private final Cache buildCache(Object obj) {
        Class<?> cls = obj.getClass();
        try {
            return new Cache(cls.getMethod("getType", null), cls.getMethod("getAccessor", null));
        } catch (NoSuchMethodException unused) {
            return new Cache(null, null);
        }
    }

    private final Cache initCache(Object obj) {
        Cache cache = _cache;
        if (cache != null) {
            return cache;
        }
        Cache cacheBuildCache = buildCache(obj);
        _cache = cacheBuildCache;
        return cacheBuildCache;
    }

    @Nullable
    public final Method loadGetAccessor(@NotNull Object recordComponent) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(recordComponent, "recordComponent");
        Method getAccessor = initCache(recordComponent).getGetAccessor();
        if (getAccessor == null) {
            return null;
        }
        Object objInvoke = getAccessor.invoke(recordComponent, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type java.lang.reflect.Method");
        return (Method) objInvoke;
    }

    @Nullable
    public final Class<?> loadGetType(@NotNull Object recordComponent) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(recordComponent, "recordComponent");
        Method getType = initCache(recordComponent).getGetType();
        if (getType == null) {
            return null;
        }
        Object objInvoke = getType.invoke(recordComponent, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type java.lang.Class<*>");
        return (Class) objInvoke;
    }
}
