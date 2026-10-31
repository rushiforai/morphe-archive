package io.branch.search.internal;

import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Ae {

    /* renamed from: a, reason: collision with root package name */
    @gn.a
    @gn.c("values")
    @Nullable
    public final List<List<Object>> f62042a;

    /* renamed from: b, reason: collision with root package name */
    @gn.a
    @gn.c("stmt")
    @Nullable
    public final String f62043b;

    public Ae() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof Ae)) {
            return false;
        }
        Ae ae2 = (Ae) obj;
        return Intrinsics.b(this.f62042a, ae2.f62042a) && Intrinsics.b(this.f62043b, ae2.f62043b);
    }

    public final int hashCode() {
        List<List<Object>> list = this.f62042a;
        int iHashCode = (list == null ? 0 : list.hashCode()) * 31;
        String str = this.f62043b;
        return iHashCode + (str != null ? str.hashCode() : 0);
    }

    @NotNull
    public final String toString() {
        StringBuilder sb2 = new StringBuilder("Stmt(values=");
        sb2.append(this.f62042a);
        sb2.append(", stmt=");
        return Z.a(sb2, this.f62043b, ')');
    }

    public /* synthetic */ Ae(int i5) {
        this(null, null);
    }

    public Ae(@Nullable String str, @Nullable List list) {
        this.f62042a = list;
        this.f62043b = str;
    }
}
