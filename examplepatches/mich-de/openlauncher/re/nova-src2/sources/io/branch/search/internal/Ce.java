package io.branch.search.internal;

import android.database.sqlite.SQLiteCantOpenDatabaseException;
import android.database.sqlite.SQLiteDiskIOException;
import android.database.sqlite.SQLiteFullException;
import kotlin.jvm.functions.Function0;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class Ce {
    public static final <T> T a(@NotNull Be be2, @NotNull Function0<? extends T> fn, @NotNull Function0<? extends T> onDiskFull) {
        Intrinsics.g(be2, "<this>");
        Intrinsics.g(fn, "fn");
        Intrinsics.g(onDiskFull, "onDiskFull");
        try {
            return be2.b() ? (T) onDiskFull.invoke() : (T) fn.invoke();
        } catch (SQLiteCantOpenDatabaseException e3) {
            C3309p1.b(EnumC3131e9.Others, "out of disk space", e3);
            be2.a();
            return (T) onDiskFull.invoke();
        } catch (SQLiteDiskIOException e11) {
            C3309p1.b(EnumC3131e9.Others, "out of disk space", e11);
            be2.a();
            return (T) onDiskFull.invoke();
        } catch (SQLiteFullException e12) {
            C3309p1.b(EnumC3131e9.Others, "out of disk space", e12);
            be2.a();
            return (T) onDiskFull.invoke();
        }
    }
}
