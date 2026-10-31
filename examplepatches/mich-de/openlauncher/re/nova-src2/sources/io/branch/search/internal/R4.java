package io.branch.search.internal;

import android.database.Cursor;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class R4 {
    public static final int a(Cursor cursor, String str) {
        int columnIndex = cursor.getColumnIndex(str);
        if (columnIndex != -1) {
            return columnIndex;
        }
        throw new IllegalStateException(h6.c1.m('\'', "Unknown column '", str));
    }

    public static final boolean b(@NotNull Cursor cursor, @NotNull String column) {
        Intrinsics.g(cursor, "<this>");
        Intrinsics.g(column, "column");
        return cursor.getInt(a(cursor, column)) == 1;
    }

    @Nullable
    public static final Integer c(@NotNull Cursor cursor, @NotNull String columnName) {
        Intrinsics.g(cursor, "<this>");
        Intrinsics.g(columnName, "columnName");
        int columnIndex = cursor.getColumnIndex(columnName);
        if (columnIndex == -1 || cursor.getType(columnIndex) != 1) {
            return null;
        }
        return Integer.valueOf(cursor.getInt(columnIndex));
    }

    @Nullable
    public static final Boolean d(@NotNull Cursor cursor, @NotNull String columnName) {
        Intrinsics.g(cursor, "<this>");
        Intrinsics.g(columnName, "columnName");
        int columnIndex = cursor.getColumnIndex(columnName);
        if (columnIndex == -1) {
            return null;
        }
        if (cursor.getType(columnIndex) != 1) {
            return null;
        }
        return Boolean.valueOf(cursor.getInt(columnIndex) == 1);
    }

    @Nullable
    public static final Long e(@NotNull Cursor cursor, @NotNull String columnName) {
        Intrinsics.g(cursor, "<this>");
        Intrinsics.g(columnName, "columnName");
        int columnIndex = cursor.getColumnIndex(columnName);
        if (columnIndex == -1 || cursor.getType(columnIndex) != 1) {
            return null;
        }
        return Long.valueOf(cursor.getLong(columnIndex));
    }

    @Nullable
    public static final String f(@NotNull Cursor cursor, @NotNull String columnName) {
        Intrinsics.g(cursor, "<this>");
        Intrinsics.g(columnName, "columnName");
        int columnIndex = cursor.getColumnIndex(columnName);
        if (columnIndex == -1 || cursor.getType(columnIndex) != 3) {
            return null;
        }
        return cursor.getString(columnIndex);
    }
}
