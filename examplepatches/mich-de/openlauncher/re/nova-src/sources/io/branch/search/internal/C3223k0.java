package io.branch.search.internal;

import android.content.SharedPreferences;
import kotlin.jvm.internal.Intrinsics;
import org.jetbrains.annotations.NotNull;

/* renamed from: io.branch.search.internal.k0, reason: case insensitive filesystem */
/* loaded from: classes4.dex */
public final class C3223k0 {

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f64906a;

    public C3223k0(@NotNull SharedPreferences sharedPrefs) {
        Intrinsics.g(sharedPrefs, "sharedPrefs");
        this.f64906a = sharedPrefs;
        a();
    }

    public final void a() {
        this.f64906a.edit().remove("persistedAnalyticsPayload").apply();
    }

    public final void a(@NotNull String callerId, @NotNull String value) {
        Intrinsics.g(callerId, "callerId");
        Intrinsics.g(value, "value");
        this.f64906a.edit().putString("prev_analytics_window_id_".concat(callerId), value).apply();
    }
}
