package io.branch.search.internal;

import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class P3 {

    /* renamed from: a, reason: collision with root package name */
    public final int f63063a;

    /* renamed from: b, reason: collision with root package name */
    public final long f63064b;

    public P3(long j11, int i5) {
        this.f63063a = i5;
        this.f63064b = j11;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof P3)) {
            return false;
        }
        P3 p32 = (P3) obj;
        return this.f63063a == p32.f63063a && this.f63064b == p32.f63064b;
    }

    public final int hashCode() {
        return Long.hashCode(this.f63064b) + (Integer.hashCode(this.f63063a) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("CachedFileInfo(fileCount=");
        sb2.append(this.f63063a);
        sb2.append(", fileDiskSpace=");
        return C3380t5.a(sb2, this.f63064b, ')');
    }
}
