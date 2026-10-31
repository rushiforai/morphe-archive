package io.branch.search.internal;

import android.content.SharedPreferences;
import io.branch.search.internal.Y2;
import kotlin.Lazy;
import kotlin.LazyKt;
import kotlin.jvm.internal.Intrinsics;
import kotlin.random.Random;
import org.jetbrains.annotations.NotNull;

/* loaded from: classes4.dex */
public final class K5 {

    @NotNull
    public static final a Companion = new a();

    /* renamed from: a, reason: collision with root package name */
    @NotNull
    public final F2 f62781a;

    /* renamed from: b, reason: collision with root package name */
    @NotNull
    public final SharedPreferences f62782b;

    /* renamed from: c, reason: collision with root package name */
    @NotNull
    public final Lazy f62783c;

    public static final class a {
    }

    public K5(@NotNull F4 contextDelegate, @NotNull G2 remoteConfigManager) {
        Intrinsics.g(contextDelegate, "contextDelegate");
        Intrinsics.g(remoteConfigManager, "remoteConfigManager");
        this.f62781a = remoteConfigManager;
        this.f62782b = contextDelegate.a(Y2.b.Analytics);
        this.f62783c = LazyKt.a(new L5(this));
    }

    public static final float a(K5 k52) {
        k52.getClass();
        Random.f71890a.getClass();
        float fC = (float) Random.f71891b.c(100.0d);
        SharedPreferences.Editor editorEdit = k52.f62782b.edit();
        editorEdit.putFloat("detailed_analytics_device_rank", fC);
        editorEdit.apply();
        return fC;
    }

    public final boolean a() {
        return ((Number) this.f62783c.getValue()).floatValue() < this.f62781a.a().f65357e0;
    }
}
