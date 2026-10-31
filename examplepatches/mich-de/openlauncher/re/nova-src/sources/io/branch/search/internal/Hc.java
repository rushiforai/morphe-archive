package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3279n5;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Hc implements InterfaceC3279n5 {
    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "scheduled_queries";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`query_id` INTEGER NOT NULL,`query` TEXT NOT NULL,`bindings` TEXT,`should_execute_now_query` TEXT NOT NULL,`should_execute_now_query_bindings` TEXT,`weight` INTEGER NOT NULL,`transaction_group_id` INTEGER,`uses_cursor` INTEGER NOT NULL, PRIMARY KEY (query_id)";
    }
}
