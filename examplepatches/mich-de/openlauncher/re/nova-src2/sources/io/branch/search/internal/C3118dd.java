package io.branch.search.internal;

import android.database.Cursor;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import io.branch.search.internal.InterfaceC3279n5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.dd, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3118dd implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f64336a;

    public C3118dd(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f64336a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "search_clicks";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`session_id` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `request_id` TEXT NOT NULL, `result_id` INTEGER NOT NULL, `package_name` TEXT NOT NULL, `entity_id` TEXT,`external_organic` BOOLEAN NOT NULL CHECK (external_organic IN (0, 1)),PRIMARY KEY(`timestamp`)";
    }

    public static C3101cd a(Cursor cursor) {
        Intrinsics.g(cursor, "<this>");
        String string = cursor.getString(R4.a(cursor, SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        String strA = C3053a.a("request_id", "column", cursor, "request_id", "getString(checkColumnIndex(column))");
        return new C3101cd(cursor.getInt(R4.a(cursor, "result_id")), cursor.getLong(R4.a(cursor, "timestamp")), string, strA, C3053a.a("package_name", "column", cursor, "package_name", "getString(checkColumnIndex(column))"), C3053a.a("entity_id", "column", cursor, "entity_id", "getString(checkColumnIndex(column))"), R4.b(cursor, "external_organic"));
    }
}
