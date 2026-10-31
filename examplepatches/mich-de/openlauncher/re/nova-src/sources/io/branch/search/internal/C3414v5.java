package io.branch.search.internal;

import android.os.UserHandle;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.v5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3414v5 implements InterfaceC3281n7 {
    @Override // io.branch.search.internal.InterfaceC3281n7
    @Nullable
    public final void a(@NotNull String packageId, @NotNull UserHandle handle) {
        Intrinsics.g(packageId, "packageId");
        Intrinsics.g(handle, "handle");
    }
}
