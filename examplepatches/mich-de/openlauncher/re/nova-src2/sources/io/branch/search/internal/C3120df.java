package io.branch.search.internal;

import android.database.Cursor;
import io.branch.search.internal.InterfaceC3279n5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.df, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3120df implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f64348a;

    public C3120df(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f64348a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "unified_impressions";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`request_id` TEXT NOT NULL, `result_id` INTEGER NOT NULL, `entity_id` TEXT, `area` FLOAT NOT NULL, `start_time` INTEGER NOT NULL, `duration` INTEGER NOT NULL, `analytics_window_id` TEXT, `caller_id` TEXT, `external_organic` INT NOT NULL, PRIMARY KEY(`request_id`, `result_id`, `start_time`, `duration`)";
    }

    public static C3103cf a(Cursor cursor) {
        Intrinsics.g(cursor, "<this>");
        String string = cursor.getString(R4.a(cursor, "request_id"));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        return new C3103cf(string, cursor.getInt(R4.a(cursor, "result_id")), R4.f(cursor, "entity_id"), cursor.getFloat(R4.a(cursor, "area")), cursor.getLong(R4.a(cursor, "start_time")), cursor.getLong(R4.a(cursor, "duration")), R4.f(cursor, "analytics_window_id"), R4.f(cursor, "caller_id"), R4.b(cursor, "external_organic"));
    }
}
