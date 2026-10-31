package io.branch.search.internal;

import android.content.Context;
import io.branch.search.internal.V4;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.lc, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3252lc implements InterfaceC3093c5 {
    @Override // io.branch.search.internal.InterfaceC3093c5
    @NotNull
    public final C3218jc a(@NotNull Context context, @NotNull String name, boolean z11, int i5, @NotNull V4.a onCreate, @NotNull V4.b onUpgrade) {
        Intrinsics.g(context, "context");
        Intrinsics.g(name, "name");
        Intrinsics.g(onCreate, "onCreate");
        Intrinsics.g(onUpgrade, "onUpgrade");
        return new C3218jc(new C3235kc(context, i5, onCreate, onUpgrade, z11 ? null : name.concat(".db")));
    }
}
