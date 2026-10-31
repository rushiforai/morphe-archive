package kotlin.reflect.jvm.internal.impl.utils;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public class WrappedValues {
    private static final Object NULL_VALUE = new Object() { // from class: kotlin.reflect.jvm.internal.impl.utils.WrappedValues.1
        public String toString() {
            return "NULL_VALUE";
        }
    };
    public static volatile boolean throwWrappedProcessCanceledException = false;

    public static final class ThrowableWrapper {
        private final Throwable throwable;

        private static /* synthetic */ void $$$reportNull$$$0(int i5) {
            String str = i5 != 1 ? "Argument for @NotNull parameter '%s' of %s.%s must not be null" : "@NotNull method %s.%s must not return null";
            Object[] objArr = new Object[i5 != 1 ? 3 : 2];
            if (i5 != 1) {
                objArr[0] = "throwable";
            } else {
                objArr[0] = "kotlin/reflect/jvm/internal/impl/utils/WrappedValues$ThrowableWrapper";
            }
            if (i5 != 1) {
                objArr[1] = "kotlin/reflect/jvm/internal/impl/utils/WrappedValues$ThrowableWrapper";
            } else {
                objArr[1] = "getThrowable";
            }
            if (i5 != 1) {
                objArr[2] = "<init>";
            }
            String str2 = String.format(str, objArr);
            if (i5 == 1) {
                throw new IllegalStateException(str2);
            }
        }

        @NotNull
        public Throwable getThrowable() {
            Throwable th2 = this.throwable;
            if (th2 == null) {
                $$$reportNull$$$0(1);
            }
            return th2;
        }

        public String toString() {
            return this.throwable.toString();
        }

        private ThrowableWrapper(@NotNull Throwable th2) {
            if (th2 == null) {
                $$$reportNull$$$0(0);
            }
            this.throwable = th2;
        }
    }

    public static class WrappedProcessCanceledException extends RuntimeException {
        public WrappedProcessCanceledException(Throwable th2) {
            super("Rethrow stored exception", th2);
        }
    }

    private static /* synthetic */ void $$$reportNull$$$0(int i5) {
        String str = (i5 == 1 || i5 == 2) ? "@NotNull method %s.%s must not return null" : "Argument for @NotNull parameter '%s' of %s.%s must not be null";
        Object[] objArr = new Object[(i5 == 1 || i5 == 2) ? 2 : 3];
        if (i5 == 1 || i5 == 2) {
            objArr[0] = "kotlin/reflect/jvm/internal/impl/utils/WrappedValues";
        } else if (i5 != 3) {
            objArr[0] = "value";
        } else {
            objArr[0] = "throwable";
        }
        if (i5 == 1 || i5 == 2) {
            objArr[1] = "escapeNull";
        } else {
            objArr[1] = "kotlin/reflect/jvm/internal/impl/utils/WrappedValues";
        }
        if (i5 != 1 && i5 != 2) {
            if (i5 == 3) {
                objArr[2] = "escapeThrowable";
            } else if (i5 != 4) {
                objArr[2] = "unescapeNull";
            } else {
                objArr[2] = "unescapeExceptionOrNull";
            }
        }
        String str2 = String.format(str, objArr);
        if (i5 != 1 && i5 != 2) {
            throw new IllegalArgumentException(str2);
        }
        throw new IllegalStateException(str2);
    }

    @NotNull
    public static <V> Object escapeNull(@Nullable V v11) {
        if (v11 == null && (v11 = (V) NULL_VALUE) == null) {
            $$$reportNull$$$0(1);
        }
        return v11;
    }

    @NotNull
    public static Object escapeThrowable(@NotNull Throwable th2) {
        if (th2 == null) {
            $$$reportNull$$$0(3);
        }
        return new ThrowableWrapper(th2);
    }

    @Nullable
    public static <V> V unescapeExceptionOrNull(@NotNull Object obj) {
        if (obj == null) {
            $$$reportNull$$$0(4);
        }
        return (V) unescapeNull(unescapeThrowable(obj));
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Nullable
    public static <V> V unescapeNull(@NotNull Object obj) {
        if (obj == 0) {
            $$$reportNull$$$0(0);
        }
        if (obj == NULL_VALUE) {
            return null;
        }
        return obj;
    }

    /* JADX WARN: Multi-variable type inference failed */
    @Nullable
    public static <V> V unescapeThrowable(@Nullable Object obj) {
        if (!(obj instanceof ThrowableWrapper)) {
            return obj;
        }
        Throwable throwable = ((ThrowableWrapper) obj).getThrowable();
        if (throwWrappedProcessCanceledException && ExceptionUtilsKt.isProcessCanceledException(throwable)) {
            throw new WrappedProcessCanceledException(throwable);
        }
        throw ExceptionUtilsKt.rethrow(throwable);
    }
}
