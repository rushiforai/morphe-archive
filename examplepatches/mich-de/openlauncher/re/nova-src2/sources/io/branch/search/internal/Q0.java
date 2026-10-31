package io.branch.search.internal;

import android.database.Cursor;
import io.branch.search.internal.InterfaceC3279n5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Q0 implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f63206a;

    public Q0(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f63206a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "app_usage_stats";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`package_name` TEXT NOT NULL, `screen_uptime` INTEGER NOT NULL, `last_usage_timestamp` INTEGER NOT NULL, PRIMARY KEY(`package_name`)";
    }

    public static P0 a(Cursor cursor) {
        Intrinsics.g(cursor, "<this>");
        String string = cursor.getString(R4.a(cursor, "package_name"));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        return new P0(cursor.getLong(R4.a(cursor, "screen_uptime")), cursor.getLong(R4.a(cursor, "last_usage_timestamp")), string);
    }
}
