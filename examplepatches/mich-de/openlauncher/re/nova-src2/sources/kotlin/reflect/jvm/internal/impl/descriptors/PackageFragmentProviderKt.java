package kotlin.reflect.jvm.internal.impl.descriptors;

import java.util.ArrayList;
import java.util.Collection;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.name.FqName;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class PackageFragmentProviderKt {
    public static final void collectPackageFragmentsOptimizedIfPossible(@NotNull PackageFragmentProvider packageFragmentProvider, @NotNull FqName fqName, @NotNull Collection<PackageFragmentDescriptor> packageFragments) {
        Intrinsics.g(packageFragmentProvider, "<this>");
        Intrinsics.g(fqName, "fqName");
        Intrinsics.g(packageFragments, "packageFragments");
        if (packageFragmentProvider instanceof PackageFragmentProviderOptimized) {
            ((PackageFragmentProviderOptimized) packageFragmentProvider).collectPackageFragments(fqName, packageFragments);
        } else {
            packageFragments.addAll(packageFragmentProvider.getPackageFragments(fqName));
        }
    }

    public static final boolean isEmpty(@NotNull PackageFragmentProvider packageFragmentProvider, @NotNull FqName fqName) {
        Intrinsics.g(packageFragmentProvider, "<this>");
        Intrinsics.g(fqName, "fqName");
        return packageFragmentProvider instanceof PackageFragmentProviderOptimized ? ((PackageFragmentProviderOptimized) packageFragmentProvider).isEmpty(fqName) : packageFragments(packageFragmentProvider, fqName).isEmpty();
    }

    @NotNull
    public static final List<PackageFragmentDescriptor> packageFragments(@NotNull PackageFragmentProvider packageFragmentProvider, @NotNull FqName fqName) {
        Intrinsics.g(packageFragmentProvider, "<this>");
        Intrinsics.g(fqName, "fqName");
        ArrayList arrayList = new ArrayList();
        collectPackageFragmentsOptimizedIfPossible(packageFragmentProvider, fqName, arrayList);
        return arrayList;
    }
}
