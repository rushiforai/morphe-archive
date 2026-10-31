package io.branch.search.internal;

import android.os.CancellationSignal;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.be, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3085be {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final C3102ce f64036a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final CancellationSignal f64037b;

    public C3085be(@NotNull C3102ce key, @NotNull CancellationSignal cancellationSignal) {
        Intrinsics.g(key, "key");
        Intrinsics.g(cancellationSignal, "cancellationSignal");
        this.f64036a = key;
        this.f64037b = cancellationSignal;
    }

    public final boolean equals(@Nullable Object obj) {
        if (this == obj) {
            return true;
        }
        if (!(obj instanceof C3085be)) {
            return false;
        }
        C3085be c3085be = (C3085be) obj;
        return Intrinsics.b(this.f64036a, c3085be.f64036a) && Intrinsics.b(this.f64037b, c3085be.f64037b);
    }

    public final int hashCode() {
        return this.f64037b.hashCode() + (this.f64036a.hashCode() * 31);
    }

    @NotNull
    public final String toString() {
        return "Signal(key=" + this.f64036a + ", cancellationSignal=" + this.f64037b + ')';
    }
}
