package io.branch.search.internal;

import io.branch.engage.sesame_lite.internal.DataImporters;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.ia, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3200ia {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3269mc f64743a;

    public C3200ia(@NotNull C3269mc ssml) {
        Intrinsics.g(ssml, "ssml");
        this.f64743a = ssml;
    }

    public final boolean a(@NotNull String packageName, @Nullable long[] jArr) {
        Intrinsics.g(packageName, "packageName");
        C3269mc c3269mc = this.f64743a;
        c3269mc.getClass();
        if (((Boolean) c3269mc.f65157d.getValue()).booleanValue()) {
            return ((DataImporters) c3269mc.f65160g.getValue()).markPackageIgnored(packageName, jArr);
        }
        return false;
    }

    public final boolean a(@NotNull List<String> packageNames, @Nullable long[] jArr, boolean z11) {
        Intrinsics.g(packageNames, "packageNames");
        C3269mc c3269mc = this.f64743a;
        c3269mc.getClass();
        if (((Boolean) c3269mc.f65157d.getValue()).booleanValue()) {
            return ((DataImporters) c3269mc.f65160g.getValue()).syncIgnoredPackages(packageNames, jArr, z11);
        }
        return false;
    }

    public final boolean a(@NotNull String packageName) {
        Intrinsics.g(packageName, "packageName");
        C3269mc c3269mc = this.f64743a;
        c3269mc.getClass();
        if (((Boolean) c3269mc.f65157d.getValue()).booleanValue()) {
            return ((DataImporters) c3269mc.f65160g.getValue()).unmarkPackageIgnored(packageName);
        }
        return false;
    }
}
