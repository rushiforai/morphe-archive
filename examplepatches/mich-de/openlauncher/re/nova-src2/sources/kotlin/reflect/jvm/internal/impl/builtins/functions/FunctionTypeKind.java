package kotlin.reflect.jvm.internal.impl.builtins.functions;

import h6.c1;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.builtins.StandardNames;
import kotlin.reflect.jvm.internal.impl.name.ClassId;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import kotlin.reflect.jvm.internal.impl.name.Name;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public abstract class FunctionTypeKind {

    @Nullable
    private final ClassId annotationOnInvokeClassId;

    @NotNull
    private final String classNamePrefix;
    private final boolean isReflectType;

    @NotNull
    private final FqName packageFqName;

    public static final class Function extends FunctionTypeKind {

        @NotNull
        public static final Function INSTANCE = new Function();

        private Function() {
            super(StandardNames.BUILT_INS_PACKAGE_FQ_NAME, "Function", false, null);
        }
    }

    public static final class KFunction extends FunctionTypeKind {

        @NotNull
        public static final KFunction INSTANCE = new KFunction();

        private KFunction() {
            super(StandardNames.KOTLIN_REFLECT_FQ_NAME, "KFunction", true, null);
        }
    }

    public static final class KSuspendFunction extends FunctionTypeKind {

        @NotNull
        public static final KSuspendFunction INSTANCE = new KSuspendFunction();

        private KSuspendFunction() {
            super(StandardNames.KOTLIN_REFLECT_FQ_NAME, "KSuspendFunction", true, null);
        }
    }

    public static final class SuspendFunction extends FunctionTypeKind {

        @NotNull
        public static final SuspendFunction INSTANCE = new SuspendFunction();

        private SuspendFunction() {
            super(StandardNames.COROUTINES_PACKAGE_FQ_NAME, "SuspendFunction", false, null);
        }
    }

    public FunctionTypeKind(@NotNull FqName packageFqName, @NotNull String classNamePrefix, boolean z11, @Nullable ClassId classId) {
        Intrinsics.g(packageFqName, "packageFqName");
        Intrinsics.g(classNamePrefix, "classNamePrefix");
        this.packageFqName = packageFqName;
        this.classNamePrefix = classNamePrefix;
        this.isReflectType = z11;
        this.annotationOnInvokeClassId = classId;
    }

    @NotNull
    public final String getClassNamePrefix() {
        return this.classNamePrefix;
    }

    @NotNull
    public final FqName getPackageFqName() {
        return this.packageFqName;
    }

    @NotNull
    public final Name numberedClassName(int i5) {
        Name nameIdentifier = Name.identifier(this.classNamePrefix + i5);
        Intrinsics.f(nameIdentifier, "identifier(...)");
        return nameIdentifier;
    }

    @NotNull
    public String toString() {
        StringBuilder sb2 = new StringBuilder();
        sb2.append(this.packageFqName);
        sb2.append('.');
        return c1.t(sb2, this.classNamePrefix, 'N');
    }
}
