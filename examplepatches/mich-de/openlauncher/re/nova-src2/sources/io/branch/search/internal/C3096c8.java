package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3279n5;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.c8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3096c8 implements InterfaceC3279n5 {
    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "internal_versions";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`id` TEXT, `version` TEXT, PRIMARY KEY (id)";
    }
}
