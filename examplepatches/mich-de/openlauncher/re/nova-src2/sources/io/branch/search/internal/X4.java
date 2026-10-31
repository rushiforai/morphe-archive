package io.branch.search.internal;

import android.database.Cursor;
import io.branch.search.internal.InterfaceC3279n5;
import java.io.IOException;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class X4 implements InterfaceC3279n5 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3076b5 f63654a;

    public X4(@NotNull InterfaceC3076b5 dbHelper) {
        Intrinsics.g(dbHelper, "dbHelper");
        this.f63654a = dbHelper;
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    public final void a(@NotNull InterfaceC3365s7 interfaceC3365s7) {
        InterfaceC3279n5.a.a(this, interfaceC3365s7);
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String getName() {
        return "data_usage";
    }

    public final long a(@NotNull String date, @Nullable String str, @Nullable String str2) throws IOException {
        Intrinsics.g(date, "date");
        Cursor cursorA = this.f63654a.getReadableDatabase().a(r70.f.o0("\n                SELECT SUM(usage) FROM data_usage WHERE date > ? AND (\n                    (? = '||' OR ? = '' OR ? is null)\n                    OR INSTR(?, '|' || channel || '|') > 0\n                 )\n                 AND (\n                   (? = '||' OR ? = '' OR ? is null)\n                   OR INSTR(?, '|' || connection_type || '|' ) > 0\n                 )\n            "), new String[]{date, str, str, str, str, str2, str2, str2, str2}, new w4.d());
        try {
            cursorA.moveToFirst();
            long j11 = cursorA.getLong(0);
            cursorA.close();
            return j11;
        } finally {
        }
    }

    @Override // io.branch.search.internal.InterfaceC3279n5
    @NotNull
    public final String a() {
        return "date TEXT,\nchannel TEXT,\nconnection_type TEXT,\nusage INTEGER,\nPRIMARY KEY  (date, channel, connection_type)";
    }
}
