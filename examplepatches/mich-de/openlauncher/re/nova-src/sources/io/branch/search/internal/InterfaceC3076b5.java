package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.b5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public interface InterfaceC3076b5 {
    void close();

    @NotNull
    C3178h5 getReadableDatabase();

    @NotNull
    C3178h5 getWritableDatabase();

    void setMaxSqlCacheSize(int i5);
}
