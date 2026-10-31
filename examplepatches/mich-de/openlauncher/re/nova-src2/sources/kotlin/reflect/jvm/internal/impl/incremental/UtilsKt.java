package kotlin.reflect.jvm.internal.impl.incremental;

import kotlin.jvm.internal.Intrinsics;
import kotlin.reflect.jvm.internal.impl.descriptors.ClassDescriptor;
import kotlin.reflect.jvm.internal.impl.descriptors.PackageFragmentDescriptor;
import kotlin.reflect.jvm.internal.impl.incremental.components.LocationInfo;
import kotlin.reflect.jvm.internal.impl.incremental.components.LookupLocation;
import kotlin.reflect.jvm.internal.impl.incremental.components.LookupTracker;
import kotlin.reflect.jvm.internal.impl.incremental.components.Position;
import kotlin.reflect.jvm.internal.impl.incremental.components.ScopeKind;
import kotlin.reflect.jvm.internal.impl.name.Name;
import kotlin.reflect.jvm.internal.impl.resolve.DescriptorUtils;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes5.dex */
public final class UtilsKt {
    public static final void record(@NotNull LookupTracker lookupTracker, @NotNull LookupLocation from, @NotNull ClassDescriptor scopeOwner, @NotNull Name name) {
        LocationInfo location;
        Intrinsics.g(lookupTracker, "<this>");
        Intrinsics.g(from, "from");
        Intrinsics.g(scopeOwner, "scopeOwner");
        Intrinsics.g(name, "name");
        if (lookupTracker == LookupTracker.DO_NOTHING.INSTANCE || (location = from.getLocation()) == null) {
            return;
        }
        Position position = lookupTracker.getRequiresPosition() ? location.getPosition() : Position.Companion.getNO_POSITION();
        String filePath = location.getFilePath();
        String strAsString = DescriptorUtils.getFqName(scopeOwner).asString();
        Intrinsics.f(strAsString, "asString(...)");
        ScopeKind scopeKind = ScopeKind.CLASSIFIER;
        String strAsString2 = name.asString();
        Intrinsics.f(strAsString2, "asString(...)");
        lookupTracker.record(filePath, position, strAsString, scopeKind, strAsString2);
    }

    public static final void recordPackageLookup(@NotNull LookupTracker lookupTracker, @NotNull LookupLocation from, @NotNull String packageFqName, @NotNull String name) {
        LocationInfo location;
        Intrinsics.g(lookupTracker, "<this>");
        Intrinsics.g(from, "from");
        Intrinsics.g(packageFqName, "packageFqName");
        Intrinsics.g(name, "name");
        if (lookupTracker == LookupTracker.DO_NOTHING.INSTANCE || (location = from.getLocation()) == null) {
            return;
        }
        lookupTracker.record(location.getFilePath(), lookupTracker.getRequiresPosition() ? location.getPosition() : Position.Companion.getNO_POSITION(), packageFqName, ScopeKind.PACKAGE, name);
    }

    public static final void record(@NotNull LookupTracker lookupTracker, @NotNull LookupLocation from, @NotNull PackageFragmentDescriptor scopeOwner, @NotNull Name name) {
        Intrinsics.g(lookupTracker, "<this>");
        Intrinsics.g(from, "from");
        Intrinsics.g(scopeOwner, "scopeOwner");
        Intrinsics.g(name, "name");
        String strAsString = scopeOwner.getFqName().asString();
        Intrinsics.f(strAsString, "asString(...)");
        String strAsString2 = name.asString();
        Intrinsics.f(strAsString2, "asString(...)");
        recordPackageLookup(lookupTracker, from, strAsString, strAsString2);
    }
}
