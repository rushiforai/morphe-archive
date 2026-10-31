package io.branch.search.internal;

import java.io.IOException;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.z9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3486z9 extends IOException {

    /* renamed from: a, reason: collision with root package name */
    @Nullable
    public final String f66364a;

    public C3486z9(@Nullable String str) {
        this.f66364a = str;
    }

    @Override // java.lang.Throwable
    @Nullable
    public final String getMessage() {
        return this.f66364a;
    }
}
