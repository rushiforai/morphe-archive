package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.l9, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3249l9 {

    /* renamed from: a, reason: collision with root package name */
    public final int f64962a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final List<String> f64963b;

    public C3249l9(int i5, @NotNull List<String> statements) {
        Intrinsics.g(statements, "statements");
        this.f64962a = i5;
        this.f64963b = statements;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3249l9)) {
            return false;
        }
        C3249l9 c3249l9 = (C3249l9) obj;
        return this.f64962a == c3249l9.f64962a && Intrinsics.b(this.f64963b, c3249l9.f64963b);
    }

    public final int hashCode() {
        return this.f64963b.hashCode() + (Integer.hashCode(this.f64962a) * 31);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Migration(version=");
        sb2.append(this.f64962a);
        sb2.append(", statements=");
        return Ob.a(sb2, this.f64963b, ')');
    }
}
