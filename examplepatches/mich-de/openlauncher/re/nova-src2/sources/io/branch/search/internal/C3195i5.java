package io.branch.search.internal;

import java.util.Set;
import kotlin.collections.EmptySet;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.i5, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3195i5 {

    /* renamed from: a, reason: collision with root package name */
    @gn.a
    @Nullable
    public final String f64735a;

    /* renamed from: b, reason: collision with root package name */
    @gn.a
    @NotNull
    public final Set<EnumC3285nb> f64736b;

    /* renamed from: c, reason: collision with root package name */
    @gn.a
    @NotNull
    public final Set<EnumC3285nb> f64737c;

    public C3195i5() {
        this(0);
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3195i5)) {
            return false;
        }
        C3195i5 c3195i5 = (C3195i5) obj;
        return Intrinsics.b(this.f64735a, c3195i5.f64735a) && Intrinsics.b(this.f64736b, c3195i5.f64736b) && Intrinsics.b(this.f64737c, c3195i5.f64737c);
    }

    public final int hashCode() {
        String str = this.f64735a;
        return this.f64737c.hashCode() + h6.c1.k(this.f64736b, (str == null ? 0 : str.hashCode()) * 31, 31);
    }

    @NotNull
    public final String toString() {
        return "DatabaseMetaData(name=" + this.f64735a + ", queryTypeToDB=" + this.f64736b + ", setupTeardownTypeToDB=" + this.f64737c + ')';
    }

    /* JADX WARN: Multi-variable type inference failed */
    public C3195i5(@Nullable String str, @NotNull Set<? extends EnumC3285nb> queryTypeToDB, @NotNull Set<? extends EnumC3285nb> setupTeardownTypeToDB) {
        Intrinsics.g(queryTypeToDB, "queryTypeToDB");
        Intrinsics.g(setupTeardownTypeToDB, "setupTeardownTypeToDB");
        this.f64735a = str;
        this.f64736b = queryTypeToDB;
        this.f64737c = setupTeardownTypeToDB;
    }

    /* JADX WARN: Illegal instructions before constructor call */
    public C3195i5(int i5) {
        EmptySet emptySet = EmptySet.f71734a;
        this(null, emptySet, emptySet);
    }
}
