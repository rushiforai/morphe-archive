package kotlin.reflect.full;

import com.moloco.sdk.xenoss.sdkdevkit.android.core.b;
import java.lang.annotation.Annotation;
import java.lang.annotation.Repeatable;
import java.lang.reflect.InvocationTargetException;
import java.lang.reflect.Method;
import kotlin.Metadata;
import kotlin.jvm.internal.Intrinsics;
import kotlin.jvm.internal.SourceDebugExtension;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

@Metadata(d1 = {"\u0000 \n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0002\b\u0002\n\u0002\u0018\u0002\n\u0002\b\u0006\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0002\b\u0003\bÂ\u0002\u0018\u00002\u00020\u0001:\u0001\u000eB\u0007\b\u0002¢\u0006\u0002\u0010\u0002J\b\u0010\t\u001a\u00020\u0004H\u0002J \u0010\n\u001a\f\u0012\u0006\b\u0001\u0012\u00020\f\u0018\u00010\u000b2\u000e\u0010\r\u001a\n\u0012\u0006\b\u0001\u0012\u00020\f0\u000bR\u001c\u0010\u0003\u001a\u0004\u0018\u00010\u0004X\u0086\u000e¢\u0006\u000e\n\u0000\u001a\u0004\b\u0005\u0010\u0006\"\u0004\b\u0007\u0010\b¨\u0006\u000f"}, d2 = {"Lkotlin/reflect/full/Java8RepeatableContainerLoader;", b.f42142b, "()V", "cache", "Lkotlin/reflect/full/Java8RepeatableContainerLoader$Cache;", "getCache", "()Lkotlin/reflect/full/Java8RepeatableContainerLoader$Cache;", "setCache", "(Lkotlin/reflect/full/Java8RepeatableContainerLoader$Cache;)V", "buildCache", "loadRepeatableContainer", "Ljava/lang/Class;", b.f42142b, "klass", "Cache", "kotlin-reflection"}, k = 1, mv = {1, 9, 0}, xi = 48)
@SourceDebugExtension
/* loaded from: classes4.dex */
final class Java8RepeatableContainerLoader {

    @NotNull
    public static final Java8RepeatableContainerLoader INSTANCE = new Java8RepeatableContainerLoader();

    @Nullable
    private static Cache cache;

    @Metadata(d1 = {"\u0000\u001c\n\u0002\u0018\u0002\n\u0002\u0010\u0000\n\u0000\n\u0002\u0018\u0002\n\u0002\u0010\u001b\n\u0000\n\u0002\u0018\u0002\n\u0002\b\u0006\u0018\u00002\u00020\u0001B!\u0012\u0010\u0010\u0002\u001a\f\u0012\u0006\b\u0001\u0012\u00020\u0004\u0018\u00010\u0003\u0012\b\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\u0002\u0010\u0007R\u001b\u0010\u0002\u001a\f\u0012\u0006\b\u0001\u0012\u00020\u0004\u0018\u00010\u0003¢\u0006\b\n\u0000\u001a\u0004\b\b\u0010\tR\u0013\u0010\u0005\u001a\u0004\u0018\u00010\u0006¢\u0006\b\n\u0000\u001a\u0004\b\n\u0010\u000b¨\u0006\f"}, d2 = {"Lkotlin/reflect/full/Java8RepeatableContainerLoader$Cache;", b.f42142b, "repeatableClass", "Ljava/lang/Class;", b.f42142b, "valueMethod", "Ljava/lang/reflect/Method;", "(Ljava/lang/Class;Ljava/lang/reflect/Method;)V", "getRepeatableClass", "()Ljava/lang/Class;", "getValueMethod", "()Ljava/lang/reflect/Method;", "kotlin-reflection"}, k = 1, mv = {1, 9, 0}, xi = 48)
    public static final class Cache {

        @Nullable
        private final Class<? extends Annotation> repeatableClass;

        @Nullable
        private final Method valueMethod;

        public Cache(@Nullable Class<? extends Annotation> cls, @Nullable Method method) {
            this.repeatableClass = cls;
            this.valueMethod = method;
        }

        @Nullable
        public final Class<? extends Annotation> getRepeatableClass() {
            return this.repeatableClass;
        }

        @Nullable
        public final Method getValueMethod() {
            return this.valueMethod;
        }
    }

    private Java8RepeatableContainerLoader() {
    }

    private final Cache buildCache() {
        return new Cache(Repeatable.class, Repeatable.class.getMethod("value", null));
    }

    @Nullable
    public final Class<? extends Annotation> loadRepeatableContainer(@NotNull Class<? extends Annotation> klass) throws IllegalAccessException, IllegalArgumentException, InvocationTargetException {
        Annotation annotation;
        Method valueMethod;
        Intrinsics.g(klass, "klass");
        Cache cacheBuildCache = cache;
        if (cacheBuildCache == null) {
            synchronized (this) {
                cacheBuildCache = cache;
                if (cacheBuildCache == null) {
                    cacheBuildCache = INSTANCE.buildCache();
                    cache = cacheBuildCache;
                }
            }
        }
        Class repeatableClass = cacheBuildCache.getRepeatableClass();
        if (repeatableClass == null || (annotation = klass.getAnnotation(repeatableClass)) == null || (valueMethod = cacheBuildCache.getValueMethod()) == null) {
            return null;
        }
        Object objInvoke = valueMethod.invoke(annotation, null);
        Intrinsics.e(objInvoke, "null cannot be cast to non-null type java.lang.Class<out kotlin.Annotation>");
        return (Class) objInvoke;
    }
}
