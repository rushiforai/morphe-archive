package io.branch.search.internal;

import android.content.ContentValues;
import android.database.Cursor;
import android.database.SQLException;
import io.branch.search.internal.C3296o5;
import io.branch.search.internal.InterfaceC3279n5;
import java.io.IOException;
import java.util.List;
import kotlin.Unit;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class P8 implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f63082a;

    public P8(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f63082a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "local_packages";
    }

    @Nullable
    public final M8 a(@NotNull String packageName, long j11) throws IOException {
        Intrinsics.g(packageName, "packageName");
        Cursor cursorA = this.f63082a.getReadableDatabase().a("SELECT * FROM local_packages WHERE package_name IS ? AND user_id IS ?", new Object[]{packageName, Long.valueOf(j11)}, new w4.d());
        try {
            M8 m8A = !cursorA.moveToFirst() ? null : a(cursorA);
            cursorA.close();
            return m8A;
        } finally {
        }
    }

    public final void a(@NotNull M8 item) throws SQLException {
        Intrinsics.g(item, "item");
        C3178h5 writableDatabase = this.f63082a.getWritableDatabase();
        ContentValues contentValues = new ContentValues();
        contentValues.put("package_name", item.f62924a);
        contentValues.put("user_id", Long.valueOf(item.f62925b));
        contentValues.put("original_name", item.f62926c);
        List<Integer> list = C3217jb.f64893a;
        contentValues.put("normalized_name", C3217jb.a(item.f62926c, true));
        contentValues.put("case_sensitive_normalized_name", C3217jb.a(item.f62926c, false));
        contentValues.put("relabeled_name", item.f62927d);
        contentValues.put("normalized_relabeled_name", C3217jb.a(item.f62927d, true));
        contentValues.put("case_sensitive_normalized_relabeled_name", C3217jb.a(item.f62927d, false));
        contentValues.put("is_installed", Boolean.valueOf(item.f62928e));
        contentValues.put("first_installed_date", Long.valueOf(item.f62929f));
        contentValues.put("installed_date", Long.valueOf(item.f62930g));
        contentValues.put("uninstalled_date", Long.valueOf(item.f62931h));
        contentValues.put("uninstall_count", Long.valueOf(item.f62932i));
        Unit unit = Unit.f71706a;
        writableDatabase.f64647a.insert("local_packages", 5, contentValues);
    }

    public final void a(@NotNull String sessionId, @Nullable M8 m82, long j11) throws SQLException {
        Intrinsics.g(sessionId, "sessionId");
        if (m82 != null) {
            if (!m82.f62928e) {
                C3309p1.c(EnumC3131e9.PackageSync, "mark [" + m82.f62924a + "] as installed (previously uninstalled) latest installed ts: " + j11);
                a(new M8(m82.f62924a, m82.f62925b, m82.f62926c, m82.f62927d, true, m82.f62929f, j11, m82.f62931h, m82.f62932i));
                return;
            }
            C3296o5.a aVar = C3296o5.f65426a;
            C3296o5.a(new F6(sessionId, "LocalPackagesDataSource", "invoked markInstalled(...) but the package is already marked as installed", null));
            return;
        }
        C3296o5.a aVar2 = C3296o5.f65426a;
        C3296o5.a(new F6(sessionId, "LocalPackagesDataSource", "invoked markInstalled(...) but the package does not exist", null));
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "`package_name` TEXT NOT NULL, `user_id` INTEGER NOT NULL, `original_name` TEXT NOT NULL, `normalized_name` TEXT NOT NULL, `case_sensitive_normalized_name` TEXT NOT NULL, `relabeled_name` TEXT, `normalized_relabeled_name` TEXT, `case_sensitive_normalized_relabeled_name` TEXT, `is_installed` BOOLEAN NOT NULL, `first_installed_date` INTEGER, `installed_date` INTEGER, `uninstalled_date` INTEGER, `uninstall_count` INTEGER, PRIMARY KEY(`package_name`, `user_id`)";
    }

    public static M8 a(Cursor cursor) {
        Intrinsics.g(cursor, "<this>");
        String string = cursor.getString(R4.a(cursor, "package_name"));
        Intrinsics.f(string, "getString(checkColumnIndex(column))");
        return new M8(string, cursor.getLong(R4.a(cursor, "user_id")), C3053a.a("original_name", "column", cursor, "original_name", "getString(checkColumnIndex(column))"), R4.f(cursor, "relabeled_name"), R4.b(cursor, "is_installed"), cursor.getLong(R4.a(cursor, "first_installed_date")), cursor.getLong(R4.a(cursor, "installed_date")), cursor.getLong(R4.a(cursor, "uninstalled_date")), cursor.getLong(R4.a(cursor, "uninstall_count")));
    }
}
