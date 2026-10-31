package io.branch.search.internal;

import android.content.SharedPreferences;
import io.branch.search.internal.InterfaceC3272mf;
import io.branch.search.internal.Y2;
import kotlin.Pair;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;
import org.jetbrains.annotations.Nullable;

/* renamed from: io.branch.search.internal.h6, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3179h6 implements InterfaceC3272mf {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final InterfaceC3272mf f64648a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f64649b;

    /* renamed from: io.branch.search.internal.h6$a */
    public static final class a {
    }

    public C3179h6(@NotNull F4 context, @NotNull InterfaceC3272mf source, long j11) {
        Intrinsics.g(context, "context");
        Intrinsics.g(source, "source");
        this.f64648a = source;
        this.f64649b = context.a(Y2.b.UserAgent);
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    public final void a() {
        this.f64648a.a();
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @NotNull
    public final Pair<String, InterfaceC3272mf.c> b() {
        if (System.currentTimeMillis() - this.f64649b.getLong("last_obtained", 0L) <= 2592000000L) {
            return new Pair<>(this.f64649b.getString("user_agent", null), InterfaceC3272mf.c.DISK);
        }
        Pair<String, InterfaceC3272mf.c> pairB = this.f64648a.b();
        String str = (String) pairB.f71683a;
        if (str == null) {
            return new Pair<>(this.f64649b.getString("user_agent", null), InterfaceC3272mf.c.DISK);
        }
        this.f64649b.edit().putLong("last_obtained", System.currentTimeMillis()).putString("user_agent", str).commit();
        return pairB;
    }

    @Override // io.branch.search.internal.InterfaceC3272mf
    @Nullable
    public final String get() {
        return (String) b().f71683a;
    }
}
