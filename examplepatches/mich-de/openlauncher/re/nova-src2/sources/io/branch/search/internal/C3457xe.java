package io.branch.search.internal;

import android.database.SQLException;
import io.branch.requery.android.database.sqlite.SQLiteStatement;
import java.io.Closeable;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.xe, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3457xe implements Closeable {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SQLiteStatement f66298a;

    public C3457xe(@NotNull SQLiteStatement statement) {
        Intrinsics.g(statement, "statement");
        this.f66298a = statement;
    }

    public final void a(@NotNull List<? extends Object> values) {
        Intrinsics.g(values, "values");
        this.f66298a.clearBindings();
        int i5 = 0;
        for (Object obj : values) {
            int i11 = i5 + 1;
            if (i5 < 0) {
                ul.b.e0();
                throw null;
            }
            if (obj instanceof Double) {
                this.f66298a.bindDouble(i11, ((Number) obj).doubleValue());
            } else if (obj instanceof Long) {
                this.f66298a.bindLong(i11, ((Number) obj).longValue());
            } else if (obj instanceof Integer) {
                this.f66298a.bindLong(i11, ((Number) obj).intValue());
            } else if (obj instanceof String) {
                this.f66298a.bindString(i11, (String) obj);
            } else {
                if (obj != null) {
                    throw new SQLException("Unknown type for param");
                }
                this.f66298a.bindNull(i11);
            }
            i5 = i11;
        }
        this.f66298a.execute();
    }

    @Override // java.io.Closeable, java.lang.AutoCloseable
    public final void close() {
        this.f66298a.close();
    }
}
