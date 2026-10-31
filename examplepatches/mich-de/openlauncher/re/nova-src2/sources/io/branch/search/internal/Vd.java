package io.branch.search.internal;

import java.util.ArrayList;
import java.util.List;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* loaded from: classes4.dex */
public final class Vd {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final List<Xd> f63543a;

    public Vd(@NotNull ArrayList sharedPrefsFiles) {
        Intrinsics.g(sharedPrefsFiles, "sharedPrefsFiles");
        this.f63543a = sharedPrefsFiles;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        return (obj instanceof Vd) && Intrinsics.b(this.f63543a, ((Vd) obj).f63543a);
    }

    public final int hashCode() {
        return this.f63543a.hashCode();
    }

    @NotNull
    public final String toString() {
        return Ob.a(new StringBuilder("SharedPreferencesDiagnostics(sharedPrefsFiles="), this.f63543a, ')');
    }
}
