package io.branch.search.internal;

import io.branch.search.internal.InterfaceC3279n5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.e8, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3130e8 implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f64372a;

    public C3130e8(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f64372a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "invalid_links";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`user_id` INTEGER NOT NULL, `linking` TEXT NOT NULL, `app_store_id` TEXT NOT NULL, `validation_timestamp` INTEGER NOT NULL, `should_retry` BOOLEAN NOT NULL, PRIMARY KEY(`linking`, `user_id`)";
    }
}
