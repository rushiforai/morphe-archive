package io.branch.search.internal;

import android.database.Cursor;
import com.instabridge.ai.tools.SharedPreferencesToolRegistrationStateStore;
import io.branch.search.internal.InterfaceC3279n5;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.w0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3426w0 implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f66198a;

    public C3426w0(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f66198a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "app_clicks";
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`session_id` TEXT NOT NULL, `timestamp` INTEGER NOT NULL, `request_id` TEXT NOT NULL, `package_name` TEXT NOT NULL,`external_organic` BOOLEAN NOT NULL CHECK (external_organic IN (0, 1)),PRIMARY KEY(`timestamp`)";
    }

    public static C3409v0 a(Cursor cursor) {
        Intrinsics.g(cursor, "<this>");
        String string = cursor.getString(R4.a(cursor, SharedPreferencesToolRegistrationStateStore.KEY_SESSION_ID));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        return new C3409v0(string, C3053a.a("request_id", "column", cursor, "request_id", "getString(checkColumnIndex(column))"), cursor.getLong(R4.a(cursor, "timestamp")), C3053a.a("package_name", "column", cursor, "package_name", "getString(checkColumnIndex(column))"), R4.b(cursor, "external_organic"));
    }
}
