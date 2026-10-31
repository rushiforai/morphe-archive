package kotlin.reflect.jvm.internal.impl.load.java.lazy;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.load.java.structure.JavaClass;
import kotlin.reflect.jvm.internal.impl.resolve.jvm.JavaDescriptorResolver;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
public final class SingleModuleClassResolver implements ModuleClassResolver {
    public JavaDescriptorResolver resolver;

    @NotNull
    public final JavaDescriptorResolver getResolver() {
        JavaDescriptorResolver javaDescriptorResolver = this.resolver;
        if (javaDescriptorResolver != null) {
            return javaDescriptorResolver;
        }
        Intrinsics.m("resolver");
        throw null;
    }

    @Override // kotlin.reflect.jvm.internal.impl.load.java.lazy.ModuleClassResolver
    @Nullable
    public ClassDescriptor resolveClass(@NotNull JavaClass javaClass) {
        Intrinsics.g(javaClass, "javaClass");
        return getResolver().resolveClass(javaClass);
    }

    public final void setResolver(@NotNull JavaDescriptorResolver javaDescriptorResolver) {
        Intrinsics.g(javaDescriptorResolver, "<set-?>");
        this.resolver = javaDescriptorResolver;
    }
}
