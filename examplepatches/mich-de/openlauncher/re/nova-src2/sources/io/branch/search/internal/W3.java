package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class W3 {

    /* renamed from: a, reason: collision with root package name */
    @gn.a
    @gn.c("statements")
    @Nullable
    public final List<C3440we> f63559a;

    public W3() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof W3) && Intrinsics.b(this.f63559a, ((W3) obj).f63559a);
    }

    public final int hashCode() {
        List<C3440we> list = this.f63559a;
        if (list == null) {
            return 0;
        }
        return list.hashCode();
    }

    @NotNull
    public final String toString() {
        return Ob.a(new StringBuilder("Category(statements="), this.f63559a, ')');
    }

    public /* synthetic */ W3(int i5) {
        this((List<C3440we>) null);
    }

    public W3(@Nullable List<C3440we> list) {
        this.f63559a = list;
    }
}
