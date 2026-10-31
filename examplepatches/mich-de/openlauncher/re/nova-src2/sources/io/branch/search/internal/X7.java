package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3279n5;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class X7 implements InterfaceC3279n5 {
    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "internal_queries";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`id` TEXT, `query` TEXT, `binds` TEXT, PRIMARY KEY (id)";
    }
}
