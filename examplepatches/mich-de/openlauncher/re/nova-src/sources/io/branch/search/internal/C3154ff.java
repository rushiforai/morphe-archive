package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3279n5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.ff, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3154ff implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f64498a;

    public C3154ff(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f64498a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "unified_virtual_requests";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`request_id` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `request_type` TEXT NOT NULL, `query` TEXT, `normalized_query` TEXT, `analytics_window_id` TEXT,`caller_id` TEXT,PRIMARY KEY(`request_id`)";
    }
}
