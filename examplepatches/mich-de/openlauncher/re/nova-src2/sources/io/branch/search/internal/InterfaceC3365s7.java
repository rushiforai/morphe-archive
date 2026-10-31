package io.branch.search.internal;

import android.content.ContentValues;
import android.database.Cursor;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.s7, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3365s7 {
    @NotNull
    Cursor a(@NotNull String str, @NotNull Object[] objArr, @NotNull w4.d dVar);

    @NotNull
    Cursor a(@NotNull String str, @NotNull String[] strArr, @NotNull w4.d dVar);

    void a(@NotNull String str, boolean z11);

    void a(@NotNull String str, @NotNull String[] strArr);

    @NotNull
    C3457xe compileStatement(@NotNull String str);

    void execSQL(@NotNull String str);

    void execSQL(@NotNull String str, @NotNull Object[] objArr);

    long insert(@NotNull String str, int i5, @NotNull ContentValues contentValues);
}
