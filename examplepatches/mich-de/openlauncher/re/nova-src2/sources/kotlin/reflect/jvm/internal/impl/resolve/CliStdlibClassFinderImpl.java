package kotlin.reflect.jvm.internal.impl.resolve;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.FindClassInModuleKt;
import kotlin.reflect.jvm.internal.impl.descriptors.ModuleDescriptor;
import kotlin.reflect.jvm.internal.impl.name.StandardClassIds;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes5.dex */
final class CliStdlibClassFinderImpl implements StdlibClassFinder {

    @NotNull
    public static final CliStdlibClassFinderImpl INSTANCE = new CliStdlibClassFinderImpl();

    private CliStdlibClassFinderImpl() {
    }

    @Override // kotlin.reflect.jvm.internal.impl.resolve.StdlibClassFinder
    @Nullable
    public ClassDescriptor findEnumEntriesClass(@NotNull ModuleDescriptor moduleDescriptor) {
        Intrinsics.g(moduleDescriptor, "moduleDescriptor");
        return FindClassInModuleKt.findClassAcrossModuleDependencies(moduleDescriptor, StandardClassIds.INSTANCE.getEnumEntries());
    }
}
