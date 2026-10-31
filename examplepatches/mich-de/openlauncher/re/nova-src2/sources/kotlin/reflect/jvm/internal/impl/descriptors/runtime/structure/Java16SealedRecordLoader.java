package kotlin.reflect.jvm.internal.impl.descriptors.runtime.structure;

import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
final class Java16SealedRecordLoader {

    @NotNull
    public static final Java16SealedRecordLoader INSTANCE = new Java16SealedRecordLoader();

    @Nullable
    private static Cache _cache;

    public static final class Cache {

        @Nullable
        private final Method getPermittedSubclasses;

        @Nullable
        private final Method getRecordComponents;

        @Nullable
        private final Method isRecord;

        @Nullable
        private final Method isSealed;

        public Cache(@Nullable Method method, @Nullable Method method2, @Nullable Method method3, @Nullable Method method4) {
            this.isSealed = method;
            this.getPermittedSubclasses = method2;
            this.isRecord = method3;
            this.getRecordComponents = method4;
        }

        @Nullable
        public final Method getGetPermittedSubclasses() {
            return this.getPermittedSubclasses;
        }

        @Nullable
        public final Method getGetRecordComponents() {
            return this.getRecordComponents;
        }

        @Nullable
        public final Method isRecord() {
            return this.isRecord;
        }

        @Nullable
        public final Method isSealed() {
            return this.isSealed;
        }
    }

    private Java16SealedRecordLoader() {
    }

    private final Cache buildCache() {
        try {
            return new Cache(Class.class.getMethod("isSealed", null), Class.class.getMethod("getPermittedSubclasses", null), Class.class.getMethod("isRecord", null), Class.class.getMethod("getRecordComponents", null));
        } catch (NoSuchMethodException unused) {
            return new Cache(null, null, null, null);
        }
    }

    private final Cache initCache() {
        Cache cache = _cache;
        if (cache != null) {
            return cache;
        }
        Cache cacheBuildCache = buildCache();
        _cache = cacheBuildCache;
        return cacheBuildCache;
    }

    @Nullable
    public final Class<?>[] loadGetPermittedSubclasses(@NotNull Class<?> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(clazz, "clazz");
        Method getPermittedSubclasses = initCache().getGetPermittedSubclasses();
        if (getPermittedSubclasses == null) {
            return null;
        }
        Object objInvoke = getPermittedSubclasses.invoke(clazz, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.Array<java.lang.Class<*>>");
        return (Class[]) objInvoke;
    }

    @Nullable
    public final Object[] loadGetRecordComponents(@NotNull Class<?> clazz) {
        Intrinsics.g(clazz, "clazz");
        Method getRecordComponents = initCache().getGetRecordComponents();
        if (getRecordComponents == null) {
            return null;
        }
        return (Object[]) getRecordComponents.invoke(clazz, null);
    }

    @Nullable
    public final Boolean loadIsRecord(@NotNull Class<?> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(clazz, "clazz");
        Method methodIsRecord = initCache().isRecord();
        if (methodIsRecord == null) {
            return null;
        }
        Object objInvoke = methodIsRecord.invoke(clazz, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.Boolean");
        return (Boolean) objInvoke;
    }

    @Nullable
    public final Boolean loadIsSealed(@NotNull Class<?> clazz) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Intrinsics.g(clazz, "clazz");
        Method methodIsSealed = initCache().isSealed();
        if (methodIsSealed == null) {
            return null;
        }
        Object objInvoke = methodIsSealed.invoke(clazz, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type kotlin.Boolean");
        return (Boolean) objInvoke;
    }
}
