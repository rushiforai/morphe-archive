package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3279n5;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Nc implements InterfaceC3279n5 {
    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "scheduled_query_execution_history";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`query_id` INTEGER NOT NULL,`timestamp` INTEGER NOT NULL,`duration` INTEGER NOT NULL,`error` TEXT, PRIMARY KEY (query_id, timestamp)";
    }
}
